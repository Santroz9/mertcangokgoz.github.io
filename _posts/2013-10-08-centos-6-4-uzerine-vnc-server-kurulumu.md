---
layout: post
title: Centos 6.4 Üzerine VNC Server Kurulumu
date: 2013-10-08 19:41:57.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Linux kullanan arkadaşlar sistemlerini uzaktan yönetmek isteyebilirler buna biraz görsellik katmak isteyebilirler işte VNC burada devreye giriyor.
---

**Linux** kullanan arkadaşlar sistemlerini uzaktan yönetmek isteyebilirler buna biraz görsellik katmak isteyebilirler işte **VNC** burada devreye giriyor. Bu anlatımımızda sizlere Centos 6.4 üzerine VNC server kurulum ve yapılacak olan ayarları anlatmak istiyorum biraz vaktim olsaydı bir script yazardım ilerleyen zamanlarda bash shell olarak ekleyeceğim hiç kuşkunuz olmasın

Neler kuracağız

- VNC Server
- Desktop bileşenleri

Öncelikle sistemimizde SELinux ü kapatalım

    setenforce 0

Kapatma işlemi yapıldıktan hemen sonra centos üzerinde yüklemelerimizi yapmamız gerekiyor bunun için

**GNOME** için

    yum groupinstall  "General Purpose Desktop" "Desktop Platform"

**KDE** için

    yum groupinstall  "KDE Desktop"

Kurulum süresi sistem özelliklerine göre değişmektedir. Kurulum tamamlandıktan hemen sonra sıra VNC yi kurmaya geldi

    yum -y install vnc-server

yada

    yum -y install tigervnc-server

Kurulumları tamamlandıktan sonra şifre belirlemeye geldi sıra

    vncpasswd

Komutunu veriyoruz ardından şifrenizi yazmanız için yer gelecek şifremizi belirliyoruz.(kolay tahmin edilen şifreler kullanmayınız)

bağlanırken vnc clientine ip den sonra **:1** yazmayı unutmayınız.

## **VNC Yeni Kullanıcı eklemek**

nano komutu vererek **/etc/sysconfig/vncservers** açıyoruz sonrasında aşağıdaki satırı buluyoruz.

    VNCSERVERS="2:testuserpw"

Kullanıcı ekliyecek isek eğer aşağıdaki örnekte olduğu gibi düzenleme yapıyoruz.

    VNCSERVERS="2:testuserpw 3:pass1 4:test2"
    VNCSERVERARGS[2]="-geometry 1280x1024"
    VNCSERVERARGS[3]="-geometry 1024x576"
    VNCSERVERARGS[4]="-geometry 800x600"

Şeklinde düzenliyoruz kayıt edip çıkış yapıyoruz. işlemimiz tamamlandı bundan sonra yapmanız gereken eğer açılmamış ise

    /etc/init.d/vncserver start

komutu vererek başlatıyoruz.(sistemi her yeniden başlatışınız da bu işlemi tekrar etmeniz gerekmektedir.)&nbsp;yok ben bunla uğraşamam diyenler için

    chkconfig vncserver on

komutu ile sistem başlangıcına ekleyebilirsiniz.
