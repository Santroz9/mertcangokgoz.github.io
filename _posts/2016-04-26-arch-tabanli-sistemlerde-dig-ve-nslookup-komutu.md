---
layout: post
title: Arch Tabanlı Sistemler'de Dig ve Nslookup Komutu
date: 2016-04-26
type: post
categories: Linux
description: Ubuntu,Debian yada Fedora kullananlar bilirler sistemde ön tanımlı olarak dig,nslookup komutları
---

Ubuntu,Debian yada Fedora kullananlar bilirler sistemde ön tanımlı olarak dig,nslookup komutları kullanabilecekleri paketler kurulu olarak gelir ancak arch linux de ön tanımlı olarak bu paketler kurulu gelmez hal böyle oluncada ilk başta şaşırabilirsiniz lan her sistemde var bunda nasıl yok gibi şeyler söyleyip hatta küfür bile edebilirsiniz. Ama böyle aksiyonlara gerek yok kurulumu oldukça basit `pacman` amca bize yardımcı bile olacak


```bash
sudo pacman -S dnsutils
sudo pacman -S traceroute
```

Kurulumlar bittikten sonra istediğiniz gibi dig,nslookup gibi komutları çalıştırabileceksiniz.Ayrıca traceroute uygulaması aracılığıylada bağlantının nerelerden geçtiğini görebileceksiniz.
