---
layout: post
title: Nginx İçin Basit Kimlik Doğrulama Modülü
date: 2016-10-16
type: post
categories: nginx
description: Web sitenizde gelen ziyaretçilerin bazı alanlara ulaşmasını istemiyorsanız. Basit ama etkili olan bu yöntemi kullanabilirsiniz.
---

Web sitenizde gelen ziyaretçilerin bazı alanlara ulaşmasını istemiyorsanız. Basit ama etkili olan bu yöntemi kullanabilirsiniz. Bize gerekli olan apache için kullanılan `htpasswd` yi nginx içinde kullanmak

İlk önce apache2 de kullanılan `utils` paketini sisteme dahil edelim

```
apt-get install apache2-utils
```

kurulumu yaptıktan sonra kullanıcı oluşturmamız gerekiyor bunu isterseniz web sitelerini kullanarak isterseniz de aşağıdaki komut ile oluşturabilirsiniz.


```
htpasswd -c /etc/nginx/.htpasswd Mertcan
```

Kullanıcı için parola tanımladık ve aşağıdaki gibi işlemi tamamladık

```
New password:
Re-type new password:
Adding password for user Mertcan
```

Kullanıcımızı ve bu kullanıcıya ait gerekli parolayı oluşturma işlemimizi tamamladık. Şimdi nginx konfigürasyon dosyamızı kurcalamaya geldi sıra kullanıcılara kısıtlayacağımız yerin `location` bloğu içerisine aşağıdaki satırları ekliyoruz.

```
auth_basic "Yetkili Kullanici Girisi";
auth_basic_user_file /etc/nginx/.htpasswd;
```

bu işlemin hemen ardından tanımladığınız kullanıcı adı ve parola ile sisteme giriş yapabilmenin aktif olabilmesi için nginxi yeniden başlatıyoruz veya `reload` yapıyoruz.

```
nginx -s reload
```

Bu işlemden sonra kısıtladığınız alana tnaımladığınız kullanıcı adı ve parola ile sadece siz ve belirlediğiniz kişiler girebilir bir duruma getirdik.

öptüm bye <3
