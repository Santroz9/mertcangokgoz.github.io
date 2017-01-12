---
layout: post
title: Telegram İçin Tema Nasıl Hazırlanır
date: 2017-01-12
type: post
categories: genel
description: Herkes Telegram Masaüstü için bir tema hazırlayabilir. Aşağıdaki adımları takip ederek, tabi ki her şey çok basit bir tema oluşturmak için 
---

Herkes Telegram Masaüstü için bir tema hazırlayabilir. Aşağıdaki adımları takip ederek, tabi ki her şey çok basit bir tema oluşturmak için iki dosyayı birlikte bir .zip dosyasına koymanız gerekecek haliyle

- İhtiyacınız olan ilk dosya renk şemasıdır, [buna benzer](https://github.com/telegramdesktop/tdesktop/blob/dev/Telegram/Resources/default.tdesktop-theme). Bu dosyanın `colors.tdesktop-theme` olması ve temanızın ana ayarlarını ve yapılandırmasını içermesi gerekir.
- İkinci dosya arka plan resmi olacak, bu isimlerden birini kullanmanız gerekiyor: `background.jpg`, `background.png`, `tiled.jpg` veya `tiled.png`

böyle desenlerin tekrar edilmesini vs isterseniz ve böyle bir arka plan olsun derseniz, ad olarak 'tiled' kullanmalısınız, tek bir resim için ise `background` kullanmalısınız.

Renk ayarlamaları için hex color düzenlemeniz gerekiyor bir kaç ayardan sonra güzel bir tema yapabileceğinizi düşünüyorum.

Her iki dosyayı `.zip` arşivine ekledikten sonra, dosya uzantısını `.zip` dosyasından .`tdesktop-theme` değiştirmeniz gerekiyor.

![temaornekgorsel](/assets/ornektelegramtemasema.png)

Şimdi, `mytheme.tdesktop-theme` dosyasını Telegram'da paylaşın ve uygulamak için Telegram Masaüstünden açın dosyayı açın