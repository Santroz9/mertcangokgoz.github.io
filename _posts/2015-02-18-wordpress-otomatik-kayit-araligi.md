---
layout: post
title: Wordpress otomatik kayıt aralığı
date: 2015-02-18 12:15:35.000000000 +02:00
type: post
published: true
status: publish
categories: programlama
description: Wordpress bir yazı yazarken wordpress bunu mümkün olduğunca kayıt ederek acil durumlarda sizi korumuş olur ama bu süre default olarak siz
---
**Wordpress** bir yazı yazarken wordpress bunu mümkün olduğunca kayıt ederek acil durumlarda sizi korumuş olur ama bu süre default olarak siz yazmayı bitirdikten **60 saniye** sonradır.Biz işimizi sağlama alalım ve bunu düşürelim çünkü kimi zaman en olmadık yerde bir iş gelebilir.

**wp-config.php** her hangi bir editör aracılığı ile açıp

    define('AUTOSAVE_INTERVAL', 30);

ekliyorsunuz böylelikle bundan sonra sistem **30 saniyede** bir otomatik olarak yazdıklarınızı kayıt ediyor ve işimizi biraz da olsa sağlama almış oluyoruz.Tavsiyem **30 saniye** den düşük bir değer vermemeniz siteyi yormak istemezsiniz.vereceksenizde minimum **15 saniyeye** indiriniz.
