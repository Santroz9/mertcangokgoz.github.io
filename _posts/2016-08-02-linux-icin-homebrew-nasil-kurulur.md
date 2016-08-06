---
layout: post
title: Linux İçin Homebrew Nasıl kurulur
date: 2016-08-02
type: post
categories: linux
description: OSX kullananların brew'i varda bizim niye yok ? bu güzelim uygulamadan bizde istiyoruz dediniz mi hiç çünkü ben bir zamanlar diyordum bazı uygulamalar
---

OSX kullananların brew'i varda bizim niye yok ? bu güzelim uygulamadan bizde istiyoruz dediniz mi hiç çünkü ben bir zamanlar diyordum bazı uygulamalar OSX var ama bize yoktu

Bu brew kardeşin en büyük özelliği home dizini altına root şifresiz istediğinizi kurabilmeniz yok `sudo` gireyim de şifremi yazayım derdi yok. Keza bu paket yöneticisi Linux sunucularda ve Mac dizüstü bilgisayarlarda kullanılabilir. Birebir mac için olan tüm brew uygulamaları linux sunucularda da çalışmaktadır.

## Özellikleri

- Yönetici yetkileri istemez
- Hazır paketlenmiş olarak depodan kurulmaz
- Dağıtımdaki sürümler eski ise bunu hiç kafanıza takmanıza gerek yok güncel sürümleri kurabilirsiniz
- Mac ve Linux sistemleri yönetmek için aynı paket yöneticisini kullanın
- Tamamen git üzerinden çalışır
- Oldukça hızlı ve esnektir

## Bağımlılıklar

- Ruby 1.8.6 ve daha üst sürümler
- GCC 4.4 ve daha üst sürümler
- Linux 2.6.16 ve daha üst sürümler
- 64-bit x86 veya 32-bit ARM (Raspberry Pi)

### Kurulum

Debian ve Ubuntu ailesi

```console
sudo apt-get install build-essential curl git python-setuptools ruby
```

Fedora , Centos ve RHEL ailesi

```console
sudo yum groupinstall 'Development Tools' && sudo yum install curl git irb python-setuptools ruby
```

Geldik ana kuruluma bu işlemi yaparken lütfen root olmadan normal kullanıcı ile kurulumu gerçekleştirin. Zaten root olarak kurmaya çalıştırdığınızda bunu yapmanıza izin vermeyecek

```console
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
```

Kurulum direk olarak 2 dakika sürecek internet hızınız yavaş ise 5 dakika sürecek daha yukarısına çıkmayacak

kurulum tamamlandıktan sonra ana dizindeki `.bashrc` dosyasına aşağıdakileri ekleyin

```console
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export HOMEBREW_BUILD_FROM_SOURCE=1
```

Kurulumu başarılı bir şekilde tamamlanız, şimdi yapmanız gereken ne istiyorsanız onu depoden aramak ve kurulumunu gerçekleştirmek

```console
brew search [kurulacak uygulama]
```

Bulduğunuz uygulamayı kurmak için

```console
brew install aria2
```

Daha sonra bu `brew` otomatik olarak istediğiniz uygulamayı derleyip kuracak Arch tabanlı sistemlerdeki `yaourt` mantığının aynısı diyebiliriz talimatı veriyorsunuz ve kurulumu başlatıyorsunuz otomatik olarak kurup size teslim ediyor.

Yerel depoların güncellenmemesi sorununu bu şekilde çözebilirsiniz. Tabi bazı paketleri `brew` üzerinden kurmanız önerilmez

Paketleri online bir şekilde [bu adresten](http://braumeister.org/) arayıp kurabilirsiniz.

### İpuçları

Uygulama indexlerini güncellemek için

```console
brew update
```

Güncel olmayan uygulamaların tespiti

```console
brew outdated
```

Uygulamaların güncellenmesi

```console
brew upgrade
```

Uygulamayı silecem diyenler

```console
brew remove [uygulama]
```

Homebrew sevmedim silecem diyenlere

```console
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/uninstall)"
```
