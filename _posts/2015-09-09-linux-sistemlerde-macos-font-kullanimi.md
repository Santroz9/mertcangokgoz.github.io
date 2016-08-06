---
layout: post
title: Linux Sistemlerde MacOS Font Kullanımı
date: 2015-09-09 00:21:39.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: MacOS işletim sisteminde kullanılan fontlara takık olduğumu bir kaç arkadaşım bilir bunun en büyük nedenlerinden biride göze daha hoş gelmesidir
---

![fontyenilogo](/assets/fontyenilogo.jpg)

**MacOS** işletim sisteminde kullanılan fontlara takık olduğumu bir kaç arkadaşım bilir bunun en büyük nedenlerinden biride göze daha hoş gelmesidir daha bi yumuşak gelir yazılar daha hoştur hafif gölgelidir falan adam gibi güzel fontlardır.

Bende windows sistmelerde naısl kullanabileceğinizi bu makalemizde göstermiştim.Şimdi ise linux işletim sistmelerini hedef alacağım ve fontları bunlara göre değiştireceğiz.Sonrasında istediğiniz bir fontu seçip kullanabilirsiniz **mac şeklinde zaten ayarlı olarak karşınıza çıkacak**

Hemen **root** yetkisini elinize alıyorsunuz ve gereken işlemleri yapmaya başlıyoruz.ilk olarak kuracağımız şey **microsoft** fontlarının çalışmasını sağlayacak olan uygulamamız aslında gerek yok diyebilirim ama tam anlamıyla çalışması için öneririm kurmanızı

    sudo apt-get install ttf-mscorefonts-installer

Kurulum tamamlandıktan sonra aşağıdaki işlemleri yapmanız yeterli bundan sonra fontlarınız mac fontları gibi gözümüze güzel gözükecek ve daha çok seveceksiniz.

    wget https://mertcangokgoz.com/Downloads/mac_fonts.tar.gz
    tar -zxvf mac_fonts.tar.gz
    sudo mv fonts /usr/share/fonts/
    sudo fc-cache -f -v

yukarıdaki işlemleri yaptıktan sonra fontlarınız böyle bi tatlı olacak böyle bi göze hoş gelecek diyeceksiniz ben onca zaman niye bu kötü fontlar gözlerimi bozmuşum tabi **MacOS** kullananlar bilirler efsane fontlar olduklarını.
