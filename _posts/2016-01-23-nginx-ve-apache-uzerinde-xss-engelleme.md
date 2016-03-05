---
layout: post
title: Nginx ve Apache Üzerinde XSS Engelleme
date: 2016-01-23 12:38:30.000000000 +02:00
type: post
categories: Nginx
description: XSS yani normal adıyla "Cross Site Scripting" çok eski bir açık.Ancak günümüzde önlemi alınmadığı taktirde bu açığa oldukça fazla denk gelmemiz
---

**XSS** yani normal adıyla "Cross Site Scripting" çok eski bir açık.Ancak günümüzde önlemi alınmadığı taktirde bu açığa oldukça fazla denk gelmemiz mümkün.Yazılan uygulamada önlem alınmamasından kaynaklandığını söylemiştik saldırgan kendi hazırladığı kod ile siteniz üzerinde bir takım yönlendirmelerde bulunabilir veya kod çalıştırıp ziyaretçilerinize istediğini gösterebilir.

Apache ve **Nginx** üzerinde ise gelen bu saldırıları bir nebzede olsun durdurabilmek ve sonuç alınabilmesini engellemek mümkündür.Tabi bazı **XSS** kodlarına karşı savunmasız olacaktır.

Apache için **.htaccess** dosyanızın en altına aşağıdaki kodu ekleyiniz

```
    RewriteCond %{REQUEST_URI} base64_encode.*\(.*\) [OR]
    RewriteCond %{REQUEST_URI} (lt;|<).*script.*(gt;|>) [NC,OR]
    RewriteCond %{REQUEST_URI} (lt;|<).*iframe.*(gt;|>) [NC,OR]
    RewriteCond %{REQUEST_URI} GLOBALS(=|\[|\%[0-9A-Z]{0,2}) [OR]
    RewriteCond %{REQUEST_URI} _REQUEST(=|\[|\%[0-9A-Z]{0,2})
    RewriteRule ^(.*)$ 404.html [F,L]
```

**Nginx** için site.conf dosyanızın altına aşağıdaki kodu ekleyiniz.

```
    set $block_xss 0;
    if ($query_string ~ "base64_(en|de)code\(.*\)") {
    	set $block_xss 1;
    }
    if ($request_uri ~ "base64_(en|de)code\(.*\)") {
    	set $block_xss 1;
    }
    if ($query_string ~ "(<|%3C).*script.*(>|%3E)") {
    	set $block_xss 1;
    }
    if ($request_uri ~ "(<|%3C).*script.*(>|%3E)") {
    	set $block_xss 1;
    }
    if ($query_string ~ "(<|%3C).*iframe.*(>|%3E)") {
    	set $block_xss 1;
    }
    if ($request_uri ~ "(<|%3C).*iframe.*(>|%3E)") {
    	set $block_xss 1;
    }
    if ($query_string ~ "GLOBALS(=|\[|\%[0-9A-Z]{0,2})") {
            set $block_xss 1;
    }
    if ($query_string ~ "_REQUEST(=|\[|\%[0-9A-Z]{0,2})") {
            set $block_xss 1;
    }
    if ($block_xss = 1) {
    	return 403;
    }
```

Tüm XSS kodlarını engellemeyeceğini unutmayın gelen saldırıya göre varyasyonları değiştirmeniz ve(veya) ekleme yapmanız gerekmektedir.
