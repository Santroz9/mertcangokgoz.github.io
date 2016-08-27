---
layout: post
title: Jekyll Youtube Eklentisi
date: 2016-08-27
type: post
categories: jekyll
description: Jekyll'nin youtube eklentisini bir arkadaşımız bizim için geliştirilmiş oldukça kullanışlı direk olarak embed almadan sadece ID ile otomatik oluşturabiliyoruz. Bunun 
---

Jekyll'nin youtube eklentisini bir arkadaşımız bizim için geliştirilmiş oldukça kullanışlı direk olarak embed almadan sadece ID ile otomatik oluşturabiliyoruz. Bunun güzelliği ise `markdown` dosyalarınız içerisinde kod kalabalıklığının ortadan kalkması oluyor. Eklenti kullanmazsanız da pek bir şey olmuyor aslında

bu eklentiye ben ufak bir ekleme yaptım ve gizlilik korunsun diye cookie bırakmayan embed oluşturması için tekrar linki düzenledim. `_plugins` klasörü içerisine indirmiş olduğunuz `.rb` uzantılı dosyayı atıp gerekli dosyanın içerisinde belirtildiği gibi kullandığınız taktirde güzel bir şekilde eklentimiz çalışacaktır.

{% gist MertcanGokgoz/cc824208425077aad174a0f4f5e58fce %}

Eklentinin yaptığı tek şey belirtilen boyutlar ve belirtilen youtube linkleri ile kolay bir şekilde belirtilen yere embed kodları oluşturmaktır.

öptüm bye <3
