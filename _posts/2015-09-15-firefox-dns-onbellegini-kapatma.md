---
layout: post
title: Firefox DNS Önbelleğini Kapatma
date: 2015-09-15 15:54:21.000000000 +03:00
type: post
published: true
status: publish
categories: guvenlik
description: Firefox güvenlik sıkılaştırmalarına tam gaz devam ediyoruz şimdi ise firefoxdaki dns cachesini kapatmayı göstereceğim bunu yapma nedenimiz
---

**Firefox** güvenlik sıkılaştırmalarına tam gaz devam ediyoruz şimdi ise firefoxdaki **dns** cachesini kapatmayı göstereceğim bunu yapma nedenimiz bilgisayarımızda daha az gezdiğimiz siteler hakkında verilerin azalması her seferinde temizlenmesi bu açıdan işimize yarayacak işlemleri yaptıktan sonra web sitelerine eskisi gibi belki giremeyeceksiniz 1 sn gibi bir gecikme yaşayacaksınız.

İlk olarak tarayıcımızdaki tüm sekmeleri kapatarak işlemimize başlayalım sonra ise adres girdiğimiz çubuğa **about:config** diyelim ve gereken yere ulaşalım.Garantiden çıkacaksınız falan diyecek evet diyip geçiyoruz.

![aboutconfiggorsel1](/assets/aboutconfiggorsel1.jpg)

Burada bir çok ayar göreceksiniz bize lazım olan ise **network.dnsCacheExpiration** bunu arama kısmına yazıyoruz ve karşımıza 2 değer çıkıyor. Aşağıdaki gibi değiştiriyoruz.

![dnsexpirationgorsel1](/assets/dnsexpirationgorsel1.jpg)

İşlemimiz tamamlanmış oluyor artık Firefox dns sorgularınızı tutmayacak biraz daha güvenli bir şekilde gezinebilirsiniz.Anlık olarak sıfırlanacak bazı web siteleri kağnı gibi açılabilir tekrardan söylüyorum. **Dikkat Ediniz.**

Eğer **network.dnsCacheExpiration** değeri sistem içerisinde yok ise alana sağ tıklayıp **Properties \> New \> Integer** dediğiniz anda gereken şekilde değeri oluşturabilirsiniz.
