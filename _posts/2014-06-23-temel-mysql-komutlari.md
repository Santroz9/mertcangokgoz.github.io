---
layout: post
title: Temel MYSQL Komutları
date: 2014-06-23 14:30:19.000000000 +03:00
type: post
published: true
status: publish
categories: Programlama
description: Bu makalemizde veritabanı içerisindeki tablolarda bulunan verileri yönetmek için kullanılan bazı temel SQL komutlarını açıklamak istiyorum.
---
Bu makalemizde veritabanı içerisindeki tablolarda bulunan verileri yönetmek için kullanılan bazı temel **SQL** komutlarını açıklamak istiyorum.

## Bazı DML komutları

- **SELECT** = Verisi alınacak veri tabanı seçimi
- **INSERT** = Tabloya yeni bir satır ekleme
- **UPDATE** = Tabla içerisinde veri güncellemesi
- **DELETE** = Tablo içerisinde veri silme
- **LOCK TABLE** = Kontrol ve(veya) eşzamanlama
- **CALL** = Veritabanından çağırma işlevi

# İNSERT

Tabloya yeni bir satır eklemek için kullanılan **SQL** komutudur.

Syntax

    INSERT INTO <tablo adı> VALUES (<deger 1>, ... <deger n>);

Örnek Kullanım

    INSERT INTO RAM VALUES (1001,‘Rams’);

Ya tüm sütunların içereceği değerler aralarına virgül konularak sıralanır ya da öncelikle sütun adları sıralanır sonra VALUES() parantez içinde veriler listelenir.

# UPDATE

Syntax

    UPDATE <tablo adı> SET <yeni bilgi> = <ifade> WHERE <şart>;

Örnek Kullanım

    UPDATE RAM SET Name = ‘1’ WHERE RID=1001;

**SQL** dilinde **UPDATE** komutu, veritabanın da bulunan verileri değiştirmek-güncellemek amacıyla kullanılan bir komuttur.

# DELETE

Syntax

    DELETE FROM <tablo adı> WHERE <şart>;

Örnek Kullanım

    DELETE FROM RAM WHERE RID=1001;

**DELETE** komutu, veritabanın da bulunan bir tablodaki istenilen kayıtları silmek amacıyla kullanılan temel bir **SQL** komutudur.

# SELECT

Syntax

    SELECT <yeni bilgi>, ….., <yeni bilgi n> FROM <tablo adı>;

Örnek Kullanım

    SELECT RID, Name FROM RAM;

SELECT komutu veritabanı'nın da ki bir veya birden fazla tablodan veri almak için kullanılır.
