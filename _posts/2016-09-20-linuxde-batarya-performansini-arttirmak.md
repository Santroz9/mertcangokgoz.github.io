---
layout: post
title: Linux'de Batarya Performansını Arttırma
date: 2016-09-20
type: post
categories: linux
description: Linuxde batarya performansının biraz kötü olduğunu düşünebilirsiniz özellikle uzun süre windows kullandıktan sonra linuxe geçtiğinizde batarya
---

Linuxde batarya performansının biraz kötü olduğunu düşünebilirsiniz özellikle uzun süre windows kullandıktan sonra linuxe geçtiğinizde batarya süresinin olduğundan az gittiğini fark etmişsinizdir. Aslında bu durum bir hatadan çok kullanıcıya elindeki sistemin tüm imkanlarını kullanabilmesi için verilmiş olan bir özelliktir. 

Windows sizi kısıtlarken linux tarafında sisteminizin tüm kaynaklarını kullanırsınız bu yüzdende windowsa oranla batarya performansı düşüktür. Ancak windowsda 6 saat gidipte linux de 2 saat gitme gibi bir durum söz konusu değildir sadece 1 saatlik bir fark bulunmaktadır. Yani 4 saat giden bir batarya ömrü 3 saate düşebilir. Bunun bir garantisi tabi ki windowsta olmadığı gibi linux sistemlerdede yoktur. Lafı uzatmadan hemen işlemlerimize geçelim...

Laptobumuzda bir takım değişiklikler yapacağız bu yaptığımız değişiklikler güç yönetimini sistemin daha iyi kullanmasını sağlayacak.

İlk olarak BIOS arkadaşımıza sistemin ne olduğunu belirtmemiz gerekiyor. Bu hem bir takım değişikliklerin geçerli olmasını sağlayacak hemde güç yönetimini iyileştirecek.


```
sudo nano /etc/default/grub
```

grub ayarlarımıza giriş yapıyoruz. Direk olarak şu satırı gözümüz ile arıyoruz. `GRUB_CMDLINE_LINUX=` bu satırı bulduktan sonra karşısına daha önceden bir şey eklemediyseniz aşağıdaki satırı ekliyoruz.


```
acpi_osi=Linux acpi=force acpi_enforce_resources=lax
```

ayarları kayıt ediyoruz ve aşağıdaki komutu vererek grubu güncelliyoruz.


```
sudo update-grub
```

Bu işlemi yaptık sisteme söyledik biz linux kullanıyoz sen istesende istemesende buna alış dedik bu kardeşte alıştı zorlarkende `lax` kullan dedik ki standartlarda sıkıntı çıkmasın

Bazı laptoplarda yapılan bu işlemler klavye arka plan ışığını falan geri getiriyor. getirmez ise şunu kullanabilirsiniz ceplik bilgi olarak burada dursun `acpi_backlight=vendor`

Şimdi herşey yerinde bu hali ile sistemi yeniden başlatıyorsunuz ve `dmesg` komutunu verip çıktılara bakıyorsunuz güç yönetimini engelleyen ve sistemde desteklenmiyor diye bas bas bağıran şunun gibi bir çıktı göreceğinize eminim


```
r8169 0000:03:00.0: can't disable ASPM; OS doesn't have ASPM control
```

Şimdi bu r8169 yani wifi den olabileceği gibi aynı zamanda başka donanımlardanda olabilir merak etmeyin bu bir sorun değil sadece bir uyarı sistem size güç yönetimi konusunda sisteminizin ASPM(Active State Power Management) desteklemediğinden bahsediyor.

şu şekilde kontrol edebiliriz.

```
dmesg | grep ASPM
```

çıktısında yukarıdaki gibi hatalar ile karşılaşıyormusunuz örneğin;

```
[    0.000000] PCIe ASPM is disabled
[    0.131506] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.194817] acpi PNP0A08:00: _OSC: not requesting OS control; OS requires [ExtendedConfig ASPM ClockPM MSI]
```

Sistemin desteklemediğinden tekrar ve tekrar bahsettiğini göreceğiz. Bunu çözmek için ise şu şekilde bir yol izleyebiliriz ya olduğu gibi pcıe üzerinde kapatırız yada TLP kurup yolumuza devam ederiz. İlk olarak biz bi TLP yi kuralım

```
sudo apt-get install tlp
```

Ubuntu 16.04 üzerinde direk ppa sisteme ekli olduğu için herhangi ek bir işleme gerek duyulmuyor direk olarak yükleyip kullanabiliyorsunuz. Sisteme uygulamayı ilk dahil ettiğinizde batarya modunda kulaklığınızdan cızırtı gelecektir telaşlanmayın yada `tlp` yi hemen kaldırmayın çözümü oldukça basit 

```
sudo nano /etc/default/tlp
```

dosyaya giriyoruz pek çok ayar karşımıza çıkıyor kulaklıkta sıkıntı yaratan satırı buluyoruz 

```
﻿SOUND_POWER_SAVE_ON_BAT=1
```

ve aşağıdaki gibi değiştiriyoruz.

```
SOUND_POWER_SAVE_ON_BAT=0
```

bu sayede bataryada kulaklıtan gelen tısırtı ve cızırtı kesilmiş olacak.

İkinci bir yöntem olarak ise aspm yi kontrol etmek ve bunu direk olarak grub yardımıyla kapatmak bu sayede sistem bu aşamada zorlamayacak ve kapatıp geçecek tüm donanımlar performanslı bir şekilde çalışmaya devam edecek ve bir yandanda TLP nin kurallarını uygulayacak ne güzel değil mi

şimdi bunu yapmak için yukarıdaki grub ayarlarına geliyorsunuz ve eklediklerinizin son satırına şunu ekleyip aynı işlemleri tekrarlıyorsunuz.

```
pcie_aspm=off
```

Kalıcı bir şekilde bu özellikten kurtulduğumuza görede işlem tamamlanmış oluyor artık bataryanın %10 daha fazla gittiğini göreceksiniz yani buna zaman olarak bakarsak 20 dk daha fazla demek olsada bu durum bataryanızın kalitesine görede değişecek bataryanızın ölü olmadığından emin olun yoksa `linux size harikalar yaratmaz`

öptüm bye <3
