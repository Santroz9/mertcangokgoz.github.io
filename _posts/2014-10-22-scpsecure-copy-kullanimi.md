---
layout: post
title: SCP(Secure Copy) Kullanımı
date: 2014-10-22 19:07:19.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: sisteminde hali hazırda gelen bi sistem güvenli bir yol aslında Secure Copy olan bir açılımı var ve hızlı bir şekilde dosya atabilirsiniz özellik
---
Merhabalar hasta olmamdan dolayı 4 gündür makale yazıp yayınlayamıyordum ve bugün serumu yedikten sonra kendime geldim yeni bir makale ile de karşınızdayım konumuz **SCP** ile dosya transferi olacak **SCP** dediğimiz şey linux dosya sisteminde hali hazırda gelen bi sistem güvenli bir yol aslında Secure Copy olan bir açılımı var ve hızlı bir şekilde dosya atabilirsiniz özellikle yedek alıp atma derdi yaşayan arkadaşlar kullansınlar zamandan tasarruf ederler baya bi

Sistemde olmadığını var sayıyorum ve kurulum parametremizi veriyorum

    sudo apt-get install ssh-client

Sistemde kurulu olarak geldiği için kurmaya normalde gerek yok ama sildiyseniz falan yada hata veriyorsa böylelikle kurabilirsiniz.

Kullanımı ise şu şekilde

    scp hangidosya nereye

**FTP** ye atmak isteyelim ve senaryomuz şu şekilde olsun

-mertcangokgoz.com adresinin **FTP** bilgileri alınıyor olsun atılacak olan dosyamız backup.zip dosyayı atacak olduğumuz yer ana dizin olsun

Parametremiz şu şekilde olacaktır...

    scp /Mert/Desktop/backup.zip mertc@mertcangokgoz.com:/home/public_html/

Sisteminize dosya indirmek istersenizde

    scp dosyaadi yol

Örnek olarak ise

    scp mertc@mertcangokgoz.com/public_html/backup.zip /Mert/Desktop/
