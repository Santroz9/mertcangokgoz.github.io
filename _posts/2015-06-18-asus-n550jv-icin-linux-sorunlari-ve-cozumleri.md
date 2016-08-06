---
layout: post
title: ASUS N550JV İçin Linux Sorunları ve Çözümleri
date: 2015-06-18 17:12:49.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: ASUS N550JV ilk aldığınızda içerisinde windows 8 ile gelmekte sonradan güncelleme ile 8.1 olmakta ancak windows sistemlerden benim gibi hoşlanmayan
---

**ASUS N550JV** ilk aldığınızda içerisinde windows 8 ile gelmekte sonradan güncelleme ile 8.1 olmakta ancak windows sistemlerden benim gibi hoşlanmayan arkadaşlar varsa **Ubuntu** yada herhangi bir linux dağıtımı kurduklarında bir kaç sorunla karşılaşacaklar bunlardan ilki fn tuşunun ve buna bağlı olarak bazı komutların çalışmaması,SD Kart slot sorunu,Laptop ile birlikte verilen subwoofer ses gelmemesi vb.

Sisteme yeni bir ubuntu dağıtımı kurduğunuzu varsayıyorum sıfırdan gerekli materyallerin nasıl kurulacağını ve sorunların nasıl çözüleceğini göstermek istiyorum aslında

## 1-GeForce 750M Sürücü yüklenmesi

Sistemde yazılım güncelleme kısmına geliyorsunuz direk olarak sistem ekran kartınıza uyumlu olan güncellemeyi gösterecek buradan yükleme işlemini yapıyorsunuz test edilmiş sürümü yükleyiniz.

![Asusn550jvdriverubuntu](/assets/Asusn550jvdriverubuntu.png)

Ayrıca ikinci bir ekran kartı olan intelide kullanması için bumblebee kurulumunuda aşağıdaki gibi yapabilirsiniz.Ek bir ayar gerektirmez tabi updates yüklendiği zaman işler değişir

    sudo add-apt-repository ppa:bumblebee/stable
    sudo apt-get update
    sudo apt-get install bumblebee bumblebee-nvidia linux-headers-generic

kurulum tamamlandıktan sonra sisteminizi yeniden başlatın sonrasında iki ekran kartınıda kullanabileceksiniz.

## 2-Klavye FN Tuşu

Çalıştırmak için ilk olarak bir kurulum yapmamız sonrasında ise grub dosyasına ufak bir kaç ayar girmemiz gerekiyor.Bunlar sırasıyla

    sudo su
    nano /etc/default/grub

![asusn550jvklavyebacklight](/assets/asusn550jvklavyebacklight-e1434632544130.png)

yukarıdaki gbi yapacaksınız eklenecekler ise

    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_osi="
    GRUB_CMDLINE_LINUX="acpi_backlight=vendor"



**acpi\_osi=** ve **acpi\_backlight=vendor** eklemelerini yaptık şimdi ise grub güncellemesi yapmamız lazım bunun için

    update-grub

Şimdi ise kurulum yapacağız ki adam akıllı çalışsın

    sudo apt-get install acpi

## 3-SD Slot Güncellemesi

**ASUS** laptopda RTS chipset kullandığı için bir kaç uygulama kurmamız gerekiyor bunun sonucunda kart slotu çalışacak

    sudo add-apt-repository ppa:relan/exfat
    sudo apt-get update
    sudo apt-get install exfat-utils fuse-exfat

kurulumdan sonra her zaman ki gibi yeniden başlatıyoruz ve işlemimiz tamamdır

Bu kurulumların hepsi belli başlı bazı sorunları çözemektedir.Güncelleme yapılması için gereken bildirimleri yaptıysamda biraz zaman alabilir.Güncelleme yapılana kadar bu yöntemler ile sorunlarınızı çözebilirsiniz ve kullanmaya devam edebilirsiniz.
