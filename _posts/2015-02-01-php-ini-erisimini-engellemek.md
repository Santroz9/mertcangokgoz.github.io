---
layout: post
title: Php.ini erişimini engellemek
date: 2015-02-01 12:15:49.000000000 +02:00
type: post
published: true
status: publish
categories: Güvenlik
description: php.ini bir site için genel güvenlik önlemlerini barındırır ayrıca önemli ayarlarında yapıldığı bir sistem dosyasıdır.Şaşıracağınızı biliyor
---
**php.ini** bir site için genel güvenlik önlemlerini barındırır ayrıca **önemli** ayarlarında yapıldığı bir sistem dosyasıdır.Şaşıracağınızı biliyorum dışarıdan zaten erişilemeyen bi **php.ini** dosyasını nasıl olurda korumaya çalışırız diyorsunuzdur.Ancak ne olur ne olmaz bazı arkadaşlar çalıştırabilirler yada erişebilirler bunun önüne geçip korumaya çalışalım bir nebze olsun uğraştıralım.Bunun için .htaccess dosyamıza bir kaç satır ekleme yapıyoruz.

    <FilesMatch "^php5?\.(ini|cgi)$">
    Order Deny,Allow
    Deny from All
    Allow from env=REDIRECT_STATUS
    </FilesMatch>

Bu satırları ekledikten sonra **php.ini** ve **php.cgi** korumasını bazılarına karşı korumuş oluyoruz...
