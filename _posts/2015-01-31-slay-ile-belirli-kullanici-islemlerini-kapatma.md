---
layout: post
title: Slay ile belirli kullanıcı işlemlerini kapatma
date: 2015-01-31 13:45:31.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Chris Ausbrooks adında bir eleman tarafından geliştirilen slay sayesinde linux sistemlerde kullanıcı bazlı olarak tüm işlemleri kapatabilirsiniz.
---
**Chris Ausbrooks** adında bir eleman tarafından geliştirilen bu ufak araç sayesinde linux sistemlerde kullanıcı bazlı olarak tüm işlemleri kapatabilirsiniz.Kısacası adamı öldürürsünüz zaten **slay** bir kelime anlamıda **öldürmektir**.

Kurulumu şu şekilde yapabilirsiniz.

Ubuntu,Debian için

    sudo apt-get install slay

Arch Linux için

    sudo pacman -S slay

Centos için

    sudo yum install slay

Kullanımı ise çok ama çok kolaydır işlemi yapan kullanıcı adını bilmeniz yeterlidir o kullanıcıya ait tüm işlemler bir anda sonlandırılacaktır.

    sudo slay kullanıcıadı
