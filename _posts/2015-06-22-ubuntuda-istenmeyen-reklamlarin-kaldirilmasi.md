---
layout: post
title: Ubuntu'da İstenmeyen Reklamların Kaldırılması
date: 2015-06-22 15:46:36.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Ubuntu kurduk ama reklamlardan bir türlü kurtulamadık hadi bir kaç eklenti ekledik diyelim tarayıcı tabanlı engelledik ama uygulamalar içinde
---

**Ubuntu** kurduk ama reklamlardan bir türlü kurtulamadık hadi bir kaç eklenti ekledik diyelim tarayıcı tabanlı engelledik ama uygulamalar içinde gelenleri vs engelleyemedik hadi onu geçtim tarayıcıdaki eklentinin engelleyemedikleri reklamlar oluyor hatta malware,crapware,trojan vs vs alıp gidiyor.Bunları önceden yasaklamak bize çok şey kazandırır o yüzden hemen işlemlerimize geçelim üşenmeyin hadi gelin yapalım.

Şimdi **/etc/hosts** lokasyonu normal şartlar altında değiştirilemiyoz illa root istiyor ondan bi **root** olup gelin.Şimdi lokasyon olarak kolay bi yol tanımlamak lazım hemen yapalım

    cp /etc/hosts ~/.etchosts

Tanımlamamızı yaptık sıra betiğimizi oluşturmaya geldi

**Dosya:** /usr/local/bin/updatehosts.sh

    #!/bin/bash
    cd /tmp
    wget http://winhelp2002.mvps.org/hosts.txt
    rm /etc/hosts
    mv hosts.txt /etc/hosts
    cat ~/.etchosts >> /etc/hosts

Dosyamızı **CTRL+X** ile kayıt ediyoruz.ve dosya izinlerini

    chmod +x updatehosts.sh

şeklinde çalıştırılabilir bir hale sokuyoruz.Şimdi bunu otomatiğe bağlayalım ve crontab ekliyelim

    crontab -e

Açılan ekranda 2 ye basıp nano ile dosyayı açalım en kolay yöntem olarak zaten kendiside söyleyecek ve hemen içerisine ayda 2 kez olmak şartı ile gece kontrol edecek ve güncelleyecek.

    59 23 * * * /root/update_hosts.sh

İşlemimiz böylelikle tamamlandı kayıt edip çıkıyorsunuz ve gerisini kendi ayarlıyor ilk çalıştırmayı siz yapabilirsiniz.Ondan sonrasını kendi yapacaktır.
