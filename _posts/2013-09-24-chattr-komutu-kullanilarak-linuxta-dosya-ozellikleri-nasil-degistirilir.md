---
layout: post
title: Linux'ta Dosya Özellikleri Nasıl Değiştirilir
date: 2013-09-24 18:27:34.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: chattr ext2/ext3/ext4 tabanlı dosya sisteminde bulunan ve belli özellikleri ayarlamanız için olanak sağlayan bir linux sistem komutudur
---

**chattr**  ext2/ext3/ext4 tabanlı dosya sisteminde bulunan ve belli özellikleri ayarlamanız için olanak sağlayan bir **linux** sistem komutudur. Linux de silinmeyen,yeniden adlandırılmayan,taşınmayan dosyaları bu komut yardımı ile silinebilir hale getirebilirsiniz.Linux işletim sistemlerinde sıkça karşılaşılan sorunu ortadan kaldırmak için biçilmiş kaftandır.

    #chattr [Komut] [döngü] [dosya adı]

#### Komutlar

- + Özniteliğini ekle
- - Özniteliğini çıkart
- = Belirtilmemiş özellikleri kaldırma

#### Döngüler

- -R ardışık olarak dizinleri ve içeriklerinin özelliklerini değiştirir.(sembolik hatalar gözardı edilir)
- -a yazma işlemi açık ise sadece Süper user in düzenlemesini sağlayabilirsiniz
- -i dosyayı hiçbir şekilde silemez,yeniden adlandıramaz yerini değiştiremezsiniz.(ayarlama yapmak için root olmanız gerekir.)

Örnek 1

![chattrornek1](/assets/chattrornek11.jpg)

Örnek 2

![chattrornek2](/assets/chattrornek21.jpg)

Örnek 3

![chattrornek3](/assets/chattrornek31.jpg)
