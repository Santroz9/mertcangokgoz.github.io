---
layout: post
title: SSH Girişlerinin Kontrol Edilmesi
date: 2015-12-25 13:09:15.000000000 +02:00
type: post
categories: Linux
description: SSH üzerinde bir takım güvenlik yapılandırmaları yapmanız gerekiyor. Sunucunuza SSH üzerinden giriş mi yapıldı yada bazılarından mı
---

**SSH** üzerinde bir takım güvenlik yapılandırmaları yapmanız gerekiyor. Sunucunuzda **SSH** üzerinden giriş mi yapıldı yada bazılarından mı şüpheleniyorsunuz.Her ne olursa olsun bence yapacağımız bu değişiklik güvenlik için oldukça önemli tarafınıza bu ayarlama ile mail atılacak sisteme şu saatte şu ip adresinden giriş yapıldı diye anlık olarak mail atılacak.Herhangi bir ek uygulama&nbsp;kurmanıza gerek yok

Aşağıdaki komutumuzu direk olarak ana dizinde bulunan .bash\_profil dosyası içerisine ekliyoruz.Sonrasında her giriş yaptığımızda belirttiğiniz mail adresine kimin hangi saatte giriş yaptığı bilgisi gelecek

```
    echo 'ALERT - ACCESS GRANTED on:' `date` `who` | mail -s "ALERT - ACCESS GRANTED from : `who | awk '{print $6}'`" mail@mail.com
```

![sshgiriskontrolgorsel1](/assets/sshgiriskontrolgorsel1.png)

Giriş yapıldığında ise mail adresine gelen mail şu şekilde

![sshgirisdetaygorsel1](/assets/sshgirisdetaygorsel1.jpg)
