---
layout: post
title: Nginx SSL Yönlendirme
date: 2015-06-15 14:09:53.000000000 +03:00
type: post
published: true
status: publish
categories: nginx
description: SSL Aktif ettiğim zaman apache kullanıyordum.Sonradan baktım apacheden bir yol olmayacak geçtim nginx e bu seferde http yönlendirmesinin kolay
---

SSL Aktif ettiğim zaman apache kullanıyordum.Sonradan baktım apacheden bir yol olmayacak geçtim nginx e bu seferde http yönlendirmesinin kolay olmadığını söylediler dedim nasıl kolay olmaz hemen yaptım ayarlamalayı yönlendirdim http trafiğini https e böylelikle güvenlik üst seviyelere yükselmiş oldu kullanıcılar http girseler bile otomatik olarka https trafiğine yönlenecekler bu yüzden içimiz rahat

**Dosya** : /etc/nginx/nginx.conf satırının en üstüne yeni bir server bloğu açıp aşağıdakileri yazıyoruz

    server {
    server_name mertcangokgoz.com;
    rewrite ^/(.*) https://mertcangokgoz.com/$1 permanent;
    }

Ardından nginx restart etmemiz gerekiyor.

    service nginx restart
