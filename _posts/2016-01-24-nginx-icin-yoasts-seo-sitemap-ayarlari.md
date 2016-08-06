---
layout: post
title: Nginx için Yoast’s SEO Sitemap Ayarları
date: 2016-01-24 11:00:49.000000000 +02:00
type: post
categories: nginx
description: Google XML Sitemap üzerinde bulunan hatalar ve uzun süredir güncelleme almamasından dolayı yeni bir Sitemap eklentisi arıyordum Yoast's SEO
---

Google **XML** Sitemap üzerinde bulunan hatalar ve uzun süredir güncelleme almamasından dolayı yeni bir Sitemap eklentisi arıyordum Yoast's SEO kullandığım için Sitemap özelliğini açayım dedim **Apache** üzerinde pek sıkıntı çıkmasa da **Nginx** üzerinde çok nadir 404 hatası vermektedir bunun çözümü ise aşağıdaki kodu **nginx** de site.conf dosyanıza eklemeniz olacaktır.

```
    #Yoast sitemap
    location ~ ([^/]*)sitemap(.*)\.x(m|s)l$ {
    	rewrite ^/sitemap\.xml$ /sitemap_index.xml permanent;
      rewrite ^/([a-z]+)?-?sitemap\.xsl$ /index.php?xsl=$1 last;
    	rewrite ^/sitemap_index\.xml$ /index.php?sitemap=1 last;
    	rewrite ^/([^/]+?)-sitemap([0-9]+)?\.xml$ /index.php?sitemap=$1&sitemap_n=$2 last;

      ## following lines are options. Needed for wordpress-seo addons
      rewrite ^/news_sitemap\.xml$ /index.php?sitemap=wpseo_news last;
    	rewrite ^/locations\.kml$ /index.php?sitemap=wpseo_local_kml last;
    	rewrite ^/geo_sitemap\.xml$ /index.php?sitemap=wpseo_local last;
    	rewrite ^/video-sitemap\.xsl$ /index.php?xsl=video last;

    	access_log off;
    }
```

Sadece sitemap özelliğini kullanacaksanız ve herhangi ek bir wordpress eklentisi kullanmayacaksanız direk olarak aşağıdaki kodlar işinizi görecektir.Yukarıdaki kodları eklemenize gerek yoktur.

```
    # Rewrites for Yoast SEO XML Sitemap
    rewrite ^/sitemap_index.xml$ /index.php?sitemap=1 last;
    rewrite ^/([^/]+?)-sitemap([0-9]+)?.xml$ /index.php?sitemap=$1&sitemap_n=$2 last;
```

bu şekilde XML sitemap kolay bir şekilde **nginx** tarafından hatasız olarak gösterilecek kimi zaman aldığınız 404 hatasından kurtulacaksınız...
