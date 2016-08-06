---
layout: post
title: Ubuntu 15.04 Steam Sorunu ve Çözümü
date: 2015-06-15 12:55:20.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Ubuntu 15.04 üzerinde steam her zaman ki gibi çalışır ya dedim açmaya çalıştım.Sonradan hata vermediğini ama açılmadığını fark etmem ile
---

Ubuntu 15.04 üzerinde steam her zaman ki gibi çalışır ya dedim açmaya çalıştım.Sonradan hata vermediğini ama açılmadığını fark etmem ile hayatım bir anda değişti sonra terminal yardımıyla açayım şunu dedim birde ne göreyim karşımda şöyle bir hata

![steamubuntuhatagorsel](/assets/steamubuntuhatagorsel.png)

Şimdi bu hatanın asıl nedeni ne araştırdım bulamadım kimi diyor ekran kartından kimisi diyor steam\_runtime sorunu kimiside diyor ubuntu kullanılırmı bu marjinal arkadaşları bir kenara bırakıp sorunun çözümüne ufakdan yaklaşalım ilk olarak sisteminizde steamın güncel sürümü yüklü olmak zorunda zaten bu hatayı en son güncelleme ile almaya başladık buda yaklaşık olarak 1 ay oluyor.ve Ubuntu 15.04 sürümünde var sadece haliyle bu distroyu kullanan tüm linux dağıtımlarında aynı sorun mevcut yani 15.04 tabanında olan tüm linux sistemlerde bunu görüyorsunuzdur.

AMD Kartlar için

    sudo apt-get install fglrx fglrx-pxpress
    sudo amdconfig --adapter=all --initial

NVIDIA Kartlar için

    sudo apt-get install linux-source
    sudo apt-get install linux-headers-generic
    sudo apt-get install nvidia-current-updates

Bu aşamadan sonra sisteminizi yeniden başlatmanız gerekmekte ayrıca yukarıdaki işlemleri yaparken araya xserver,xorg falan böyle adını falan duymadığınız paketlerde yüklenecektir sonrasında kaldırabilrirsiniz.
