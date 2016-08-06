---
layout: post
title: Debian Tabanlı Sistemler'e Docker Kurulumu
date: 2016-04-12
type: post
categories: linux
description: Docker sistem yöneticileri ve yazılım geliştiriciler için ortaya çıkan açık kaynak kodlu
---

**Docker** sistem yöneticileri ve yazılım geliştiriciler için ortaya çıkan açık kaynak kodlu bir sanallaştırma uygulamasıdır. **Docker** Multi platform olarak geliştirilmiştir ve aynı şekilde docker makinaları üzerinde de pek çok işletim sistemini çalıştırabilmeniz mümkündür.Yazılımcılar ve sistem yöneticiler için docker kurulumu ve test imkanını kolaylaştırmasıdır.Aynı zamanda oluşabilecek sorunları da önceden fark etmenize imkan tanır.

Docker yazılımların imaj kaydını tekrar kullanılabilir haline getiriyor yani kurulmuş halini bir imaj dosyası haline getiriyor.Diğer sistemlerde kurulumunu kolaylaştırıyor aynı şekilde **DockerFile** bakarak her sisteme aynı imaj kaydını geçmiş oluyor.Bu sayede sonradan sizin tekrar ayarları kurcalamanıza gerek kalmıyor.

Ayrıca **DockerFile** daha sonradan ekleyeceğiniz yenilikler ile geliştirebilirsiniz.Bu sayede yapacaklarınızdan zaman kazanabilirsiniz.

Debian sistemimize öncelikli olarak bi deposunu ekleyelim bunun için `/etc/apt/sources.list.d/docker.list` yoluna eklemeyi yapacağız bunun için aşağıdaki kod işinizi görecektir.

**Debian**

```
sudo sh -c "echo 'deb https://apt.dockerproject.org/repo debian-'$(lsb_release -cs)' main' >> /etc/apt/sources.list.d/docker.list"
```

**Ubuntu**

```
sudo sh -c "echo 'deb https://apt.dockerproject.org/repo ubuntu-'$(lsb_release -cs)' main' >> /etc/apt/sources.list.d/docker.list"
```

**Mint**

```
sudo sh -c "echo 'deb https://apt.dockerproject.org/repo ubuntu-trusy main' >> /etc/apt/sources.list.d/docker.list"
```

## Kurulum

Eklemesini yaptıktan sonra kayıt edip çıkıyoruz.Sistemin paketleri indexlemesini sağlamak amacıyla aşağıdaki her zaman kullandığımız komutu verelim

```
sudo apt-get update && sudo apt-get upgrade
```

Bu esnada GPG keyi yok yada eklememişsiniz vay efendim siz bu işlemi yapamazsınız derse eklemesini yapalım

```
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
```

Şimdi bazı gereklilikleri kuracağız bunlar ise şu şekilde (HTTPS sıkıntı çekmeyelim)

```
sudo apt-get install apt-transport-https ca-certificates
```

Şimdi herşey tamam ise Docker ekipmanın kurulumu için aşağıdaki komutu verelim

```
sudo apt-get install docker-engine
```

Uygulamayı başlatalım

```
sudo service docker start
```

## Kernel AUFS Desteği

Eğer kurulu değilse aşağıdaki komutu vererek kurulumu yapabilirsiniz ama kurulu olmama ihtimali baya düşük

```
sudo apt-get install linux-image-extra-"$(uname -r)"
```

Öptüm bye <3
