---
layout: post
title: Centos 7 Üzerine Varnish Kurulumu
date: 2015-07-08 21:38:34.000000000 +03:00
type: post
published: true
status: publish
categories: Nginx
description: Centoz 7 Üzerine varnish kurmak istediyseniz doğru yere geldiniz daha önceden farklı sistemler üzerine kurulumları göstermiştik bugün ise son sürüm
---
Centoz 7 Üzerine **varnish** kurmak istediyseniz doğru yere geldiniz daha önceden farklı sistemler üzerine kurulumları göstermiştik bugün ise son sürüm centos üzerine kurulumu yapacağız.Ayrıca kurulum yapılan sistemde kurulu olan uygulamalar sırasıyla

- Nginx
- MariaDB Sürüm 10
- PHP-FPM

Bu sistem içerisine Varnish dahil edeceğiz ve yapılan isteklerin daha hızlı bir şekilde yanıtlanmasını sağlayacağız daha hızlı açılan sayfalarınız olacak buna karşında daha az **CPU** kullanan siteleriniz olacak.Bilmenizde fayda var **SSL** olan sitelerinizde Varnish çalışmaz https desteği bu sürümlerde yoktur.Biraz uğraşırsanız ssl tunelleme ile yapılabilmekte ancak pek uğraşacağınızı sanmıyorum ben bile üşendim.(Çalıştığını söyleyenler var ama inanmadım pek)

Centos 7 deposunu ekleyelim bunun için epel kullanıcaz.

    rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    yum update
    yum install varnish

Kurulum tamamlandıktan sonra **Nginx** ayarlarına geldi sıra trafiğin gidişatını 80 üzerinden 8080 yönlendiriyoruz.Böylelikle cache işleminin ilk ayağı başlamış olacak

    user www-data;
    worker_processes auto;

    error_log /var/log/nginx/error.log;

    pid /run/nginx.pid;

    events {
        worker_connections 1024;
    }


    http {
        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                          '$status $body_bytes_sent "$http_referer" '
                          '"$http_user_agent" "$http_x_forwarded_for"';

        access_log /var/log/nginx/access.log main;

        sendfile on;

        keepalive_timeout 60;

        include /etc/nginx/global/*.conf;

        index index.html index.htm;

        server {
            listen 127.0.0.1:8080;
            root /var/www/sitead.com/;
            location / {
            }

            error_page 404 /404.html;
            location = /40x.html {
            }

            error_page 500 502 503 504 /50x.html;
            location = /50x.html {
            }

        location ~ \.php$ {
          root /usr/share/nginx/html;
          fastcgi_split_path_info ^(.+\.php)(.*)$;
          fastcgi_pass unix:/var/run/php-fpm/php-fpm.sock;
          fastcgi_index index.php;
          fastcgi_param SCRIPT_FILENAME $document_root/$fastcgi_script_name;
          include fastcgi_params;
    }
        }

Geldik ikinci değişikliğe bunu **/etc/php-fpm.d/www.conf** yolundaki dosya ile yapacağız

    listen = /var/run/php-fpm/php-fpm.sock
    user = www-data
    group = www-data

Varnish'in tamamen aktif olmasını sağlamak istiyoruz bunun içinde&nbsp; **/etc/varnish/default.vcl** dosyasına aşağıdaki gibi ekleme yapalım varsa da değiştirelim.Genelde port burada 80 yazar bunu 8080 olarak değiştirelim.

    backend default {
        .host = "127.0.0.1";
        .port = "8080";
    }

Varnish'deki son ayarımız ise şu dosyada yapacağız **/etc/varnish/varnish.params** aşağıda verdiklerimi ekleyin varsada değiştirmeyi unutmayın

    VARNISH_LISTEN_ADDRESS=sitenizin ip adresi
    VARNISH_LISTEN_PORT=80

işlemimiz tamamdır şimdi otomatik olarak sistem başlatıldığında başlaması için eklemeyi yapalım

    systemctl enable varnish.service

Yaptıklarımızın geçerli olabilmesi içinde son olarak sistemleri yeniden başlatalım.

    systemctl restart php-fpm
    systemctl restart nginx
    systemctl restart varnish

Bu şekilde yaptığımız ayarlamalar neticesinde **Varnish** artık sistemimizde aktif bunu anlamak için ise sitenin headerine bakabilirsiniz.Direk olarak orada **X-Varnish** yazacaktır...
