---
layout: post
title: CPU ve RAM Değerlerinin Görülmesi
date: 2013-08-20 14:23:13.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Linux sistemlerde kullanabileceğiniz bu komutumuz sizin belirtmiş olduğunuz işlemlerin Ram ve CPU kullanımını % değer olarak belirtmektedir.
---

**Linux** sistemlerde kullanabileceğiniz bu komutumuz sizin belirtmiş olduğunuz işlemlerin **Ram** ve **CPU** kullanımını % değer olarak belirtmektedir. Sisteminizde aşırı derecede CPU ve RAM kullanımından şikayetçi iseniz “ **ps** ” ve “ **pidof** ” komutları işinize çokca yarayacak. Özellikle webserver olarak kullanan arkadaşlarda aşırı **CPU** kullanımı ve **RAM** kullanımı büyük risk taşır bu komutumuz sayesinde gerekli kullanımı öğrenebilir ve gereken müdahaleyi yapabilirsiniz.

Ps(İşlem durumu) aradığınız işlem nerede etkin ise yol ve kullanılan CPU ve Ram bazında bilgi verir.

**Örnek 1** Chromenin CPU ve Ram Değerlerinin İzlenmesi

    ps -p $(pidof chrome | sed 's/s/,/g') -o %cpu,%mem,cmd

![ram ve CPU göstermek](/assets/memorycpu3.png)

**Örnek 2** MYSQL deamon CPU ve Ram Değerlerinin İzlenmesi

    ps -p $(pidof mysqld | sed 's/s/,/g') -o %cpu,%mem,cmd

![ram ve cpu göstermek 1](/assets/memorycpu11.png)

**Örnek 3** Apachenin CPU ve Ram Değerlerinin İzlenmesi

    ps -p $(pidof httpd | sed 's/s/,/g') -o %cpu,%mem,cmd

![memorycpu2](/assets/memorycpu21.png)
