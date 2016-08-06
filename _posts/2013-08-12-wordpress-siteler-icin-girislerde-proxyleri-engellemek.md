---
layout: post
title: Wordpress Siteler için girişlerde proxyleri engellemek
date: 2013-08-12 14:58:40.000000000 +03:00
type: post
published: true
status: publish
categories: guvenlik
description: Farklı bir saldırı türü olarakta karşımıza çıkan bu sinir bozucu proxyleri engelleyerek gerek sitemizin güvenliğini artırıp gerekse gerçek
---
<p>Farklı bir saldırı türü olarakta karşımıza çıkan bu sinir bozucu <strong>proxyleri engelleyerek</strong> gerek sitemizin güvenliğini artırıp gerekse gerçek kullanıcılardan gelen hiti görmemiz mümkün. Googlede ufak bir kaç araştırma sonrasında <strong>.htaccess</strong> ile kolaylıkla engelleyebileceğimizi anladıktan sonra blogum da bu konuyu tekrardan yazmaya karar verdim. <strong>Proxy</strong> ile sahte Hit çekmeye çalışanlar yada <strong>Proxy</strong> Saldırıları ile canınızı sıkanlar oluyorsa işte bu ayarlar tam site göre olacaktır.</p>
<p>Öncelikle .htaccess düzenliyeceğiz eklememiz Gerekenler</p>
<pre class="lang:default decode:true">RewriteEngine on
RewriteCond %{HTTP:VIA} !^$ [OR]
RewriteCond %{HTTP:FORWARDED} !^$ [OR]
RewriteCond %{HTTP:USERAGENT_VIA} !^$ [OR]
RewriteCond %{HTTP:X_FORWARDED_FOR} !^$ [OR]
RewriteCond %{HTTP:PROXY_CONNECTION} !^$ [OR]
RewriteCond %{HTTP:XPROXY_CONNECTION} !^$ [OR]
RewriteCond %{HTTP:HTTP_PC_REMOTE_ADDR} !^$ [OR]
RewriteCond %{HTTP:HTTP_CLIENT_IP} !^$
RewriteRule ^(.*)$ - [F]

# protect xmlrpc
&lt;IfModule mod_alias.c&gt;
RedirectMatch 403 /xmlrpc.php
&lt;/IfModule&gt;</pre>
<p>Yukarıda girmiş olduğumuz <strong>.htaccess</strong> komutları ile Proxylerin %98 ini engellemiş olduk isterseniz siteye <strong>proxy</strong> ile girenlere ufak bir mesaj göstermek istersenizde yapmanız gereken tek şey</p>
<p>Tema klasörü içerisindeki <strong>header.php</strong> nin ilk satırına</p>
<pre class="">&lt;?php if(@fsockopen($_SERVER['REMOTE_ADDR'], 80, $errstr, $errno, 1))
die("Proxy Girişleri Yasaklanmıştır."); ?&gt;</pre>
<p>Yukarıdaki satırları eklemek ve kayıt edip çıkmak sonrasında her hangi bir <strong>proxy</strong> ile girip girmediğini deneyebilirsiniz.</p>
