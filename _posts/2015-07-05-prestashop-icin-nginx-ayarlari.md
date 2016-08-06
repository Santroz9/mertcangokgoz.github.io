---
layout: post
title: Prestashop için Nginx Ayarları
date: 2015-07-05 15:15:42.000000000 +03:00
type: post
published: true
status: publish
categories: nginx
description: Prestashop açık kaynak kodlu ve ücretsiz bir E-Ticaret tabanlı içerik yönetim sistemidir.Bu sistem Apache alt yapısında sorunsuz çalışmakta ama
---

**Prestashop** açık kaynak kodlu ve ücretsiz bir **E-Ticaret** tabanlı içerik yönetim sistemidir.Bu sistem Apache alt yapısında sorunsuz çalışmakta ama iş **Nginx** gelince ayarlamaları biraz zorlaşıyor lakin **Nginx** de sistem daha stabil çalışıyor.Yüklü miktarda yapılan isteklerde şişme yapmıyor haliyle de performansı yüksek.İlk olarak sitenizin adı ile bir config dosyası oluşturarak işe başlayabilirsiniz.

**Dosya** : /etc/nginx/sites-available/siteadi.conf

İçerisine belli başlı komutları giriyoruz.

    server {
    access_log off;
    error_log logs/siteadi.com-error_log warn;

    	listen 80;
            server_name siteadi.com www.siteadi.com;
            root /var/www/siteadi.com;
            index index.php index.html;

    location / {
      index /index.php;
      rewrite ^/api/?(.*)$ /webservice/dispatcher.php?url=$1 last;
      rewrite ^/([0-9])(-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ /img/p/$1/$1$2.jpg last;
      rewrite ^/([0-9])([0-9])(-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ /img/p/$1/$2/$1$2$3.jpg last;
      rewrite ^/([0-9])([0-9])([0-9])(-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ /img/p/$1/$2/$3/$1$2$3$4.jpg last;
      rewrite ^/([0-9])([0-9])([0-9])([0-9])(-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ /img/p/$1/$2/$3/$4/$1$2$3$4$5.jpg last;
      rewrite ^/([0-9])([0-9])([0-9])([0-9])([0-9])(-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ /img/p/$1/$2/$3/$4/$5/$1$2$3$4$5$6.jpg last;
      rewrite ^/([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])(-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ /img/p/$1/$2/$3/$4/$5/$6/$1$2$3$4$5$6$7.jpg last;
      rewrite ^/([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])(-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ /img/p/$1/$2/$3/$4/$5/$6/$7/$1$2$3$4$5$6$7$8.jpg last;
      rewrite ^/([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])(-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ /img/p/$1/$2/$3/$4/$5/$6/$7/$8/$1$2$3$4$5$6$7$8$9.jpg last;
      rewrite ^/c/([0-9]+)(-[_a-zA-Z0-9-]*)(-[0-9]+)?/.+\.jpg$ /img/c/$1$2.jpg last;
      rewrite ^/c/([a-zA-Z-]+)(-[0-9]+)?/.+\.jpg$ /img/c/$1.jpg last;
      rewrite ^/([0-9]+)(-[_a-zA-Z0-9-]*)(-[0-9]+)?/.+\.jpg$ /img/c/$1$2.jpg last;
      try_files $uri $uri/ /index.php?$args;
    }

      rewrite ^/page-not-found$ /index.php?controller=404 last;
      rewrite ^/address$ /index.php?controller=address last;
      rewrite ^/addresses$ /index.php?controller=addresses last;
      rewrite ^/authentication$ /index.php?controller=authentication last;
      rewrite ^/best-sales$ /index.php?controller=best-sales last;
      rewrite ^/cart$ /index.php?controller=cart last;
      rewrite ^/contact-us$ /index.php?controller=contact-form last;
      rewrite ^/discount$ /index.php?controller=discount last;
      rewrite ^/guest-tracking$ /index.php?controller=guest-tracking last;
      rewrite ^/order-history$ /index.php?controller=history last;
      rewrite ^/identity$ /index.php?controller=identity last;
      rewrite ^/manufacturers$ /index.php?controller=manufacturer last;
      rewrite ^/my-account$ /index.php?controller=my-account last;
      rewrite ^/new-products$ /index.php?controller=new-products last;
      rewrite ^/order$ /index.php?controller=order last;
      rewrite ^/order-follow$ /index.php?controller=order-follow last;
      rewrite ^/quick-order$ /index.php?controller=order-opc last;
      rewrite ^/order-slip$ /index.php?controller=order-slip last;
      rewrite ^/password-recovery$ /index.php?controller=password last;
      rewrite ^/prices-drop$ /index.php?controller=prices-drop last;
      rewrite ^/search$ /index.php?controller=search last;
      rewrite ^/sitemap$ /index.php?controller=sitemap last;
      rewrite ^/stores$ /index.php?controller=stores last;
      rewrite ^/supplier$ /index.php?controller=supplier last;

    	location ~* .(gif)$ {
    	expires 2592000s;
    	}

    	location ~* .(jpeg|jpg)$ {
    	expires 2592000s;
    	}

    	location ~* .(png)$ {
    	expires 2592000s;
    	}

    	location ~* .(css)$ {
    	expires 604800s;
    	}

    	location ~* .(js)$ {
    	expires 604800s;
    	}

    	location ~* .(js)$ {
    	expires 604800s;
    	}

    	location ~* .(ico)$ {
    	expires 31536000s;
    	}

             location ~ \.php$ {
             try_files $uri =404;
             fastcgi_split_path_info ^(.+\.php)(/.+)$;
             fastcgi_pass unix:/var/run/php5-fpm.sock;
             fastcgi_index index.php;
             include fastcgi.conf;
             }
    }

Bu kullandıklarınız da sorun çıkarsa aşağıdakilerinide kullanabilirsiniz.Sürüm farklılığından doğan **URL** sorunları olabiliyor.

    rewrite ^/([a-z0-9]+)\-([a-z0-9]+)(\-[_a-zA-Z0-9-]*)/([_a-zA-Z0-9-]*)\.jpg$ /img/p/$1-$2$3.jpg last;
    rewrite ^/([0-9]+)\-([0-9]+)/([_a-zA-Z0-9-]*)\.jpg$ /img/p/$1-$2.jpg last;
    rewrite ^/([0-9]+)(\-[_a-zA-Z0-9-]*)/([_a-zA-Z0-9-]*)\.jpg$ /img/c/$1$2.jpg last;
    rewrite "^/lang-([a-z]{2})/([a-zA-Z0-9-]*)/([0-9]+)\-([a-zA-Z0-9-]*)\.html(.*)$" /product.php?id_product=$3&isolang=$1$5 last;
    rewrite "^/lang-([a-z]{2})/([0-9]+)\-([a-zA-Z0-9-]*)\.html(.*)$" /product.php?id_product=$2&isolang=$1$4 last;
    rewrite "^/lang-([a-z]{2})/([0-9]+)\-([a-zA-Z0-9-]*)(.*)$" /category.php?id_category=$2&isolang=$1 last;
    rewrite ^/([a-zA-Z0-9-]*)/([0-9]+)\-([a-zA-Z0-9-]*)\.html(.*)$ /product.php?id_product=$2$4 last;
    rewrite ^/([0-9]+)\-([a-zA-Z0-9-]*)\.html(.*)$ /product.php?id_product=$1$3 last;
    rewrite ^/([0-9]+)\-([a-zA-Z0-9-]*)(.*)$ /category.php?id_category=$1 last;
    rewrite ^/content/([0-9]+)\-([a-zA-Z0-9-]*)(.*)$ /cms.php?id_cms=$1 last;
    rewrite ^/([0-9]+)__([a-zA-Z0-9-]*)(.*)$ /supplier.php?id_supplier=$1$3 last;
    rewrite ^/([0-9]+)_([a-zA-Z0-9-]*)(.*)$ /manufacturer.php?id_manufacturer=$1$3 last;
    rewrite "^/lang-([a-z]{2})/(.*)$" /$2?isolang=$1 last;

Yaptığınız bu işlemlerden sonra servisi yeniden başlatmayı unutmayınız.

    service nginx restart
