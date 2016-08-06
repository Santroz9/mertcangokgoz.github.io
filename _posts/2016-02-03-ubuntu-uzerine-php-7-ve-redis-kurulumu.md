---
layout: post
title: Ubuntu Üzerine Php 7 ve Redis Kurulumu
date: 2016-02-03 15:45:27.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: PHP 7 yayınlanalı çok oluyor yeni sürüme geçmeyenler yada hali hazırda php5-fpm kullananlar olabilir nginx üzerinde sıkıntı çekeceğini düşünenler

---

**PHP 7** yayınlanalı çok oluyor yeni sürüme geçmeyenler yada hali hazırda **php5-fpm** kullananlar olabilir **nginx** üzerinde sıkıntı çekeceğini düşünenler olabilir.Kurmayan varsa kurmalarını öneriyorum niye derseniz **php5** sürümüne göre oldukça hızlı&nbsp;tabi hala **HHVM** kadar hızlı değil ancak **php** den vazgeçemeyen arkadaşlar için oldukça ideal

Grafiksel olarak göstermek gerekirse Php 7 **Wordpress** de olukça performanslı çalışıyor.

![php7grafikgorsel](/assets/php7grafikgorsel.jpg)

Tabi burada saf **php7** gösterilmiş durumda biz bu kuruluma birde **redis** eklediğimizde otomatikmen **HHVM** performansına ulaşmış olacağız tabi **HHVM** ve **redis** kurulumu yapıldığında dahada performanslı bir sistemimiz olacak

{% gist MertcanGokgoz/f3c5f63a49f7e917fa09 %}
