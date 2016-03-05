---
layout: post
title: Ubuntu Guest Hesabını Devredışı Bırakmak
date: 2014-09-12 21:14:25.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Ubuntuda misafir hesabına ne gerek var kapatayım da kurtulayım evime misafir gelmiyor ben miyim lan misafir diyen arkadaşlar için güzel bir kapatma
---
Ubuntuda misafir hesabına ne gerek var kapatayım da kurtulayım evime misafir gelmiyor ben miyim lan misafir diyen arkadaşlar için güzel bir kapatma yöntemi bulunmakta ubuntu 14.04 sürümü kullanıyorum bildiğiniz gibi kapatmaya çalışmam zor olmadı tekde işini bitirdim.Komutumuz aşağıdadır.

    echo "allow-guest=false" |sudo tee -a /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf

![guestkullanicisinikapatmakubuntugorsel1](/assets/guestkullanicisinikapatmakubuntugorsel1.png)

Bu işlemleri Lütfen Root izni varken yapın sonrasında sisteminizi yeniden başlatın başlattığınızda karşınızda guest hesabı diye birşey çıkmayacak açmak için ise tam tersini yapmanız gerekiyor.
