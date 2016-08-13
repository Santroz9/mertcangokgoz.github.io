---
layout: post
title:  İşlemci ve Hard Disk Sıcaklığının Gözlemlenmesi
date: 2016-08-13
type: post
categories: linux
description:  Bir arkadaşımız bana mail ile ulaşarak bu işlemi nasıl yapabileceğini sordu bende gereken bilgilendirmeyi yaptım ancak buraya da yazayım
---

Bir arkadaşımız bana mail ile ulaşarak bu işlemi nasıl yapabileceğini sordu bende gereken bilgilendirmeyi yaptım ancak buraya da yazayım ki bundan sonra arayan arkadaşlara'da referans olsun

Kişisel bilgisayarınız için güvenle kullanabilirsiniz özellikle laptoplar da işlemci ve diğer bileşenlerin sıcaklıklarını kolaylıkla ölçebilir ve gözlemleyebilirsiniz.

Kritik sıcaklıklar ile birlikte o an ki sıcaklığı da gösterir. Genelde pek çok sistemle birlikte gelse bile bazılarında yüklü olmayabiliyor.

```console
sudo apt-get install lm-sensors hddtemp
```

Hemen ardından sistemdeki sensörleri bulmak amacıyla bi tarama işlemi gerçekleştiriyoruz.

```console
sudo sensors-detect
```

Bu aşamada size bir çok soru soracak yes mi no mu diye sisteminize göre cevaplayın referans olması için büyük harf ile gösterir neye ne diyebileceğinizi bu şekilde anlayabilirsiniz.

```console
sensors
```

komutunu verdiğiniz anda ise aşağıdaki gibi bir çıktı verecek

```console
mertcan@mertcan:~$ sensors
acpitz-virtual-0
Adapter: Virtual device
temp1:        +53.0°C  (crit = +98.0°C)

radeon-pci-0100
Adapter: PCI adapter
temp1:            N/A  (crit = +120.0°C, hyst = +90.0°C)

coretemp-isa-0000
Adapter: ISA adapter
Physical id 0:  +52.0°C  (high = +84.0°C, crit = +100.0°C)
Core 0:         +51.0°C  (high = +84.0°C, crit = +100.0°C)
Core 1:         +50.0°C  (high = +84.0°C, crit = +100.0°C)
Core 2:         +52.0°C  (high = +84.0°C, crit = +100.0°C)
Core 3:         +51.0°C  (high = +84.0°C, crit = +100.0°C)
```

Bunun dışında kurduğumuz Hard diskimiz için olan sıcaklık ölçeri şu şekilde çalıştırabiliriz.

```console
mertcan@mertcan:~$ sudo hddtemp /dev/sda
/dev/sda: SanDisk SDSSDHII240G: 38°C
```

Hemen altında sabit sürücünün sıcaklık değerini de gösterecektir.
