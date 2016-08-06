---
layout: post
title: "Çöp kutusunu silme aralığını değiştime"
date: 2015-02-15 12:25:57.000000000 +02:00
type: post
published: true
status: publish
categories: programlama
description: Wordpress normal koşullar altında 30 gün içerisinde çöp kutusunda bulunan tüm içerikleri kalıcı olarak silmektedir.Fakat siz bunu değiştirmek istersenizde
---
**Wordpress** normal koşullar altında 30 gün içerisinde çöp kutusunda bulunan tüm içerikleri kalıcı olarak silmektedir._Fakat siz bunu değiştirmek istersenizde yapmanız gerekenler oldukça basit_

ana dizinde bulunan **wp-config.php** herhangi bir editör aracılığı ile açıyorsunuz. ve içerisine

    define('EMPTY_TRASH_DAYS', 10);

ekliyorsunuz yukarıda 10 diyerek çöp kutusundaki içeriğin 10 gün içerisinde silinmesini istediğimizi belirttik ve sistemde buna uyacak 10 gün sonra eğer çöp kutusunda varsa birşeyler otomatik olarak silinecek

eğer değer 0 olarak girilirse sistem otomatik olarak silmeyi durduracağı için çöp kutusuna atılan içerikler kesinlikle silinmeyecektir.
