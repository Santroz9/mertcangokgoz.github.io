---
layout: post
title:  Raspberry Pi İle OwnCloud Yapılandırma
date: 2016-07-18
type: post
categories: Linux
description:  Dosyalarımı cloudda barındırıp para vermekten usanmıştım elimde 2 adet Raspberry pi bulunuyordu bende bunlardan bir
---

![Raspberry Pi Paket Görsel 1](/assets/raspberrypi1.JPG)

Dosyalarımı cloud'da barındırıp para vermekten usanmıştım elimde 2 adet Raspberry pi bulunuyordu bende bunlardan bir tanesini niye kullanmayayım ki dedim.Bu işlem zor olmayacaktı yapacağım 3 işlem vardı çünkü pek fazla bir zorluğu yoktu

Yapılacaklar;

- Sabit İP tahsis edilmesi
- Port ve router ayarları
- Kurulum ve ayarlama işlemleri

İlk olarak internet sağlayıcımı aradım 444 0 126(Uydunet Müşteri hizmetleri) Karşıma Duygu adında bayan bir görevli çıktı dedim ben sabit ip almak istiyorum.Tamam dedi 2.99 TL ücreti var dedim yapıştır gelsin.

Hattınıza ben tanımladım 1 saat sonra aktif olur kolay gelsin dedi kapattı insan bi güle güle der sesi de pek güzeldi ayıp etti ama olsun ben alacağımı aldım Sabit İP adresimi edindim.

Modem arayüzüme girdim port yönlendirmeden gerekli olan Portları raspberry pi nin lokal ip adresine yönlendirdim.

- 192.168.0.10

Tabi HTTP ve HTTPS olarak kullanılacağı için 2 adet port açılacaktı bunlar 80 ve 443 portları herhalde NAT ayarlamayı biliyorsunuzdur işte onu yapıyorsunuz.Zor bir yanı yok yani herneyse yönlendirme işlemlerini yaptıysanız fazla birşey kalmadı kurulumları yapmak kaldı

Öncelikle belirteyim ben bu rehberi hazırlarken temel kurulumları gerçekleştirdiğinizi varsayarak yapacağım bunlar arasında SD karta işletim sistemini kurup raspberry pi cihazınızı açmış olmanız gerekiyor.Eğer bunları yapmadıysanız makalemin bu kısmında okumaktan vazgeçip ister favorilerinize ekleyebilir isterseniz de direk olarak çıkış yapabilirsiniz.

Şimdi SD kart içerisine daha önceden indirmiş olduğum Raspbian sistemini dd aracılığı ile kurdum. Server olarak kullanacağımız içinde Desktop ekipmanlarını kurmadım lite sürümünü indirdim oldukça düşük boyutlu bir kalıp indireceksiniz.

Raspberry Pi cihazımıza bağlanıyoruz. ilk bağlanırken kullanılacak olan bilgiler şu şekilde

**Kullanıcı adı:** pi
**Şifre:** raspberry

SSH zaten açık olacağı için bağlantımızı kuralım.İp adresini DHCP den öğrenebilirsiniz.Modem arayüzüne bakmanız yeterli desktop sürümünü kullanıyorsanız HDMI dan bağlanıp `ip addr show' komutu aracılığı ilede bakabilirsiniz.

```console
ssh pi@192.168.0.10
```

Bağlantığımı kurduktan sonra ilk olarak sistemi bir güzel güncelleyin çünkü içindeki bir takım paketler eski

```console
sudo su
sudo apt-get update && apt-get upgrade && apt-get dist-upgrade
reboot
```

Bunu güzelce yaptıktan sonra artık tertemiz kuruluma geçebiliriz.İlk önce raspberry pi cihazımızın ayarlarını yapmamız gerekiyor bunun için şu komutu vererek gereken adımları takip edin

```console
sudo raspi-config
```

1. Genel Ayarlardan Dili değiştirin bunun için change local yolunu takip edin ve değeri `en_US.UTF8` olarak değiştirin biraz altlarda o yüzden göremeyebilirsiniz.
2. Advanced Options olan kısma tıklayın ve ardından Memory split kısmına geçiş yapın buradan değeri 16 yada 32 olarak değiştirin.
3. Son olarak da overclock seçeneğine gelin ve CPU değerini High yapın.Isınması 1-2 derece daha fazla olacak ancak işlemleri daha hızlı yapabilecek cihazımız

Web serverda kullanacağımız kullanıcımızı ekleyelim.

```console
sudo usermod -a -G www-data www-data
```

Ardından gerekli olan tüm paketlerin toplu bir şekilde kurulumunu gerçekleştirelim.

```console
sudo apt-get install nginx openssl ssl-cert php5-cli php5-sqlite php5-gd php5-common php5-cgi sqlite3 php-pear php-apc curl libapr1 libtool curl libcurl4-openssl-dev php-xml-parser php5 php5-dev php5-curl php5-gd php5-fpm memcached php5-memcache php5* varnish
```

Bu işlem internet hızınıza göre biraz sürecek zaten cihaz yavaş olduğu için kurmasıda biraz zaman alabilir.

Cloudflare SSL kullanacağım için ben sunucu tarafında da bir SSL oluşturmayı tercih ediyorum bu sayada güvenliği arttıracağız ayrıca owncloud için ssl de gerekiyor. Kurmasanızda olur ancak kursanız fena olmaz

```console
sudo openssl req $@ -new -x509 -days 730 -nodes -out /etc/nginx/cert.pem -keyout /etc/nginx/cert.key
```

Oluşturulan bu 2 anahtarın yetkilerini düzenliyoruz.

```console
sudo chmod 600 /etc/nginx/cert.pem
sudo chmod 600 /etc/nginx/cert.key
```

Sistemde ön tanımlı olarak gelen default dosyasını temizliyoruz.

```console
sudo sh -c "echo '' > /etc/nginx/sites-available/default"
```

Ve herhangi bir metin editörü ile açıp aşağıdaki ayarları giriyoruz.

```nginx
upstream php-handler {
    server 127.0.0.1:9000;
    #server unix:/var/run/php5-fpm.sock;
}
server {
    listen 80;
    server_name 192.168.1.116;
    return 301 https://$server_name$request_uri;  # enforce https
}

server {
    listen 443 ssl;
    server_name 192.168.1.116;
    ssl_certificate /etc/nginx/cert.pem;
    ssl_certificate_key /etc/nginx/cert.key;
    root /var/www/owncloud;
    client_max_body_size 1000M; # set max upload size
    fastcgi_buffers 64 4K;
    rewrite ^/caldav(.*)$ /remote.php/caldav$1 redirect;
    rewrite ^/carddav(.*)$ /remote.php/carddav$1 redirect;
    rewrite ^/webdav(.*)$ /remote.php/webdav$1 redirect;
    index index.php;
    error_page 403 /core/templates/403.php;
    error_page 404 /core/templates/404.php;
    location = /robots.txt {
        allow all;
        log_not_found off;
        access_log off;
    }
    location ~ ^/(?:\.htaccess|data|config|db_structure\.xml|README) {
        deny all;
    }
    location / {
        # The following 2 rules are only needed with webfinger
        rewrite ^/.well-known/host-meta /public.php?service=host-meta last;
        rewrite ^/.well-known/host-meta.json /public.php?service=host-meta-json last;
        rewrite ^/.well-known/carddav /remote.php/carddav/ redirect;
        rewrite ^/.well-known/caldav /remote.php/caldav/ redirect;
        rewrite ^(/core/doc/[^\/]+/)$ $1/index.html;
        try_files $uri $uri/ index.php;
    }
    location ~ \.php(?:$|/) {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
        fastcgi_param HTTPS on;
        fastcgi_pass php-handler;
   }
   # Optional: set long EXPIRES header on static assets
   location ~* \.(?:jpg|jpeg|gif|bmp|ico|png|css|js|swf)$ {
        expires 30d;
        # Optional: Don't log access to assets
        access_log off;
   }
}
```

Ayar dosyamız içerisinde sizin dosyalarınızın yolu olacak bir kısım bulunuyor bunu kendi alışkanlıklarınıza göre düzenleyebilirsiniz.

```console
root /var/www/owncloud;
```

Kayıt edip çıkış yaptıktan sonra ownCloud uygulamasını indirmeye geldi sıra sitesinden son sürümü indiriyoruz ve gereken adımları takip ediyoruz.

```console
sudo mkdir -p /var/www/owncloud
sudo wget https://download.owncloud.org/community/owncloud-9.0.3.tar.bz2
sudo tar xvf owncloud-9.0.3.tar.bz2
sudo mv owncloud/ /var/www/
sudo chown -R www-data:www-data /var/www
rm -rf owncloud owncloud-9.0.3.tar.bz2
```

Başarılı bir şekilde dosyaları ana dizinimize atma işlemimiz tamamlandı ufak bir kaç ayardan sonra sistemimiz çalışır hale gelecek o ayarlamalardan ilki .htaccess içerisindeki dosya upload boyutları

```console
cd /var/www/owncloud
sudo nano .htaccess
```

Dosyamızı açtıktan sonra içerisindeki satırları şu şekilde değiştiriyoruz.Tabi siz kendinize görede ayarlayabilirsiniz.

```console
php_value_upload_max_filesize 2048M
php_value_post_max_size 2048M
php_value_memory_limit 2048M
```

Kullanıcılar içinde tanımlama yapıyoruz.

```console
sudo nano .user.ini
```

Dosya içerisinde arama yaparak aşağıdaki değişiklikleri gerçekleştiriyoruz.

```console
upload_max_filesize=2048M
post_max_size=2048M
memory_limit=2048M
```

Artık İP adresiniz ile sisteme erişebiliyor olmanız gerekiyor. Tabi bu ayarlardan sonra ilk olarak Nginx bi yeniden başlatmanız gerekiyor yapmışsınızdır diyerek geçiyorum.

Geldik sisteme disk eklemeye Raspberry pi cihazımız 5v üstünde gelen her cihaza güç yetiremediği için çalışmıyor haliyle HDD leri takamıyoruz SATA to USB olsa dahi çünkü volt yetmiyor.Hal böyle olunca sizin diski takabilme imkanınız 2 şeye kalıyor ya bir şekilde ek güç çekeceksiniz yada gerçekten bir şekilde ek güç edineceksiniz.

Bunun için ise hepsiburada gibi yerlerde satılan Adaptör ile beslemeli USB HUB edinmek böylelikle herhangi bir diski sisteme entegre edebilirsiniz ama unutmayın Raspberry pi 4 TB kadar diskleri görmekte 4 tane 1 TB yada 2 Tane 2 TB disk takabilme imkanınız var.Tabi bu arttırılabiliyor mu bilmiyorum.

NTFS paketimizi kuralım

```console
sudo apt-get install ntfs-3g
```

Media klasöründe gerekli olan klasörü oluşturalım.bu işimizi kolaylaştıracak isterseniz farklı bir yol kullanabilirsiniz.

```console
sudo mkdir -P /media/ownclouddrive
```

Bu alanı kullanacak olan kullanıcı kardeşin id bilgilerini bulmaya geldi sıra bunlar içinde aşağıdakileri sırasıyla çalıştırıyoruz.

```console
id -g www-data
id -u www-data
```

USB portunuzdan bağladığınız diskinizi UUID aracılığı ile fstab dosyamıza ekleyeceğiz ama diskin UUID sinin tespit edilmesi gerekiyor bunun için sistemdeki tüm hepsini listeyelim zaten 2 tane çıkacak eğer 1 tane disk takmışsanız

```console
ls -l /dev/disk/by-uuid
```

Daha sonra yukarda bahsettiğim gibi fstab dosyamızı açıyoruz.

```console
sudo nano /etc/fstab
```

İçerisine en son satıra aşağıdaki kaydı giriyoruz.

```console
UUID=368DE6723F50766B /media/ownclouddrive auto nofail,uid=33,gid=33,umask=0027,dmask=0027,noatime 0 0
```

Buradaki UUID sizin yukardaki komut ile aldığınız UUID herkeste haliyle farklılık gösterecek düzenlemeyi unutmayın. `id -g www-data` ile gelen bilgi `gid` bilginiz `id -u www-data` ile gelen bilgi ise `uid` bilginiz olacak.

Ardından Raspberry pi cihazınızı yeniden başlatmanız gerekiyor.

```console
reboot
```

Şimdi ise yapacağımız şey ownCloud uygulamasının kurulumunu tamamlamak bunun için ip adresinize giriş yapıp gereken bilgileri doldurmanız yeterli bunların başında sizden 2 adet bilgi isteyecek bunlar `kullanıcı adı` ve `parola` ikincisi ise `data folder` yani verilerin kayıt edileceği yer yani ayarladığımız `/media/ownclouddrive` klasörü isterseniz veritabanını da ayarlayabilirsiniz ben gerek duymadım bu yüzden o ayarları değiştirmedim.

Tüm bu işlemlerde tamamlandıktan sonra Nginx amcamızı tekrar yeniden başlatıyoruz `sudo service nginx restart` bundan sonra artık özgürce kullanabileceğiniz bir ownCloud serverınız oldu güle güle kullanın.

![Raspberry Pi Görsel 2](/assets/raspberrypi2.JPG)
