---
layout: post
title: Raspberry Pi'ye Statik İp Verme
date: 2016-09-15
type: post
categories: linux
description: Elimdeki raspberry pi cihazlarına sabit ip vereyim dedim genelde hiç reboot atmadığım ve kendine has bi ip aralığı olduğu için aynı ip yi alırdı ancak her ne hikmetse aynı ip yi almayıp bi üstünü alıyordu
---

Elimdeki raspberry pi cihazlarına sabit ip vereyim dedim genelde hiç reboot atmadığım ve kendine has bi ip aralığı olduğu için aynı ip yi alırdı ancak her ne hikmetse aynı ip yi almayıp bi üstünü alıyordu bende dedim birader bu böyle olmayacak şunlara bi sabit ip tanımlaması yapalım.(evimde modeme bağlı yaklaşık bi 12 cihaz var dhcp de saçmalama çok nadirde olsa görüyorum)

Normal şartlar altında `interfaces` kısmından yaptığımızı yemesi lazımdı ama yemeden devam etti bende birşeyden şüphelendim `dhcpcd.conf` dosyasından dedim şuna bir bakayım. Daha sonra aşağıdaki gibi düzenledim ve herşey hazırdı artık

`eth0` ve `wlan0` kardeşlere ip adreslerini bir güzel verdim.

```
interface eth0
fallback static_eth0

static ip_address=192.168.0.15/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1

interface wlan0

static ip_address=192.168.0.15/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1
```

Bu komutlarda yaptıklarımızı bi açıklayalım;

| Komut                      | Açıklama                                                                                 |
|----------------------------|------------------------------------------------------------------------------------------|
| `interfaces`                 | Ağ arayüz yapılandırması                                                                 |
| `static ip_address`          | sabitlemek istediğiniz ip adresi                                                         |
| `static routers`             | Routerinizin ip adresi                                                                   |
| `static domain_name_servers` | Modeminizin bilgisayarınıza tanımladığı dns adresi genelde router ip adresi ile aynıdır. |

Bu bölümden sonrası bilgilendirme amaçlı eklenmiştir. Ekleseniz bile ip adresini sabitlemeyecektir. Tüm bu işlemler sonunda sistemi yeniden başlatmayı unutmayınız.

```
auto lo
iface lo inet loopback

iface eth0 inet static
address 192.168.0.15
netmask 255.255.255.0
gateway 192.168.0.1
network 192.168.0.0
broadcast 192.168.0.254

allow-hotplug wlan0
iface wlan0 inet manual
wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
iface default inet dhcp
```

Bu komutlarda yaptıklarımızı açıklayalım;

| Komut     | Açıklama                    |
|-----------|-----------------------------|
| `address`   | Statik yerel ip adresi      |
| `netmask`   | Ağ geçidi                   |
| `gateway`   | Routerinizin ip adresi      |
| `network`   | Routerin atadığı ip aralığı |
| `broadcast` | Yayınlanan ip aralığı       |

Tüm bu doldurulacak bölümleri hali hazırda kullandığınız sistemde aşağıdaki komutu çalıştırarak çıkan değerlere göre yapabilirsiniz.

```
netstat -nr
```

en son yaptıklarımız geçerli olsun diye sistemi yeniden başlatıyoruz.

`sudo reboot`

NOT: Raspbian işletim sistemi kullanılmıştır.

öptüm bye <3
