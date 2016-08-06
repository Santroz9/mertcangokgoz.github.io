---
layout: post
title: DD Komutunda İlerlemeyi Görelim
date: 2016-05-27
type: post
categories: linux
description: Dd komutu ile USB belleklere birşeyler yazdırırken veya imaj oluştururken falan benim canım terminalde yeni satıra geçmesini
---

**Dd** komutu ile USB belleklere birşeyler yazdırırken veya imaj oluştururken falan benim canım terminalde yeni satıra geçmesini bekleyene kadar sıkılıyor **Dd** nin ne yaptığını kaç ile yüklediğini falan görmek istiyordum eskiden kullandığım bir komutum vardı

PV nin kurulumunu yapıyoruz.

```bash
sudo apt install pv
```

hemen ardından dd komutumuzu şu şekilde oluşturmaya geçiyoruz misal ben bu komutu kullandığım şu zamanlarda sistemi **Debian 8 "Jessie"** ye çevirdiğim için ortaya şöyle bi kod çıktı

```bash
dd bs=8M if=debian-8.4.0-amd64-CD-1.iso | pv | dd of=/dev/sdb1 conv=sync
```

Bunun sayesinde kaç MB yüklenmiş ve Kaç MB hız ile yükleniyor onu rahatlıkla görebilirsiniz.Performans sorunlarınıda takip etmenize imkan tanır. **blocksize** değeri olan `bs=8M` siz her zaman kullandığınız değer ile değiştirebilirsiniz.Ben bu işlemde **8M** olarak seçtim. Ayrıca USB belleğimizin ömrü bitmesin diyede `conv=sync` komutunu verdim cache yazmasının önüne geçtim **USB** ömrüne ömür kattım :)


öptüm bye <3
