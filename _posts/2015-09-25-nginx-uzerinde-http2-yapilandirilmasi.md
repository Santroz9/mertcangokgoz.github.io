---
layout: post
title: Nginx Üzerinde HTTP/2 Yapılandırılması
date: 2015-09-25 16:27:16.000000000 +03:00
type: post
published: true
status: publish
categories: Nginx
description: Uzun süredir http/2 biye bize SPDY birşey yutturmuştu geliştiriciler şimdi ise bunu bir kenara bırakıp ciddi ciddi http2 ye geçmeye başladık nginx
---

![1439288659](/assets/1439288659.png)

Uzun süredir **http/2** biye bize **SPDY** birşey yutturmuştu geliştiriciler şimdi ise bunu bir kenara bırakıp ciddi ciddi **http/2** ye geçmeye başladık nginx kullanan web site sahipleri hemen güncellemelerini ve ayarlamalarını yaptı lakin bizim ülkemizde bunu hemen görmenin imkanı pek yok gibi duruyor.

Öncelikle 22 Eylül tarihinde duyurulan bir güncelleme ile **Nginx 1.9.5** sürümü geldi bu sürüm ilede geliştiriciler **HTTP/2** protokolüne şrank diye geçtiler. Nginx ayarlamalarınızı yaparken öyle uç noktalarda bir işlem gerekmiyor sadece derlerken yeni parametreleri eklemeniz gerekiyor.

Yapılması gerekenler sırasıyla

    wget http://nginx.org/download/nginx-1.9.5.tar.gz
    tar -zxvf nginx-1.9.5.tar.gz

ardından dizin içerisine giriş yapıyoruz ve parametrelerimizi sırasıyla giriyoruz.

    ./configure --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=www-data --group=www-data --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_stub_status_module --with-http_auth_request_module --with-file-aio --with-ipv6 --with-http_v2_module

ufak bir işlemden sonra aşağıdaki parametreleri veriniz.

    make && make install

bu komutları verdikten sonra kurulum tamamlanmış oluyor ama servisi başlatmadan önce yapmanız gereken birşey var spdy kalıntılarından kurtulmak bunları şu şekilde yapabilirsiniz.Sistemde tanımladığınız domine ait olan ayar dosyasını buluruz.

**Dosya:** /etc/nginx/sites-available/mertcangokgoz.com

    nano mertcangokgoz.com

içerisinde **443** portunu kullanan servislerin sonunda bilindiği gibi **spdy** bulunuyor çünkü önceden spdy kullanıyorduk bu kısımları kaldırıyoruz ve yerine **http2** yazıyoruz.

    server {
    	listen 443 ssl http2;
            listen [::]:443 ipv6only=on ssl http2;
            server_name mertcangokgoz.com;
    	error_page 404 /404.html;
       	error_page 500 502 503 504 /50x.html;
    }

Aynı dosya içerisinde birde _"spdy\_headers\_comp 0;"_ şu şekilde bir satır bulunacak bunuda dosya içerisinden kaldırıyorsunuz.Servisi yeniden başlattıktan sonra İşlemimiz böylelikle tamamlanmış oluyor artık **HTTP/2** protokolüne geçiş yaptınız.

Test etmek için [bu web sitesinden](https://tools.keycdn.com/http2-test) faydalanabilirsiniz. **(Sitesinde CloudFlare aktif olan arkadaşlar analizlerde Http/2 kullandıklarını henüz göremeyecekler çünkü cloudflare hala SPDY kullanmaktadır.)**
