---
layout: post
title: Netdata İle Gerçek Zamanlı Performans İzleme
date: 2016-06-10
type: post
categories: Linux
description: Netdata yüksek bir oranda optimize edilmiş bir deamon üzerinden gerçek zamanlı olarak linux sistemlerin izlenmesi için geliştirilmiş
---

Netdata yüksek bir oranda optimize edilmiş bir deamon üzerinden gerçek zamanlı olarak linux sistemlerin izlenmesi için geliştirilmiş bir araçtır. C programlama dili ile yazılmıştır.Web arayüzünde bizleri oldukça güzel grafiksel bir tasarım ile karşılayan netdata uygulaması 4 milisaniye gibi bir süre ile verileri günceller bunu yaparken JSON kullanır bu yüzden disk okuma ve yazma süreçlerine pek fazla ihtiyacı olmayan bir yapısı vardır.Kurulduğu sistemde sadece 15 MB ram ve %1 oranında CPU kullanır.Ayrıca kurulum esnasında ihtiyaç duyduğu tüm herşeyi kurar sizin ek herhangi bir paketi kurmanıza gerek yoktur.

Kurulum öncesi bağımlılıklar

```bash
# Debian / Ubuntu
apt-get install zlib1g-dev uuid-dev libmnl-dev gcc make git autoconf autogen automake pkg-config

# Centos / Fedora / Redhat
yum install zlib-devel libuuid-devel libmnl-devel gcc make git autoconf autogen automake pkgconfig
```

Netdata kurulum parametrelerimiz

```bash
# download it - the directory 'netdata' will be created
git clone https://github.com/firehol/netdata.git --depth=1
cd netdata

# build it, install it, start it
./netdata-installer.sh
```

Systemd nin uygulamayı başlangıçta çalıştırmasını sağlamak

```bash
# stop netdata
killall netdata

# copy netdata.service to systemd
cp system/netdata.service /etc/systemd/system/

# let systemd know there is a new service
systemctl daemon-reload

# enable netdata at boot
systemctl enable netdata

# start netdata
service netdata start
```

Uygulamayı kurduğunuzda öntanımlı olarak herşeyi izlemeye ayarlı bir şekilde geliyor ancak SNMP ye ayarlı değil özel bir takım kural setleri düzenleyerek bu sorunu da çözebilirsiniz.Kurulum ve tüm herşey tamamlandıktan sonra ayarlamaların bulunduğu dizine şu şekilde erişim sağlayabilirsiniz.

```
cd /etc/netdata
```

Konfigurasyon dosyası ise aynı klasör içerisinde bulunan `netdata.conf` dilediğiniz gibi ayarlama yapabilirsiniz.Değişikliklerin uygulanması için haliyle netdatayı yeniden başlatmayı unutmayın.

Uygulamayı başlatmak için

```
/usr/sbin/netdata
```

Çalıştırıldıktan sonra arayüze ulaşmak için `ipadresi:19999` veya `domainadresi:19999` kullanabilirsiniz.Konfigurasyon dosyanız aracılığı ile değişiklik yapabilirsiniz

![netdatagif](https://cloud.githubusercontent.com/assets/2662304/14092712/93b039ea-f551-11e5-822c-beadbf2b2a2e.gif)

Bu Güzel web arayüzüne göz atmak için [DEMO](http://netdata.firehol.org/)
