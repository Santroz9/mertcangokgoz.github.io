---
layout: post
title: Linux cPanel & WHM Panel Kurulum
date: 2016-09-04
type: post
categories: linux
description: Elinizde bir sunucu var ve bunu SSH üzerinden yönetmek zor geliyor yada panelsiz daha önce hiç kullanmamış iseniz cPanel kuracağız size alışkanlıklardan vazgeçmek
---

Elinizde bir sunucu var ve bunu **SSH** üzerinden yönetmek zor geliyor yada panelsiz daha önce hiç kullanmamış iseniz **cPanel** kuracağız size alışkanlıklardan vazgeçmek zordur. İşte bu yüzden **cPanel** kurulumu yapmanıza yardım etmemiz gerekiyor. Kamu görevi gibi düşünebiliriz. Farklı paneller önerdiğimizde küfür dahi edenler olabiliyor siz onlardan olmayın o bize yeter.

# Sistem Gereksinimleri

<table>
  <thead>
    <tr>
      <th rowspan="2">İşletim Sistemi
      </th>
      <th rowspan="2" style="text-align: center;">Versiyon
      </th>
      <th rowspan="2" style="text-align: center;">İşlemci
      </th>
      <th colspan="2" style="text-align: center;">Bellek
      </th>
      <th colspan="2" style="text-align: center;">Disk Alanı
      </th>
      <th rowspan="2" style="text-align: center;">Mimari
      </th>
    </tr>
    <tr>
      <th colspan="1">Minimum
      </th>
      <th colspan="1">Önerilen
      </th>
      <th colspan="1">Minimum
      </th>
      <th colspan="1">Önerilen
      </th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td rowspan="2">
        <span>CentOS, CloudLinux, veya RHEL
        </span>
      </td>
      <td colspan="1">6
      </td>
      <td rowspan="2">
        <span>226 MHz
        </span>
      </td>
      <td colspan="1">768 MB
      </td>
      <td colspan="1">1 GB
      </td>
      <td rowspan="2">
        <span>20 GB
        </span>
      </td>
      <td rowspan="2">
        <span>40 GB
        </span>
      </td>
      <td rowspan="2">64-bit
      </td>
    </tr>
    <tr>
      <td colspan="1">7
      </td>
      <td colspan="1">1 GB
      </td>
      <td colspan="1">2 GB
      </td>
    </tr>
    <tr>
      <td colspan="1">Amazon Linux
      </td>
      <td colspan="1">Tüm Sürümler
      </td>
      <td>&nbsp;
      </td>
      <td colspan="1" >768 MB
      </td>
      <td colspan="1" >1 GB
      </td>
      <td >&nbsp;
      </td>
      <td>&nbsp;
      </td>
      <td colspan="1">64-bit
      </td>
    </tr>
  </tbody>
</table>

## Güvenlik Duvarları Kapatılması

Centos, CloudLinux, RHEL 6

```console
/etc/init.d/iptables save
/etc/init.d/iptables stop
/sbin/chkconfig --del iptables
```

Centos, CloudLinux, RHEL 7

```console
iptables-save > ~/firewall.rules
systemctl stop firewalld.service
systemctl disable firewalld.service
```

## NetworkManager'in Kapatılması

Centos, CloudLinux, RHEL 5 ve 6

```console
service NetworkManager stop
chkconfig NetworkManager off
chkconfig network on
service network start
service ipaliases start
```

Centos, CloudLinux, RHEL 7

```console
systemctl stop NetworkManager.service
systemctl disable NetworkManager.service
systemctl enable network.service
systemctl start network.service
systemctl start ipaliases.service
```

## SELinux Kapatılması

```console
sudo nano /etc/selinux/config
```

hemen ardından dosya aşağıdaki gibi düzenlenir.

```console
# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
# enforcing - SELinux security policy is enforced.
# permissive - SELinux prints warnings instead of enforcing.
# disabled - No SELinux policy is loaded.
SELINUX=disabled
# SELINUXTYPE= can take one of these two values:
# targeted - Only targeted network daemons are protected.
# strict - Full SELinux protection.
SELINUXTYPE=targeted
```

Kuruluma başlamadan önce bağımlılıklarından bir tanesi olan `perl` kurulumu gerçekleştirilir.

```console
yum -y install perl
```

## Hostname Ayarlanması

```console
sudo nano /etc/sysconfig/network
```

`HOSTNAME=` ile başlayan değer bulunur ve FQDN kurallarına göre uygun bir değer ile değiştirilir.

```console
NETWORKING=yes
HOSTNAME=venus.mertcangokgoz.com
 ```
hemen ardından hosts dosyası düzenlemesi yapılır.

```console
sudo nano /etc/hosts
```

dosyaya yeni değer aşağıdaki gibi eklenir.

```console
127.0.0.1 venus.mertcangokgoz.com
127.0.0.1   localhost localhost.localdomain localhost2 localhost2.localdomain2
::1         localhost localhost.localdomain
```

Sistem `reboot` komutu ile yeniden başlatılır.

Tüm bu işlemler bittiğinde aşağıdaki komutu vererek kurulum işlemini başlatıyoruz. Sisteminizin özelliklerine göre kurulum biraz zaman alabilir lütfen sabırlı olun.

```console
cd /home && curl -o latest -L https://securedownloads.cpanel.net/latest && sh latest
```

öptüm bye <3
