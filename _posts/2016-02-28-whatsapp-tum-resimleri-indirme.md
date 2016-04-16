---
layout: post
title: Whatsapp Tüm Resimleri İndirme
date: 2016-02-28 11:05:00 +03:00
type: post
categories: Programlama
description: whatsapp web çıktı çıkalı resimleri telefon dışında indirmek pek mümkün
---

**Whatsapp Web** çıktı çıkalı resimleri telefon dışında indirmek pek mümkün değil sırf insanlara zorluk çıksın diye sanki bilgisayara indirmeyi buton ile yapmışlar ve otomatik olarak hepsini ne indirebiliyorsunuz nede gösteriyor.Ancak yapabileceğiniz ufak bir yöntem ile bundan kurtulmak mümkün tek yapmanız gereken aşağıdaki kodu kullanmak ve konuşma içerisindeki tüm resimleri indirmek

*Javascript Kodları*

```javascript
var img_dom = document.getElementsByClassName('image-thumb-body');
var links = [];

for (var i = 0; i< img_dom.length;i++){
 links.push(img_dom[i].src);
}


function downloadAll(urls) {
  var link = document.createElement('a');

  link.setAttribute('download', null);
  link.style.display = 'none';

  document.body.appendChild(link);

  for (var i = 0; i < urls.length; i++) {
    link.setAttribute('href', urls[i]);
    link.click();
  }

  document.body.removeChild(link);
}
downloadAll(links);
```

Bu kodu direk olarak **F12** aracılığı ile geliştirici kısmında çalıştırıyorsunuz ve o konuşma içerisindeki tüm resimler otomatik olarak tarayıcınızda önceden belirttiğiniz bölüme iniyor.
