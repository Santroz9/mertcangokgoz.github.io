---
layout: post
title: Sitemi Nasıl Yönlendirebilirim ?
date: 2015-03-22 18:13:05.000000000 +02:00
type: post
published: true
status: publish
categories: Genel
description: Bir web sitesi kurdunuz ve sonrasında domain adresinizi değiştirmeniz gerekti eski yedeklerinizi taşıdınız ayarlamalarınızı yaptınız ve sıra yönlendirme
---
Bir web sitesi kurdunuz ve sonrasında domain adresinizi değiştirmeniz gerekti eski yedeklerinizi taşıdınız ayarlamalarınızı yaptınız ve sıra yönlendirme işlemine geldi ve yönlendirmeyi .htaccess kullanarak yapmak istemiyorsanız.Aşağıdaki **PHP** kodu işinize çok yarayacak yapmanız gereken domaininizin bulunduğu eski sunucu içerisindeki **index.php** içerisine satırları eklemek

    header('Location: https://www.mertcangokgoz.com/');

yukarıdaki kodları **index.php** içerisinde olan **\<?php** tagından hemen sonra yazıp kayıt ettiğiniz taktirde yönlendirme hemen gerçekleşecek ve siteniz yeni adrese yönlenmeye başlayacak
