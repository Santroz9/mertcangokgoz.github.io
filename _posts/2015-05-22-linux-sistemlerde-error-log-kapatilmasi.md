---
layout: post
title: Linux Sistemlerde Error Log Kapatılması
date: 2015-05-22 18:34:23.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Yeni kurduğunuz linux sunucuda herşey güzelce ilerlerken bir anda sistem kitlenip kaldı ve siteniz gerekli gereksiz kasıyor yada hiç açılmıyor
---

Yeni kurduğunuz linux sunucuda herşey güzelce ilerlerken bir anda sistem kitlenip kaldı ve siteniz gerekli gereksiz kasıyor yada hiç açılmıyor sizde bu sorunu çözmek istiyorsanız.Aşağıdaki adımları yapabilirsiniz.

Apache için

    nano /etc/httpd/conf/httpd.conf
    #ErrorLog “var/log/apache/error_log”

Nginx için

    nano /etc/nginx/nginx.conf
    #access_log /var/log/nginx/access.log;
    #error_log /var/log/nginx/error.log;

Şeklinde Ayarlayıp kayıt edip çıkıyoruz böylelikle bir daha sunucunuzda şişme yada kasma olmuyor.Ancak hata loglarını kapatmak sonradan oluşabilecek sorunların çözümünü zorlaştıracağı için bu işlemi yaparken bir kez daha düşünmeyi unutmayınız.
