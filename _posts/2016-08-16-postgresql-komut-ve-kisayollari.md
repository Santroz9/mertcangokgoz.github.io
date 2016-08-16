---
layout: post
title: PostgreSQL Komut ve Kısayolları
date: 2016-08-16
type: post
categories: programlama
description: PosgreSQL ile uğraşırken kurcaladıklarım ve öğrendiklerim oldu unutmak istemediğimden bende bir referans kartı oluşturmaya karar verdim. Bir kaç projede kullandım pekiştirme fırsatı buldum.
---

PosgreSQL ile uğraşırken kurcaladıklarım ve öğrendiklerim oldu unutmak istemediğimden bende bir referans kartı oluşturmaya karar verdim. Bir kaç projede kullandım pekiştirme fırsatı buldum. Denedim çalışma mantığını gözlemledim güzelliklerini gördüm oldukça hoşuma gitti

Girişimizi yapalım postgres kullanıcısı ile

```console
sudo -u postgres psql postgres
```

daha sonra `postgres=#` olarak konsolda görebileceksiniz aşağıdaki komutları çalıştırmanız yeterli

| Komut           | Açıklama                               |
|-----------------|----------------------------------------|
| `\q`              | Çıkış                                  |
| `\conninfo`       | veritabanı bağlantı bilgisi            |
|` \c [veritabani]` | Veritabanı bağlantısı                  |
| `\d+ [tabloadi]`  | Tablonun tanımı                        |
| `\dt *.*`         | Tüm veritabanındaki tabloları gösterir |
| `\l`              | Veritabanlarını listeler               |
| `\l+`             | Veritabanlarını detaylı listeler       |
| `\dn`             | Şemalar listelenir                     |
| `\df`             | Fonksiyonlar listelenir                |
| `\dv`             | İlişkiler listelenir                   |
| `\df+`            | Fonksiyon'un detayları                 |
| `\x`              | Çıktıları güzelleştirir.(önerilir)     |
| `\dx+`            | Eklentileri listeler                   |
| `\encoding`       | Tanımlı olan karakter kodlaması        |
| `\du`             | Kuralları listeler                     |

PostgreSQL Servislerinde yapılabilecekler

```console
sudo service postgresql stop
sudo service postgresql start
sudo service postgresql restart
```

Yeni kural oluşturma

```sql
CREATE ROLE kural1 WITH LOGIN ENCRYPTED PASSWORD 'sifre' CREATEDB;
```

Sadece kural seti olarak veritabanı oluşturmaya izin verdik diğer kurallar için durum şu şekilde;

```sql
CREATE ROLE kural1 WITH LOGIN ENCRYPTED PASSWORD 'sifre1' CREATEDB CREATEROLE REPLICATION SUPERUSER;
```

Çalıştırma planı

```sql
EXPLAIN SELECT * FROM pg_class;
```

Çalışma zamanı parametreleri

```sql
SHOW ALL;
```

tanımlanan kuralı silme

```sql
DROP ROLE kural1;
```

Veritabanı oluşturma

```sql
CREATE DATABASE test_db WITH OWNER kural1 ENCODING 'UTF8';
```

Yetkilendirme

```sql
GRANT ALL PRIVILEGES ON DATABASE test_db TO kural1
```

Veritabanını silme

```sql
DROP DATABASE test_db;
```

Tablo oluşturmak

```sql
CREATE TABLE tablo_adi (
 id serial PRIMARY KEY,
 name varchar(20) UNIQUE NOT NULL,
 dateCreated timestamp DEFAULT current_timestamp
);
```

Birincil anahtar ekleme

```sql
ALTER TABLE tablo_adi ADD PRIMARY KEY (id);
```

indis oluşturmak

```sql
CREATE UNIQUE INDEX indexName ON tableName (columnNames);
```

ilk 10 kayıt

```sql
SELECT satır FROM tablo LIMIT 10;
```

regexp kullanarak kayıt getirme

```sql
SELECT satır FROM tablo WHERE column ~ 'test.*';
```

sayfalayarak kayıtları getirme

```sql
SELECT cols FROM table LIMIT 10 OFFSET 30;
```

tablodaki tüm kayıtları getir

```sql
SELECT * FROM tablo;
```

yeni kayıt girme

```sql
INSERT INTO tablo (satır1,satır2)
VALUES (4, 'testveri');
```

satır güncelleme

```sql
UPDATE tablo SET test = 'test2' WHERE id = 4;
```

kayıt silme

```sql
DELETE FROM tablo WHERE id = 4;
```

Lag replication kontrol

```sql
SELECT EXTRACT(EPOCH FROM (now() - pg_last_xact_replay_timestamp()))::INT;
```

Devam eden sorguların kontrolü

```sql
SELECT datname,usename,client_addr,waiting,query_start FROM pg_stat_activity WHERE query_start < NOW() + INTERVAL '5 seconds';
```

En büyük boyutlu veritabanı tablosunu bulma

```sql
SELECT table_name, pg_relation_size(table_name) FROM information_schema.tables WHERE table_schema = 'public' ORDER BY 2;
```

Veri bekleyen tüm sorgular

```sql
SELECT * FROM pg_stat_activity WHERE waiting='t';
```

Veritabanı toplam boyutu

```sql
SELECT pg_size_pretty(pg_database_size('veritabanı_adı'));
```
