---
layout: post
title: Nginx'de Cors Ayarları Nasıl Yapılır
date: 2015-06-03 20:16:23.000000000 +03:00
type: post
published: true
status: publish
categories: nginx
description: Cors belkide internet ortamında en fazla aradığım şeylerden bir tanesi olabilir.Yaklaşık 2 hafta aramışımdır en iyi ayarı bulana kadar deneme
---

**Cors** belkide internet ortamında en fazla aradığım şeylerden bir tanesi olabilir.Yaklaşık 2 hafta aramışımdır en iyi ayarı bulana kadar deneme yanılma derken çalışan versiyonu sonunda karşınıza çıkartıyorum.

CDN kullanmaya başladığınızda Cors eğer aktif değilse web fontlar gözükmez yada uzaktan çekilen resimler hata verir işte CORS bunun önüne geçiyor ve hepsine izin veriyor **Apache** sistemlerde oldukça basit olsada **Nginx** de yapılan her isteğe ayrı ayrı davranmamız gerekiyor.Güvenlik bakımındanda oldukça faydalı yapmanız gereken

**Dosya** : /etc/nginx/global/cors.conf

adında bir dosya oluşturmak ve sonrasında aşağıdaki satırları içerisine eklemek

    location / {
         if ($request_method = 'OPTIONS') {
            add_header 'Access-Control-Allow-Origin' '*';
            add_header 'Access-Control-Allow-Credentials' 'true';
            add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
            add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type';
            add_header 'Access-Control-Max-Age' 1728000;
            add_header 'Content-Type' 'text/plain charset=UTF-8';
            add_header 'Content-Length' 0;
            return 204;
         }
         if ($request_method = 'POST') {
            add_header 'Access-Control-Allow-Origin' '*';
            add_header 'Access-Control-Allow-Credentials' 'true';
            add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
            add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type';
         }
         if ($request_method = 'GET') {
            add_header 'Access-Control-Allow-Origin' '*';
            add_header 'Access-Control-Allow-Credentials' 'true';
            add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
            add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type';
         }
    }

Eklediğimiz bu satırlar sayesinde **Nginx** artık **CDN** de sıkıntı çıkartmayacak ve web fontlarınız düzgün bir şekilde çalışacak Peki **Apache** kullanıyorsak ne yapacağız alışılmışın aksine aslında standart belirlenen **CORS** apachede çalışmaz. **.htaccess** içerisine aşağıdaki kural setini tanımlamanız gerekmektedir.

    <FilesMatch "\.(ttf|ttc|otf|eot|woff)$">
        <IfModule mod_headers>
            Header set Access-Control-Allow-Origin "*"
        </IfModule>
    </FilesMatch>

İşlem tamamdır artık **CDN** de ve **APİ** uygulamalarınızda sıkıntı yaşamayacaksınız.
