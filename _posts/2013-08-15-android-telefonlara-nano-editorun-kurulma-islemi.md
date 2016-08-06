---
layout: post
title: Android sistemlerde nano editorü
date: 2013-08-15 20:45:50.000000000 +03:00
type: post
published: true
status: publish
categories: genel
description: Android telefonlaradki o sıkıcı text editörden sıkıldıysanız işte bu makalemiz tam size göre ancak baştan belirtiyim ROOT gerektirir ve oluşabilecek
---
![ss (2013-08-15 at 08.44.38)](/assets/ss-2013-08-15-at-08.44.381.jpg)

Android telefonlaradki o sıkıcı text editörden sıkıldıysanız işte bu makalemiz tam size göre ancak baştan belirtiyim ROOT gerektirir ve oluşabilecek sorunlarlarda hiç bir şekilde sorumluluk almıyorum...öncelikle nano text editörünü herkes biliyordur en iyi ve en basit kullanımı olan editördür.

Gelelim ne yapacağız bize lazım olan xda daki geliştiricinin vermiş olduğu ve roma yükliyeceğimiz dosyadır.

Bunu nasıl yapacağız derseniz **/system/xbin** yada **/system/bin** içerisine rardan çıkanı atmanız

    http://www.mertcangokgoz.com/Downloads/nano.android.zip

yukarıdaki linkden indirebilirsiniz.Ardından gereken komutları çalıştırmanız

    su
    export TERMINFO=/etc/terminfo
    export TERM=linux

Bundan sonrada sisteme ne olur ne olmaz bi reboot atın sonrasında nano artık çalışacaktır.
