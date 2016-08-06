---
layout: post
title: Rdesktop ile Linux Uzak Masaüstü Kullanımı
date: 2014-07-29 15:23:48.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Rdesktop ile Linux Uzak Masaüstü Kullanımı aslında göründüğü kadar zor değil Teamviewer yerine kullanabileceğimiz bir alternatif olarak gözükebilir
---
**Rdesktop** ile Linux Uzak Masaüstü Kullanımı aslında göründüğü kadar zor değil **Teamviewer** yerine kullanabileceğimiz bir alternatif olarak gözükebilir Windowsdaki **RDP** nin linux sürümü zaten bunun kullanımıda oldukça basit sadece bağlanacağınız sistemlerin **RDP** bağlantısına izinleri açıp ubuntu üzerinden işlemlerimize geçebiliriz öncelikle izni vermemiz lazım bunun için

Bilgisayarıma sağ tıklayıp özellikler diyoruz oradan karşınıza uzak diye bir sekme gözünüze zaten ilişecek ayarlamaları aşağıdaki gibi yapıyoruz.

![rdekstopuzakmasaustugorsel1](/assets/rdekstopuzakmasaustugorsel1.png)

izinleri tamamladıktan sonra Ubuntu sistemimize programımızı kuruyoruz kurduktan sonra başka bi ayarlama yapmamıza gerek yok parametreleri vererek bağlanabilirsiniz.

Ubuntu için

    sudo apt-get install rdesktop

RHEL/Centos

    yum install rdesktop

Kurulum tamamlandıktan sonra bağlanmak için gerekli prosedürü yapabilirsiniz lokalden bağlanıyorsanız Eğer lokal ip yi girmelisiniz onun dışında normal **RDP** nasılsa rdesktopda da aynı şekilde kullanılmaktadır.

    rdesktop ip adresi

Bağlandık giriş yapmaya çalıştığımda kendi sistemime parolası olmadığı için haliyle bağlanamıyorum.Bunu düzeltmek için kullanıcı izinlerinden gerekenleri yapabilirsiniz.

![rdekstopuzakmasaustugorsel2](/assets/rdekstopuzakmasaustugorsel2-732x576.png)
