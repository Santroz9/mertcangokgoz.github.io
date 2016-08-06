---
layout: post
title: SSH İle Yedek Alma İşlemi
date: 2015-03-21 14:45:46.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Her hangi bir kontrol paneli kullanmayan yada cpanel den farklı bir panel kullanan arkadaşların en büyük sıkıntılarından bir tanesi sunucudan
---
Her hangi bir kontrol paneli kullanmayan yada cpanel den farklı bir panel kullanan arkadaşların en büyük sıkıntılarından bir tanesi sunucudan yedek almakdır hem veritabanı hemde ana dizini yedek almak gerekiyor herhangi bir arayüzümüz olmayacak tamamen SSH üzerinden yedek alacağız.

İlk işlem olarak root kullanıcı adıyla sisteme giriş yapıyoruz.Sisteme root olarak giriş yaptıktan sonra aşağıdaki komutlar ile dizine ulaşın

    ls -la
    cd Klasöradı

İşlemlerimizden biri tamam aslında dosyalarımızın klasör adını öğrendik ve kontrolümüzü yaptık daha sonra veritabanı işlemi geliyor burada direk olarak yedeğini alacağız bunun için bilmemiz gereken _3 şey var bunlar;_

- Veritabanı Kullanıcı Adı
- Veritabanı Şifresi
- Veritabanı Adı

yedeğimizide **mysqldump** aracılığı ile direk **.sql** oluşturarak alacağız.bu komut girildiğinde sizden sql şifrenizi isteyecek.

    mysqldump --add-drop-table -u Kullaniciadi -p database > yedekadi.sql

Veritabanımızın yedeğini aldıktan sonra sıra dosyalarımızın bulunduğu klasörü tek dosya halinde sıkıştırmaya bunun içinde aşağıdaki kodu kullanabilirsiniz.

    tar -vcf yedekadi.tar .

sıkıştırdığımız .tar dosyası içerisinde .htaccessler varmı yokmu yedeği aldıktan sonra bir kontrol etmenizde fayda var.Bu işlemlerden sonra eğer yedeğinizi kuracaksanız.İşlemin tersini uygulamanız gerekecek bunun için ise dizin içerisine

    tar -vxf yedekadi.tar

Peki veritabanını nasıl geri yükleriz bunun için ise komutun tersini yapacağız komutumuz şu şekilde

    mysql -u kullanıcı adi -p veritabanı < yedekadi.sql
