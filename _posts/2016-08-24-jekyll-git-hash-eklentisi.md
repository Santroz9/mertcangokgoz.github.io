---
layout: post
title: Jekyll Git Eklentisi ile Versiyonlama
date: 2016-08-24
type: post
categories: jekyll
description: Jekyll'nin versiyonlama konusunda oldukça güzel bir eklentisi kullandığınız statik sitenin git de kullanılan hash değerinin kısa halini döndürür. Bunun güzel yani
---

Jekyll'nin versiyonlama konusunda oldukça güzel bir eklentisi kullandığınız statik sitenin git de kullanılan hash değerinin kısa halini döndürür. Bunun güzel yani versiyonlama konusunda işinize yarayacak olmasıdır. Bazı arkadaşlar özellikle sitelerinden kontrol ettikleri oluyor. yada kullanıcıya sitenin hangi sürümde olduğunu göstermek için bile kullanılabilir bir eklentidir.

Aşağıda bulunan ve size gerekli olan `.rb` uzantılı dosyayı jekyll de bulunan `_plugins` klasörü içerisine atıyorsunuz ve kullanmaya başlıyorsunuz. Herhangi bir dosyanızın donuna ekleme yaptırabilirsiniz yada ayrı bir html sayfada çağırabilirsiniz.

`_layout` klasörünüz içerisindeki `default.html` de bulunan 1 adet Css yada JS dosyasında şu satırı eklemeniz gerekiyor.

```
{% raw %}
{{ site.data['hash'] }}
{% endraw %}
```

{% gist MertcanGokgoz/3847f91c92dd8e7ea5bede0a29cc1c56 %}

Uygulamanın yaptığı şey ise çok basit `git rev-parse --short HEAD` komu çalıştırıyor ve o anki git de kullanılan hash değerinin kısa halini getiriyor. Siz bu eklentiyi baz olarak daha farklı birşeyler yapabilirsiniz.

öptüm bye <3
