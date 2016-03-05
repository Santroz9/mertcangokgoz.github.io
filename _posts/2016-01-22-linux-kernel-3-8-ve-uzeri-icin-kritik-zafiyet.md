---
layout: post
title: Linux Kernel 3.8 ve Üzeri için Kritik Zafiyet
date: 2016-01-22 09:27:11.000000000 +02:00
type: post
categories: Güvenlik
description: Linux kernel sürüm 3.8 ve üzeri sürümleri etkileyen ve geçtiğimiz günlerde tespit edilen sıfırıncı gün açığı 32 ve 64 bit sistemlerde sistem üzerinde
---
Linux kernel **sürüm 3.8** ve üzeri sürümleri etkileyen ve geçtiğimiz günlerde tespit edilen sıfırıncı gün açığı 32 ve 64 bit sistemlerde sistem üzerinde kullanıcının yetkisini arttırıyor ve **root** olmasına imkan tanıyor.Tespit edilen bu güvenlik açığı sayesinde **root** şifrelerini bilmeden yönetici olabilmek mümkün

**CVE-2016-0728** Etkilenebilecek Sistemler

- Red Hat Enterprise Linux 7
- CentOS Linux 7
- Scientific Linux 7
- Debian Linux stable 8.x (jessie)
- Debian Linux testing 9.x (stretch)
- SUSE Linux Enterprise Desktop 12
- SUSE Linux Enterprise Desktop 12 SP1
- SUSE Linux Enterprise Server 12
- SUSE Linux Enterprise Server 12 SP1
- SUSE Linux Enterprise Workstation Extension 12
- SUSE Linux Enterprise Workstation Extension 12 SP1
- Ubuntu Linux 14.04 LTS (Trusty Tahr)
- Ubuntu Linux 15.04 (Vivid Vervet)
- Ubuntu Linux 15.10 (Wily Werewolf)
- Opensuse Linux LEAP 42.x and version 13.x
- Oracle Linux 7

Oluşan bu zafiyetten korunmak için ise kernel sürümünü yükseltmeniz gerekmekte 2012 den beri var olan bu açıktan sunucular ve android telefonlar etkilenebileceği gibi internet üzerinden bulunabilecek bir takım **exploitler** ile sunucu üzerinde direk olarak yönetici olup zafiyetten faydalanabilmekte mümkün olabiliyor.

[CVE-2016-0728 Exploit](http://bit.ly/1NoEWs2)

![linux0dayzafiyetgorsel](/assets/linux0dayzafiyetgorsel.jpg)

Bulunan bu **linux kernel** güvenlik zafiyetinden etkilenmemek için yayınlanmış olan yeni kernel sürümüne geçmeniz gerekiyor.Sisteminizde yapacağınız ufak bir güncelleme ile bundan kurtulmanız mümkün

    uname -a

ile kernel versiyonumuzu öğreniyoruz. 0.73 ve aşağısı ise belirtilen zafiyetli sürüme uyuyor olabilir hal böyle olunca da açıktan etkileneceksiniz.Aşağıdaki komutlar aracılığı ile sistemde bulunan kernelinizi güncellemeniz mümkün

**Debian Tabanlı Sistemler**

    sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade

**RHEL/Centos**

    sudo yum update

**Suse/OpenSuse**

    zypper patch

Güncelleme işlemlerinin sonunda sisteminizi **yeniden başlatmanız** gerekiyor bunun için ise tüm sistemlerde aynı olan komutumuzu veriyoruz.

    reboot
