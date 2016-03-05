---
layout: post
title: Ubuntu 14.04 Sürümünü 14.10 Yükseltme
date: 2014-10-23 14:00:48.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Bugün Ubuntu 14.10 un final betası yayınlandı eskisine göre pek çok hatayı gidermişler dediklerine göre ve bir kaç yenilik yapılmış bilgim
---
Bugün Ubuntu 14.10 un final betası yayınlandı eskisine göre pek çok hatayı gidermişler dediklerine göre ve bir kaç yenilik yapılmış bilgim yok okumadım.Ancak yayın notlarında Final Sürüm yayınlanma günü 26 sı ancak bugün final beta yayınlanarak Büyük bir adım atılmış oldu peki güncellemek için ne yapmamız gerekiyor.

Öncelikle Hangi sistemi güncelleyeceğinize karar vermeniz lazım Desktop mu Server mu gelin 2 sürüm içinde güncelleme aşamalarına göz atalım

## Desktop Sürümü

Önce bi güncelleme yapalım sisteme

    sudo apt-get update && sudo apt-get dist-upgrade

Bu aşamadan sonra sisteme Reboot atmanız önemli hemen bi reboot işlemi gerçekleştirmeniz yeterli

En güzel komutumuza geldik kullanılabilir yeni sürümü güncelleme maksatlı verelim komutumuzu

    sudo update-manager -d

uzun bi kontrolden sonra karşınıza aşağıdaki gibi bi kısım gelecek upgrade diyip onaylayın. ![ubuntuupgradegorsel1](/assets/ubuntuupgradegorsel1.jpg)

Sonra kabul etmeniz gereken bir ekran çıkacak he deyip geçin gitsin 2 adet dosya indirecek bu sonrasında

![ubuntuupgradegorsel2](/assets/ubuntuupgradegorsel2-e1414060840608-646x576.png)

İndirdiği 2 dosyadan sonra yükseltme işlemine geçecek şöyle ki

![ubuntuupgradegorsel3](/assets/ubuntuupgradegorsel3.jpg)

Bir Bakıyor sistem acaba neyi güncellesek gardaş diye sonradan geçiyor installing kısmına ve bizede gösteriyor neyin ne olduğunu ki güncelleyebilelim ahanda o ekran budur...

![ubuntuupgradegorsel4](/assets/ubuntuupgradegorsel4.jpg)

Bazı sistemlerde 730MB olabiliyor güncelleme bende 830 MB çıktı bir kaç ek gözüküyor sanırım yüklü olan bir veya birkaç sistem elemanıda dahil ediliyor gibi bazı pakerleri çıkartmışlar falan gerek duymuyor artık bazılarına herneyse indirdiği paketler kurulması bitti diyelim.Sistemi yeniden başlattığınızda sisteminiz artık ubuntu 14.10 a geçmiş olacak sürüm adıda "Utopic Unicorn"

## Server Sürümü

Server sürümünde işlem daha kolay aslında sisteme hemen şu komutu veriyorsunuz.

    sudo apt-get install update-manager-core

Ardından bir kaç birşey kuracak yada güncelleyecek bitmesini bekleyin ve editlenmesi gereken dosyamıza giriş yapalım

    sudo nano /etc/update-manager/release-upgrades

Buraya girdiğinizde aşağıda "<tt><strong>Prompt</strong></tt>" olacak karşısında ne yazıyor bi göz atın normal yada lts olarak ayarlayın LTS tercihimdir benim.

Daha sonra güncelleme komutumuzu veriyoruz.

    sudo do-release-upgrade -d

ve komut satırında ne yapmanız gerekeceği ve sistemde hangi paketlerin güncelleneceği eksiltileceği güncelleneceği falan gözükecek ona göre yaparsınız elimde malesef server bulunmadığından görsel açıdan gösteremiyorum.

Sürüm Planına [ulaşmak için tıklayın](https://wiki.ubuntu.com/UtopicUnicorn/ReleaseSchedule)
