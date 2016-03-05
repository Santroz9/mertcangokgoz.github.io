---
layout: post
title: CentOS 6.5 Resmen Yayınlandı!
date: 2013-12-03 15:05:03.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: CentOS 6.5 Enterprise Linux (1 Aralık 2013) tarihinde resmen yayınlandı. Red Hat tarafından geliştirilip kullanıcıların kullanımına
---

**CentOS 6.5** Enterprise Linux (1 Aralık 2013) tarihinde resmen yayınlandı. Red Hat tarafından geliştirilip kullanıcıların kullanımına açılması **CentOS 6.4** ün üst sürümü olan bu sürüm içerisinde&nbsp; **RHEL 6.5** e dayalı tüm güncellemeleri içermektedir.CentOS 6.x sistemlerinizi çok kolay bir şekilde **CentOS 6.5** yükseltebilirsiniz yada var olan eski bir sürüm üzerine yeniden format ile kolaylıkla kurabilirsiniz.

## Belli başlı neler değişti ?

- The Precision Time Protocol - previously a technology preview - is now fully supported. The following drivers support network time stamping: bnx2x, tg3, e1000e, igb, ixgbe, and sfc.
- OpenSSL has been updated to version 1.0.1.
- OpenSSL and NSS now support TLS 1.1 and 1.2.
- KVM received various enhancements. These include improved read-only support of VMDK- and VHDX-Files, CPU hot plugging and updated virt-v2v-/virt-p2v-conversion tools.
- Hyper-V and VMware drivers have been updated.
- Updates to Evolution (2.32) and Libre Office (4.0.4)

### Nereden indirebilirim ?

- [Download CentOS 6.5 32Bit](http://mirror.centos.org/centos/6.5/isos/i386/CentOS-6.5-i386-bin-DVD1to2.torrent)
- [Download CentOS 6.5 64Bit](http://mirror.centos.org/centos/6.5/isos/x86_64/CentOS-6.5-x86_64-bin-DVD1to2.torrent)

Alternatif

- [Download CentOS 6.5 32/64 Bit İSO](http://www.centos.org/modules/tinycontent/index.php?id=30)

#### Hali Hazırdaki CentOS sistemimi nasıl yükseltebilirim ? ( **CentOS 6.x dan 6.5** )

    yum update

Karşımıza aşağıdaki gibi bir çıktı verecektir...

    Transaction Summary
    ================================================================================
    Install       6 Package(s)
    Upgrade     135 Package(s)
    Total download size: 248 M
    Is this ok [y/N]:

"Y" Basıyoruz ve işlemin devamına geçiyoruz burada sisteminizin internet ve işlemci hızına göre yükseltme işlemi devam edecek tüm paketler indirilip otomatik olarak kurulacaktır.

## Tüm İşlemler Bitti peki güncellendiğini nasıl anlayacağım ?

Aşağıdaki komutu yazıyoruz.

    cat /etc/redhat-release

ve çıktı olarak bize

     CentOS Release 6.5 (Final)

Geri kalan tüm bilgiler ve kurulum notları için [Release Not](http://wiki.centos.org/Manuals/ReleaseNotes/CentOS6.5)larına bakabilirsiniz...
