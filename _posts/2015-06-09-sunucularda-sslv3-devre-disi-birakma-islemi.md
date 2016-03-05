---
layout: post
title: Sunucularda SSLv3 Devre Dışı Bırakma İşlemi
date: 2015-06-09 23:59:30.000000000 +03:00
type: post
published: true
status: publish
categories: Güvenlik
description: Bildiğiniz üzere SSLv3 üzerinde bulunan açıklar sunucu ve sistemleri ciddi bir şekilde etkiliyordu sonraları anlaşıldıki bu protokolün kapatılması
---

Bildiğiniz üzere SSLv3 üzerinde bulunan açıklar sunucu ve sistemleri ciddi bir şekilde etkiliyordu sonraları anlaşıldıki bu protokolün kapatılması ile Poodle açığını durdurabiliyorduk.Sunucu tabanında ise bu işlemi yapmak için bir kaç yol mevcut bunlar ise

### IIS

    Windows Registry Editor Version 5.00

    [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server]
    "Enabled"=dword:00000000

    [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server]
    "Enabled"=dword:00000000

### Nginx

    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

### Lighttpd

    ssl.use-sslv2 = "disable"
    ssl.use-sslv3 = "disable"

### Apache

    SSLProtocol All -SSLv2

Yukarıdaki ayarlar yapıldığı taktirde sistemde Poodle açığı dediğimiz açık kalmayacak hala bu açıkdan etkilenen sistemler mevcut ise yukarıdaki ayarları yapabilirler...
