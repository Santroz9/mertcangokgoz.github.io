---
layout: post
title: Vesta Kontrol Panel Kurulumu
date: 2014-07-11 18:16:05.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Karmaşık ve zor kontrol panellerine uğraşmasa son Vesta tüm sorunlarınıza çözüm olmaya geliyor. Bu Paneli keşfetmem nginx ile uğraşmam
---
Karmaşık ve zor kontrol panellerine uğraşmasa son **Vesta** tüm sorunlarınıza çözüm olmaya geliyor. Bu Paneli keşfetmem **nginx** ile uğraşmam ile birlikte başladı gerçekten harika bir panel ve ufak çaplı web siteleriniz için kullanımı da oldukça kolay sitesinde belirttiği gibi kullanıcıya temiz bir ara yüz sunmakta ve bilmeyen bir insana bile sunucu yönetimini sevdirecek kadar güzel

Desteklediği İşletim Sistemleri

- Rhel 5/Rhel 6
- Centos 5 / Centos 6
- Debian 7
- Ubuntu 12.04, Ubuntu 12.10, Ubuntu 13.04, Ubuntu 13.10, Ubuntu 14.04

Kurulumu da oldukça basite indirilmiş sizden sadece kurulum esnasında bir elin 5 parmağını geçmeyecek bilgiler istiyor ve yaklaşık 15 DK kadar bir sürede sizlere paneli hazır hale getiriyor…Putty üzerinden sunucumuza **root** olarak bağlanıyoruz.Resmi sitesinden kurulum betiğini indirip gerekli komutu verdikten sonra sizden isteyeceği

- Kullandığınız 1 adet mail adresi
- Kullandığınız Hostname
- Sonrasında Kuruluma başlansın mı diye soracaktır

Kurulum Betiğimizi **curl** aracılığı ile sistemimize indiriyoruz.

    curl -O http://vestacp.com/pub/vst-install.sh

İndirme tamamlandığında kurulum betiğini çalıştırıyoruz.

    bash vst-install.sh

ve bizden istediği bilgileri girdikten sonra **15 DK** sonrasında Sonuç

![vestakontrolpanelkurulumgorsel1](/assets/vestakontrolpanelkurulumgorsel1.jpg)

Ve Panel Kullanıma hazır bir şekilde karşımıza geliyor gereken ayarlamaları panelinizden kolaylıkla yapabilirsiniz.
