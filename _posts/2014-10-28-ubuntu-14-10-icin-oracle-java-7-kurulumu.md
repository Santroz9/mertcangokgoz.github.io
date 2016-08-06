---
layout: post
title: Ubuntu 14.10 için Oracle Java 7 Kurulumu
date: 2014-10-28 14:50:33.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Ubuntuda java ya yazılım geliştirmek isteyen arkadaşlar yana döne türkçe içerik aramaktadırlar eski sürümler için var ancak ubuntunun son sürümüne
---
Ubuntuda java ya yazılım geliştirmek isteyen arkadaşlar yana döne türkçe içerik aramaktadırlar eski sürümler için var ancak ubuntunun son sürümüne göre kurulum yapmaktan korkuyorsanız biz sizin için yapalım sizde izleyin bakın yapın sorunsuz ve güncel

    sudo su
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java7-installer

Kurulum sisteminize göre hızlı yada yavaş kurulacaktır telaş yapmayın

![ubuntuoraclejavakurulumgorsel1](/assets/ubuntuoraclejavakurulumgorsel1.png)

kurulumun doğru olduğunu nasıl anlayacaz onada hemen bakalım

![ubuntuoraclejavakurulumgorsel2](/assets/ubuntuoraclejavakurulumgorsel2-e1414496551392-525x576.jpg)

Böylelikle Javamız kuruluyor sistemimize artık istediğiniz gibi java geliştirme işlemine ufaktan başlayabilirsiniz Java candır...Bu arada silmek istiyorsanızda ki yapmayın böyle şeyler

    sudo apt-get remove oracle-java7-installer
