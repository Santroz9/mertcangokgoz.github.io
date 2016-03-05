---
layout: post
title: Ubuntu Üzerine Mumble Server Kurulumu
date: 2015-02-28 14:01:21.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: Mumble açık kaynak kodlu,gecikme süresi düşük ve yüksek kaliteli bir sesli sohbet uygulamasıdır.TeamSpeak ve Ventrilo gibi uygulamalara benzer
---
**Mumble** açık kaynak kodlu,gecikme süresi düşük ve yüksek kaliteli bir sesli sohbet uygulamasıdır. **TeamSpeak** ve **Ventrilo** gibi uygulamalara benzer oyuncular tarafından kullanılabilmesi için geliştirilmiştir sesi net ve anlaşılır bir biçimde ilettiği için tercih edilmesi gerekmektedir. **Mumble** kullanıcıları aynı server üzerinden birbirleriyle sesli sohbet yapabilmeleri için izin veren bir istemci-sunucu mimari yapısı kullanır.

Kurulumu yapmadan önce sistemin güncelliğini kontrol etmemiz gerekiyor bunun için aşağıdaki komutu kullanabilirsiniz.

    sudo apt-get update
    sudo apt-get upgrade

herhangi bir güncelleme bulunursa güncellemeyi unutmayın ve ardından mumble server kurulum parametremize geçelim

    sudo apt-get install mumble-server

aynı zamanda istemcisinide sisteme dahil edelim

    sudo apt-get install mumble

![mumleserverkurulumgorsel1](/assets/mumleserverkurulumgorsel1.png)

Şimdi gelelim _mumble-serverin_ ayarlamalarına hemen aşağıdaki komutları veriyoruz.

    sudo dpkg-reconfigure mumble-server

![mumbleservergorsel2](/assets/mumbleservergorsel2.jpg)

Sistem başlatıldığında başlasın mı seçeneğine evet diyoruz.

![mumbleservergrosel3](/assets/mumbleservergrosel3.jpg)

Yüksek öncelikli olarak ayarlansınmı diye soracak bunada evet diyoruz.

![mumleservergorsel4](/assets/mumleservergorsel4.png)

SuperUser için bir şifre belirlemeniz gerekiyor _mümkün olduğunca karışık şifreler kullanmaya bakın_ ki güvenliğiniz yüksek olsun bu aşamayıda geçtikten sonra aşağıdaki gibi satırları görüceksiniz ve kurulumunuz tamamlanmış olacak

![mumbleservergorsel5](/assets/mumbleservergorsel5.png)

Şimdi ise **Mumble** Serverın kullanıcı taraflı bir takım ayarlamalarınında yapılması gerekiyor.Ayarları yapılacak olan satırlar sırası ile

- autobanAttempts
- autobanTimeframe
- autobanTime
- welcometext
- host
- bandwidth
- users
- textmessagelenth
- imagemessagelenght
- allowhtml
- registername
- registerURL

Bu satırları tek tek **/etc/mumble-server.ini** dosyası içerisinde bularak kendinize göre ayarlıyacaksınız sonrasında ise kayıt edip çıkıcaksınız ve _mumble serveri yeniden başlatacaksınız._

    sudo service mumble-server restart

Bağlantımızı yapıyoruz ve sonuç

![mumbleserversongorsel](/assets/mumbleserversongorsel.jpg)
