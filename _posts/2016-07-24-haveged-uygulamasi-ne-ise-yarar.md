---
layout: post
title:  Haveged Uygulaması Ne İşe Yarar
date: 2016-07-24
type: post
categories: linux
description:   Haveged(Hardware Volatile Entropy Gathering and Expansion) kısaltılmış halidir. HAVAGE projesinden esinlenilerek yapılmıştır aslında benzersiz
---

Haveged(Hardware Volatile Entropy Gathering and Expansion) kısaltılmış halidir. **HAVAGE** projesinden esinlenilerek yapılmıştır aslında benzersiz rastgele sayı üretmeyi kusursuz hale getirmeyi amaçlamışlar bu yüzden güzel bir algoritma oluşturmuşlar

Linux genel olarak her türlü girdi çıktı işlemlerinde random sayı üretmeyi tercih eder genellikle sisteme bağlanan cihazların kimliklerini bu şekilde belirler.

Linux de rastgele sayı üretmek için 2 yöntem bulunmaktadır.

*  /dev/random
*  /dev/urandom

Bu arkadaşlardan ilki yani `/dev/random` block device ile çalışan değişik bir rastgele sayı üretme şeysi yukarıda bahsettiğim girdi çıktı olaylarındaki cihazların çıkarttığı gürültü ile çalışır yani bir nevi bir şeyin çalışır olmasına ihtiyacı vardır ki rastgele bir şeyler üretebilsin. Entropi yeterli olana kadar devam eder ve en kaliteli random işlemini yapar.

ikinci olanı yani `/dev/urandom` ise her koşulda çalışabilen ve benzersiz bir şekilde rastgele sayı oluşturma özelliğine sahip bir arkadaşımızdır. Girdisi ile çıktısı farklıdır.

Burada bizi bekleyen sıkıntılardan bir tanesi veri tekrarı oluşması ve haliyle üretilen her neyse onların bir birlerine daha çok denk gelebilme olasılıklarının artmasıdır. Mevcut entropi koşulları düştüğü zaman hizmetin kalitesi de düşer yani kalitesiz şifreleme işlemi demek

Pek çok uygulamada bu haveged ihtiyaç duyuyor. ipsec, openvpn gibi popüler VPN uygulamaları anahtar oluşturmada çok uzun bir süre geçiriyor ise bu sisteminizde entropi sorunu olduğuna işarettir ve mutlaka kurulması gerektiğinin de bir habercisi olabilir.

Genel güvenilirliği arttırmak ve engelleri aşarak yüksek kararlılık elde etmek mümkün kriptografik işlemleri gözle görülür ölçüde arttırıyor ayrıca sayısal tüm işlemlerinizde de eş zamanlı olarak hızlanma göreceksiniz.

Entropi koşullarınızın ne olduğunu görmek için aşağıdaki komut kullanılabilir.

```console
cat /proc/sys/kernel/random/entropy_avail
```

komutu verilir eğer çıkan sonuç **1000** den düşük ise özellikle `haveged` kurmanızda yarar var. Şimdi geldik kuruluma öyle uzun uzadıya yok şunu ayarlayın bunu buraya atın şunu şöyle yapın diye bir şey yok direk olarak kullandığınız dağıtımın paket yöneticisi ile çok kolay bir şekilde kurulumu yapabilirsiniz.

```console
sudo apt install haveged
```

Her dağıtımın reposun da özellikle bulunduğu için bulamama gibi bir lüxünüz yoktur diye düşünüyorum. Ayarları default bırakacağız ama ben kurcalamak istiyorum diyen arkadaşlar için

```console
cat /etc/default/haveged
```

komutunun çıktısı aşağıdaki gibi olacak bu sizi tatmin etmedi ise bu değeri yükseltebilirsiniz.

```console
# Configuration file for haveged

# Options to pass to haveged:
#   -w sets low entropy watermark (in bits)
DAEMON_ARGS="-w 1024"
```

Kayıt edip çıktığınızda zaten ayarlar otomatik olarak işleyecek ne başlatmanıza nede ön yükleyiciye eklemenize gerek yok zaten kendi işini kendisi yapıyor.

Test etmek istersenizde şöyle bir komut verebilirsiniz.Bu komutu kullanabilmek için sisteminizde `rng-tools` paketinin kurulu olması gerekmektedir.

```console
sudo apt install rng-tools
```

Test için örnek kodumuz

```console
cat /dev/random | rngtest -c 1000
```

test sonucunda eğer hata sayısı azsa ve verdiğiniz sayıya yakınsa haveged mükemmel bir şekilde çalışıyor ve görevini yerine getiriyor demektir.

```console
rngtest 5
Copyright (c) 2004 by Henrique de Moraes Holschuh
This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

rngtest: starting FIPS tests...
rngtest: bits received from input: 20000032
rngtest: FIPS 140-2 successes: 1000
rngtest: FIPS 140-2 failures: 0
rngtest: FIPS 140-2(2001-10-10) Monobit: 0
rngtest: FIPS 140-2(2001-10-10) Poker: 0
rngtest: FIPS 140-2(2001-10-10) Runs: 0
rngtest: FIPS 140-2(2001-10-10) Long run: 0
rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
rngtest: input channel speed: (min=1.531; avg=19.793; max=9536.743)Mibits/s
rngtest: FIPS tests speed: (min=20.575; avg=82.842; max=93.041)Mibits/s
rngtest: Program run time: 1194076 microseconds
```

**dipnot:** Ubuntu her ne kadar bu entropi sorununu çözdüğünü söylese de uyulama kurulmadan önceki ve sonraki testlerde sonuçlar oldukça farklılık göstermekte. Benim kişisel fikrim uygulamanın kurulması yönünde...

öptüm bye <3
