---
layout: post
title: PostgreSQL Veritabanını Yedekten Geri Yükleme
date: 2016-12-20
type: post
categories: linux
description: Bir veritabanını geri yüklemeden önce, o veritabanına olan tüm bağlantıları sonlandırmanız ve yedekleme dosyasını hazırlamanız gerekir.
---

Bir veritabanını geri yüklemeden önce, o veritabanına olan tüm bağlantıları sonlandırmanız ve yedekleme dosyasını hazırlamanız gerekir. PostgreSQL'te bir veritabanını iki şekilde geri yükleyebilirsiniz:

* Psql kullanarak, `pg_dump` ve `pg_dumpall` araçları tarafından üretilen düz SQL komut dosyasını geri yüklemek
* `Pg_dump` aracıyla oluşturulan tar dosyası ve dizin biçimini geri yüklemek için `pg_restore` kullanmak

### Psql kullanarak veritabanlarını geri yükleme

Psql yardımcı programı, `pg_dump`, `pg_dumpall` veya uyumlu yedek dosyalar üreten diğer araçlar tarafından oluşturulan SQL komut dosyasını geri yüklemenizi sağlar. Psql aracını kullanarak tüm komut dosyasını yürütmeniz gerekir.

Tam olan bir yedeklemeyi geri yüklemek ve geri yükleme işlemi sırasında oluşan herhangi bir hatayı göz ardı etmek için aşağıdaki komutu kullanabilirsiniz

```
psql -U kullanici-adi -f yedek.sql
```

Bir hata oluşması durumunda veritabanını geri yüklemeyi durdurmak isterseniz aşağıdaki komutu kullanmanız gerekiyor benimde en çok kullandığım yöntem budur

```
psql -U kullanici-adi --set ON_ERROR_STOP=on -f yedek
```

Gördüğünüz gibi sadece ek bir seçenek ekledik. `--set ON_ERROR_STOP = on`

Belli bir veritabanın da ki belirli veritabanı nesnelerini yedeklerseniz, bunları aşağıdaki komutu kullanarak geri yükleyebilirsiniz

```
psql -U kullanici-adi -d veritabani -f yedekbro.sql
```

### Pg_restore kullanarak veritabanları nasıl restore edilir

Psqltool'un yanında, `pg_dump` veya `pg_dumpalltools` tarafından yedeklenen veritabanlarını geri yüklemek için `pg_restore` programını kullanabilirsiniz. `Pg_restore` programı ile, restorasyon edilecek veritabanları için çeşitli seçenekler bulunuyor bunları şu şekilde sıralayabiliriz.

* Pg_restore, restorasyon için iş parçacığı sayısını belirtmek için `-j` seçeneğini kullanarak paralel geri yükleme yapmanıza izin verir. Her bir thread aynı anda ayrı bir tabloyu geri yükler ve böylece işlem oldukça hızlanır. Şu anda, `pg_restore` yalnızca özel dosya biçimi için bu seçeneği desteklemektedir.
* Pg_restore, belirli veritabanı nesnelerini tam veritabanını içeren bir yedeği geri yüklemenizi sağlar.
* Pg_restore, eski sürümde yedeklenen bir veritabanını alabilir ve yeni sürüme geri yükleyebilir.

```
pg_restore --dbname=cemil --verbose /home/mertcan/yedek.tar
```

İkincisi, aşağıdaki komutu kullanarak tablo yapısını yalnızca yedek.tar yedek dosyasından geri yükleyebiliriz.

```
pg_restore --dbname=cemil --section=pre-data  /home/mertcan/yedek.tar
```