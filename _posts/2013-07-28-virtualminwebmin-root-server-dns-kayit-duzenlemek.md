---
layout: post
title: Virtualmin/Webmin Root Server DNS Kayıt düzenlemek
date: 2013-07-28
type: post
published: true
status: publish
categories: Virtualmin/webmin
description: Bu soruna test amaçlı almış olduğum centos 5.9 serverim de domainler de oluşan record sorunlarına çözüm ararken google de bulmuş olduğum
---

Bu soruna test amaçlı almış olduğum **centos 5.9 serverim** de domainler de oluşan record sorunlarına çözüm ararken google de bulmuş olduğum ve r10 da bir arkadaşımız tarafından da resimli olarak gördüğüm bir olaydır gerçekten sinir bozucu özellikle webmin kullanan arkadaşlar yada kullanmak isteyenler buraya dikkatle bakmalarını tavsiye ediyorum.

Öncelikle **http://siteadi.com:10000** Yolunu takip ederek panelimize ulaşıyoruz.

1-Karşımıza gelmiş olan **Ayarlar** sekmesine bir göz atalım

![virtualmingorsel1](/assets/virtualmingorsel1.png)

2-Yukarıda da görmüş olduğumuz **System Settings** e Tıklıyoruz.

![virtualmingorsel2](/assets/2.png)

3-Hemen Ardından **Server Templates** Kısmına Giriş Yapıyoruz.

![virtualmingorsel3](/assets/4.png)

4-Karşımıza 2 yada sistemin otomatik ayarlamasına bağlı olarak 2 seçenek gelecek karşımıza bizim işimiz **Default Setting** ile olacak tıklıyoruz.

![virtualmingorsel4](/assets/5.png)

5- hemen ardından Edit Template Section Kısmına tıklıyoruz ve scrool dan **BIND DNS Domain** Seçiyoruz.

![virtualmingorsel5](/assets/6.png)

Burada yapmamız gereken 2 işlem var genel olarak burası default şekilde ayarlı gelecek karşımıza ve **Address Records For New Domain** kısmında ön tanımlı olarak hepsi işaretlenmiştir lakin burada bize lazım olan sadece en başta bulunan 2 seçenektir.

![virtualmingorsel6](/assets/7.jpg)

- ns1.siteniz.com
- ns2.siteniz.com

Kısmını kendinize göre düzenleyin **Master Server DNS Hostname** Kısmını default olarak **hostname** ayarlayabilirsiniz yada automatic seçeneğini seçebilirsiniz sistem zaten otomatik algılamaktadır...
