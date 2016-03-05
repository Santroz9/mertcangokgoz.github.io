---
layout: post
title: Wordpress İçin NGİNX Rewrite Kuralları
date: 2015-04-24 12:20:44.000000000 +03:00
type: post
published: true
status: publish
categories: Nginx
description: Wordpress Olan bir adet siteniz var ve hitleriniz yükseldi yada anlık 512 üstü kullanıcı gördünüz sisteminizde hal böyle oluncada Apache
---
Wordpress Olan bir adet siteniz var ve hitleriniz yükseldi yada anlık 512 üstü kullanıcı gördünüz sisteminizde hal böyle oluncada Apache altyapısını kullanan sitenizde kasmalar takılmalar kitlenmeler olmaya başladı sizde çağre ararken NGİNX ile tanıştınız peki Wordpressin düzgün çalışması için ne yapmamız gerekiyor.Hangi ayarlamaları yaparsak daha iyi bir şekilde sitemizi kurmuş oluruz diyorsanız ben burayı yani bu siteyi Nginx alt yapısına taşırken yazmış olduğun kuralları sizlerle paylaşacağım.

SEO Dostu URL Yapıları için kullanacağınız kod

    location / {
    		index index.php index.html index.htm;
    		try_files $uri $uri/ /index.php?$args;
    	}

Wordpress sitenin içerisinde bulanan statik bazı dosyaların izinlerini belirlemek için

    location ~* \.(js|css|png|jpg|jpeg|gif|ico)$ {
            	expires max;
            	log_not_found off;
        	}

    	location = /favicon.ico {
    		log_not_found off;
    		access_log off;
    	}

    	location = /robots.txt {
    		allow all;
    		log_not_found off;
    		access_log off;
    	}

    	location ~ /(\.|wp-config.php|readme.html|license.txt) {
    		return 404;
    	}

    	location ~ /\. {
    		deny all;
    		access_log off;
    		log_not_found off;
    	}

Apache alt yapısından kalan .htaccess dosyalara ulaşmayı engellemek için

    location ~ /\.ht {
    		deny all;
    	}

Hata mesajlarında gösterilecek sayfaların ayarlanması

    error_page 404 /404.html;
        	error_page 500 502 503 504 /50x.html;
        	location = /50x.html {
            	root /usr/share/nginx/html;
       	 }

Bunların dışında sistemde W3 Total Cache eklentisi kurulu ise gene aşağıdaki kuralları kullanarak eklentinin randımanlı çalışmasını sağlayabilirsiniz.

    # BEGIN W3TC Page Cache cache
    location ~ /wp-content/cache/page_enhanced.*html$ {
        add_header Vary "Accept-Encoding, Cookie";
    }
    location ~ /wp-content/cache/page_enhanced.*gzip$ {
        gzip off;
        types {}
        default_type text/html;
        add_header Vary "Accept-Encoding, Cookie";
        add_header Content-Encoding gzip;
    }
    # END W3TC Page Cache cache BEGIN W3TC Browser Cache
    gzip on; gzip_types text/css text/x-component application/x-javascript application/javascript text/javascript text/x-js text/richtext image/svg+xml text/plain text/xsd text/xsl text/xml image/x-icon;
    # END W3TC Browser Cache BEGIN W3TC CDN
    location ~ \.(ttf|ttc|otf|eot|woff|font.css)$ {
       add_header Access-Control-Allow-Origin "*";
    }
    # END W3TC CDN BEGIN W3TC Page Cache core
    set $w3tc_rewrite 1; if ($request_method = POST) {
        set $w3tc_rewrite 0;
    }
    if ($query_string != "") {
        set $w3tc_rewrite 0;
    }
    if ($request_uri !~ \/$) {
        set $w3tc_rewrite 0;
    }
    if ($http_cookie ~* "(comment_author|wp\-postpass|w3tc_logged_out|wordpress_logged_in|wptouch_switch_toggle)") {
        set $w3tc_rewrite 0;
    }
    if ($http_cookie ~* "(w3tc_preview)") {
        set $w3tc_rewrite _preview;
    }
    set $w3tc_enc ""; if ($http_accept_encoding ~ gzip) {
        set $w3tc_enc _gzip;
    }
    if (!-f "$document_root/wp-content/cache/page_enhanced/$http_host/$request_uri/_index$w3tc_rewrite.html$w3tc_enc") {
      set $w3tc_rewrite 0;
    }
    if ($w3tc_rewrite = 1) {
        rewrite .* "/wp-content/cache/page_enhanced/$http_host/$request_uri/_index$w3tc_rewrite.html$w3tc_enc" last;
    }
    # END W3TC Page Cache core
