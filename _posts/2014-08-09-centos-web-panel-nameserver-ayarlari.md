---
layout: post
title: Centos Web Panel Nameserver Ayarları
date: 2014-08-09 12:12:29.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Centos web panelimizi ilk kez kuruyorsak sistemimizde nameserver ayarlarınıda haliyle yapmamız gerekiyor.Bunun için centos web panel kullanıcıyı
---

Centos web panelimizi ilk kez kuruyorsak sistemimizde nameserver ayarlarınıda haliyle yapmamız gerekiyor.Bunun için centos web panel kullanıcıyı yormayan bir arayüz yapmış bu şekilde nameserver ayarlamalarını kolay bir şekilde yapabiliyoruz.

İlk olarak Panelimize güzel bir biçimde giriş yapıyoruz. sol menüden "DNS Functions" tıklıyoruz. Buradanda Edit Nameserver IPs Diyoruz. ve domaine tanımladığınız nameserveri birkezde buraya tanımlıyorsunuz.

![nameservergorsel1](/assets/nameservergorsel1.png)

Sonrasında ise ip ve tanımlanacak domain vs bilgilerimizi giriyorz.

![nameservergorsel2](/assets/nameservergorsel2.jpg)

Daha sonra ip adresimizi sisteme tanıtacağız. ön tanımlı olarak 127.0.0.1 tanımlıdır.değiştirmeniz şiddetle önerilir.Bunuda soldaki menünün yukarılarında bulunan **"CWP Settings"** adı altında **"Edit Settings"** diyerek yapıyoruz.

![nameservergorsel3](/assets/nameservergorsel3.png)

Bilgilerinizi doğru bir şekilde girmeyi unutmayın bende apache portunun 82 olmasının nedeni sistemde Varnish cache nin aktif olmasından kaynaklanmaktadır.

![nameservergorsel4](/assets/nameservergorsel41.jpg)

Bu işlemleri yaptıktan sonra alan adınızı oluşturduğunuz nameserver yönlendirebilirsiniz.24 ila 48 saat arasında tam olarak yönlenecektir.
