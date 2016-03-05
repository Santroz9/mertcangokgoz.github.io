---
layout: post
title: MYSQL Veri Tanımlamaya Giriş
date: 2013-09-26 23:44:04.000000000 +03:00
type: post
published: true
status: publish
categories: Programlama
description: DDL(Data Definition Language) tablo veri veya şema veritabanı yapısını tanımlamak veya var olanı değiştirmek için kullanılır. mysql içerisinde
---

DDL( **Data Definition Language** ) tablo veri veya şema veritabanı yapısını tanımlamak veya var olanı değiştirmek için kullanılır. **mysql** içerisinde kullanılabilen bu komutlar sistem içerisinde hemen yürürlüğe girerler.Yapacağınız bir hata veritabanınızın zarar görmesine neden olabilir.

## Bazı komutlar

- **CREATE**  Veritabanında tablo oluşturmak için kullanılır
- **ALTER** Veritabanının yapısını değiştirir
- **DROP** Veritabanından bileşen siler(tablo veya şablon)
- **TRUNCATE** Bir tabloda bulunan bütün kayıtları silmek için kullanılır.(tamamını değilde bir kısmını silmek için **DELETE** kullanılır)

### Bir Kaç Örnek

**CREATE** : bir tablo oluşturmak için kullanılacak olan komuttur.

    CREATE TABLE Kullanici ( KullanciID NUMBER, isim VARCHAR);

**VARCHAR** 0 ile 65,535 arasında veri tutar **CHAR** ise 0 ile 255 arasında veri tutar. **NUMBER** Sayı depolar **DATE** tarihi depolar

**ALTER** : sütun boyutu,anahtar kısıtlamaları vb işlemleri yapmamızı sağlar

    ALTER TABLE Kullanici ADD CONSTRAINT NOT NULL PRIMARY KEY (KullaniciID);

- **CONSTRAINT**  Veri üzerindeki mantıksal sınırlamalar
- **PRIMARY KEY**  Birincil anahtar kısıtlayıcı anlamındadır. Aynı olmayan değerler girilmesini sağlar.Her kayıtın farklı tutulmasını sağlar
- **NOT NULL** Veritabanın da ki tablolarındaki sütunların boş geçilmemesi isteniyorsa kullanılır

**DROP** : Bir tablo yada veri tabanı silmek için kullanılacak

    DROP TABLE Kullanici;

**TRUNCATE** : bir tablonun komple silinmesini sağlamak amacıyla kullanılır.

    TRUNCATE TABLE Kullanici;
