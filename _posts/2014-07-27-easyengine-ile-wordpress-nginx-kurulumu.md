---
layout: post
title: EasyEngine ile Wordpress-Nginx kurulumu
date: 2014-07-27 17:28:24.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: EasyEngine Adının hakkını gerçektende veren bir Linux shell-script dir aslında wordpress-nginx yapılandırmasını bunun aracılığı ile sadece bir kaç
---
EasyEngine Adının hakkını gerçektende veren bir Linux shell-script dir aslında wordpress-nginx yapılandırmasını bunun aracılığı ile sadece bir kaç koda yapabilirsiniz.EasyEngine Kullandığınız taktirde ayrıca sisteme Nginx, PHP, MySQL, Postfix, phpMyAdmin gibi sistem araçlarını ayrıca ihtiyacı olan diğer şeyleride otomatik olarak kuracak ve yapılandıracaktır.Bu wordpress-nginx web sitelerini kurmak ve yönetme işlemini çok kolaya indirger böylelikle saatlerde kod girip paketleri yükleme derdiniz ortadan kalkıyor.Herşey siz ana komutu verdiğiniz anda arka planda gerçekleşiyor ve sizde gereken sefayı sürüyorsunuz.EasyEngine sadece Ubuntunun LTS sürümleirnde çalışmaktadır 12.04/14.04 aynı zamanda Debian 6/7 sürümlerindede çalışmaktadır.

# Özellikleri

- Nginx, PHP, MySQL, Postfix, phpMyAdmin Tek bir komut ile kurabilme
- Sunucu özelliklerinize göre otomatik olarak sunucuyu yapılandırma özelliği
- Tek veya çoklu sitelerin kurulum ve yapılandırılma işlemi
- Otomatik Güncelleme özelliği
- w3-total-cache, wp-super-cache, nginx’s fastcgi-cache, Zend Opcache,ve Memcache tek bir komut ile kurma ve yapılandırma özelliği

## Ubuntu 14.04 Üzerine Kurulum işlemi

Kurulum parametremiz.

    wget -qO ee rt.cx/ee && sudo bash ee

![easyenginekurulumugorsel1](/assets/easyenginekurulumugorsel1.png)

![easyenginekurulumugorsel2](/assets/easyenginekurulumugorsel2.png)

Kurulum böylelikle son buldu ancak tam olarak bitmedi bahsettiği üzere komutu çalıştırıyoruz.

    source /etc/bash_completion.d/ee

bu komuttan sonra hemen tam kurulum parametresini veriyoruz.

    sudo ee stack install

![easyenginekurulumugorsel3](/assets/easyenginekurulumugorsel3.png)

![easyenginekurulumugorsel5](/assets/easyenginekurulumugorsel5.png)

Kurulumumuz nihayet son buldu artık sitemize giriş yapabiliriz.ve karşımıza Nginx ekranı gelecek şu şekilde

![nginx_defaultgorsel1](/assets/nginx_defaultgorsel1.png)

Peki EasyEngine kurulumunu tamamladık ama wordpress sitesi kurmak istiyoruz ve özelliklerinide haliyle belirlememiz gerekiyor. bunuda EasyEngine nin komut satırını kullanarak yapacağız istediğiniz gibi kurulumu yapabilirsiniz.Aşağıda bir kaç örnek komut bulunmaktadır.

![easyenginekurulumgorsel7](/assets/easyenginekurulumgorsel7-e1406468188445.png)

Wordpress+Nginx memcached ve w3tc kurulumlarınıda script kendisi gördüğünüz gibi gerçekleştirdi.Artık Ns yönlendirmesi yaptıysanız siteniz karşınızda duruyor olaraktır.Dilerseniz farklı ayarlamalar ilede kurulum yapabilirsiniz.

    //Tek site WP
    ee site create example.com --wp # Sade eklentisiz wordpress kurulumu
    ee site create example.com --w3tc # wordpress ve w3-total-cache eklentisinin kurulumu
    ee site create example.com --wpsc # wordpress ve wp-super-cache eklentisinin kurulumu
    ee site create example.com --wpfc # wordpress + nginx fastcgi_cache kurulumu
    //Birden fazla dizine wp
    ee site create example.com --wpsubdir # Dizine wordpress kurulumu eklentisiz
    ee site create example.com --wpsubdir --w3tc # Dizine wordpress ve w3-total-cache eklentisinin kurulumu
    ee site create example.com --wpsubdir --wpsc # Dizine wordpress ve wp-super-cache eklentisinin kurulumu
    ee site create example.com --wpsubdir --wpfc # Dizine wordpress + nginx fastcgi_cache kurulumu
    //subdomain WP
    ee site create example.com --wpsubdom # subdomaine wordpress kurulumu eklentisiz
    ee site create example.com --wpsubdom --w3tc # subdomaine wordpress ve w3-total-cache eklentisinin kurulumu
    ee site create example.com --wpsubdom --wpsc # subdomaine wordpress ve wp-super-cache eklentisinin kurulumu
    ee site create example.com --wpsubdom --wpfc # subdomaine wordpress + nginx fastcgi_cache kurulumu
    //Wordpress olmayan siteler için
    ee site create example.com --html # html siteler için kurulum parametresi
    ee site create example.com --php # php destekleyen herhangi bir site kurulumu
    ee site create example.com --mysql # php ve mysql destekleyen herhangi bir site kurulumu

Mysql şifresini bilmiyorum ne yapacam diyorsanız sshdan vereceğiniz ufak bir kod ile bununda öğrenmenin kolay olduğunu biliyorsunuz.

    sudo cat ~/.my.cnf

wp-config.php ile ayarlamalarınızı yapabilir yada standart belirlenin bazı ayarlamaları kaldırmak için ise dizininiz

    ls /var/www/mertcangokgoz.com/

Sistemin durumunu kontrol etmek isteyebilirsiniz o zamanda kullanacağımız komut

    sudo ee system status

![easyenginekurulumgorsel8](/assets/easyenginekurulumgorsel8.png)Sistemleri yeniden başlatmak yada durdurmak isterseniz bunun için

    sudo ee system start
    sudo ee system stop
    sudo ee system restart

Sistemde kullandığımız phpMyAdmin, MemCache viewer, Zend Opcache gibi programların giriş çıkışlarını kontrol etmemiz lazım sonra hacklenme gibi durumlar doğabilir bu yüzden nginxden bir kaç ayarlama için

    sudo nano /etc/nginx/common/acl.conf

![easyenginekurulumgorsel9](/assets/easyenginekurulumgorsel9.png)Kayıt edip çıkıyoruz buradaki **"allow 192.168.1.100"&nbsp;** sizin kendi ip adresiniz olacak.Buna dikkat ediniz.

Servislere bi restart atalım ki ayarlamalarımız geçerli olsun

    nginx -t && service nginx restart

Bunun yerine aşağıdakinide kullanabilirsiniz.

    sudo ee system restart

htpasswduser i ve şifreyi değiştirmek için

    ee secure --auth

Komutunu veriyoruz ve istediğimizi belirliyoruz.

![easyenginekurulumgorsel10](/assets/easyenginekurulumgorsel10.png)

EasyEngine yeni versiyonu çıkarda güncellenmezse otomatik güncelleme çalışmaz ise aşağıdaki komutu kullanarak sistemi güncelleyebilirsiniz.

    sudo ee update

Görmüş olduğunuz gibi EasyEngine gerçektende kolay,kullanışlı ve hiçbir bilgisi olmayan kişilerin bile sysadmin gibi hissetmesini sağlayacak ve bilgili olmasanız bile sitenizin yeni sistemini kurabileceksiniz.wordpress olsun veya olmasın sitelerinizi kontrol edebilecek ve ek ücret ödeme derdiniz olmayacak...
