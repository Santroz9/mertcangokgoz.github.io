---
layout: post
title: SQL Veri Tipleri
date: 2014-07-16 16:54:40.000000000 +03:00
type: post
published: true
status: publish
categories: Programlama
description: SQL ortamında oluşturduğunuz tabloların her alanı her sütunu içerisinde saklanan verilerin haliyle bir veri tipinde tanımlanmış olması gerekmektedir.
---
![SQL-Server-2014-Logo](/assets/SQL-Server-2014-Logo.png)

**SQL** ortamında oluşturduğunuz tabloların her alanı her sütunu içerisinde saklanan verilerin haliyle bir veri tipinde tanımlanmış olması gerekmektedir. Burada C,C# ve asp.net deki veri tipleri gene burada da karşımıza çıkıyor. Gönül isterdi ki bunlardan kurtulalım

- **İnt** = tam sayılar -2,147,483,648 ile 2,147,483,648 arasındaki değerleri almaktadır.
- **Float** = büyük, küçük ve kesirli sayılar için kullanılır -1.79E+308 ile 1.79E+308 arasında değer alır.
- **Bigint** = tam sayılar -9,223,372,036,854,775,808 ile 9,223,372,036,854,775,808 arasındaki değerleri almaktadır.
- **Smallint** = tam sayılar -32,768 ile 32,768 arasındaki değerleri almaktadır.
- **Tinyint** = 0 ile 255 arasındaki değerleri almaktadır.
- **Bit** = 0 ile 1 arasındaki değerlerini alır durum bilgisini saklamakta çok kullanılır.
- **Decimal** = nasıl ifade etsem bilemedim -10^38 +1 ile 10^38 +1 arasında değerler almakta.
- **Money** = aşırı şekildeki büyük sayıları tutmada kullanılır genelde parasal işlemlerde bu kullanılmaktadır. -922,337,203,685,477.5808 ve +922,337,203,685,477.5808 arasında değerler alır.
- **Smallmoney** = parasal işlemlerde kullanılmaktadır ancak Money göre daha küçük değer saklamaktadır. -214,748.3648 ile +214,748.3648 arasında değer almakta
- **Datetime** = tarih ve zaman tipindeki verileri saklamak için kullanılır. 1 ocak 1753 den 31 aralık 9999 kadardır.
- **Smalldatetime** = tarih ve zaman tipindeki verileri saklamaktadır ancak datetime göre daha kısa bir süreyi kapsar 1 ocak 1900 den 6 Haziran 2079 kadardır.

String Veri Tipleri

- **Nvarchar** (değer) = Veritabanların da en çok kullanılan veri tipidir text formatın da ki bilgileri saklamak için kullanılır. Ve parantez içerisine gireceğiniz değer ile kapasitesini belirlersiniz Örneğin : nvarchar(250) en fazla 4 bin karakter desteklenir.
- **Nchar** (değer) = nvarchar ile tamamen aynıdır sadece verdiğiniz değerin altında veri girdiğinizde geri kalan verileri kendisi otomatik olarak tamamlamaktadır. En fazla 4 bin karekter desteklenir
- **Text** = adından da anlaşılacağı üzere text tipindeki verileri saklar En fazla 2,147,483,647 karakteri destekler

**Nvarchar** ve **nchar** özellikle çince, arapça, Türkçe gibi diller için özel olarak tanımlanmış bir veri tipidir. İngilizce bir veritabanı uygulamamız olsaydı varchar ve char kullanılabilirdi ama Türkçe karekterler de sorun çıkmaması açısından nvarchar ve nchar kullanılması önerilir.
