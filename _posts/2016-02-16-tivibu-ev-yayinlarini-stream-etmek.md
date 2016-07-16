---
layout: post
title: Tivibu Ev Yayınlarını Bilgisayar ve Telefonda Stream Etmek
date: 2016-02-15
type: post
categories: Güvenlik
description: Tivibu Türkiye’de internet üzerinden veri akışıyla gerçekleşen Internet TV alanında
---

**Yasal uyarı: Bu blog yazısı eğitici amaçlarla yazılmıştır. Bu yazıdaki bilgilerin kötü amaçlarla kullanılmasından doğan zararlardan dolayı mesuliyet kabul etmiyorum.**

Tivibu, Türkiye’de internet üzerinden veri akışıyla gerçekleşen Internet TV alanında yapılmış çalışmalardan birisidir. Tivibu ev, mobil ve bilgisayar gibi kullanım seçenekleri vardır.<sup>[[1]](https://tr.wikipedia.org/wiki/Tivibu)</sup>
Bu anlatacağım yöntem için Tivibu Ev üyeliğinizin olması gerekmektedir.Çünkü Tivibu Ev, Tivibu'nun diğer platformlarının aksine [IGMP](https://tr.wikipedia.org/wiki/%C4%B0nternet_Grup_Y%C3%B6netim_Protokol%C3%BC) adı verilen teknoloji kullanarak UDP Multicast Streaming ile çalışmaktadır.

#### Biraz Elimizi Kirletme Zamanı
Ağdaki IGMP paketlerini okumak için Wireshark yazği yazılımını kullanıyoruz. Çünkü Wireshark tüm trafik içerisinde IGMP paketlerini filtreleyebiliyor. Bunun için Wireshark'ı kullandığımız arayüzü dinleyecek şekilde başlatıp "Filter:" kısmına kısaca `igmp` yazmamız yeterli. Fakat gördüğünüz üzere bu karşımıza bir sürü IP adresi çıkıyor:

![ttnetgorsel1](/assets/ExjelYz.png)

 Şuan izlediğimiz kanala ait multicast yayınını bulabilmek için öncelikle geri dönüş için kullanılan IPleri tahmin edip filtrelememiz gerekiyor.

- Araştırmalarıma göre 224.x.x.x şeklindeki IP adresleri IGMP istekleri tarafından kullanılıyor (Yayın alma isteği ya da Yayından çıkma isteği) yani video verisi içermiyor. Bunları Filter: `igmp and not ip.dst==224.0.0.0/8` ile filtreleyebiliriz.

![ttnetgorsel2](/assets/J2szjCG.png)

- Kalan 239.x.x.x şeklindeki IP adresleri ise Multicast için atanmış IP adresleriymiş. Yani video verisi içeren adres bu iplerden biri olabilir.

- Mantıken stream adreslerinin birbiri ardına gitmesi gerekiyor, mesela **239.x.x.1, 239.x.x.2, 239.x.x.3** gibi. Örnek tablomuza baktığımızda bize en yakın ip adresleri **239.254.0.x** şeklindeki adreslerdir. Fakat henüz hangi IP'nin stream verisi içerdiğini bilmiyoruz.

#### Peki Hangisi ?

Bunu anlamanın tek yolu denemek. Ben [bu](https://www.youtube.com/watch?v=InxO6tviZOE) videoya göre hareket ederek denedim. Buna göre **239.254.0.16:1234** adresi aradığımız adres. Voila !

![ttnetgorsel3](/assets/ejEJ7GU.png)

#### Ufak Düzeltmeler
Denemelerime göre RTP protokolü UDP'ye göre daha düzgün bir görüntü sunuyor fakat ne yazık ki her iki protokolde de aşırı hareketli görüntülerde görüntünün çizgi çizgi taranmış gibi gözükme problemi var. Bu problemiyse VLC -> Görüntü -> Taramasızlık -> Açık  yolunu takip ederek çözdüm. Ayrıca işin güzel yanı televizyonda o kanal açık olmasa bile PC veya Telefonda o kanala ait akışı seyredebiliyorsunuz.

Yayın akışı Androidli tablet ve telefonlarda MX Player ile sorunsuzca izlenebilir.

Herkese iyi seyirler :)

[Furkan KALKAN](http://www.furkankalkan.com/) Tarafından yazılmıştır.

----
**Not:** Burada yazanlar teknik açıdan eksik ya da yanlış bilgiler içeriyor olabilir. Bu durumda lütfen alttaki yorum kutusunu kullanın.
