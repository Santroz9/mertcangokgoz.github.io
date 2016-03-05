---
layout: post
title: Apache'de HTTP'den HTTPS Geçiş
date: 2015-12-29 12:05:10.000000000 +02:00
type: post
categories: Linux
description: Apache tabanlı veya direk olarak apache kullanan kişilerin SSL alımından sonra http den gelen tüm trafiği https yönlendirmemiz gerekiyor
---

**Apache** tabanlı veya direk olarak apache kullanan kişilerin SSL alımından sonra http den gelen tüm trafiği **https** yönlendirmemiz gerekiyor bunu yapmak için ise . **htaccess** kural setlerinde bir takım değişikliğe gitmemiz gerekiyor.

Tüm **Http** den gelen trafiği **Https** yönlendirme

```
    RewriteEngine On
    RewriteCond %{SERVER_PORT} 80
    RewriteRule ^(.*)$ https://www.siteadresi.com/$1 [R,L]
```

Belirli Bir yoldaki tüm trafiği Https yönlendirme

```
    RewriteEngine On
    RewriteCond %{SERVER_PORT} 80
    RewriteCond %{REQUEST_URI} yoladi
    RewriteRule ^(.*)$ https://www.siteadresi.com/yoladi/$1 [R,L]
```

Gelen Tüm istekleri Https yönlendirme

```
    RewriteCond %{HTTPS} =on
    RewriteCond %{THE_REQUEST} ^[A-Z]{3,9}\ /(.*)//(.*) HTTP/ [NC]
    RewriteRule ^.*$ https://%{SERVER_NAME}/%1/%2 [R=301,L]
```

Bu sayede **Apache** ve diğer türevlerde **SSL** sertifikası aldığınız zaman sitenize gelen normal http trafiğini https yönlendirebileceksiniz.Tabi bunu yapmak ile bitmiyor herşey birte temanızda gerekli düzenlemeleri yapmalısınız bunun içinde tüm "https://" başlayan linkleri "//" olarak değiştirmeniz sorunu çözecektir.
