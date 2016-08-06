---
layout: post
title: fatal error x264.h hatasının giderilmesi
date: 2015-02-14 14:34:37.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Ubuntu için x264 derlerken fatal error x264.h hatası ile karşılaştım hal böyle olunca codec kurmak işkence haline geliyordu
---
Ubuntu için **x264** derlerken fatal error: x264.h hatası ile karşılaştım hal böyle olunca codec kurmak işkence haline geliyordu.sorunu kolay bir şekilde çözebileceğimi stackoverflow da fark ettim ve sizede açıklamak istiyorum.Hata tam olarak şu şekilde gözüküyor terminalde

    fatal error: x264.h: No such file or directory

kurmaya çalıştığım ne idi **H.264/MPEG-4 AVC** açık kaynak kodlu ve genelde **HD** görüntülerde kullanılan bu codec mutlaka kurmanız gerekiyor yoksa piyasadaki çoğu video açılmaz oluyor.

Debian tabanlı sistemler için

    sudo apt-get install libx264-dev

Centos/RHEL ve Fedora sistemler için

    sudo yum --enablerepo=rpmfusion-free install x264-devel

Bunun dışında derleme ile kurmanıza gerek yok zaten internetdeki eski anlatımlarda derleme ile yapıldığı için hep **hatalar** ile karşılaşıyoruz internetdeki çoğu anlatımda zaten bu yönde ancak paket ile kurulum varken derlemeye gerek yok
