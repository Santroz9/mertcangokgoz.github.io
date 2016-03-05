---
layout: post
title: Ubuntu 15.04 Üzerine LAMP Kurulumu
date: 2015-04-30 14:01:01.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: "İlk olarak sizlere Ubuntu 15.04 üzerinde LAMP Kurulumunu göstermek istiyorum sonrasında ilerleyen zamanlarda LEMP Krulumlarınıda anlatacağım"
---
İlk olarak sizlere Ubuntu 15.04 üzerinde LAMP Kurulumunu göstermek istiyorum sonrasında ilerleyen zamanlarda LEMP Krulumlarınıda anlatacağım.Öncelikle Ubuntu 15.04 yeni çıktığı için internet ortamında fazlaca dokümantasyon bulmanız imkansız ancak eski ubuntu makalelerinin çoğu çalışmaktadır bununla beraber bu sürümdede kurulumu birlikte yapacağız.

İlk olarak sistemimize Apacheyi dahil edelim bildiğiniz üzere Apache açık kaynak kodlu bir şekilde geliştirilen bir web server uygulaması ancak yüksek ölçekli siteler tarafından kesinlikle kullanılmaz performans sıkıntıları vardır burada kurarken daha yeni başlamış bir site kuruyor gibi düşünebiliriz hiti yeni yeni gelmeye başlayan gelişmekte olan bir site gibi düşünelim

Komutumuzu direk olarak veriyoruz ve kurulmuş oluyor Apache hiçbir düzenleme yada ayarlama yapmamıza gerek kalmayacak

    sudo apt-get install apache2

Test Sayfasına ulaşmak için **http://Sunucuipadresi/** şeklinde girişimizi yapıyoruz.Aşağıdaki gibi bir sayfa sizi karşılayacak

![ubuntu15.04lampkurulumu](/assets/ubuntu15.04lampkurulumu-e1430338943543.jpg)

Sıra Geldi MySQL kurulumuna ufak bir kod ile kurulumu yapabiliriz.O kadar uğraştırıcı bir tarafı yok hemen parametremizi uygulayalım ve kurulsun

    sudo apt-get install mysql-server mysql-client

Kurulum başlar başlamaz MySQL diyecek ki kardeş bana bi yönetici şifresi ayarlasana işlerimizi bununla yapalım.Sizde olur abi diyip devam edeceksiniz yolunuz

![ubuntu15.04mysqlkurulumu](/assets/ubuntu15.04mysqlkurulumu-e1430339202480_xvr5cf.jpg)

Şimdi arkadaşlar ubuntu 14.10 ve altı sürümlerde komutlar genelde aynıyken 15.04 de değiştiğini fark ettim.Durumunu kontrol ederken kullanacağımız yeni kodumuz

    sudo systemctl status mysql

Olarak görüyorum eskisinde ise

    sudo service mysql status

Sıra Geldi PHP kurulumuna Apachede PHP direk olarak kurabileceğinizi elbetde biliyorsunuzdur NGİNX gibi uğraştıran bir tarafı yok kur geç yapacağız.Ama bunu yaparken aşağıdaki kodu kullanacağız

    sudo apt-get install php5 php5-mysql libapache2-mod-php5

Kurulum tamamlandıktan sonra ki bu yaklaşık 1-2 dk demek aşağıdaki komut ile çalışıp çalışmadığına bir bakalım

    sudo nano -w /var/www/html/info.php

İçerisine phpde her zaman kullanılan tipik info komutunu girelim

    <?php
    phpinfo();
    ?>

Yukarıda dediğim gibi komutlarda bir değişiklik olmuş yeniden başlatma konusunda kullanacağımız yeni komutumuz

    sudo systemctl restart apache2

Ubuntu 14.10 ve eski sürümlerinde ise

    sudo service apache2 restart

Şimdi test etmek istersek **http://sunucuipadresi/info.php** diyoruz karşımıza aşağıdaki gibi bir ekran geliyor ve kurulduğunu anlamış oluyoruz.

![ubuntu15.04phpkurulumu](/assets/ubuntu15.04phpkurulumu-e1430339593560.jpg)
