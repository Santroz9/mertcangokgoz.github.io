---
layout: post
title: Otomatik MySQL Veritabanı Optimizasyonu
date: 2015-12-18 12:24:09.000000000 +02:00
type: post
categories: programlama
description: MySQL nadirende olsa sıkıntı çıkartabiliyor bunu çözmek adına ise yapabileceğimiz bir kaç işlem var günlük yada haftalık olarak veritabanında
---

**MySQL** nadirende olsa sıkıntı çıkartabiliyor bunu çözmek adına ise yapabileceğimiz bir kaç işlem var günlük yada haftalık olarak veritabanında bulunan tabloları kontrol edebilir ve daha sonrasında tamamen onarabilir yada optimize edebiliriz.

ilk olarak bir kullanıcı oluşturuyoruz yetkileri diğerlerinden farklı olacak

```
create user 'optimise'@'localhost';
grant select,insert,reload on *.* to 'optimise'@'localhost';
flush privileges;
exit
```

Oluşturduğumuz bu kullanıcı ile gereken işlemimizi yapıyoruz herhangi bir kuruluma gerek yok **MySQL** içerisinde hali hazırda bulunan uygulamayı kullanacağız

```
    mysqlcheck -u optimise --optimize --all-databases
```

Sonrasında tüm veritabanınız otomatik olarak denetlenecek ve onarılacak komut satırından hangi veritabanlarında düzenleme yaptığını görebilirsiniz.
