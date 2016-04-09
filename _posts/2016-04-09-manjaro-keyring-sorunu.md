---
layout: post
title: Manjaro Keyring Sorunu
date: 2016-04-09
type: post
categories: Linux
description: Merhaba arkadaşlar bir takım düzenlemeler yaparken heleki sistemi yeni kurmuşsanız
---

Merhaba arkadaşlar bir takım düzenlemeler yaparken heleki sistemi yeni kurmuşsanız güncellemeleri indirip kurma aşamasına geçtiğinizde aşağıdaki gibi bir hata ile karşılaşırsınız GUI ekranında hatanın ne olduğunu size söylemeyecektir.

pacman aracılığı ile güncelleme komutunu verdiğimizde ise aşağıdaki gibi bir hata döndürüyordu.

```
Can't Update: error: required key missing from keyring
```

Aslında hata demek doğru olmaz diye düşünüyorum.Sadece sistemdeki keylerin güncellenmesi veya eklenmesi gerekiyor bunuda kolay bir şekilde pacman aracılığı ile yapıyoruz.Bilmenizde yarar var bu hata sadece paketleri sisteme kurarken karşınıza çıkabilir onun dışında indirirken yada arama yaparken karşınıza çıkmaz.

```
sudo pacman -Sy archlinux-keyring manjaro-keyring
sudo pacman-key --refresh-keys
sudo pacman -Syu
```

ve bu sorunuda ortadan kaldırmış oluyoruz.Belirli periyotlar ile bu keyringleri güncellemek önemli lütfen bunu unutmayın.

öptüm bye <3