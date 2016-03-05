---
layout: post
title: Redis ile Wordpress Cache
date: 2015-07-19 19:42:49.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Redis Key/value türünde çalışan bir yüksek performanslı bir cache sistemidir NoSQL veri yapısına sahiptir.Veriyi bellek üzerinde tutmak
---

**Redis** Key/value türünde çalışan bir yüksek performanslı bir cache sistemidir NoSQL veri yapısına sahiptir.Veriyi bellek üzerinde tutmak üzerine geliştirilmiştir belirli periyotlarla üzerindeki verileri bir dosyaya kayıt eder. Bu yüzden key/value ulaşılmasında yüksek oranda kullanıcısına hız sunar uzatma lan ben anlamadım diyenler için ise sitenizin sayfaları hızlı açılır.İşlemler hızlıca yapılır kasma veya onun gibi şeyler görülmez yüksek hit alan sitelerde kullanılabilir.

Zaten yüksek trafik alan facebook, instagram, github gibi sitelerde bu alt yapıdan birazda olsa faydalanmaktadırlar.Hemen hemen her yazılım dilini [destekler resmi sitesinden](http://www.redis.io/documentation) gereken dokümanlara ulaşabilirsiniz.

Kurulum için ben **Ubuntu** tercih ettim üşenen adamım ben hemen kurulsun bitsin gitsin hemde çalışsın derdindeydim gecenin körü sonuçta kahvemi tazeledim geçtim laptop karşısına **SSH** bilgilerimi girdim sunucuma ulaştım.Kurmam gereken şey basit ve belli

    sudo apt-get install redis-server php5-redis

ilk olarak **redis** sunucusunu&nbsp;sisteme dahil ettik daha sonradan php eklentisini de kurarak sunucusuna yancı yapmış olduk.Her şey buraya kadar çok güzel ilerledi şimdi geldik ufak ayarlamalara ilk olarak php ayarlamasını yapalım.

**Dosya** : /etc/php5/mods-available/redis.ini

İçerisine aşağıdaki satırları ekliyoruz.

    session.save_handler = redis
    session.save_path = "tcp://127.0.0.1:6379"

Ekleme işlemini yaptıktan sonra **php** servisini yeniden başlatıyoruz ki sistem tanısın bilsin ki böyle bir session'umuz varmış desin

    service php5-fpm restart

Daha sonra bir tanım **kernel** düzenlemeleri yapmamız gerekiyor belleği daha efektif kullanabilelim ve sistem bize sıkıntı çıkartmasın diye bunun için ise

**Dosya** : /etc/sysctl.conf

İçerisine aşağıdaki satırları ekliyoruz eğer varsa yeni değerleri ile güncelliyoruz.

    vm.overcommit_memory = 1
    fs.file-max = 100000
    net.core.somaxconn=1024

Gereken ayarları kayıt edip çıkıyorsunuz.Etkinleştirmek için ise

    sysctl -p

Eski sürüm redis sunucusunda bir takım ayarları yapmamıza gerek yoktu ancak yukarıdaki **kernel** ayarlaması ve şimdi yapacağımız **THP** ayarlarını yapmayı unutursanız efektif bir şekilde çalışmaz hatalar alabilirsiniz.

**Dosya** : /etc/rc.local

içerisine aşağıdaki satırları ekliyorsunuz. exit 0 komutundan önce yapıştırınız.

    echo never > /sys/kernel/mm/transparent_hugepage/enabled

yani;

![rclocalayarlamagorsel](/assets/rclocalayarlamagorsel1.jpg)

Bunu da kayıt edip çıkıyorsunuz işlemimiz neredeyse tamamlandı sadece **wordpress** entegre işlemi kaldı buda oldukça basit.Şimdi çalışıyormu çalışmıyormu diye test edelim komut satırına aşağıdaki komutu yazın

    redis-cli ping

Uygulama size şöyle bir çıktı vermesi gerekiyor. **PONG** yazarsa sistemdeki **redis** düzgün bir şekilde çalışıyor demektir.

![redistestgorsel](/assets/redistestgorsel.jpg)

Şimdi sıra geldi **Wordpress** yapılandırmaya bunun için yapılacak şeylerin başında;

- Wordpress Eklentisinin indirilmesi
- Predis kurulumu
- Wordpress ana index ayarlaması

gibi bir kaç teferruat kalıyor. Gereken ekipmanları indirelim bunun için aşağıdaki bağlantıyı kullanabilirsiniz.Ayrıca eklentinin [resmi sayfasından da eklentiyi edinebilirsiniz](https://github.com/BenjaminAdams/wp-redis-cache). Tabi içerisinde predis.php bulunmamaktadır.

    wget https://mertcangokgoz.com/Downloads/wp-redis-cache-master.zip

Dosya içerisinde ekipmanlarımızın hepsi var ben sizin için düzenledim sizin yapmanız gereken yerlerine atmak ama sizin sunucu tarafınızda yapacağınız ayarlarda olacak.İlk olarak dosya içerisinde yer alan

- predis.php
- index.php
- index-wp-redis.php

Bu üç dosyayı **wordpress** sitenizdeki ana dizine atıyorsunuz.Sonrasında içerisinden çıkan eklentiyi yani **"wp-redis-cache"** klasörünü **wordpress** içerisindeki **plugins** klasörüne atıyorsunuz.Bu işlemler bittikten hemen sonra **index-wp-redis.php** içerisinde bir takım ayarları yapıyoruz.

    $debug = true;
    $cache = true;
    $websiteIp = 'sunucu ip adresiniz';
    $sockets = true;
    $redis_server = '127.0.0.1:6379';
    $secret_string = 'gizli komutunuz';

**$websiteIp** ve **$secret\_string** kısımlarını doldurup kayıt edip çıkıyorsunuz.Sitenize attığınız eklentiyi de eklentiler kısmından aktif ediyorsunuz.Son olarak **wp-config.php** ye bir kaç tanımlama yapmamız lazım cache'nin sorunsuz çalışması için gerekiyor bunun için aşağıdaki komutları dosyaya eklemeyi unutmayın

    define('WP_CACHE', true);
    define('WP_CACHE_KEY_SALT', 'site adresiniz');

her şey böylelikle tamamlanıyor.Geriye kaldı aktif etmeye ilk olarak sistemdeki 3 ekipmanı yeniden başlatıyoruz.

    service nginx restart
    service php5-fpm restart
    service redis-server restart

Resetleme işleminiz bittikten sonrada sunucuyu yeniden başlatıyoruz ki **kernel** ayarlamaları gerçerli olsun.isterseniz direk reset de atabilirsiniz.Yukarıdaki işlemi ayrı ayrı yapıp vakit kaybetmenize gerek yok

    reboot

İşlemimiz tamamlandı **Wordpress** sitemizin admin paneline giriyoruz.Ayarlar kısmından Redis cache eklentisini bulup giriyoruz 12 saat cache süresini ayarlıyoruz isterseniz dahada uzun tutabilirsiniz.

- Güncellenen yazılarda
- Yazıp yayınladığınız yeni yazılarda vs otomatik olarak cache silineceğinden sizin ek birşey yapmanıza gerek yok.
