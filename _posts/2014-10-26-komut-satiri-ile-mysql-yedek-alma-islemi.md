---
layout: post
title: Komut Satırı ile MySQL Yedek Alma İşlemi
date: 2014-10-26 11:28:45.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Gelin size güzel bir şekilde SSH kullanarak MySQL yedek nasıl alınır anlatayım.Genelde herkes panel kullanma peşinde ama kullanmayan arkadaşlarıda
---
Gelin size güzel bir şekilde **SSH** kullanarak **MySQL** yedek nasıl alınır anlatayım.Genelde herkes panel kullanma peşinde ama kullanmayan arkadaşlarıda düşünmek lazım ingilizcesi olmayabilir googlede türkçe aratıyor ama sonuç bulamıyor ve kafayı yiyor olabilir.İşte kafayı yemesini önlemeye çalışıyorum ben ve en son bu yöntemi 2 ay önce sunucumda kullanmıştım sonrasında ise unutuldu gitti makalesinide anca yazabiliyorum farkındayım uzattım dönelim konumuza öncelikli olarak mysqldump denen birşeyimiz var sunucuda bu bizim için önemli kullanımı ise şu şekilde

    mysqldump --opt -u [kullanici] -p[şifre] [database] > [backupdosyaadi.sql]

- [kullanici] = Database kullanıcı adınız
- [şifre] = o kullanıcı adının şifresi
- [database] = yedek alınacak olan veritabanı adı
- [backupdosyaadi] = yedeğin adı
- [--opt] = ek birşeyler yaptıracaksanız gelecek olan parametrelerin yeri

Şeklinde kolay bir kullanımı var oldukçada basit zaten görüyorsunuz.

    mysqldump -u root -p gborriQw38XOgl#VfxeA2wgfj mertg > backup26.10.2014new.sql

**root** kullanıcısı olarak mertg den yedek alıyoruz. tüm databaseleri yedeklemeye çalışırsak

    mysqldump -u root -p gborriQw38XOgl#VfxeA2wgfj --all-databases > backupalldb26.10new.sql

böyle almanın şöyle bi sıkıntısı var ne varsa içine doluşacak belirli bir yönetge vermediğiniz için sisteme atarkende o şekilde atılacak yani sonradan tekini çıkartayım gibi bi lüxünüz bulunmuyor.

sistemde bir kaç komut da var

- **--no-data** = sadece veritabanını alır içerisindeki içeriğe dokunmaz
- **--add-locks** = veritabanına LOCK TABLE ekleyerek yedek alınmasını sağlar
- **--add-drop-table** = DROP TABLE ekler sıkıntı çıkmasın diye kullanmayın bence

komut satısı ile genel olarak böyle alınıyor diye biliyorum.Yanlışımız varsa iletin düzeltelim.
