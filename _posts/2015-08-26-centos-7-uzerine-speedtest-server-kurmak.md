---
layout: post
title: Centos 7 Üzerine SpeedTest Server Kurmak
date: 2015-08-26 16:06:22.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Speedtest internet hızınızı test etmek için kullanabileceğiniz bir servis ama flash kullandığı için güvenliğimizi tehdit ediyor.Hal böyle olunca
---

**Speedtest** internet hızınızı test etmek için kullanabileceğiniz bir servis ama **flash** kullandığı için güvenliğimizi tehdit ediyor.Hal böyle olunca bende araştırma yaptım bu adamları kullanmadan nasıl test ederiz diye sonra fark ettim ki **speedtest** server kurabilme imkanımız var tabi gene flash kullanacak ama hiç değilse kendi sistemimizde olduğu için eskisi kadar riskli olmayacak(Eskisi derken biri %90 ise diğeri %70)

Kurulumda ihtiyacımız olanlar

- Herhangi bir centos 7 işletim sistemli bilgisayar
- Web Server için **Apache** ve **PHP** kurulumunu yapabilme yeteneği
- Speedtest sitesinden indirmemiz için gerekli olan paketler

hepsini yapabileceğinizi varsayarak kurulum aşamasına geçelim oldukça basit bir şekilde yapacağız bunu yaparken de "yum" komutları havada uçuşacak.İlk olarak webserver için gerekli paketleri kuralım aşağıdaki komutlar ile bu işlemi yapabilirsiniz.

    yum update
    yum install httpd
    yum install php php-mysql php-gd php-mcrypt

Daha sonra adamların bize vermiş olduğu **server** dosyalarını indireceğiz fazla bir arayüze sahip değil isterseniz özelleştirebilirsiniz ama kişisel kullanım için yeterde artar

    wget http://c.speedtest.net/mini/mini.zip

indirdiğimiz dosyayı sıkıştırılmış halinden çıkartıyoruz ve gerekli olan konuma kopyalıyoruz.

    unzip mini.zip
    cd mini

İçerisinde ne var ne yoksa bir güzel apachenin **default** olarak kullandığı klasöre paslıyoruz. bundan sonra gereken apachede

    cp -rRfv mini /var/www/html/
    cd /var/www/html/mini

İçerisine girdiğimizde **index-php.html** adında bir dosya var siz bunun ismini **index.html** olarak değiştirin.Komut ile yapmak istersenizde

    mv index-php.html index.html

Şimdi apacheyi başlatalım daha önceden başlatılmış ise bir **restart** atalım ki yaptıklarımız otursun yerine güzelce çalışsın ben yeni kurduğunuzu varsayarak apacheyi başlatıyorum.

    systemctl start httpd

Kurulum sonrasında yapmanız gereken **http://ipadresi/mini** yada **http://siteadi.com/mini** şeklinde giriş yapmak Flash isteyeceği için sisteminizde kurulu olması iyi olur kurulu değilse kurmanız gerekiyor.

    nano /etc/yum.repos.d/adobe-linux.repo

içerisine

    [adobe-linux]
    name=Adobe Systems Incorporated
    baseurl=http://linuxdownload.adobe.com/linux/$basearch/
    enabled=1
    gpgcheck=1
    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux

daha sonra ise tekrar update komutunu veriyoruz.

    yum update
    yum install flash-plugin nspluginwrapper alsa-plugins-pulseaudio libcurl

İşlemimiz tamamlandı dilediğiniz gibi hız testinizi kendi sunucunuz üzerinden yapabilirsiniz. Unutmayın ki bu server speedtest bağlı olarak çalışmaya devam edecek siz iyisi **HTML5** destekleyen bir hız test sitesi kullanın [OpenSpeedTest.com](http://openspeedtest.com/) gibi
