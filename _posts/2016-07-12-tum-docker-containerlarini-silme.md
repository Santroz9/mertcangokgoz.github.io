---
layout: post
title:  Tüm Docker Containerlarını Silme
date: 2016-07-12
type: post
categories: Linux
description: Docker kullanmayı öğrenirken pek çok container oluşturmuştum.bunları tek tek silmek yerine hepsini bir çırpıda 
---

Docker kullanmayı öğrenirken pek çok container oluşturmuştum. Bunları tek tek silmek yerine hepsini bir çırpıda kolaylıkla silebileceğimizi öğrendim şöyle ki;

```console
docker stop $(docker ps -a -q) && docker remove $(docker ps -a -q)
```

Bu komut sayesinde durdurup tek tek silme derdinden kurtulacaksınız ve bu komut da geçen `docker ps -a -q` ID lerine göre containerları listelemekte haliyle `docker remove` denildiği içinde silme işlemi gerçekleşiyor.