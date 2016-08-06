---
layout: post
title: OpenVPN Frag TTL Expired
date: 2016-04-17
type: post
categories: linux
description: OpenVPN ile gizliliğimizi koruyacaz diye patates olmaya gerek yok keza UDP bağlantılarda
---

OpenVPN ile gizliliğimizi koruyacaz diye patates olmaya gerek yok keza **UDP** bağlantılarda sıkça karşılaşılaşıyorum. TCP bağlantıya geçtiğimde durum düzeliyor ancak arada bu `FRAG TTL expired` yazısını loglarda gördüğümde hoşuma gitmiyor.VPN arkasında eğer hızınız düşüyor ise logları bir kontrol edin derim **MTU** sıkıntısı çekiyor olabilirsiniz.

Örnek bir log;

```
Sat Apr 16 21:18:35 2016 Initialization Sequence Completed
Sat Apr 16 21:19:28 2016 FRAG TTL expired i=2
Sat Apr 16 21:19:28 2016 FRAG TTL expired i=17
Sat Apr 16 21:19:28 2016 FRAG TTL expired i=19
Sat Apr 16 21:19:28 2016 FRAG TTL expired i=24
Sat Apr 16 21:20:38 2016 FRAG TTL expired i=17
Sat Apr 16 21:20:38 2016 FRAG TTL expired i=22
Sat Apr 16 21:20:38 2016 FRAG TTL expired i=23
Sat Apr 16 21:21:03 2016 FRAG TTL expired i=7
Sat Apr 16 21:21:18 2016 FRAG TTL expired i=17
Sat Apr 16 21:21:18 2016 FRAG TTL expired i=18
```

Bu durum UDP bağlantılarında yaşanan **MTU**<sup>[[1]](https://en.wikipedia.org/wiki/Maximum_transmission_unit)</sup> sorunundan kaynaklanıyor aslında,Gönderilen verinin boyutu büyük ise bu veriler daha küçük parçalara bölünerek gönderilir.İşte bu duruma `Fragmantation` denir.Düzgün ayarlanırsa sıkıntı çıkartmaz ama gel gelelim çok sayıda bölümlendirme olursa yukarıdaki gibi saçma hatalar verip verimsizliğe neden olur bağlantınız yavaşlar ve kalitesi düşer.Bir MTU paketinin maximum boyutu 1500 byte olur.Bu kendi içerisinde ise şu şekilde ayrılır 1492 size ayrılan byte , geriye kalan 8 byte ise servis ile sizin aranızda ki paketdir.

Geçici çözüm olarak ise yapmış olduğunuz VPN bağlantısının bağlantı tipini değiştirmek UDP portlarından bağlanıyorsanız.Bunu **TCP** olarak değiştirmek.**UDP** bağlantıya göre hızınız TCP de düşük olaraktır ama bağlantı kaliteniz de ciddi anlamda düzelme göreceksiniz.Veya ağ kartınızı kurcalayıp MTU değerini değiştirebilirsiniz.Deneye yanıla bir şekilde doğru değeri bulabilirsiniz.Ama kişisel olarak size önerim TCP üzerinden trafik akışını gerçekleştirmeniz olacaktır.

En olmadı kulandığınız **VPN**in support kısmına bu konu hakkında danışabilirsiniz.Gerekli kontrolleri onlar sizin yerinize yapacaktır.
