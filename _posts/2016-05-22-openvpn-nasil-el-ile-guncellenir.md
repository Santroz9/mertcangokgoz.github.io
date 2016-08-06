---
layout: post
title: OpenVPN El ile Güncelleme İşlemi
date: 2016-05-22
type: post
categories: linux
description: Bir sürü açık ve bir sürü sıkıntısının çıktığı OpenSSL den nasibini bizim
---

Bir sürü açık ve bir sürü sıkıntısının çıktığı **OpenSSL** den nasibini bizim popüler VPN uygulamamız olan **OpenVPN** de alıyor.Firmalar güncelleyin derken ne şekilde yapılacağını belirtmiyorlar kullanıcılarda haliyle güncellerken zorluk çekiyor.

Debian tabanlı sistemlerde kullanıyorsanız size 2.3.10 sürümü yüklü geliyor.Tabi bu sürüm bizim için yeterli değil çünkü güncelleme geldi ve bir takım sorunlar giderilerek açıklar kapatıldı(bu açıklar OpenSSL tarafında bulunduğundan OpenVPN içerisindeki sürümüde yükselmiş oldu)

El ile güncelleştirme yapın denildiğinde compile etmeniz gerek falan diye algılamış olabilirsiniz tabi bu da bir çözüm ancak debian tabanlı sistemler için .deb halinde kurma imkanınız da var.

OpenVPN GPG açık anahtarını sistemimize dahil ediyoruz.

```bash
wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg|apt-key add -
```

daha sonra sistem için geçerli olan depoyu ekleme işlemimize geçiyoruz

```bash
echo 'deb http://swupdate.openvpn.net/apt '$(lsb_release -cs)' main' > /etc/apt/sources.list.d/swupdate.openvpn.net.list
```

listemize eklendiğini gördükten sonra haliyle bi güncelleme komutlarımızı verelim.tabi bunu yaparken `su` aracılığı ile yetkilendirme işlemini yapmayı unutmayın

```bash
apt-get update && apt-get ugrade
```

Bu işlemlerden sonra her yeni sürüm yayınlandığında otomatik olarak her zaman ki kullandığınız güncelleme komutunu verdiğiniz an güncellenecek.

ref: [https://community.openvpn.net/openvpn/wiki/OpenvpnSoftwareRepos](https://community.openvpn.net/openvpn/wiki/OpenvpnSoftwareRepos)

öptüm bye <3
