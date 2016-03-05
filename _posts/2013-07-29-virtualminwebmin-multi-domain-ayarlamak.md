---
layout: post
title: Virtualmin/Webmin Multi Domain Ayarlamak
date: 2013-07-29 01:26:23.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Virtualminin Cpanel,Plesk,Kloxo gibi diğer sistemlerden farkı biraz daha detaya inmesi sunucunun en ince ayarlarına kadar ulaşabilir ve değiştirebilirsiniz
---
Virtualminin Cpanel,Plesk,Kloxo gibi diğer sistemlerden farkı biraz daha detaya inmesi sunucunun en ince ayarlarına kadar ulaşabilir ve değiştirebilirsiniz bunlardan en kolay multi domain eklemektir çünkü belirlediklerinizin dışında yapacağınız bir iş yok çünkü gereken ayarları **Virtualmin** eğer doğru kurmuş iseniz yapmaktadır.

Öncelikle Sol Menüden **Create Virtual Server** (Burdaki Virtual server ifadesi sizi yanıltmasın Reseller gibi düşünün ve 1 adet domain e ait alan ve bilgileri ekliyeceğiz)

![1](/assets/11.png)

Gereken bilgileri gereken yerlere ekliyoruz. **Account Plan** kısmı genel olarak **default 1 GB** ve limitsiz trafik olarak yarlıdır değiştirmek yada yeni Planlar eklemek için [Lütfen Bu Makalemize](http://mertcangokgoz.com/virtualminwebmin-account-planspaket-olusturma.html) göz atınız...

![2](/assets/21.png)

Bu Kısımdan Mail,database, prefix, mailuser gibi ayarlara **username** ekleme yapabilir yada **automatic** seçeneği ile işlemlerin otomatik bir biçimde yapılmasını sağlayabilirsiniz.

![3](/assets/31.png)

Bu bölümde de kullanıcıya vermiş olduğumuz **permissionlar** (izinler) burayı kullanıcının isteğine göre düzenleyebilir eklemeler veya çıkartmalar yapabilirsiniz.

![4](/assets/41.png)

Bu bölümde İP ayarları karşınıza gelir kullanıcı farklı ip adresi istemiyor ise ayarlarına dokunmamıza gerek yok lakin farklı ip isteğinde bulunulduğu taktirde yeni İP adreslerini girmeniz işlemi tamamlayacaktır...
