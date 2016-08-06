---
layout: post
title: 'unknown url type: https Hatasının Giderilmesi'
date: 2015-01-21 13:20:18.000000000 +02:00
type: post
published: true
status: publish
categories: programlama
description: Python ile uğraşan arkadaşlar az çok gözlemlemişlerdir özellikle yeni kurulan sunucu ve sistemlerde easy_install kullanmak isterseniz bu hata çokca
---
**Python** ile uğraşan arkadaşlar az çok gözlemlemişlerdir özellikle yeni kurulan sunucu ve sistemlerde _easy\_install_ kullanmak isterseniz bu hata çokca karşımıza çıkar ve oldukça can sıkıcıdır.Genellikle **HTTPS** linklerde karşımıza çıkan bu hatayı bir kaç ufak yapılandırma ile çözebilmek mümkün

Ubuntu,Mint

    sudo apt-get install libssl-dev

Centos,RHEL,Fedora

    sudo yum install openssl-devel

Böylelikle **SSL** nin geliştirici paketlerini kurmuş oluyoruz ve bundan sonra yapacağınız işlemlerde bu _hata_ ile karşılaşmamış oluyoruz.
