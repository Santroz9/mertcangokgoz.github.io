---
layout: post
title: Linux Kernel 4.0 Kurulumu/Güncellemesi
date: 2015-07-01 22:30:50.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Kernel 4.0 sürümü debian kullanan kullanıcılar için uzun zaman önce yayınlandı.Güncellemek isteyenler aşağıdaki yönergeleri izleyebilirler.Ayrıca
---

**Kernel 4.0 sürümü** debian kullanan kullanıcılar için uzun zaman önce yayınlandı.Güncellemek isteyenler aşağıdaki yönergeleri izleyebilirler.Ayrıca Kernel güncellemesinden sonra sisteminizde bazı ciddi sorunlar oluşabilir.Sisteminiz kararsız çalışmayabilir.Bazı özellikleri devre dışı kalabilir lütfen bunları göz önünde bulundurunuz.

Terminalde aşağıdaki komutları çalıştırınız.

```
sudo su
cd /usr/local/bin
wget https://mertcangokgoz.com/Downloads/kernel-4.0.sh
chmod +x kernel-4.0.sh
sudo ./kernel-4.0.sh
reboot
```

Yüklediğiniz kernelde çok sorunlar oldu kaldırmak istiyorsunuz.Onun içinde aşağıdaki komutu kullanınız.

```bash
sudo apt-get purge linux-image-4.0*
sudo update-grub
reboot
```
