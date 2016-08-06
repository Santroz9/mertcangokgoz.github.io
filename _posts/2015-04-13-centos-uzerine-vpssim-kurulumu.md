---
layout: post
title: CentOS Üzerine VPSSIM Kurulumu
date: 2015-04-13 15:05:53.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Normalde bunun adı VPS SIMple ancak bu arkadaşlar ple ekini akıp VPSSIM yapmışlar.İyi de olmuş adamlar bizim yerimize çoğu uygulamayı tek
---
Normalde bunun adı **VPS SIM** ple ancak bu arkadaşlar ple ekini akıp **VPSSIM** yapmışlar.İyi de olmuş adamlar bizim yerimize çoğu uygulamayı tek bir scriptde kurulum için toparlamış ve hazırlamışlar bu script sayesinde hiç uğraşmadan Web sunucunuzu kurup sitenizi yayınlayabilirsiniz.Script Sadece Centos işletim sistemlerinde çalışmaktadır tabi onlar içerisinde ise güncel olan 2 adet sürüm tercih edilmiş **CentOS 6** ve **CentOS 7** bu iş için kullanabilirsiniz.

## Özellikleri

- 32Bit ve 64Bit Sistemlerde sorunsuz çalışabilir
- Nginx en son sürümü ile çalışır
- Nginx ile birlikde PHP-FastCGI Kullanılarak Apacheye oranla %45 performans sağlar
- PHP-FPM Desteği ile daha hızlı php sorguları sağlanır
- HTTP/2 ve SPDY desteği sağlar
- Kurmak istediğiniz PHP Sürümünü seçebilirsiniz
- Veritabanı uygulaması olarak MariaDB Kullanır böylelikle daha hızlı SQL komutları çalıştırabilirsiniz
- SSL desteği vardır(SPDY)
- Veritabanı yönetimi için PhpMyAdmin Kurulumu yapabilirsiniz
- CSF Firewall kurabilirsiniz
- Yukarıdaki pek çok özelliği açıp kapatabilirsiniz.
- Sunucu ve Sitelerinizi Optimize etmek isterseniz OpCache/MemCached/Google PageSpeed Modüllerini kurabilirsiniz
- ve daha fazlası...

Öncelikle **VPSSIM** Sistemi yormayan bir Uygulama olduğu için elinizde öyle yüksek özelliklerde bir sunucu olmasına hiç gerek yok 512MB ramli bir VPS bile işinizi görecektir.Şimdi kurulum için hazırlıklarımızı yaptıysak yanımızdada çayımız varsa iş tamamdır.

Kurulum parametremiz şu şekilde

    yum update
    yum -y install wget && wget https://vpssim.com/install && chmod +x install && ./install

Bu Parametreyi verdiğiniz anda Bir takım güncellemeler ve kurulumlar yapacak sonrasında karşınıza aşağıdaki gibi bir ekran geldiğinde direk olarak komutu basın gitsin

![vpssimgorsel1](/assets/vpssimgorsel1.png)

Kurulum parametresini verdiğinizde karşınıza bu ekran gelecek kurulacak olan **PHP** versiyonunu seçmenizi isteyecek istediğiniz bir sürümü seçebilirsiniz.

![vpssimgorsel2](/assets/vpssimgorsel2.png)

Kurulacak olan domain vs belirliyoruz ve **PhpMyAdmin** portunu belirliyoruz bu portu kafanıza göre ayarlayabilirsiniz.

![vpssimgorsel3](/assets/vpssimgorsel3.png)

Değişiklikleri onaylıyormusunuz diye bize birde uyarı veriyor evet diyip geçiyoruz.

![vpssimgorsel4](/assets/vpssimgorsel4.png)

Bu ekrandan sonra ufak bir kurulum yapıcak ve karşınıza şöyle bir kısım gelecek bunada onaylıyoruz ve kuruluma tamamen geçmiş oluyor sistem

![vpssimgorsel5](/assets/vpssimgorsel5.png)

Sıra geldi **MySQL** Yönetici şifresini ayarlamaya burada oluşturacağınız şifre rastgele sayı karakter ve şekillerden oluşursa iyi olur güvenliğin az olmasını istemeyiz.

![vpssimgorsel6](/assets/vpssimgorsel6.png)

biraz işlem yapacak sonrasında kurulumları tamamlayacak ve aşağıdaki gibi bir ekran gelecek ve otomatikman sistem yeniden başlatılacak bundan sonra işlemlerinizi yapabilirsiniz sistemin online olduğunu ip adresine girerek görebilirsiniz.

![vpssimgorsel7](/assets/vpssimgorsel7.png)

Hayırlı olsun kurulumumuz tamamlandı karşınıza artık seçmeli bir kurulum menüsü çıktı artık tüm işlemlerinizi buradan yapacaksınız.Komut ekranına **vpssim** yazarak aşağıdaki ekrana ulaşabilirsiniz.

![vpssimgorsel8](/assets/vpssimgorsel8.png)
