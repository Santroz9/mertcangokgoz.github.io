---
layout: post
title: Tripwire ile Sunucu Saldırı Tespiti
date: 2015-12-16 13:27:38.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Tripwire sistemlerde dosya bütünlüğünü kontrol edebilmeniz için geliştirilmiş bir uygulamadır.Çalıştığı anda dosya bütünlüklerini kontrol
---

**Tripwire** sistemlerde dosya bütünlüğünü kontrol edebilmeniz için geliştirilmiş bir uygulamadır.Çalıştığı anda dosya bütünlüklerini kontrol ederek bilgileri bir veritabanında toplar.Bir sonraki kontrol aşamasında bu veritabanında kayıtlı olan bilgilere göre herhangi bir değişiklik saptarsa değişiklikler ile birlikte rapora yansıtır. **Tripwire** günlük olarak bu kontrolleri yerine getirir aynı zamanda size mailde atabilir.Sistemde yapılan habersiz değişikliklerin saptanmasında çok önemli bir rol oynar.Birden fazla yöneticisi olan sistemlerde veya sisteme sızıldığı düşünülüyor ise özellikle kullanılması tavsiye edilir.

İlk olarak sisteme paketleri&nbsp;kuralım

```
    sudo su
    apt-get update && apt-get upgrade
    apt-get install tripwire
```

Bu aşamadan sonra ufak bi klasör ayarı lazım bunun için ise

```
    nano /etc/tripwire/twcfg.txt
```

Ayarları aşağıdaki gibi yapıyorsunuz.

![tripwiregorsel1](/assets/tripwiregorsel1.png)

Tripwire için anahtar oluşturmamız gerekiyor bunun için aşağıdaki komutu veriyoruz.

```
    tripwire-setup-keyfiles
```

Çalışmazsa korkmayın kurulum sırasında sizden istemişte olabilir.Eğer öyle ise bu aşamayı direk olarak atlıyoruz.Zaten kurulum sırasında yani en başta 2 kez şifre oluşturmamızı istiyor idi bunlardan biri **Site key** diğeride **local key**

Şimdi default olarak sistem tarafından kural seti oluşturmamız gerekiyor çabucak aşağıdaki komutu veriyoruz.

```
    sudo twadmin --create-polfile /etc/tripwire/twpol.txt
```

kural setimi oluştuktan sonra tripwire veritabanını başlatıyoruz.

```
    sudo tripwire --init
```

Uygulama sizden local key girmenizi isteyecek belirlediğiniz şifrenizi giriyorsunuz işlem biraz uzun sürebilir.Bu esnada bir takım hatalar alabilirsiniz.Bunun ana nedeni sisteminizde tripwirenin uyumsuz olması bir takım modüllerin çalışmasında sıkıntı çıkması

![tripwiregorsel2](/assets/tripwiregorsel2.png)

Gördüğünüz gibi linux için yazılmış olan bir uygulama çalışamayabiliyor böyle hatalar verebiliyor.Aşağıya bir klasör oluşturuyoruz çıkan hatalarıda ayrıştırmamız gerekiyor ki düzeltebilelim.

```
    mkdir ~/tripwire_update
    cd ~/tripwire_update
    tripwire --check | grep "Filename:" | awk {'print $2'} >> ./tripwire_errors
    cp /etc/tripwire/twpol.txt ~/tripwire_update/twpol.txt
```

Sonra aşağıdaki betiği çalıştırıyoruz.

**Dosya:** tripwire\_fix.sh

```
    #!/bin/sh

    TWERR="./tripwire_errors";
    TWPOL="./twpol.txt";

    export IFS=$'n'
    for i in $(cat $TWERR);
        do
        if grep $i $TWPOL
        then
            sed -i "s!$i!# $i!g" $TWPOL
        fi
    done
```

Betiği çalıştırdığınızda aşağıdaki gibi bazı kural setleri göreceksiniz.

![tripwiregorsel3](/assets/tripwiregorsel3.png)

baktığımızda hata veren tüm sistem uygulamalarının çıkarıldığını görüyoruz.Yeni oluşturulan kural seti dosyasını direk olarak uygulamanın dizinine taşıyoruz.

```
    cp ~/tripwire_update/twpol.txt /etc/tripwire/twpol.txt
```

Onaylanan yeni kural setimizi oluşturma komutumuzu veriyoruz.

```
    tripwire --update-policy -Z low /etc/tripwire/twpol.txt
```

![tripwiregorsel4](/assets/tripwiregorsel4.png)

Şimdi oluşturulan yeni kural setine göre dosya bütünlüğünü kontrol ettirelim.

```
    tripwire --check
```

Biraz sürecek ve sonra size bir çıktı verecek haliyle bu çıktı ile ilk bütünlüğü kontrol etmiş oluyoruz.Böylelikle günlük kontrollerden sonra ne olup bittiğini görebileceksiniz lakin bu haliyle günlük kontrol etmiş olmayacak el ile çalıştırmanız gerekecek lakin cronjob sistem hakkında gereken ayarı yaparsanız günlük olarak kontrol edilmesini sağlayabilirsiniz.

```
    crontab -e
```

Dosya içerisine aşağıdaki satırı ekleyin

```
    30 3 * * * /usr/sbin/tripwire --check | mail -s "Tripwire report for `uname -n`" your_email@domain.com
```

Mail fonksiyonları çalışmaz ise mail ile ilgili ekipmanlar kurulmamış olabilir kurmak için

```
    sudo apt-get install mailutils
```

Yukarıdaki eklemeler sonucunda her gün 3:30 sularında dosyaların bütünlüğü kontrol edilecek ve raporlar arasına eklenecek raporların yolu ise **"/var/lib/tripwire/report"** raporlara buradan ulaşabilirsiniz.
