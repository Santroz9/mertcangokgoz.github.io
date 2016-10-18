---
layout: post
title: Nginx İçin Self-Signed SSL Sertifikası Oluşturma
date: 2016-10-18
type: post
categories: nginx
description: Nginx için SSL sertifikasını ayarlamak oldukça basittir hele ki bu işlem self-signed ise ve özellikle cloudflare gibi bir aracı kullanılacak
---

Nginx için **SSL** sertifikasını ayarlamak oldukça basittir hele ki bu işlem self-signed ise ve özellikle **cloudflare** gibi bir aracı kullanılacak ise daha iyi olacaktır. Direk olarak cloudflare Mitm olayından etkilenmemiş olursunuz ama gene etkilenirsiniz.

Ben bahsettiğim gibi Cloudflare'yi araya alacaksam böyle bir yöntemi kullanıyorum. Diğer türlü araya **Cloudflare** girmeyecek ise o zaman yapacaklarımız tabi ki farklı olacak

Nginx klasörü içerisine `ssl` adında bir klasör oluşturuyoruz.

```
mkdir /etc/nginx/ssl
```

daha sonra veriyoruz sihirli komutu

```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/mertcangokgoz.com.key -out /etc/nginx/ssl/mertcangokgoz.com.crt
```

RSA da kullandığımız bit uzunluğumuz çok olduğu için sisteminize göre baya sürebilir. Çok sürmesini istemiyorsanız [Baba'ya Kullanılabilir Entropi Lazım](https://mertcangokgoz.com/babaya-kullanilabilir-entropi-lazim/) makalemizdeki adımları uygulayarak işlemleri hızlandırabilirsiniz.

Bizden istediklerini güzelce dolduruyoruz.

```
Country Name (2 letter code) [AU]:TR
State or Province Name (full name) [Some-State]:Ankara
Locality Name (eg, city) []:Ankara
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Mertcan, Inc.
Organizational Unit Name (eg, section) []:
Common Name (e.g. server FQDN or YOUR name) []:mertcangokgoz.com
Email Address []:admin@mertcangokgoz.com
```

Ardından SSL oluşturulma işlemine başlanılacak zaten yerini ayarladığımız içinde `/etc/nginx/ssl` içerisine `.key` ve `.crt` çıkacak

Forward Secrecy olayını gerçekleştirmek için `dhparam.pem` ihtiyacımızı karşılamalıyız.

**İletme gizliliği**(Forward Secrecy) kavramı basittir: Sunucudan **RSA** özel istemci ve sunucu arasında bir **Diffie-Hellman** anahtar değişimini imzalamak için kullanılır. El sıkışma ile elde edilen pre-master anahtar, şifreleme için kullanılır. Ana anahtar bir istemci ve sunucu arasında geçen bir bağlantıya özgüdür ve yalnızca sınırlı bir süre için kullanılır, ömrü kısadır daha sonrasında kullanılmaz.

İletme Gizliliği ile, bir saldırgan sunucunun özel anahtarını eline geçirirse, geçmiş iletişim şifresini çözmek saldırgan için mümkün olmayacaktır. Özel anahtar sadece pre-master anahtarı ortaya koymuyor, ki **DH** yi, imzalamak için kullanıyor. Pre-master anahtarlar hiçbir zaman istemci ve sunucu arasında bir saldırgan tarafından yapılan ve tespit edilemeyen **MITM'leri** engeller.

```
cd /etc/nginx/ssl/
openssl dhparam -out dhparam.pem 4096
```

Daha sonrasında gerekli olan düzenlemeleri şu şekilde yapıyoruz ve konfigürasyon dosyamız hazır olmuş oluyor.

```
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name git.mertcangokgoz.com;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    listen [::]:443 ssl;
    server_name git.mertcangokgoz.com;
    # certs sent to the client in SERVER HELLO are concatenated in ssl_certificate
    ssl_certificate /etc/nginx/ssl/mertcangokgoz.com.crt;
    ssl_certificate_key /etc/nginx/ssl/mertcangokgoz.com.key;
    ssl_session_timeout 1d;
    ssl_session_cache shared:SSL:50m;
    ssl_session_tickets off;

    # Diffie-Hellman parameter for DHE ciphersuites, recommended 4096 bits
    ssl_dhparam /etc/nginx/ssl/dhparam.pem;

    # modern configuration. tweak to your needs.
    ssl_protocols TLSv1.2;
    ssl_ciphers 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256';
    ssl_prefer_server_ciphers on;

    # HSTS (ngx_http_headers_module is required) (15768000 seconds = 6 months)
    add_header Strict-Transport-Security max-age=15768000;

    location / {
	    try_files $uri $uri/ =404;
    }
}
```

Bu işlemlerden sonra `nginx -t` çalıştırıyoruz. Test sonucumuz aşağıdaki gibi olursa

```
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

Tekrardan `reload` yapıyoruz yada yeniden başlatıyoruz. ve ayarların geçerliliğini sağlıyoruz.

```
nginx -s reload
```

veya

```
systemctl restart nginx
```
öptüm bye <3