---
layout: post
title: Jekyll Kategori Listeleme Eklentisi
date: 2016-08-31
type: post
categories: jekyll
description: Benim özellikle severek kullandığım bir eklentidir. Hatalarını düzelterek tekrar revize ettim ve otomatik bir şekilde belirtilen sidebar içerisine kategorileri oluşturmasını
---

Benim özellikle severek kullandığım bir eklentidir. Hatalarını düzelterek tekrar revize ettim ve otomatik bir şekilde belirtilen sidebar içerisine kategorileri oluşturmasını sağladım bu sayede el ile ekleme zahmetindende kurtulmuş oldum. Benim yerime tüm herşeyi eklenti yapmış oldu.

{% gist MertcanGokgoz/612825252a44dfa1fe70e4303a0bf63b %}

`_plugins` klasörü içerisine indirmiş olduğunuz `.rb` uzantılı dosyayı atıyorsunuz. Sitenizde kullanmış olduğunuz `_layout` klasörü içerisinde kategorilerinizi kontrol eden layout hangisi ise önelikli olarak ona ufak bir ekleme yapmanız gerekiyor.

```
{% raw %}
{% category_list %}
{% endraw %}
```

Bu eklemeyi yaptığınızda otomatik olarak kategorilerinizi oluşturmaya başlayacak ancak ben eklentide kategori dizinini `category` olarak tanımladım siz daha önceden farklı bir yol kullanıyorsanız o kısmı değiştirmenizde fayda var.

Ayrıca daha sonra kategorilerinizi kontrol eden `layout`göre bir takım eklemeler yapıp klasörlemenizde gerekiyor. Yani sitenizde 10 adet kategori var ise sizinde `category` dizini altında aynı isimde klasörler açıp tekrar içerisini düzenlemeniz gerekiyor.

şöyle ki

`category/linux/index.html` olacak şekilde ben direk `.html` içerisine sadece şu satırları ekledim.

```
{% raw %}

---
layout: category
title: Linux
description: Linux kategorisindeki yazılar
category: linux
---

{% endraw %}
```

Bundan sonra eklentinin yapması gereken sadece linklemeler olacak. Şimdi diyebilirsiniz "dosyaları niye el ile oluşturuyoruz" bunun bir nedeni eklentimizin klasörleri oluşturmaması bu eklentinin cahilliği evet daha sonradan belki ben ekleyebilirim diye düşünüyorum ancak bu hali ile oldukça işlevsel geliyor bana o yüzden kurcalamayı pek düşünmüyorum. Ayrıca bu eklenti sitenizin `markdown` dosyaları içerisinde bulunan `category` kısmına bakarak linklemeleri yapar. Bu konuda dikkatli olun **büyük küçük harf özellikle duyarlıdır**

öptüm bye <3
