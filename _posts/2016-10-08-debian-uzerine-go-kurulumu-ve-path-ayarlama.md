---
layout: post
title: Debian Üzerine Go Kurulumu ve PATH Ayarlama
date: 2016-10-08
type: post
categories: linux
description: Google tarafından geliştirilmiş açık kaynak kodlu bir programlama dili olan go ile yazılmış github üzerinde bir sürü güzel
---

Google tarafından geliştirilmiş açık kaynak kodlu bir programlama dili olan go ile yazılmış **github** üzerinde bir sürü güzel proje bulmak ve bunları kurup kullanabilmek mümkün. Bu uygulamalar genellikle kolay, basit, güvenilir ve verimli oluyorlar ayrıca hızları da oldukça güzel

**Go** dili ile yazılmış pek çok web projesi olduğu gibi **linux** için arka plana yazılmış uygulamalarda mevcut bunlar ile bir takım bilgi alma işlemleri yapabilir. Çıktıları düzenleyebilir ve sorgulama işlemleri yapabilirsiniz.

Ama herşeyden önce bu dili sistemimiz için kurmamız gerekiyor. Bu kurulum oldukça kolay ancak kurulumdan sonra insanlar genelde go paketlerini ya kuramıyorlar yada kurduktan sonra çalıştıramıyorlar

Aslında kurulmazsa zaten çalışmıyor. Çünkü Go kardeşin **PATH** ayarlamasının yapılması gerekiyor. Ön tanımlı olarak bu ayarlamayı kendisi yapmıyor **Go** için bu oldukça büyük bir dezavantaj

Debian için ise kurulum oldukça basit ilk olarak paketleri sisteme dahil etmemiz gerekiyor. Debian paketlerini sorguladığımız web adresini ziyaret ediyoruz.

Arama çubuğuna `golang` yazıyoruz ve aratıyoruz. Karşımıza 1 adet paket çıkacak bunun üzerine tıklıyoruz. Görebildiğimiz gibi tüm debian dağıtımları için paketler mevcut bir yanlışlık da yok o zaman geçiyoruz kurmaya

```
apt-get install golang
```

Bu kurulum komutunu çalıştırdığımızda bağımlılıklarından olan 7 yada 4 adet paket kurması gerekiyor. **Stretch** sürümü hariç diğer sürümlerde 3 yada 4 tane ek paket kuracağını unutmayın.

Şimdi kurulum tamamlandıktan sonra **PATH** ayarlamamız gerekiyor yoksa hiçbir işlem yapamayız. Devamlı bitmek tükenmeyen hatalar alırız ki bu hiç hoş bir durum değil

```
cd
nano .bashrc
```

Dosyanın en altına gidiyoruz ve aşağıdaki satırları ekliyoruz.

```
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
```

Kayıt edip çıkış yaptıktan sonra aktif olabilmesi için terminali kapatıp açmanız gerekiyor. Bunu yaptıktan hemen sonra ise **Go** normal bir şekilde çalışmaya başlayacak ve uygulamalarınızı çalıştırmaya başlayabileceksiniz.

öptüm bye <3