---
layout: post
title: Ubuntu Üzerine Nginx ile Web Server Kurma
date: 2015-04-29 18:37:25.000000000 +03:00
type: post
published: true
status: publish
categories: Nginx
description: Kuracağımız sistem tamamen performansa yönelik olacak bunu baştan belirteyim yapımızı Nginx ile kuracağız uzatmadan detaylara geçelim ve
---

Böyle bir makaleyi yazmak için uzun zamandır bekledim testler yaptım ve yeni paketler derledim sonrasında güzel bir şekilde kurulumu anlatacak vakti ve tecrübeye sahip oldum normalde böylesine güzel bir configureyi açıklamayı düşünmüyordum ancak bilgi paylaşınca daha bir değerli olur.Kuracağımız sistem tamamen performansa yönelik olacak bunu baştan belirteyim Alt yapımızı Nginx ile kuracağız uzatmadan detaylara geçelim

Özellikler ve Modüller

**Kurulacak olan uygulamalar en son sürümlere göre kurulmuş ve ayarlanmıştır.**

- Nginx
  - ngx\_pagespeed
  - Naxsi
  - headers-more-nginx-module
  - ngx\_cache\_purge
- MariaDB
- Varnish
- Memcache
- PHP-FPM

Şeklinde Bir yapı oluşturdum genelde nginx derleme konusunda millet sıkıntı çektiği için bende ubuntu için derleyip kurulum paketi oluşturdum tek yapmanız gereken normal komutlar ile kurulumu gerçekleştirmek

    #Nginx 1.6.3 Sürümü İçin
    wget https://mertcangokgoz.com/Downloads/nginx-moduler-mertcangokgoz.com-1.6.3.deb

    #Nginx 1.8.0 Sürümü İçin
    wget https://mertcangokgoz.com/Downloads/nginx-moduler-mertcangokgoz.com-1.8.0.deb

Olarak dosyamızı çekiyoruz Sonra gerekli olan kurulum ve diğer işlemlerde sıra

    sudo apt-get install -y dpkg-dev
    sudo dpkg --install nginx-moduler-mertcangokgoz.com-*.deb

Kurulum başarıyla tamamlandıysa aşağıdaki komutu çalıştırıp nginx sürümüne ve modullere bakabilirsiniz.

    2>&1 nginx -V | tr ' ' 'n'

Örnek çıktı olarak ise

![nginxwebserverkurulumugorsel1](/assets/nginxwebserverkurulumugorsel1-e1430318047561.png)

Kurulumdan sonra nginx için dosya yolumuz **/etc/nginx/** olarak kullanılacaktır.Ayarlamalarımızı bu klasör içerisindeki dosyalarda yapacağız.İlk olarak kullanacağımız site için dosya yolu oluşturalım bunun için

    sudo mkdir -p /home/www/mertcangokgoz.com/

Dosya yolumuzu ayarladıktan sonra nginx içerisinde ayar dosyamızı tanımlayalım.

    cd etc/nginx/sites-available/
    nano -w mertcangokgoz.com

İçerisine kullanacağınız ayarlamaları ve yapacağımız performans düzenlemelerini ekleyeceğiz.Örnek olarak şuanda hali hazırda benim bu site için kullandığım ayarlamaları paylaşacağım

    ##
    # You should look at the following URL's in order to grasp a solid understanding
    # of Nginx configuration files in order to fully unleash the power of Nginx.
    # http://wiki.nginx.org/Pitfalls
    # http://wiki.nginx.org/QuickStart
    # http://wiki.nginx.org/Configuration
    #
    # Generally, you will want to move this file somewhere, and start with a clean
    # file but keep this around for reference. Or just disable in sites-enabled.
    #
    # Please see /usr/share/doc/nginx-doc/examples/ for more detailed examples.
    ##

    # Default server configuration
    #
    server {
    	listen 8080 default_server;
    	listen [::]:8080 ipv6only=on default_server;



            listen 443 ssl spdy;
            listen [::]:443 ipv6only=on ssl spdy;
            server_name mertcangokgoz.com;

            ssl_dhparam /etc/nginx/ssl_certs/dhparam.pem;
            ssl_certificate /etc/nginx/ssl_certs/mertcangokgoz.com.crt;
            ssl_certificate_key /etc/nginx/ssl_certs/www_mertcangokgoz_com.key;


            ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
            ssl_session_cache shared:SSL:20m;
            ssl_session_timeout 10m;
            ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA:!CAMELLIA;
    	ssl_prefer_server_ciphers on;

    	add_header Alternate-Protocol 443:npn-spdy/3;
            add_header Strict-Transport-Security "max-age=31536000; includeSubdomains;";
    	add_header Access-Control-Allow-Origin "*";
            add_header Access-Control-Allow-Credentials "true";
    	add_header X-XSS-Protection "1; mode=block";
    	add_header X-Frame-Options SAMEORIGIN;
            add_header X-Content-Type-Options "nosniff";
    	#add_header Last-Modified $time_stamp_of_uri
    	#add_header Last-Modified "";
    	#add_header ETag "";

    	more_set_headers "Server: MertcanGokgoz";
            #add_header X-Frame-Options DENY;

    	spdy_headers_comp 6;
            # ssl_buffer_size 4k;

            # enable ocsp stapling
            resolver 8.8.8.8;
            ssl_stapling on;
            ssl_stapling_verify on;
            ssl_trusted_certificate /etc/nginx/ssl_certs/mertcantr.crt;


    	root /home/www/mertcangokgoz.com;

    	# Add index.php to the list if you are using PHP
    	index index.php index.html index.htm;

    	location ~* .(eot|ttf|woff)$ {
        		add_header Access-Control-Allow-Origin *;
    	}

    	location / {
    		index index.php index.html index.htm;
    		try_files $uri $uri/ /index.php?$args;
    	}

        	error_page 404 /404.html;
        	error_page 500 502 503 504 /50x.html;
        	location = /50x.html {
            	root /usr/share/nginx/html;
       	 }

    	location ~* .(js|css|png|jpg|jpeg|gif|ico)$ {
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

    	location ~ /(.|wp-config.php|readme.html|license.txt) {
    		return 404;
    	}

    	# Prevent clients from accessing hidden files (starting with a dot)
    	# This is particularly important if you store .htpasswd files in the site hierarchy
    	location ~* (?:^|/). {
     	 	 deny all;
    	}

    	# Prevent clients from accessing to backup/config/source files
    	location ~* (?:.(?:bak|config|sql|fla|psd|ini|log|inc|swp|dist)|~)$ {
        		deny all;
    	}

    	location ~ /. {
    		deny all;
    		access_log off;
    		log_not_found off;
    	}

    	location /ngx_pagespeed_statistics { allow 127.0.0.1; deny all; }
    	location /ngx_pagespeed_global_statistics { allow 127.0.0.1; deny all; }
    	location /ngx_pagespeed_message { allow 127.0.0.1; deny all; }
    	location /pagespeed_console { allow 127.0.0.1; deny all; }
    	location ~ ^/pagespeed_admin { allow 127.0.0.1; deny all; }
    	location ~ ^/pagespeed_global_admin { allow 127.0.0.1; deny all; }

       	 location ~ .php$ {
            	try_files $uri =404;
            	fastcgi_split_path_info ^(.+.php)(/.+)$;
            	fastcgi_pass unix:/var/run/php5-fpm.sock;
            	fastcgi_index index.php;
    		include fastcgi.conf;
    	}

    	###Costum Rules####
    	include global/cache.conf;
    	include global/pagespeed.conf;
    	include global/w3.conf;
    	include global/proxy.conf;
    	include global/status.conf;

    	location ~ /.ht {
    		deny all;
    	}

    }

Kayıt edip çıktıktan sonra sıra **/etc/nginx/** yolundaki **nginx.conf** dosyasını düzenlemeye geliyor.

    user www-data;
    worker_processes auto;
    worker_rlimit_nofile 8192;
    pid /run/nginx.pid;

    events {
    	worker_connections 800;
    	multi_accept on;
    	use epoll;
    }

    http {

    	##
    	# Basic Settings
    	##

    	etag on;
    	sendfile on;
    	#tcp_nopush on;
    	tcp_nodelay on;
    	keepalive_timeout 65;
    	client_body_timeout 30;
    	client_header_timeout 30;
    	send_timeout 30;
    	client_max_body_size 100M;
    	reset_timedout_connection on;
    	types_hash_max_size 2048;
    	server_tokens off;



    	open_file_cache max=5000 inactive=20s;
            open_file_cache_valid 30s;
            open_file_cache_min_uses 2;
            open_file_cache_errors on;

    	# server_names_hash_bucket_size 64;
    	# server_name_in_redirect off;

    	include /etc/nginx/mime.types;
    	default_type application/octet-stream;

    	##
    	# SSL Settings
    	##

    	ssl_protocols TLSv1 TLSv1.1 TLSv1.2; # Dropping SSLv3, ref: POODLE
    	ssl_prefer_server_ciphers on;

    	##
    	# Logging Settings
    	##

    	access_log /var/log/nginx/access.log;
    	error_log /var/log/nginx/error.log;

    	set_real_ip_from 127.0.0.1;
    	real_ip_header X-Forwarded-For;
    	log_format main '$remote_addr - $remote_user [$time_local] $status '
    		'"$request" $body_bytes_sent "$http_referer" '
        		'"$http_user_agent" "$http_x_forwarded_for"';

    	##
    	# Gzip Settings
    	##

    	gzip on;
    	gzip_disable "MSIE [1-6].(?!.*SV1)";

    	gzip_vary on;
    	gzip_static on;
    	gzip_proxied any;
    	gzip_comp_level 5;
    	gzip_min_length	256;
    	gzip_buffers 16 8k;
    	gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript application/javascript text/x-js;

    	##
    	# Virtual Host Configs
    	##

    	#include /etc/nginx/conf.d/*.conf;
    	include /etc/nginx/global/blacklist.conf;
    	include /etc/nginx/sites-available/*;
    }

Şimdi sıra geldi MariaDB kurulumuna komutlarımızı veriyoruz.

    sudo apt-get install software-properties-common
    sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
    sudo add-apt-repository 'deb ftp://ftp.ulak.net.tr/pub/MariaDB/repo/10.0/ubuntu utopic main'
    sudo apt-get update
    sudo apt-get install mariadb-server mariadb-client

Kuruluma başlar başlamaz bir kaç işden sonra yönetici için şifre oluşturmamızı isteyecek benden size tavsiye minimum 16 karakterden oluşan random bir şifre koymanız tabi bunu kayıt etmeyi unutmayın sonrasında başınız ağrımasın.Sıra geldi PHP kurulumuna bunun için

    sudo apt-get install php5 php5-fpm php5-mysql

Kurulumumuzu tamamlıyoruz ufak tefek ayarlamalara kaldık php.ini içerisinde aşağıdaki ayarları uygulayın

    sudo nano /etc/php5/fpm/php.ini

Dosya içerisinde "cgi.fix\_pathinfo=1" arıyorsunuz sonrasında değeri aşağıdaki gibi değiştiriyorsunuz.

    cgi.fix_pathinfo=0

Kayıt edip çıktıktan sonra php yeniden başlatmamız gerekiyor.

    sudo service php5-fpm restart

Şimdi kurulumlardan çoğunu bitirdik&nbsp; **/etc/nginx/sites-available/** kısmına test için bi ayarlama yapalım

    sudo nano /etc/nginx/sites-available/default

Dosya içerisine aşağıdakileri direk olarak ekleyiniz test için bu ayarlamalar yetecektir.

    server {
            listen 80;


            root /usr/share/nginx/www;
            index index.php index.html index.htm;

            server_name example.com;

            location / {
                    try_files $uri $uri/ /index.html;
            }

            error_page 404 /404.html;

            error_page 500 502 503 504 /50x.html;
            location = /50x.html {
                  root /usr/share/nginx/www;
            }

            # pass the PHP scripts to FastCGI server listening on the php-fpm socket
            location ~ .php$ {
                    try_files $uri =404;
                    fastcgi_pass unix:/var/run/php5-fpm.sock;
                    fastcgi_index index.php;
                    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                    include fastcgi_params;

            }

    }

test için bi php info dosyası oluşturalım ve ip adresinden erişip durumları kontrol edelim.

    sudo nano /usr/share/nginx/www/info.php

dosya içerisine

    <?php
    phpinfo();
    ?>

şimdi bir nginx web serverını yeniden başlatalım

    sudo service nginx restart

Şimdi Header sorgulaması yapıyoruz bakıyoruz ki sistemde pagespeed aktif değil hemen gerekenleri yapıyoruz. **/etc/nginx/sites-available** yolundaki ayar dosyamızın içerisinde alt kısımlara doğru fark bir satır ekleyeceğiz aslında tüm .confları bu şekilde eklememiz daha doğru olacak

    include global/pagespeed.conf;

bu satırı ekledikten sonra kayıt edip çıkıyorsunuz.Dosyayı oluşturmadıysanız şu şekilde gerekeni yapabilirsiniz.

    sudo nano -w /global/pagespeed.conf

içerisine direk olarak aşağıdaki satırları yapıştırıyorsunuz.

    # Turning the module on and off
    pagespeed on;

    # Configuring PageSpeed Filters
    pagespeed RewriteLevel PassThrough;

    # Needs to exist and be writable by nginx. Use tmpfs for best performance.
    pagespeed MemcachedThreads 1;
    pagespeed MemcachedServers "127.0.0.1:11211";
    pagespeed MemcachedTimeoutUs 100000;
    pagespeed FileCachePath /var/cache/ngx_pagespeed/;
    pagespeed RunExperiment on;
    pagespeed ExperimentVariable 1;
    pagespeed ExperimentSpec "id=1;percent=50;level=CoreFilters;enabled=collapse_whitespace,remove_comments;";
    pagespeed EnableFilters insert_ga;
    pagespeed AnalyticsID Google Takip Kodunuz;
    pagespeed EnableFilters make_google_analytics_async;

    # Costum
    pagespeed FileCacheSizeKb 102400;
    pagespeed FileCacheCleanIntervalMs 3600000;
    pagespeed FileCacheInodeLimit 500000;

    #images rules
    pagespeed PreserveUrlRelativity on;
    pagespeed MaxCombinedCssBytes -1;
    pagespeed ImageResolutionLimitBytes 16777216;
    pagespeed MaxSegmentLength 250;
    pagespeed CombineAcrossPaths off;

    #default betas
    pagespeed AvoidRenamingIntrospectiveJavascript on;
    pagespeed ImageInlineMaxBytes 3072;
    pagespeed CssImageInlineMaxBytes 0;
    pagespeed MaxInlinedPreviewImagesIndex -1;
    pagespeed MinImageSizeLowResolutionBytes 3072;

    #pagespeed StatisticsPath /ngx_pagespeed_statistics;
    #pagespeed GlobalStatisticsPath /ngx_pagespeed_global_statistics;
    #pagespeed MessagesPath /ngx_pagespeed_message;
    #pagespeed ConsolePath /pagespeed_console;
    #pagespeed AdminPath /pagespeed_admin;
    #pagespeed GlobalAdminPath /pagespeed_global_admin;

    #Filter Settings
    pagespeed RewriteLevel CoreFilters;
    pagespeed EnableFilters collapse_whitespace,remove_comments;

    # PageSpeed Cache Purge
    pagespeed EnableCachePurge on;
    pagespeed PurgeMethod PURGE;

    # enable collapse whitespace filter
    pagespeed EnableFilters collapse_whitespace;

    # enable JavaScript library offload
    pagespeed EnableFilters canonicalize_javascript_libraries;

    # combine multiple CSS files into one
    pagespeed EnableFilters combine_css;

    # combine multiple JavaScript files into one
    pagespeed EnableFilters combine_javascript;

    # remove tags with default attributes
    pagespeed EnableFilters elide_attributes;

    # improve resource cacheability
    pagespeed EnableFilters extend_cache;

    # flatten CSS files by replacing @import with the imported file
    pagespeed EnableFilters flatten_css_imports;
    pagespeed CssFlattenMaxBytes 5120;

    # defer the loading of images which are not visible to the client
    pagespeed EnableFilters lazyload_images;

    # enable JavaScript minification
    pagespeed EnableFilters rewrite_javascript;

    # enable image optimization
    pagespeed EnableFilters rewrite_images;

    # pre-solve DNS lookup
    pagespeed EnableFilters insert_dns_prefetch;

    # rewrite CSS to load page-rendering CSS rules first.
    pagespeed EnableFilters prioritize_critical_css;

    #pagespeed InPlaceResourceOptimization off;
    pagespeed ModifyCachingHeaders off;

Cache için dizin oluşturuyoruz.

    sudo mkdir -p /var/cache/ngx_pagespeed/

Şimdi ayarlamalar doğrumu bir bakalım test komutunu veriyoruz.

    sudo service nginx configtest

    yada

    nginx -t

Örnek Olarak çıktımız şu şekilde

![nginxtestgorsel1](/assets/nginxtestgorsel1-e1430320632111.png)

Sıra Geldi Varnish kurulumuna Sırasıyla aşağıdaki komutları uygulayın

    sudo apt-get install apt-transport-https
    curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add -
    echo "deb https://repo.varnish-cache.org/ubuntu/ precise varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list
    sudo apt-get update
    sudo apt-get install varnish

Kurulum başarılı bir şekilde tamamlandığı zaman sistem içerisinde&nbsp; **/etc/default/** yolunu takip ediyoruz.

    sudo nano /etc/default/varnish

içerisinde deamon kısmında 8080 yazıyor olacak bunu aşağıdaki gibi değiştiriyorsunuz.

    DAEMON_OPTS="-a :80
                 -T localhost:6082
                 -f /etc/varnish/default.vcl
                 -S /etc/varnish/secret
                 -s malloc,256m"

şimdi default.vlc içerisindeki ayarlamayı yapalım **/etc/varnish/** yolunu takip ederek

    sudo nano /etc/varnish/default.vcl

üstlerdeki backend satırını aşağıdaki gibi düzenleyiniz.

    backend default {
        .host = "127.0.0.1";
        .port = "8080";
    }

Eğer yukarıdaki nginx ayar dosyalarını kullanıyorsanız bu kurulum sonrasında varnish sapa sağlam bir şekilde çalışacaktır.Ayarlamalardan sonra servisi yeniden başlatınız.

    sudo service varnish restart

Memcache kurulumu için ise

    sudo apt-get update
    sudo apt-get install php5-memcached memcached

Yukarda anlatılan ve yapılanların hepsi Wordpress kullanacaklar için özenle hazırlanmıştır wordpress haricinde web sitesi kuracaksanız site ayarlamalarında ufak değişiklikler yapmanız gerekmektedir.Yardım gerekir ise [lütfen iletişime geçiniz](https://mertcangokgoz.com/soru-cevap/)
