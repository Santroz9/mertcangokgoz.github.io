---
layout: post
title: VestaCP Üzerine WHMCS Modül Kurulumu
date: 2014-07-20 11:40:10.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: VestaCP geliştirilirken gerçekten de esnek ve bir o kadar da kolay olabilmesi amacıyla yazıldığını belirtmekte fayda var bu modül sayesinde
---
**VestaCP** geliştirilirken gerçekten de esnek ve bir o kadar da kolay olabilmesi amacıyla yazıldığını belirtmekte fayda var bu modül sayesinde tüm işlemlerinizi tek seferde yapabilirsiniz.

WHMCS Modül Kurulumu RHEL/Centos

    cd /home/user/web/billing-site.ltd/public_html/modules/server
    mkdir vesta
    wget http://c.vestacp.com/0.9.8/rhel/whmcs-module.php -O vesta.php

1. Sunucunuzda **WHMCS** ’nin kurulduğu dizini gösteriyorsunuz
2. Modules/Server dizini içerisine vesta klasörü oluşturuyorsunuz
3. Php modülünü indiriyorsunuz işlem tamamdır.

Bu sayede otomatik olarak paket oluşturabilir kullanıcı üyeliklerini kısıtlayabilir ve yönetebilirsiniz. Bununla birlikte kullanıcıların şifrelerini değiştirebilir ve kullanıcılar üzerinde denetim sağlayabilirsiniz. Web/mail/dns yönetimini de **WHMCS** yardımıyla yapabileceksiniz.
