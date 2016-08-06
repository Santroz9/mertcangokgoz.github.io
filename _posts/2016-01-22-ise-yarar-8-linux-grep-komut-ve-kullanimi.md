---
layout: post
title: "İşe Yarar 8 Linux Grep Komut ve Kullanımı"
date: 2016-01-22 20:32:11.000000000 +02:00
type: post
categories: linux
description: Linux sistemlerde grep ile kolaylıkla arama yapabilirsiniz.Özellikle dosya içlerinde arama yapmak için kullanabilirsiniz. Grep aslında metin parçalamaya
---

Linux sistemlerde **grep** ile kolaylıkla arama yapabilirsiniz.Özellikle dosya içlerinde arama yapmak için kullanabilirsiniz. **Grep** aslında metin parçalamaya yarar yani sizin verdiğiniz pattern sonucunda sistemde ne var ne yoksa önünüze getirir yada belirttiğiniz dosyalar içerisinde bu arama işlemini gerçekleştirir.Komplike arama işlemleri yapabilir veya tüm dizin içerisinde aramalar düzenleyebilirsiniz.

## 1.Dosya içinde arama yapmak

armut.text içerisinde elma geçen satırları getirmesi için

```
    grep "elma" armut.text
```
## 2.Birden fazla dosya içerisinde arama yapmak

armut.text ve elma.text içerisinde patates geçen satırları getirmesi için(sonu .text olan tüm hepsinde arama yapar)

```
    grep "patates" *.text
```

## 3.Büyük küçük harf duyarlılığı ile arama yapmak

Sadece küçük veya sadece büyük harf olan armut.text içerisindeki elmaları getirmesi için

```
    grep -i "elma" armut.text
```

## 4.Regex ile arama yapmak

armut.text içerisindeki lma ile biten ve patates geçenleri getirmesi için

```
    grep "patates *lma" armut.text
```

## 5.Sonraki satırları da getirerek arama yapmak

Bulunan değerden sonra n kadar daha satır getirmek için

```
    grep -A 3 -i "elma" armut.text
```

## 6.Tüm dizinlerde arama yapmak

Tüm dizinlerde bahsi geçen değerin bulunmasını sağlamak için

```
    grep -r "elma" *
```

## 7.Hangi dosyalarda bulunduğunu arama

Aradığımız ifadenin içerisinde bulunduğu dosyaların isimlerini getirmesi için

```
    grep -l "elma" armut*
```

## 8.Eşleşmelerin Sayısını getirme

Aranılan ifadenin dosya içerisinde kaç kez geçtiğini bulmak için

```
    grep -c "ve" armut.text
```
