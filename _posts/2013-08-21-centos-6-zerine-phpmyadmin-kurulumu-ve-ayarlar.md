---
layout: post
title: Centos 6 Üzerine PhpMyAdmin Kurulumu
date: 2013-08-21 19:07:11.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Sunucu üzerinde web sitesi barındırma işlemi yapacak arkadaşların işine yarayacak olan bu makalemiz ile kolaylıkla phpmyadmin kurarak
---

Sunucu üzerinde web sitesi barındırma işlemi yapacak arkadaşların işine yarayacak olan bu makalemiz ile kolaylıkla **phpmyadmin** kurarak **mysql** database dosyalarınızı kontrol edebileceksiniz.bunların dışında veritabanın dan yedek alabilir eski yedeklerinizi atabilir ekleme çıkartma ve bir çok veritabanı işlemlerini yapabilirsiniz.

1-Öncelikle dosyalarımızın sistemde kurulu olup olmadığına bakmamız lazım bunun için repo içerisinde grep ile arama yapacağız kurulu olanları bize söyleyecek

    rpm -qa | egrep -i "php|php-mysql|httpd|mysql-server"

2-kurulu olanlar arasında bazı dosyalar kurulu değilse hemen kuralım

    yum install php  php-mysql httpd mysql-server

3-öncelikle bi dosya oluşturuyoruz işimiz bittiği zaman bu klasörü kaldıracağız tabi ki de

    mkdir /downloads

4-hemen klasörümüze giriyoruz

    cd /downloads

5-illaki bize türkçe dil lazım olacak ben ingilizce tercih ediyorum ancak türkçe isteyenler için dil dosyalarımızı da kuracağız

    wget https://files.phpmyadmin.net/phpMyAdmin/4.5.3.1/phpMyAdmin-4.5.3.1-english.tar.gz

6-hemen tar komutumuzu verip dosyamızı açıyoruz.

    tar vfxz phpMyAdmin-4.5.3.1-english.tar.gz

7- açıldıktan sonra klasördeki tüm dosyaları belirtilen yere taşıyoruz.

    mv phpMyAdmin-4.5.3.1-english/var/www/html/phpmyadmin

8-şimdi ufak bir ayar kaldı taşıdığımız klasöre giriyoruz.

    cd /var/www/html/phpmyadmin/
    cp config.sample.inc.php config.inc.php
    nano config.inc.php

9-config.inc.php ye nano ile giriş yaptıktan sonra aşağıdaki satırları düzenliyoruz yoksa ekliyoruz.

    $cfg[‘servers’][$i][auth_type] = ‘http’;

Ve Kayıt edip çıkıyoruz.Hemen ardından **apache** ve **mysql** e restart atıyoruz ki yaptıklarımız işlesin

    service httpd restart
    /etc/init.d/mysqld restart

**SELinux** u devre dışı bırakmayı unutmayın bunun için **SSH** açıkken aşağıdaki komutu veriniz.

    setenforce 0

bunun dışında default olarak **ıd** ve **pw** belirtilmiş olmayabilir bunun içinde

    mysqladmin -u root password ŞİFRENİZ

Şeklinde komut vererek ıd ve pw nizi belirleyebilirsiniz.ve işlemimiz tamamdır bundan sonra **phpmyadmine** ulaşmak isterseniz

**www.siteadresiniz.com/phpmyadmin** yada **ipadresi/phpmyadmin** olarak girebilirsiniz.

![phpmyadmin ayarlari](/assets/phpmyadmingorsel.jpg)
