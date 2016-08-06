---
layout: post
title: Debian Tabanlı Sistemler'de Swap Etkinleştirme
date: 2016-04-15
type: post
categories: linux
description: Swap dosyası oluşturmadan sistemi kurmuş olabilirsiniz yada ne bileyim bir şekilde bir sıkıntı çıktı
---

Swap dosyası oluşturmadan sistemi kurmuş olabilirsiniz yada ne bileyim bir şekilde bir sıkıntı çıktı boyutunu falan arttıracaksınız bilemiyorum keyfinize kalmış ancak debian tabanlı sistemlerde aşağıdaki işlemleri yaptığınızda sıkıntısız bir şekilde Swap etkinleştirip kullanabilirsiniz.

Öncelikle bi nerede oluşturacağız onu bi belirleyelim ben genelde bu tarz dosyaları `var` yada `opt` içerisinde oluşturuyorum.Bu seferde `var` klasörü içerisinde oluşturacağım


```bash
cd /var
touch Swapcik.img
chmod 600 Swapcik.img
```

Dosyayı oluşturacağımız klasörümüze ulaştık ve dosyamızı oluşturduk ardındanda izinlerini düzenleyip bıraktık.Şimdi geriye tek bir şey kalıyor bu `Swapcik.img` dosyamızın boyutunu ayarlamaya

```bash
dd if=/dev/zero of=/var/Swapcik.img bs=2048k count=2000
```

oluşturma işlemimiz 4 veya 6 sn içerisinde tamamlanacak.Bizimde bunu `mkswap` ile tanımamız lazım.

```bash
mkswap /var/Swapcik.img
```

Oluşturduğumuz Takas alanımızı etkinleştirelim ki bir işe yarasın yoksa kuru kuruya oluşturmak bir işimize yaramaz

```bash
swapon /var/Swapcik.img
```

Normal şartlar altında `/etc/fstab` dosyasını size düzenletirdim ama kafanız karışmasın şimdi bunu echo komutunun güzelliği ile halledeceğiz ve son satıra çat diye ekleyeceğiz.Sonrasında her boot aşamasında otomatik devreye girecek sizde rahatınıza bakacaksınız.

```bash
echo "/var/Swapcik.img    none    swap    sw    0    0" >> /etc/fstab
```

Artık bizimde bir takas alanımız bulunuyor ama siz genede RAM bitirmemeye çalışın.

öptüm bye <3
