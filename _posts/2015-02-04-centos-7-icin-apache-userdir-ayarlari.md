---
layout: post
title: Centos 7 için Apache UserDir Ayarları
date: 2015-02-04 14:30:17.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: Tüm kullanıcıların tek bir public_html kullanması yerine UserDir aktif ederek kullanıcılara aynı alan tanımlaması yapabilirsiniz.Böylelikle
---
Tüm kullanıcıların tek bir **public\_html** kullanması yerine **UserDir** aktif ederek kullanıcılara aynı alan tanımlaması yapabilirsiniz.Böylelikle kendi bölgelerinde _kullanıcılar_ istediklerini yapabilirler.

Öncelikle Sisteme _root_ olarak giriş yapıyorsunuz.Ardından " **/etc/httpd/conf.d/"** yoluna **userdir.conf** adında bir dosya oluşturuyorsunuz.

    nano /etc/httpd/conf.d/userdir.conf

ve İçerisine Aşağıdaki satırları ekliyoruz.

    <IfModule mod_userdir.c>
     #
     # UserDir is disabled by default since it can confirm the presence
     # of a username on the system (depending on home directory
     # permissions).
     #
    UserDir enabled mertcangokgoz

     #
     # To enable requests to /~user/ to serve the user's public_html
     # directory, remove the "UserDir disabled" line above, and uncomment
     # the following line instead:
     #
     UserDir public_html

    </IfModule>

    <Directory /home/*/public_html>
    Options Indexes Includes FollowSymLinks

     AllowOverride All
     Allow from all
     Order deny,allow
     Require all granted

    </Directory>

Kayıt edip çıkıyorsunuz hemen ardından apacheyi yeniden başlatmanız gerekiyor.

    systemctl restart httpd.service

şimdi kullanıcılara özel klasör oluşturma kısmına geldi içerisinde mutlaka **public\_html** klasörü olası lazım oluşturulan klasör ismi ise yukarıdaki ayar dosyamızda gözüken _"UserDir enabled mertcangokgoz"_

    mkdir /home/mertcangokgoz/public_html

izinlerini vermeye geldi sıra

    chmod 711 /home/mertcangokgoz
    chown mertcangokgoz:mertcangokgoz/home/mertcangokgoz/public_html
    chmod 755 /home/mertcangokgoz/public_html

Sistemde **SELinux** aktif olduğu içinde sıkıntı çıkartmasın diye ufak bi ekleme yapalım **SELinux** kapalı ise bunları yapmanıza gerek yok

    setsebool -P httpd_enable_homedirs true
    chcon -R -t httpd_sys_content_t /home/mertcangokgoz/public_html

Ayarlamalar tamam ise artık eklediğiniz kullanıcı sitesini kullanabilecek ve alt dizini oluşmuş durumda olacak istediğini yapabilir ancak dosya izinlerine dikkat etmesi gerekmektedir.
