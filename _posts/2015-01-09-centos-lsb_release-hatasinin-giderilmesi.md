---
layout: post
title: Centos lsb_release hatasının giderilmesi
date: 2015-01-09 21:20:22.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Bugün centos network ile ilgili bir uygulama kuruyordum ismi lazım değil kurarken bir paketinde bir hata ile karşılaştım.böyle adını ilk kez
---
Bugün **centos** network ile ilgili bir uygulama kuruyordum ismi lazım değil kurarken bir paketinde bir hata ile karşılaştım.böyle adını ilk kez duyduğum bi script var mı kurmam gerekiyormuş açmadan önce falan filan ama asıl amacımız kuracak olduğumuz network uygulaması olunca bu hatadan kurtulmamız gerekiyor.

    You must install lsb_release binary before launching this install script.

pakete bi bakalım ne şekilde kurabiliriz ne yapabiliriz bu önemli

    yum provides */lsb_release

Çıktım şu şekilde oldu bu komutdan sonra

    redhat-lsb-core-4.1-24.el7.i686 : LSB Core module support
    Repo : base
    Matched from:
    Filename : /usr/bin/lsb_release

    redhat-lsb-core-4.1-24.el7.x86_64 : LSB Core module support
    Repo : base
    Matched from:
    Filename : /usr/bin/lsb_release

2 adet sürüm var gardaşım ne yaparsın artık bilinmez dedi bana bende bi googleledim ve karşıma çıkan kodlar şunlar oldu

    yum install redhat-lsb-core

bu komut sayesinde lsb paketinide kurmuş oldum ve o komutu içeren paketler artık sorunsuz bir biçimde çalışabilecek.
