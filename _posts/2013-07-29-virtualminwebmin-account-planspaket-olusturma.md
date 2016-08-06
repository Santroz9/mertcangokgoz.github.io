---
layout: post
title: Virtualmin/Webmin Account Plans(Paket) Oluşturma
date: 2013-07-29
type: post
published: true
status: publish
categories: Linux
description: Default Gelen üyelik paketleri yetmiyor ve yeni güzel paketler oluşturmak için virtualmin bizlere gene kolayca ayarlanabilir bir GUI sunmuş
---
**Default** Gelen üyelik paketleri yetmiyor ve yeni güzel paketler oluşturmak için virtualmin bizlere gene kolayca ayarlanabilir bir GUI sunmuş üstüne üstlük de detaylı bir izin ve ayar kısmı ile bizlere gerçekten muhteşem bir panel sunmuş ücretsiz olması ve bu kadar detaya inilmiş olmasıda webmin/virtualmin i cazip kılmaya yetiyor

Gelelim ayarlarımıza **root** olarak virtualmin e girdikten sonra Sol menüde **System Settings** > **Account Plans** Kısmına giriş yapıyoruz...

![1](/assets/12.png)

girdiğimiz zaman karşımıza ilk çıkan genellikle eskiden oluşturmuş olduğumuz paketler yeni paket oluşturmak için **Add a new account plan** tıklayarak asıl işlemlerimize geçiyoruz...

![2](/assets/22.png)

işte geldik en can alıcı yere plan oluşturma yerine burada gereken yerleri gereken şekilde dolduruyoruz.

![3](/assets/32.png)

Oluşturacağımız paketin **permissionlarına** geldi sıra **default** olarak seçili olan ayar otomatik olarak izin atamasıdır siz kullanıcılara özel izinler atamak istiyorsanız **Selected Below** seçerek gereken yerlere tik atabilirsiniz.

![4](/assets/42.png)

Bu kısımdan da Kabiliyetleri ayarlayacağız yani yapmış olduğumuz pakete neler çalışsın hangi ayarları tam olarak yapabilsin gibi önemli ayarların izinlerini verebilirsiniz. Tavsiyem script ayarları dışında kullanılmamasıdır.

![5](/assets/51.png)

**Create** dediğimiz zaman paketimiz oluşturulacaktır.ve yeni **Virtual server** oluşturulmasında kullanabilirsiniz veya oluşturdugunuz eski virtual serverlar üzerinde paket değişikliği yapabilirsiniz.
