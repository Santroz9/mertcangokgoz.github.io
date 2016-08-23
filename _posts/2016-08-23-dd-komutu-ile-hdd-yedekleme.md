---
layout: post
title: Dd Komutu İle HDD Yedekleme
date: 2016-08-23
type: post
categories: linux
description: Disk yedeklemek için falan ek program kuranların olduğunu gördüm linux için böyle bir şeye gerek yok diskin bir kısmını yada diskin tamamını çok kolay bir şekilde
---

Disk yedeklemek için falan ek program kuranların olduğunu gördüm linux için böyle bir şeye gerek yok diskin bir kısmını yada diskin tamamını çok kolay bir şekilde yedekleyebilirsiniz. Kullanımı oldukça kolay öyle şunu yaz bunu yap gibi şey yok 2 parametre giriyorsunuz diskin veya yedeklemek istediğiniz partition un boyutuna göre sürüyor artık ne kadar sürerse

Şimdi disklerimizee bakalım sistemimizde neler varmış `lsblk` komutunu verelim.

```console
# lsblk

NAME           MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
sda              8:0    0 223,6G  0 disk  
├─sda1           8:1    0 207,7G  0 part  /
├─sda2           8:2    0     1K  0 part  
└─sda5           8:5    0  15,9G  0 part  
  └─cryptswap1 252:0    0  15,9G  0 crypt [SWAP]
sdb              8:16   0 596,2G  0 disk  
└─sdb1           8:17   0 596,2G  0 part  /media/mertcan/HDDBackup2
sr0             11:0    1  1024M  0 rom   
```

2 Adet diskim var 1 tanesi sistemimdeki SSD `sda` diğeride external olan `sdb` şimdi ben bunlardan kök dizininde bulunduğu `sda` alanından 2.partition olan `sda2` yi yedeklemek istiyorum.

```console
dd if=/dev/sda2 | pv | dd of=/media/mertcan/HDDBackup2/22-aug-2016-home.img
```

Bu şekilde belirlemiş olduğum sabit diskimde bulunan 1 adet partitionu yedeklemiş oluyorum direk olarak partition alınıyor. Boyutu oldukça yüksek olduğu için biraz sürecek tüm herşey hatta boş disk alanı bile gelecek

Alınan bu yedeği az buçuk snapshot gibi düşünebilirsiniz. Peki bu aldığınız yedeği tekrar nasıl geri yüklersiniz.

```console
dd if=/media/mertcan/HDDBackup2/22-aug-2016-home.img | pv | dd of=/dev/sdaX
```

Bu sayede tekrar istediğiniz yere yedeğinizi yüklemiş olacaksınız dikkat edin yedeğinizin boyutu ile yüklemek istediğiniz yerin boyutu tutuyormu orantısız olursa yüklenmeyeceğini unutmayın.

Tüm diskin yedeğini almak isterseniz.

```console
dd if=/dev/sda | pv | dd of=/media/mertcan/HDDBackup2/22-aug-2016-fulldisk.img
```

Olarak ayarlamanız yeterli sisteminizdeki kullandığınız diskin bir kopyasını almış olursunuz boyutu ne kadarsa aynı oranlı bir yedeğiniz olur. 1 TB diskiniz varsa 1 TB yedekleme alanına ihtiyacınız var. Bu yüzden sadece diskin bir bölümünü almanızı öneririm.

Alınan tüm disk yedeğinin yüklenmesi işlemi ise

```console
dd if=/media/mertcan/HDDBackup2/22-aug-2016-fulldisk.img | pv | dd of=/dev/sdaX
```

Kullandığımız komutlarda `pv` uygulamasını ekledik bunun nedeni ilerlemeyi görebilmek ne kadarının tamamlandığını anlamak. Sisteminizde `pv` bulunmuyor ise oldukça basit bir şekilde kurulumunu gerçekleştirebilirsiniz.

```console
sudo apt-get install pv
```

öptüm bye <3
