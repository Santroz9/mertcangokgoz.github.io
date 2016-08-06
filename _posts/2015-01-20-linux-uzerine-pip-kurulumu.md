---
layout: post
title: Linux Üzerine pip Kurulumu
date: 2015-01-20 12:52:25.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Python paketlerini kurmak istediğiniz zaman ilk başka googleye koşarsınız deli gibi paketi ararsınız bulmaya çalışırsınız milletin yazdıklarına
---
**Python** paketlerini kurmak istediğiniz zaman ilk başka googleye koşarsınız deli gibi paketi ararsınız bulmaya çalışırsınız _milletin yazdıklarına bakarsınız nafile_ kuramazsınız sonra dönersiniz kaç para lan bi **python** paketi dersiniz kendi kendinize sonrada düşünüp durursunuz bu paketi harbiden ben nasıl bulucam kuran adam bunu nasıl kurmuş diye düşünürsünüz birazda işte bu noktada **pip** karşımıza çıkıyor **Python** paketlerinin kurulumunda iş gören bir uygulama her türlü _python_ paketlerini arayıp bulup otomatik olarak kurar.Ama ilk önce **pip** uygulamasını sisteminize kurmanız lazım

Ubuntu,Debian,Mint

    sudo apt-get install python-pip

Fedora

    sudo yum install python-pip

Archlinux

    sudo pacman -S python-pip

CentOS(EPEL Paketin Kurulması gerekmektedir.)

    sudo yum install python-pip

Kurulumlar tamamlandıktan sonra istediğiniz paketi aşağıdaki örneğe göre kurabilirsiniz.

    pip install [paketismi]

Bu aşamadan sonra hata veren paketlerde **googleyi** kullanmanıza gerek kalmayağı gibi istediğiniz paketi **pip** içerisinde arama yaparakda bulabilirsiniz.Aşırı uç paketler gerekmiyorsa pip işinize fazlasıyla yetecektir.
