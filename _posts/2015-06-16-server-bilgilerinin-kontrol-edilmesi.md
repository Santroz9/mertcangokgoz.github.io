---
layout: post
title: Server Bilgilerinin Kontrol Edilmesi
date: 2015-06-16 23:17:10.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Server bilgilerini kontrol edebileceğiniz ücretsiz bir şekilde yayınlanan ve özellikle root yetkisi gerekmeyen bir betik olan vHWINFO ile VPS,VDS
---

Server bilgilerini kontrol edebileceğiniz ücretsiz bir şekilde yayınlanan ve özellikle root yetkisi gerekmeyen bir betik olan vHWINFO ile VPS,VDS ve Dedicated sunucularını kontrol edebileceksiniz.Oldukça kullanışlı olan bu uygulama sayesinde aklınıza takılan soru işaretleri giderilmiş olacak Uygulama sizlere başlıca;

- Ana Bilgisayar adı
- İşletim Sistemi
- Kernel Sürümü
- CPU, RAM ve bunlar ile ilgili kullanım oranları
- Ayrıca HDD bilgileri ve kullanım oranları
- Sistemin bant genişliği ve port bilgileri

sırasıyla listelenecek.Bunu yapmak için ise

    wget –no-check-certificate https://vhwinfo.com/vhwinfo.sh -O - -o /dev/null|bash

Yukarıdaki komut Debian tabanlı olmayan tüm sistemlerde sorunsuz bir şekilde çalışacak ancak Debian tabanlı sistemlerde aşağıdaki yöntemi kullanmak zorundasınız.

    wget https://vhwinfo.com/vhwinfo.sh
    chmod +x vhwinfo.sh
    ./vhwinfo.sh

Örnek olarak çıktımız ise aşağıdaki gibi olacak

    ____
        _____/\ \__  __________  ____________
       /\ / \ ___\ _ _ / / / / | / / _/ | / /____ / __ \
      / \ \ / / | | / / /_/ /| | /| / // // |/ / /_ / / / /
     / \ \/ ___/ \ | |/ /__ / | |/ |/ // // /| / __/ / /_/ /
    / \ _________\ |___ /_/ /_/ | __/|__ / ___/_/ |_/_/ \____ /
    \ / / vHWINFO 1.1 May 2015 | https://vhwinfo.com

     hostname: mertcan
     SO: Ubuntu 15.04 64 bits
     kernel: 3.19.0-20-generic
     virtual: It is not virtual, is dedicated
     cpu: Intel(R) Core(TM) i7-4700HQ CPU @ 2.40GHz
     vcpu: 8 cores / 4788.97 bogomips
     RAM: ----------
     HD: 270G (11% used)
     cachefly 10MB: 7.51 MB/s
