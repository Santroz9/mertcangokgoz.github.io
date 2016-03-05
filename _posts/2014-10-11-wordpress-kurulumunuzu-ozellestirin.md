---
layout: post
title: Wordpress Kurulumunuzu Özelleştirin
date: 2014-10-11 16:30:01.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: WP-CLI Linux işletim sistemleri için geliştirilen bir wordpress kurulum ve özelleştirme uygulamasıdır bunu yaparkende hiçbir grafik arayüz kullanmaz
---
**WP-CLI** Linux işletim sistemleri için geliştirilen bir wordpress kurulum ve özelleştirme uygulamasıdır bunu yaparkende hiçbir grafik arayüz kullanmaz tamamen komut satısı ile işlem yapar.Böylelikle hızlı bir şeykilde 0 dan Wordpress kurulumu yapabilirsiniz üstelik eklentiler ile birlikte bu işlemi rahatlıkla tamamlayabilirsiniz.

Gerekenler

- 1 Adet \*nix tabanlı işletim sistemi
- PHP 5.3 ve üzeri

Hemen sistemi kurmaya geçiyoruz.

    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

Çalışıyormu falan bi kontrol edelim .phar dosyasını

    php wp-cli.phar --info

Dosya izinlerini verelim ve dizine taşıyalım böylelikle komut satırımızda tatlı tatlı yerini alsın

    chmod +x wp-cli.phar
    sudo mv wp-cli.phar /usr/local/bin/wp

Hatasız bir şekilde buraya geldiyseniz ve bu yazdığımı okuyorsanız işlem sonlanmış demektir.Ancak sistem hakkında bilgi almak isteyebilirsiniz o zaman kullanacağımız kod ise

    wp --info --allow-root

root izin vererek info komutunu basıyoruz yoksa bize bir hata verir bu şekilde yazmalısın diye yukardaki kodun muhtemel çıktısı sürüme göre değişecek olup şu şekildedir.

    PHP binary: /usr/local/bin/php
    PHP version: 5.5.8
    php.ini used: /usr/local/lib/php.ini
    WP-CLI root dir: phar://wp-cli.phar
    WP-CLI global config:
    WP-CLI project config:
    WP-CLI version: 0.14.0

Peki siteyi kurma işlemine nasıl başlarız.

Kurulacak olan klasöre gideriz bizde misal "/home/mertcan/public\_html"

    cd /home/mertcan/public_html
    wp core download

Wordpressindi ve FTP ye otomatik olarak atıldı

Şimdi bi veritabanı oluşturduğunuzu varsayıyorum(oluşturulan veritabanı ve kullanıcı adı bir birisi ile ilişkili olmak zorunda kuru kuru açıp bırakmayın)

    wp core config --dbname=mggc2k_234 --dbuser=mertcangg_271

Şimdi wp-config dosyasına biraz güvenlik işlemi yapmamız lazım önce bi şu kod ile giriş yapın ve bakın db ön eki wp\_ mı diye

    nano -w wp-config.php

öyle gözüküyor ise random bir şekilde ön ek oluşturup otomatikman eklemek için şu komutu verin

    NEWPREFIX=$(echo $RANDOM)
    sed -i "s/'wp_';/'${NEWPREFIX}_';/g" wp-config.php

Kurulum yapalım ve temel site bilgilerini verelim sisteme

    wp core install --url='http://siteadresiniz.com/' --title='buraya site title' --admin_email='buraya mail adresiniz' --admin_password='buraya şifreniz' --admin_name=buraya kullanıcı adı

Yetkilendirme sonradan kullanıcı bazında olsun diyorsanız public\_html ve web serverde yetkili olan kullanıcı adı ile şifreyi tüm dizine uygulamak için

    chown mertcan:mertcan /home/mertcan/public_html
    chown -R mertcan:mertcan /home/mertcan/public_html

Sıra Geldi eklentileri kurmaya bunun için size eklentilerin isimleri gerekli wordpressin sitesinden isimleri alın hepsini kurar bu WP-CLI benim temel olarak kurduklarım ise şu şekilde sizde buna bakarak kendinize özgü kurulum parametresi verebilirsiniz.

    wp plugin install wp-security-scan --activate --allow-root
    wp plugin install sucuri-scanner --activate --allow-root
    wp plugin install disable-xml-rpc --activate --allow-root
    wp plugin install wp-updates-notifier --activate --allow-root
    wp plugin install wp-updates-notifier --activate --allow-root
    wp plugin install bbpress --activate --allow-root
    wp plugin install wp-fastest-cache --activate --allow-root
    wp plugin install wordfence --activate --allow-root

tekrardan plugins klasörüne kullanıcı iznini düzenlemeyi unutmuyoruz.

    chown mertcan:mertcan /home/mertcan/public_html/wp-content/plugins/
    chown -R mertcan:mertcan /home/mertcan/public_html/wp-content/plugins/

Bu işlemlerin hepsini tamamladıktan sonra Wordpress siteniz kullanıma hazır birşekilde site adresinize girdiğiniz zaman karşınıza çıkıyor.Geri kalanı artık sizin eseriniz olacak şimdiden kolay gelsin iyi bloglamalar...
