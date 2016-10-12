---
layout: post
title: Jekyll Ditaa ASCII Art Eklentisi
date: 2016-10-12
type: post
categories: jekyll
description: Bu eklentiyi oldukça seviyorum ascii art şeklinde çizdiğiniz her türlü içeriği otomatik olarak resme dönüştürüp sayfanızda
---

Bu eklentiyi oldukça seviyorum ascii art şeklinde çizdiğiniz her türlü içeriği otomatik olarak resme dönüştürüp sayfanızda gösterebilmenize imkan tanıyor. ditaa'ya istediğinizi çizdirebilirsiniz. Tabi biraz yeteneğiniz olmalı çünkü oluşturana kadar biraz sıkıntı çekebilirsiniz. Otomatik oluşturan bir araç vs var mı bilmiyorum.

```
+--------+   +-------+    +-------+
    |        | --+ ditaa +--> |       |
    |  Text  |   +-------+    |diagram|
    |Document|   |!magic!|    |       |
    |     {d}|   |       |    |       |
    +---+----+   +-------+    +-------+
        :                         ^
        |       Lots of work      |
        +-------------------------+
```

şimdi yukarıdaki güzel çekli çizdirmek istersek ilk önce sisteme `ditaa` paketini ekleyeceğiz sonra eklentiyi `_plugins` klasörüne atacağız ve sonrasında otomatik olarak çizdiğiniz artık her neyse otomatik olarak resme dönüşecek

```
apt-get install ditaa
```

Kurulum tamamlanınca artık hazırsınız `ditaa` uygulaması java ile yazıldığı için yüklenecek paketler çok olabilir gözünüz korkmasın.

{% gist MertcanGokgoz/9c9d4325b5ab3d9e2541be8bf0b0247a %}

Oluşturulan resimler `assets/ditaa/` klasörüne atılacağını unutmayın.

öptüm bye <3
