---
layout: post
title: Linux Sistemlerde du Komutu
date: 2013-08-11 03:23:44.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Linux sistemlerde genellikle disk kullanımını görmek ve hangi uygulamanın yada dosya alt sisteminin ne kadar yer kapladığını görmek için
---
<p>Linux sistemlerde genellikle disk kullanımını görmek ve hangi uygulamanın yada dosya alt sisteminin ne kadar yer kapladığını görmek için <strong>"du"</strong> komutunu kullanmak gerekmektedir.ve bu komut bize istediğimiz tüm disk kullanım bilgilerini <strong>Megabyte</strong> ve <strong>Gigabyte</strong> cinsinden verebilmektedir.</p>
<p>Kullanımı şu şekildedir</p>
<pre class="lang:default decode:true">du [OPTION]... [FILE]...
du [OPTION]... --files0-from=F</pre>
<p>Komutlar ve açıklamaları</p>
<ul>
<li>-a geçerli dizinde bulunan her dosya için</li>
<li>-c diğer argümanlar tarafından disk kullanımının toplamını gösterir</li>
<li>-d derinlik ayarlaması -d 0 toplamları -d 1 alt toplamları -d 2 altın altı toplamları</li>
<li>-h insanların anlayabileceği bir şekle dönüştürür.</li>
<li>-k 1024 ve katları olarak gösterir</li>
<li>-L her yerdeki tüm disk kullanımını gösterir</li>
<li>-s her dosya için geçerli dizinde disk kullanımını gösterir</li>
<li>-x sadece verilmiş olan dizinde raporlama yapar</li>
<li>-X herhangi bir dosya ile eşleşenler hariç (--exclude-from=FILE :)</li>
</ul>
<p>Örnek 1 Kilobytes cinsinden disk kullanımını gösterir</p>
<pre class="lang:default decode:true">du Uploads</pre>
<p>Örnek 2 Anlaşılabilir bir biçimde disk kullanımını gösterir</p>
<pre class="lang:default decode:true">du -h Uploads</pre>
<p>Örnek 3 verilen konumdaki disk kullanımını Megabyte ve Gigabyte cinsinden göstermek</p>
<pre class="lang:default decode:true">du -BM /var/lib/mysql/*</pre>
<p><a href="https://mertcangokgoz.com/wp-content/uploads/2013/08/disk-usage5.jpg"><img class="alignnone size-full wp-image-189" src="{{ site.baseurl }}/assets/disk-usage5.jpg" alt="disk-usage" width="474" height="134" /></a></p>
<pre class="lang:default decode:true">du -BG /var/lib/mysql/plist/</pre>
<p>Yukaridaki kod ile çıktıyı Gigabyte ile yapabilirsiniz.</p>
<p>Örnek 4 Okunabilir bir biçimde tüm dizinlerin disk kullanımını yansıtır</p>
<pre class="lang:default decode:true">du -sh /var/log/</pre>
<p>Örnek 5 Tüm dosyalar için disk kullanımını sayılarını görüntülemek</p>
<pre class="lang:default decode:true">du -a /var/log/httpd/</pre>
<p><a href="https://mertcangokgoz.com/wp-content/uploads/2013/08/disk-usage11.jpg"><img class="alignnone size-full wp-image-190" src="{{ site.baseurl }}/assets/disk-usage11.jpg" alt="disk-usage1" width="435" height="209" /></a></p>
<p>Örnek 6 Bir dizindeki dosyaların tek tek disk kullanımını gösterir</p>
<pre class="lang:default decode:true">du -ca /var/log/httpd/</pre>
<p><a href="https://mertcangokgoz.com/wp-content/uploads/2013/08/disk-usage21.jpg"><img class="alignnone size-full wp-image-191" src="{{ site.baseurl }}/assets/disk-usage21.jpg" alt="disk-usage2" width="424" height="233" /></a></p>
<p>Örnek 7 gizli dosyalar dahil olmak üzere dizin içerisindeki dosyaların disk kullanımını gösterir</p>
<pre class="lang:default decode:true">du -sh .[!.]* * | sort -n</pre>
<p>Örnek 8 iç içe geçmeden dizinlerin teker teker disk kullanımlarını göstermek için kullanılır</p>
<pre class="lang:default decode:true">du --max-depth=1 -c -h -x /</pre>
<p><a href="https://mertcangokgoz.com/wp-content/uploads/2013/08/disk-usage31.jpg"><img class="alignnone size-full wp-image-192" src="{{ site.baseurl }}/assets/disk-usage31.jpg" alt="disk-usage3" width="346" height="415" /></a></p>
<p>Örnek 9 Belirli bir dosya türünü dışlıyarak disk kullanımını gösterir</p>
<pre class="lang:default decode:true">du -cbha –exclude="*.iso"</pre>
<p><a href="https://mertcangokgoz.com/wp-content/uploads/2013/08/disk-usage41.jpg"><img class="alignnone size-full wp-image-193" src="{{ site.baseurl }}/assets/disk-usage41.jpg" alt="disk-usage4" width="523" height="97" /></a></p>
