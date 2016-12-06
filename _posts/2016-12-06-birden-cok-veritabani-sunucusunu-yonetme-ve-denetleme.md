---
layout: post
title: Birden Çok Veritabanı Sunucusunu Yönetme ve Denetleme
date: 2016-12-06
type: post
categories: guvenlik
description: HexorBase merkezi bir konumdan aynı anda birden çok veritabanı sunucusunu yönetmek ve denetlemek için tasarlanmış bir veritabanı
---

HexorBase, merkezi bir konumdan aynı anda birden çok veritabanı sunucusunu yönetmek ve denetlemek için tasarlanmış bir veritabanı uygulamasıdır; ortak veritabanı sunucularına (MySQL, SQLite, Microsoft SQL Server, Oracle, PostgreSQL) karşı SQL sorguları ve kaba kuvvet saldırıları yapabilir.

![haxor gorsel](/assets/haxorbase.png)

Paket yönlendirmeyi, yerel alt ağlar içerisinde gizlenen uzaktan erişilemeyen sunucularla iletişim kurmak için proxy vekilleri için veya Metasploit için izin verir.

## Gerekenler

* python
* python-qt4
* cx_Oracle
* python-mysqldb
* python-psycopg2
* python-pymssql
* python-qscintilla2

Bağımlılıkların kurulması

```
sudo apt-get install python-qt4 python-mysqldb python-psycopg2 python-pymssql python-qscintilla2
```

cx_Oracle Kurulumu

```
pip install cx_Oracle
```

Uygulama Kurulum

```
wget https://github.com/savio-code/downloads/raw/master/hexorbase_1.0_all.deb
sudo dpkg -i hexorbase_1.0_all.deb
```

Uygulama her ne kadar eski olsa da oldukça işe yarıyor. Özellikle uzaktan yönetmek için hepsinin birleştirilmiş olması benim hoşuma gitti kaba kuvvet saldırıları gibi işler için kullanmanızı önermem ancak yönetim ve denetleme işleri için güzel