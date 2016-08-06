---
layout: post
title: Linux Sistemlerde 3G/4G Modem Kullanımı
date: 2014-09-02 13:47:57.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Laptop diye tabir ettiğimiz türkçeside dizüstü olan(ne alaka ise) sistemlerimizde genellikle kullandığımız 3G/4G modemlerin linuxde nasıl kullanılabileceğin
---
Laptop diye tabir ettiğimiz Türkçesi de dizüstü olan(ne alaka ise) sistemlerimizde genellikle kullandığımız **3G/4G** modemlerin linux de nasıl kullanılabileceğini anlatmak istiyorum.Masaüstü sisteminizde de kullanabilirsiniz de pek mantıklı olmayacaktır diye düşünüyorum.Alex adında bir geliştirici abimiz yazdığı uygulama ile modem fonksiyonlarını linux üzerinden kontrole imkan sağlayan bir araç geliştirmiş eski lan bu çalışmıyordur yada bugludur dediydim sonra bi baktım çalışıyor hemen bunu yazmalıyım dedim sonuç itibariyle açık kaynak kod mentalitesini benimsemiş ve benim gibi windows kullanmayan bir kesim var bulmuşken yapışalım.

Öncelikle sisteminize uygun olan kurulum parametresini uygulayın

centos/rhel

    yum install modem-manager-gui

Ubuntu,Debian,Mint

    sudo apt-get install modem-manager-gui

PPA kurmak isterseniz

    sudo add-apt-repository ppa:linuxonly/modem+manager+gui
     sudo apt-get update
     sudo apt-get install modem-manager-gui

Arch Linux

    sudo pacman -S modem-manager-gui

Kurulum tamamlandıktan sonra bir ayar gerektirmiyor **3G/4G** modeminizi pc nize takıyorsunuz sonrasında programı açıyorsunuz otomatik olarak zaten nedir ne değildir gözükecek.

![3g.4g.usbmodemlinuxgorsel1](/assets/3g.4g.usbmodemlinuxgorsel1.png)

![3g.4g.usbmodemlinuxgorsel3](/assets/3g.4g.usbmodemlinuxgorsel3.png)

Gördüğünüz gibi güzel bir uygulama çıkartmış Alex kardeş **SMS** atabiliyorsunuz bunun dışında trafiği izleyebiliyorsunuz ve şu yıldız kare kodları çalıştırabiliyorsunuz.Trafiği de program ip port destination olarak gösteriyor

![3g.4g.usbmodemlinuxgorsel2](/assets/3g.4g.usbmodemlinuxgorsel2.png)

program gerçekten güzel bunu bir kullanıcı arayüzü ile yapabilmekte ayrı güzel linuxde normalde arada kodla uğraşıyorduk bilen biliyor.Resmi sitesinden indirip derleyebilirsiniz bunun için [Tıklamanız](http://linuxonly.ru/cms/page.php?7) yeterli
