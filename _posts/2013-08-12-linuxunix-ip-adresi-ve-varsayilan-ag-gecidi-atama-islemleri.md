---
layout: post
title: Linux/Unix IP Adresi ve Varsayılan ağ geçidi atama işlemleri
date: 2013-08-12 05:23:27.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: sistemlerde işimize çokca yarayan bir komut olan ifconfig lan kartına çok ama çok kolay bir şekilde ip atayarak gereken işlemleri yapmamızı
---
<p>Linux sistemlerde işimize çokca yarayan bir komut olan ifconfig lan kartına çok ama çok kolay bir şekilde ip atayarak gereken işlemleri yapmamızı kolaylıkla sağlar</p>
<p>ifconfig : Bu komut linux sistemlerde komut satırı kullanılarak her hangi bir lan kartına ip atamanızı sağlamaktadır.bu komutu kullanarak istenilen lan kartına ip atanabilir ve gerekli görülen ip işlemleri yapılabilir.</p>
<p>&nbsp;</p>
<p>Kullanımı</p>
<blockquote><p><strong># ifconfig [-v] [-a] [-s]  [interface]</strong></p></blockquote>
<p>&nbsp;</p>
<ol>
<li>-a    Kullanılan tüm lan kartlarını gösterir çalışmıyor olsa bile</li>
<li>-s    Kısa bir listesini görüntüler (netstat -i ye benzer)</li>
<li>-v   hatalı durumlarda daha ayrıntılı bilgi verir</li>
</ol>
<p>&nbsp;</p>
<p>Örnek 1 ip atamak için kullanılır</p>
<blockquote><p><strong># ifconfig eth0 &lt;ip-address&gt;  netmask &lt;yournetmask&gt;  up</strong></p></blockquote>
<p>Örnek 2 etho0 lan kartındaki İP adresini kontrol için kullanılır</p>
<blockquote><p><strong># ifconfig  eth0</strong></p></blockquote>
<p>Örnek 3 Varsayılan Ağ Geçidi kontrol etmek için kullanılır</p>
<blockquote><p><strong># route  -n</strong></p></blockquote>
<p>Örnek 4 Ağ geçidini eklemek yada değiştirmek için kullanılır.</p>
<blockquote><p><strong># route  del  default gw  //Varsayılan Ağ geçidini siler</strong></p>
<p><strong># route add default gw  &lt;gateway-ipaddress&gt;  //Varsayılan Ağ geçidini ekler</strong></p></blockquote>
<p>&nbsp;</p>
