---
layout: post
title: Ubuntu Üzerine OpenLiteSpeed Kurulumu
date: 2015-04-23 16:19:02.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: OpenLiteSpeed Ücretsiz olarak LiteSpeed Technologie tarafından geliştirilen açık kaynak kodlu bir web server uygulamasıdır.OpenLiteSpeed yüksek
---
**OpenLiteSpeed** Ücretsiz olarak LiteSpeed Technologie tarafından geliştirilen açık kaynak kodlu bir web server uygulamasıdır.OpenLiteSpeed yüksek performanslı ölçeklenebilir ve hafif bir uygulama olarak tasarlanmıştır ücretsiz olarak geliştirilir,kullanılır ve dağıtılır yada isterseniz kafanıza göre kaynak kodlar ile değiştirebilirsiniz.Apache tabanlı olduğu için Apache sistemlerde kullandığınız tüm yönergeler **OpenLiteSpeed** ilede çalışmaktadır.

## Özellikleri

- Yüksek performans için derlenen kod yapısı ile daha hızlı çalışabilme
- Son derece düşük kaynak tüketimi için tam optimizasyon
- Apachede bulunan tüm yönlendirme komutları ile %100 Uyum
- Gerçek zamanlı istatistikler ve performanslı sayfa önbellekleme özelliği
- Admin Arayüzü ile Kolaylıkla vHost oluşturabilme ve yönetebilme imkanı

## Kurulum

İlk olarak yerel dosyaların güncelliğini kontrol etmemiz gerekiyor bunun için

    sudo apt-get update

Kaynak koddan derleyeceğimiz için gerekli olan derleme paketlerini kuruyoruz.

    sudo apt-get install build-essential libexpat1-dev libgeoip-dev libpng-dev libpcre3-dev libssl-dev libxml2-dev rcs zlib1g-dev

Ana dizine ulaşmamız gerekiyor ki kurulumu yaparken sıkıntı çıkmasın

    cd ~

Daha sonra ana dizine dosyamızı çekiyoruz

    wget http://open.litespeedtech.com/packages/openlitespeed-1.3.10.tgz

Sıkıştırılmış dosyayı çıkarıyoruz.Ve dosya içerisine giriş yapıyoruz.

    tar xzvf openlitespeed*
    cd openlitespeed*

Derleme öncesi bi ayarlamaları yapıyoruz.

    sudo ./configure
    sudo make

yaptığımız kurulum ve derleme aşamasından sonra uygulamamızı kuruyoruz.

    sudo make install

Ardından **/usr/local/lsws** dizini varmı yokmu bir kontrol ediyoruz eğer varsa veritabanını kurmamız gerekiyor bunun için sisteme **MySQL** dahil etmemiş şart

    sudo apt-get install mysql-server

Ve sonra sırasıyla komutları verip gerekenleri uyguluyoruz burada bir kaç yerde işlem yapmanız gerekeceği için güçlü birer şifre edinmenizde fayda var **root** kullanıcısının şifresi kolay tahmin edilebilir birşey olmasını istemeyiz

    sudo mysql_install_db
    sudo mysql_secure_installation

Şimdi ise kullanıcı şifresi oluşturma kısmına geldik sıra burada **admin** için bir şifre belirliyoruz.

    sudo /usr/local/lsws/admin/misc/admpass.sh

Belirlediğimiz şifremiz ile rahatlıkla sistemimize girebilir bir hal aldı kullanıcı olarak "admin" ön tanımlıdır.ve Servisi başlatıyoruz.

    sudo service lsws start

admpass aşamasının ardından tanımlamış olduğunuz bilgiler ile sisteme giriş yapabilirsiniz bunun için ip adresinizin sonuna aşağıdaki ekleri getirmeniz yeterli

    https://ipadresiniz:7080

Tanımlı default sayfalara ulaşmak için ise

    http://ipadresiniz:8088

Bilgilerimiz ile giriş yapacağımız ekranımız karşımıza şu şekilde geliyor.Buradan yönetim paneline ulaşacaksınız ve ayarlamalarınızı buradan gerçekleştireceksiniz.

![openlitespeedgorsel1](/assets/openlitespeedgorsel1.jpg)

Şimdi sıra geldi yukarıdaki sayfamıza ulaşacağımız portu değiştirmeye ön tanımlı olarak gelen " **8088**" portunu **80** yapmamız gerekiyor.Bunun için aşağıdaki adımları takip etmeniz yeterli

- **Configuration** Menüsü altında bulunan **listeners** ulaşıyorsunuz.
- **listeners** altında bulunan " **View/Edit**" tıklıyorsunuz ve karşınıza bir çok ayar ekranı geliyor burada kurcalayacağınız kısım **Address Settings** altında bulunan yer burada tanımlı portun **8088** olduğunu göreceksiniz bu portu hemen **80** olarak değiştiriyorsunuz ve kaydediyorsunuz.
- Şimdi ise Sisteme restart atmanız gerekiyor bunu **SSH** üzerinden yapmayın sistem içerisinde bulunan yerden yapın ki hatalar ile karşılaşmayın
- Aşağıdaki resimde gördüğünüz **Actions** Kısmına giriş yapın panelden sonra **Graceful Restart** seçeneğine basın onayladıktan sonra yeniden başlatma işlemi tamamlanmış olacak

![openlitespeedgorsel2](/assets/openlitespeedgorsel2.jpg)

Tüm Sistem dosyalarının bulunduğu konuma ulaşmak için

    cd /usr/local/lsws

Sistemi durdurmak isterseniz

    sudo /usr/local/lsws/bin/lswsctrl stop

Sistemden sıkıldıysanız yukarıdaki komutu verip durdurduktan sonra silme işlemi için

    rm -rf /usr/local/lsws
