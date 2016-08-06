---
layout: post
title:  Tüm Yazıcılar İçin Cupsenable Çalıştırılması
date: 2016-07-30
type: post
categories: linux
description: Sistemde birden çok yazıcı bulunuyor ise ve bunlardan bazıları disable moduna geçmiş ise ve normal şartlar altında otomatik
---

Sistemde birden çok yazıcı bulunuyor ise ve bunlardan bazıları disable moduna geçmiş ise ve normal şartlar altında otomatik başlatılamıyor ise `cupsenable` aracılığı ile başlatmamız gerekmektedir.

Aksi durumda;

*  Sistemdeki yazıcının gözükmemesi
*  Çıktı alınamaması
*  Yazdırma kuyruğunun etkilenmesi

 Yukarıdaki koşullardan herhangi birisini yaşıyor olabilirsiniz. Bu gibi sorunların üstesinden gelmek için aşağıdaki betik oldukça işinize yarayacak kaç tane yazıcı var ise sisteminizde hepsini yeniden aktif hale getirecektir.

{% gist MertcanGokgoz/b6eb3a7b350b46f276d036a4d01fc2da %}

Betiği Çalıştırma işlemi;

```console
chmod +x cupsfix.sh
sh ./cupsfix.sh
```

Örnek çıktı;

```console
Lutfen Bekleyin _192_168_1_53 Yazici Etkinlestiriliyor
Lutfen Bekleyin Canon_E400_series Yazici Etkinlestiriliyor
Lutfen Bekleyin HP_Deskjet_2050_J510_series Yazici Etkinlestiriliyor
Lutfen Bekleyin HP_LaserJet_Professional_P_1102w Yazici Etkinlestiriliyor
```

öptüm bye <3
