---
layout: post
title: Ubuntu Sunucular için LivePatch Özelliği
date: 2016-10-25
type: post
categories: linux
description: Linux 4.0 serisi kernelli ile birlikte ubuntu hayatına giren bir özellikten bahsetmek istiyorum. Bu özellik sayesinde kritik güncellemeleri sorunsuz bir şekilde sistemi hiçbir şekilde
---

**Linux 4.0** serisi kernelli ile birlikte ubuntu hayatına giren bir özellikten bahsetmek istiyorum. Bu özellik sayesinde kritik güncellemeleri sorunsuz bir şekilde sistemi hiçbir şekilde yeniden başlatmadan yapabiliyoruz. Bu özellik **REDHAT** tarafında ücretli olarak sunuluyor enterprise tarafında görmüşsünüzdür diye düşünüyorum. Ubuntuda bir değişiklik yapıp bu özelliğin bir farklı sürümünü ücretsiz olarak sunmaya başlamış bunu ben göreli yaklaşık 3 gün oluyor yani bu makele yayınlandığı günden 3 gün geriye geliyorsunuz.

Bu özelliği kullanabilmeniz için 16 serisi bir ubuntu kullanmanız gerekiyor kernel de en son güncel olan olması lazım ayrıca bu özellik 32 bitlerde çalışmıyor.

Peki bu özelliği nasıl aktif hale getiriyoruz. İlk önce [bu adresten](https://auth.livepatch.canonical.com/) kayıt oluyorsunuz. Ubuntu hesabınızın olması gerektiğini unutmayın. Sistem size bir API token sağlayacak bunu bir yere not edin

Ardından vakti zamanında sisteme gelen ve ulan ne işime yarayacak bu paket yöneticisi zaten apt varya dediğim o ilginç paket yöneticisini kullanacağız.

```
sudo snap install canonical-livepatch
```

Şimdi bunu kurduktan hemen sonra yukarda aldığımız **API Tokeni** tekrar elimize alıyoruz ve şu şekilde sisteme ekliyoruz.

```
sudo canonical-livepatch enable [API TOken]
```

Ardından aktif edildi işte şudur budur falan diyecek ve işlem son bulacak ancak burada dikkat etmeniz gereken üye olduğunuz hesap ile sadece 3 adet sistem üzerine ücretsiz olarak kurabiliyor olmanız.

İyi yanları

- Ücretsiz bir şekilde sunuluyor olması
- Önemli güncelleştirmeleri sistemin otomatik olarak yapacak olması
- Belkide en önemlisi sistemi yeniden başlatma zahmetinin olmaması

Kötü yanları

- 3 Sisteme kadar ücretsiz olması(benim kafamdaki sayı 6)
- Yıllık ücretinin 750 dolar olması(gider REDHAT alırız daha iyi)
- Herhangi bir yere üyelik gerektirmesi

Ücretsiz alacak olan adama üyelik gerektirebilirsin ek özellikler verirsin şudur budur dersin eyvallah ancak ücretsiz kullanacak olan arkadaşa tek cihaza sisteme kurulan uygulama üzerinden bir uuid verdirmek daha hoş ve daha pratik olurdu diye düşünüyorum.

Ayrıca unutmadan bahsedeyim sistemdeki **livepatch** durumunu görmek isteyen arkadaşlar için

```
canonical-livepatch status --verbose
```

komutu oldukça işe yarayacak...

**dipnot:** sisteme gelen güncelleştirmeleri otomatik olarak yapmaz sadece 3 haftada 1 kereye mahsus olmak üzere kritik kernel güncelleştirmelerini yapacak şekilde ayarlanmış bir özelliktir.

öptüm bye <3
