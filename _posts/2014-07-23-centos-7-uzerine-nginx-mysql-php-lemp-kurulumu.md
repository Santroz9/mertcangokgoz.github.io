---
layout: post
title: Centos 7 Üzerine (LEMP) Kurulumu
date: 2014-07-23 22:51:00.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: LEMP Paketi genellikle dinamik web siteleri ve uygulamalarını barındırmak amacıyla arka plan da çalışmasıyla ünlenmiş bir yazılım topluluğu
---
**LEMP** Paketi genellikle dinamik web siteleri ve uygulamalarını barındırmak amacıyla arka plan da çalışmasıyla ünlenmiş bir yazılım topluluğu olarak adlandırabiliriz ve tamamen açık kaynak kodlu bir yazılım topluluğudur. ve ismini kurduğu açık kaynak kodlu programlardan almaktadır.

- **L** inux Operation System
- **E** Nginx
- **M** ysql
- **P** HP

**Mysql** olarak da **MariaDB** kullanmaktadır.Dinamik içerik için ise de **PHP** kullanılmaktadır kullanacağımız sistemimizde Öncelikli olarak sisteminizi **Centos 7** olarak sıfırdan format atarak işe başlayın sonrasında **SSH** bağlanmanız gerekiyor bağlanırken root olarak bağlanın ki işlemlerimizi düzgün bir şekilde yapabilelim.

**Nginx** kurabilmemiz için öncelikle aşağıdaki komut ile rpm sini sisteme eklememiz şart

    rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

Sonrasında temel kurulum komutumuzu veriyoruz.

    yum install nginx

Sisteminizde nginx başarıyla kurulmuş oldu domaininize yada ip adresinize giriş yapın karışınıza şöyle birşeyler gelmesi lazım

![nginx_defaultgorsel1](/assets/nginx_defaultgorsel1.png)

İP adresimi bilmiyorum peki nasıl giriş yapacağım diyorsanız ufak bir kodumuz olacak bu kod ile ip adresinizi bulabilirsiniz.

    ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

yada aşağıdaki siteyide curl aracılığı ile kullanabilirsiniz.

    curl http://icanhazip.com

# İkinci Adım MYSQL Kurulumu(MariaDB)

**Mysqlin** satıldığını biliyorsunuzdur.Ekip sonradan **MariaDB** olarak adlandırılan gene açık kaynak olarak ilerleyen **SQL** i yarattı ve **mysql** ile tamamen uyumlu ve sorunsuz çalışmasını sağladılar ancak tek bir şey farklıydı kurulumları bunun dışında **SQL** komutları ve diğer ayarlamalar aynıdır.

    yum install mariadb-server mariadb

Kurulum tamamlandı sistemde başlatmamız gerekiyor haliyle

    systemctl start mariadb

Şimdi Sunucumuzda **SQL** aktif bir biçimde çalışmaya başladı Ancak ayarlamalar yapmazsak başımızı çok ağrıtan güvenlik açıkları çıkar ortaya buda pek hoş bir durum olmaz

    sudo mysql_secure_installation

Komutunu vererek kurulum işlemine geçiyoruz yani kurulum dediysemde db oluşturma ve genel ayarlamalar için kullanıcı vs belirleyeceğiz.Kabul etmemizi gerektirecek birşeyler gelecek karşımıza **Y** diyoruz ve devam ediyoruz gerekenleri giriyoruz.

    Enter current password for root (enter for none):
    OK, successfully used password, moving on...

    Setting the root password ensures that nobody can log into the MariaDB
    root user without the proper authorisation.

    New password: Şifreniz
    Re-enter new password: Şifreniz
    Password updated successfully!
    Reloading privilege tables..
     ... Success!

Sonrasında birşeyler sorarsa he deyip geçin yani **ENTER** Benden size tavsiye işlemlerinizi bitirdikten sonra root olarak **SQL** bağlantı kurulmasını kapatmanızı öneririm yoksa başınızı ağrıtacaktır.

    systemctl enable mariadb.service

Böylelikle **MYSQL(MariaDB)** Kurulumumuzu tamamen bitirdik.

# Üçüncü Adım PHP Kurulumu

Ne demiştik dinamik içeriklerimiz için **php** kullanacağız demiştik bunun için haliyle önce **php** kurulumunu tam ve eksiksiz yapmamız gerekiyor.Aşağıdaki komutu vererek işlemlere başlıyoruz.

    yum install php php-mysql php-fpm

Haliyle kurduğumuz **PHP** yi ayarlamamız gerekiyor bunun için ise

    nano /etc/php.ini

php.ini mizi açıyoruz ve aşağıdaki değişiklikleri uyguluyoruz.

İlk olarak **cgi.fix\_pathinfo** başında **;** varsa onu kaldırıyorsunuz varsayılan değer 1 olarak geliyor bunu da 0 olarak ayarlıyorsunuz son olarak aşağıdaki gibi oluyor.

    cgi.fix_pathinfo=0

Kaydedip kapatıyoruz.sıradaki ayarımız **php-fpm** yani **www.conf** ayarına nginx kullandığımız için birazcık ayarlamamız lazım haliyle

    nano /etc/php-fpm.d/www.conf

listen kısmını aşağıdaki gibi yapıp kayıt edip çıkıyoruz.

    listen = /var/run/php-fpm/php-fpm.sock

php-fpm yi başlatıyoruz.

    systemctl start php-fpm

**Nginxin**  **php** ile çalışmasını sağlamamız gerekiyor bunun içinde **nginx** in config dosyasına birkaç satır eklemez ve bazı yerleri değiştirmemiz gerekiyor ki **nginx**  **php** ile randımanlı olarak çalışabilsin.

    nano /etc/nginx/conf.d/default.conf

Açtığımızda karşımıza şu şekilde bi config kısmı açılacak

    server {
        listen 80;
        server_name localhost;

        location / {
            root /usr/share/nginx/html;
            index index.html index.htm;
        }
        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
            root /usr/share/nginx/html;
        }
    }

Görmüş olduğunuz bu kısmı aşağıdaki gibi düzenliyorsunuz.

    server {
        listen 80;
        server_name ip adresiniz;

        root /usr/share/nginx/html;
        index index.php index.html index.htm;

        location / {
            try_files $uri $uri/ =404;
        }
        error_page 404 /404.html;
        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
            root /usr/share/nginx/html;
        }

        location ~ \.php$ {
            try_files $uri =404;
            fastcgi_pass unix:/var/run/php-fpm/php-fpm.sock;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include fastcgi_params;
        }
    }

değişiklikleri yaptıktan sonra kaydedip çıkıyoruz ve **nginx** restart atıyoruz böylelikle nginximiz benim değişimle engin ebimiz php ile uyumlu oluyor.

    systemctl restart nginx

# Test Aşaması

Nginx in phpsi olduysa bu aşamada yapacağımız ekranı görebilmeniz gerekiyor göremiyorsanız bir yerde yanlışlık yapmışsınızdır geri dönüp bunu düzelttikten sonra işleminize devam edeceksiniz.

    cd /usr/share/nginx/html/

içerisine nano komutuyla 1 adet php dosyası açıp düzenleyelim.

    nano info.php

içerisine

    <?php phpinfo(); ?>

kayıt edip çıkıyoruz.Sonra sitenize yada ip adresinize giriş yapıyorsunuz.Aşağıdaki gibi bir ekran görüyorsanız php olmuş demektir.

![phpinfogorsel1](/assets/phpinfogorsel1.png)
