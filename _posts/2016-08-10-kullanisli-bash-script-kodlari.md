---
layout: post
title: Kullanışlı Bash Script Kodları
date: 2016-08-10
type: post
categories: linux
description: Kendi ihtiyaçlarım dan dolayı düzenlemiş olduğum bir kaç bash script kodunu sizlerle paylaşmak istiyorum. Bazı sorunlarınıza direk çözüm olabileceğini
---

Kendi ihtiyaçlarım dan dolayı düzenlemiş olduğum bir kaç bash script kodunu sizlerle paylaşmak istiyorum. Bazı sorunlarınıza direk çözüm olabileceğini düşünüyorum. Sizinde böyle kullanışlı bash script kodlarınız var ise yorum olarak bırakmanız yeterli zamanla yazdıklarım ile birlikte güncellemeler yapacağım yorum altına bırakılan kodları da göz ardı etmeyip makaleye ekleyeceğim.

### History Tarih Bilgisi Ekleme

```console
export HISTTIMEFORMAT="%d/%m/%y %T "
```

### En çok kullanılan komutları kullanım sayısına göre sıralamak

```console
history | awk '{a[$2]++}END{for(i in a){print a[i]" "i}}' | sort -rn | head
```

### Uptime oranını öğrenme saniye cinsinden

```console
cat /proc/uptime | awk '{print $1}'
```

### Bilgisayarın kaç çekirdek olduğunu öğrenme

```console
cat /proc/cpuinfo | grep processor | wc -l
```

### Gelen Trafiğin toplam boyutu

```console
ifconfig eth0 | awk '/RX bytes/ {print $3, $4}'
```

### Giden Trafiğin toplam boyutu

```console
ifconfig eth0 | awk '/RX bytes/ {print $7, $8}'
```

### Aliaslar

```console
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias purge='sudo apt-get remove --purge'
alias update='sudo apt-get update'
alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
alias sources='(gksudo geany /etc/apt/sources.list &)'
```

### Tüm dosya adlarını küçültme

```console
for i in *.mp4; do mv "$i" "`echo $i| tr [A-Z] [a-z]`"; done
```
