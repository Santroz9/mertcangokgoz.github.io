---
layout: post
title: Wordpress-Basic-Cache Eklentisi
date: 2016-01-20 21:54:02.000000000 +02:00
type: post
categories: programlama
description: Wordpress tüm sürümleri ile sorunsuz bir şekilde çalışması amaçlanmış yerleşik olarak sisteme dahil edilen bir cache sistemidir. Eklenti
---
**Wordpress** tüm sürümleri ile sorunsuz bir şekilde çalışması amaçlanmış yerleşik olarak sisteme dahil edilen bir cache sistemidir.Eklenti yapısı gereği dizinde bulunan ve kullanıcılar tarafından ziyaret edilmiş tüm her şeyi 1 kereye mahsus olmak sureti ile cache dosyasına almakta boş yere bekleme yapan sorguları ortadan kaldırdığı için yani saf olarak html kayıt tuttuğu için daha sonradan kullanıcı çağırdığında oldukça performanslı bir şekilde çalışmaktadır.

Tekrar tekrar **MySQL** + **PHP** de sorgu yaptırmaz.

Sitenizde yaptığınız herhangi büyük bir değişiklik de özellikle del.php çalıştırılması gerekmektedir.Yeni yazı yayınlayınca ve (veya) herhangi bir yazıyı güncelleyince cache otomatik olarak temizlenecektir.

cache dosyası otomatik olarak oluşmayacağı için el ile kendiniz oluşturmanız gerekmektedir izinlerinin **755** olması gerekmektedir.

Kullandığınız Tema dosyaları içerisinde bulunan header.php içerisine en üst satıra aşağıdaki kodları eklemeniz gerekmektedir.

```
<?php
ob_start();
echo $cachedosyas;
?>
```

Aynı şekilde kullandığınız tema dosyaları içerisinde bulunan footer.php içerisine en alt satıra aşağıdaki kodları ekleyiniz.

```
<?php
$cachedosyas=md5($_SERVER['REQUEST_URI']);
$cachedosyasi="cache/".$cachedosyas.".md5";
$ch=fopen($cachedosyasi,"w+");
fwrite($ch, ob_get_contents());
fclose($ch);
ob_end_flush();
?>
```

Ayrıca wp-admin klasörü içerisinde bulunan 4 adet dosyanın içeriğindeki kodların aynı isimdeki dosyaların en sonuna eklenmesi gerekmektedir.

- edit-tags.php
- edit.php
- post-new.php
- post.php

Bu Eklenti Eski ve yayından kalkan bir adet projenin devamı olarak geliştirilmeye devam edilecektir.

## [İndirmek için Tıklayın](https://github.com/MertcanGokgoz/Wp-Basic-Cache/releases)
