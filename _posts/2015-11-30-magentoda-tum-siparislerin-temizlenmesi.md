---
layout: post
title: Magento'da Tüm Siparişlerin Temizlenmesi
date: 2015-11-30 15:54:05.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: Geçtiğimiz günlerde Magento üzerine bir e-ticaret sitesi kurarken sistemde testler neticesinde çok ilginç veritabanı sorunları ile karşılaştım

---

Geçtiğimiz günlerde **Magento** üzerine bir e-ticaret sitesi kurarken sistemde testler neticesinde çok ilginç veritabanı sorunları ile karşılaştım öncelikle siparişler geçildiğinde bir takım kolonların olmadığını fark ettim bu sorunu sistemden çözdüm lakin bunun oluşturduğu bir hatayı siparişleri tamamen silmeden çözemiyoruz. Eğer sizde bu tarz bir sorun ile karşılaşırsanız ve hatadan kurtulmak isterseniz tam bir yedek aldıktan sonra aşağıdaki **SQL** sorgularını çalıştırıp tüm siparişleri ve buna bağlı olarak sistemdeki bir takım bilgileri silip sorunu çözebilirsiniz.

Daha sonra aldığınız yedekten sırasıyla satırları veritabanına ekleyebilirsiniz.Böylelikle sisteminizde sadece 10 dakikalık bir kesinti olacak kullanıcılarınızı daha sonraki zamanlarda bir daha rahatsız etmemiş olacaksınız.

Hatadan ufak bir kesit

    SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry ‘0’ for key ‘PRIMARY’, query was: INSERT INTO `sales_order_tax` (`order_id`, `code`, `title`, `percent`, `amount`, `priority`, `position`, `base_amount`, `process`, `base_real_amount`, `hidden`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)’

Bu Hatanın çözümü ise aşağıdaki gibi bir **SQL** sorgusunun çalıştırılması ve sorun tamamen çözüme kavuşturulmaktadır.


<script src="https://gist.github.com/MertcanGokgoz/c6dd881affeb7b8072d1.js"></script>
