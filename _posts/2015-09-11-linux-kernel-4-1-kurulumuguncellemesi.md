---
layout: post
title: Linux Kernel 4.1 Kurulumu/Güncellemesi
date: 2015-09-11 03:32:47.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Kernel 4.1.6 Güncellemesi uzun zaman önce duyuruldu ve çıktığında büyük ses getirdi özellikle bir çok hatanın düzeltildiği bu çekirdek işinize oldukça
---

**Kernel 4.1.6** Güncellemesi uzun zaman önce duyuruldu ve çıktığında büyük ses getirdi özellikle bir çok hatanın düzeltildiği bu çekirdek işinize oldukça yarayacaktır.Debian tabanlı sistemleri kullanıyorsanız eğer yapmanız gereken aşağıda, ubuntu sitesinde hala " **unstable**" etiketi ile sürümü yayınlamış olsada ASUS laptoplardaki Fn+F5 ve F6 tuşlarının çalışmaması sorunu giderilmiş aynı zamanda FN+F9 tuşuda süper bir şekilde çalışır olmuş.Dosya sisteminde meydana gelen bir kaç hata daha giderilmiş

Öncelikli olarak aşağıdaki komutlar ile en son kerneli sisteminize kurabilirsiniz.

    sudo su
    cd /usr/local/bin
    wget https://mertcangokgoz.com/Downloads/kernel-4.1.sh
    chmod +x kernel-4.1.sh
    sudo ./kernel-4.1.sh
    reboot -h now

bu işlemde kararsız durumlar varsa veya herhangi bir şekilde beklenmedik hatalar alıyorsanız silmenizi öneririm bunun için

    sudo apt-get purge linux-image-4.1* linux-headers-*
    sudo update-grub
    reboot -h now

Bu işlemden sonra sisteminiz eski kernele dönmesi gerekiyor dönmez ise aşağıdaki komut ile normal bir hale getirebilirsiniz.

    sudo apt-get install linux-generic
