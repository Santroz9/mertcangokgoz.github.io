---
layout: post
title:  Counter Strike Global Offensive Server Kurulumu
date: 2016-07-10
type: post
categories: Linux
description: Counter Strike Global Offensive oyununu oynayan bir kaç arkadaş mail aracılığı ile bana ulaşarak kurulumu göstermemi istedi 
---

Counter Strike Global Offensive oyununu oynayan bir kaç arkadaş mail aracılığı ile bana ulaşarak kurulumu göstermemi istedi bende onları kırmayarak kurulumun nasıl gerçekleştirildiğinden kısaca bahsetmek istedim.

Bu iş için özellikle internette pek çok kurulum ekipmanı olmasa da stabil olarak çalışan 1 adet kurulum ekipmanı bulabildim. Bu script ile oldukça kolay bir şekilde sunucunuzu oluşturabilecek ve oynayabileceksiniz

Ancak bilmenizde fayda var yurtdışı lokasyonlu sunucular kullanırsanız oldukça yüksek ping değerleri göreceksiniz bu kurulumu yapmadan önce hemen kendinize 1 adet türkiye lokasyon sunucu edinin

İşetim sistemi olarak Debian yada Ubuntu seçimi yapın sürüm fark etmez hemen ardından aşağıdaki uygulamaları kurun

```console
sudo apt-get install screen wget tar
```

Kurulum sırasında sistemde awk bulunamadı derse onuda ek olarak kurun ama awk bulunmayan bir debian yada ubuntu dağıtımı kaldı mı bu durum tartışılır.

```console
cd /etc/init.d/
wget https://raw.githubusercontent.com/crazy-max/csgo-server-launcher/master/csgo-server-launcher.sh -O csgo-server-launcher --no-check-certificate
chmod +x csgo-server-launcher
update-rc.d csgo-server-launcher defaults
mkdir /etc/csgo-server-launcher/
wget https://raw.githubusercontent.com/crazy-max/csgo-server-launcher/master/csgo-server-launcher.conf -O /etc/csgo-server-launcher/csgo-server-launcher.conf --no-check-certificate
```

Kurulumu gerçekleştirdikten sonra `/etc/csgo-server-launcher/csgo-server-launcher.conf` yolunu takip ederek aşağıdaki bir takım ayarlamaları yapın

* **SCREEN_NAME** - Ekran adı, istediğinizi yazabilirsiniz ama benzersiz olmalıdır ve sadece alfa-sayısal karakter içermelidir.
* **USER** - Sunucu başlatan kullanıcının adı.
* **IP** - WAN IP adresiniz
* **PORT** - dinlenecek olan port
<br />
* **GSLT** - Anonim bağlantısı yakın gelecekte kaldırılacaktır. Bu nedenle token oluşturulması gerekmektedir. Oluşturmak için : http://steamcommunity.com/dev/managegameservers
<br />
* **DIR_STEAMCMD** - steamcmd yolu
* **STEAM_LOGIN** - Steam kullanıcı adınız
* **STEAM_PASSWORD** - Steam şifreniz
* **STEAM_RUNSCRIPT** - Normalde bu değişkeni değiştirmek gerekmez.
<br />
* **DIR_ROOT** - Sunucu dizini.
* **DIR_GAME** - Oyun dizini.
* **DIR_LOGS** - Oyun günlük kayıtlarının tutulacağı dizin
* **DAEMON_GAME** - Normalde bu değişkeni değiştirmek gerekmez.
<br />
* **UPDATE_LOG** - Güncelleme günlük kayıt dosyası.
* **UPDATE_EMAIL** - Güncelleme günlük kayıtlarının gönderileceği mail adresi(Boş bırakılabilir)
* **UPDATE_RETRY** - Güncelleştirmenin başarısız olması durumunda yeniden deneme sayısı.
<br />
* **API_AUTHORIZATION_KEY** - Atolyedeki haritaları indirebilmeniz için APİ'ye ihtiyacınız var  `webapi_authkey.txt` varsa boş bırakın.  Yoksa ve oluşturmanız gerekirse  : http://steamcommunity.com/dev/apikey
* **WORKSHOP_COLLECTION_ID** - Koleksiyon ID kullanım için API_AUTHORIZATION_KEY gereklidir : https://developer.valvesoftware.com/wiki/CSGO_Workshop_For_Server_Operators
* **WORKSHOP_START_MAP** - Seçilen koleksiyondaki harita ID `WORKSHOP_COLLECTION_ID` ve `API_AUTHORIZATION_KEY` gereklidir.
<br />
* **MAXPLAYERS** - maximum kullanıcı sayısı.
* **TICKRATE** - Sunucu ticrate değeri
* **EXTRAPARAMS** - isteğe bağlı komutlar
<br />
* **PARAM_START** - Sunucu başlatma ayarları
* **PARAM_UPDATE** - Sunucu güncelleme ayarları.

## Nasıl Kullanılır

Konsol mod için CTRL + A, CTRL + D sunucuyu durdurmadan screen durdurmak için kullanılır.Ayrıca Scripti ilk kez kullanacaksanız `create` komutu vererek sunucu oluşturmanız gerekmektedir.


* **start** - Sunucuyu çalıştır
* **stop** - Sunucuyu durdur
* **status** - Sunucunun durumunu gösterir
* **restart** - Sunucuyu yeniden başlat (stop && start)
* **console** - Komutları girebileceğiniz konsolu çalıştırır.
* **update** - Güncelleştirmeleri yapar ve LOG_DIR yoluna dosya bırakır
* **create** - Sunucu oluşturma (önce ayarlamaları yapın).

Örnek: `service csgo-server-launcher start`

### Otomatik Güncelleştirmeyi Çalıştırmak

Crontab işlemleri arasına aşağıdaki satırları ekleyin

```console
0 4 * * * cd /etc/init.d/csgo-server-launcher update >/dev/null 2>&1
```

Her gün saat 4 de otomatik güncelleme çalıştırılmaktadır.
