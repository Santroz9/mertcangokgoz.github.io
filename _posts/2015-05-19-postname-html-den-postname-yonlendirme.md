---
layout: post
title: "/%postname%.html den /%postname%/ yönlendirme"
date: 2015-05-19 13:28:47.000000000 +03:00
type: post
published: true
status: publish
categories: nginx
description: Arkadaşlar SEO ya uyumludur diye kullanılan .html tipi kalıcı bağlantılar Nginx üzerinde ciddi oranda sıkıntı yaratmaktadır.Ancak bunu bir kaç
---

Arkadaşlar SEO ya uyumludur diye kullanılan .html tipi kalıcı bağlantılar Nginx üzerinde ciddi oranda sıkıntı yaratmaktadır.Ancak bunu bir kaç ufak kod ile çözmeniz mümkün /%postname%.html olan link yapınızı 301 yönlendirme ile kolaylıkla /%postname%/ yapabileceksiniz bunun için sisteminizde nginx-full sürümü veya daha üst bir sürüm kurulu olması ve rewrite modülünün kurulu olması gerekmektedir.Kullanacağımız kod ise aşağıdaki gibidir.

Tüm /%postname%.html linklerin kalıcı olarak 301 aracılığı ile /%postname%/ yapısına aktarılması

    rewrite ^(/.+)\.html$ $1 permanent;

Sadece belirli konu ve linklerin 301 ile yönlendirilmesi için ise

    rewrite ^(/konu linki.html)(.*)$ https://mertcangokgoz.com/konu linki/$2 permanent;

Bu sayede index kaybetmeden google tarafından yeni link yapınız kolaylıkla anlaşılacak ve sıralama kayıplarından kurtulacaksınız.
