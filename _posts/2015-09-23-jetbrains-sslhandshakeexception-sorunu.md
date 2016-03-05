---
layout: post
title: JetBrains SSLHandshakeException Sorunu
date: 2015-09-23 16:10:14.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Geçtiğimiz günlerde JetBrains ürünlerini kurarken karşılaştığım bir hatayı nasıl çözdüğümü belirtmek isterim.Aslında bu hata son sürüm kurulum
---

Geçtiğimiz günlerde **JetBrains** ürünlerini kurarken karşılaştığım bir hatayı nasıl çözdüğümü belirtmek isterim.Aslında bu hata son sürüm kurulum merakımızdan kaynaklanıyor.Öncelikle **Linux** üzerinde JetBrains ürünleri **OpenJDK 1.7.0+** kullanıyor.Alt sürümler kabul edilebilir ancak üst versiyonlarda aşağıdaki hatayı alıyorsunuzdur.Çünkü **OpenJDK 1.8+** sürümünde bir sıkıntı var gibi gözüküyor ayrıcada **JetBrain** firmamız desteklemiyor bu sürümü...

    JetProfile connection error: SSLHandshakeException: java.security.cert.CertificateException:
    java.security.SignatureException: Signature length not correct: got 256 but was expecting 512.

bu hatayı gidermek için aslında Ca sertifikalarını güncellememiz yetecek gibi duruyor olabilir lakin güncellesek bile sorun hala devam ettiği için mecburiyetten eski **OpenJDK** sürümünü kurmanız gerekiyor bunu yapmak için ise

ArchLinux

    pacman -Syu jdk7-openjdk

Debian/Ubuntu

    sudo apt-get install openjdk-7-jre

bu kurulumları yaptıktan sonra haliyle hata kalmayacak

Ayrıca eski paketi kaldırmak istiyorsanızda aşağıdaki komutu kullanabilirsiniz.

ArchLinux

    pacman -Runs jdk8-openjdk

Debian/Ubuntu

    sudo apt-get purge openjdk-8-jre
