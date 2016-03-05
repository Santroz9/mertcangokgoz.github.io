---
layout: post
title: Wordpress Pingback Açığının Kapatılması
date: 2013-08-12 15:36:30.000000000 +03:00
type: post
published: true
status: publish
categories: Güvenlik
description: wordpress in bazı sürümlerinde olan ve wordpress kullanıcılarını etkileyen önemli bir açıktır bu açık sayesinde aslında fazla birşey yapılamaz
---
<p><strong>wordpress</strong> in bazı sürümlerinde olan ve wordpress kullanıcılarını etkileyen önemli bir açıktır bu açık sayesinde aslında fazla birşey yapılamaz gibi görülsede ddos dan router hacking e kadar pek çok şeyin yapılabildiğini metasploit ile ufak bir <strong>exploit</strong> yardımıyla pek çok şey yapılabiliyor.</p>
<p>Neler yapılabilir.</p>
<p><strong>İntel gathering</strong> : saldırgan siteniz de belirli portlar üzerinden bilgi toplayabilir</p>
<p><strong>Port scanning</strong> : Detaylı port taraması yapılabilir</p>
<p><strong>DoS attacks</strong> : Pek çok sayıda pingback ile ddos saldırısı yapılabilir</p>
<p><strong>Router hacking</strong> : sistem üzerindeki noktalara yeniden yönlendirme yapabilir.</p>
<p><a href="https://mertcangokgoz.com/wp-content/uploads/2013/08/wordpress_pingback_vulnerability_alert1.png"><img class=" size-full wp-image-211 aligncenter" src="{{ site.baseurl }}/assets/wordpress_pingback_vulnerability_alert1.png" alt="wordpress_pingback_vulnerability_alert" width="586" height="446" /></a></p>
<p>Aslına bakılırsa ufak bir sorun gibi gözüken bu açık yada her ne denirse artık .htaccess yardıymıyla kolaylıkla koruma altına alınabilir. XML-RPC ye ulaşmaya çalışanları yönlendirme yaparak durdurmamız mümkündür.</p>
<pre><code># protect xmlrpc
&lt;IfModule mod_alias.c&gt;
	RedirectMatch 403 /xmlrpc.php
&lt;/IfModule&gt;</code></pre>
<p>Alternatif başka bir yöntem dosyaya erişimi kapatmak</p>
<pre><code># protect xmlrpc
&lt;Files xmlrpc.php&gt;
	Order Deny,Allow
	Deny from all
&lt;/Files&gt;</code></pre>
