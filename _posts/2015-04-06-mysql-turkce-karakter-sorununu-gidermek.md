---
layout: post
title: MySQL Türkçe Karakter Sorununu Gidermek
date: 2015-04-06 15:27:49.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: MySQL de yedeklerini taşırken yada yeni bir site kurarken illaki böyle bir hata ile karşılaşanlar olmuştur türkçe karakterlerin aşırı derecede
---

**MySQL** de yedeklerini taşırken yada yeni bir site kurarken illaki böyle bir hata ile karşılaşanlar olmuştur türkçe karakterlerin aşırı derecede saçmaladığı bu hatayı çok basit bir şekilde çözeceğiz tabi sunucu size ait ise bunu yapabilirsiniz yada herhangi bir **VPS** olabilir.yeterki root izniniz olsun

yapacağımız şey **my.cnf** içerisine kodlama tipini tanımlamak böylelikle sonraki sorunlarada engel olmuş olacağız kodumuz ise

    [mysqld]
    init_connect='SET collation_connection = utf8_unicode_ci; SET NAMES utf8;'
    default-character-set=utf8
    character-set-server=utf8
    collation-server=utf8_unicode_ci
    skip-character-set-client-handshake

Burada en can alıcı nokta ise **skip-character-set-client-handshake** komutumuzdur bunu eklemeyebilirsiniz ancak eklersenizde var olan tüm **UTF-8** sorunlarını çözeceksiniz. **MySQL** Servislerini yeniden başlatmayı unutmayınız ki yaptığımız işlem aktifleşsin...
