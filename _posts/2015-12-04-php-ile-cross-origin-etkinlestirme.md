---
layout: post
title: PHP ile Cross-Origin Etkinleştirme
date: 2015-12-04 12:30:53.000000000 +02:00
type: post
categories: Programlama
description: CDN yada uzak dizinden dosya kullandıran sitelerdeki en büyük sorun tarayıcıların uzak dizin hatası vermesidir.CDN tarafında tuttuğunuz
---

**CDN** yada uzak dizinden dosya kullandıran sitelerdeki en büyük sorun tarayıcıların uzak dizin hatası vermesidir. **CDN** tarafında tuttuğunuz dosyaları kullanıcılara bu hata yüzünden gösterilmez tarayıcı güvensiz gibi görüp kaynağa ulaşmaz bunu çözmek için ise ya [Nginx kurallarına](https://mertcangokgoz.com/nginxde-cors-ayarlari-nasil-yapilir/) ekleme yapmanız gerekir.Çoğu zaman bu ekleme bile yeterli gelmez yada çalışmaz header bilgisine tanımladığınız uzak dizin kullanımı tanımı geçmez bu gibi durumlarda **PHP** kullanarak istenilen domain adreslerinden uzak dizini kabul ettirebiliriz.

<script src="https://gist.github.com/MertcanGokgoz/2040cd0efb48952087f0.js"></script>

**PHP** sayesinde header bilgisine belirttiğiniz originsleri ekleyebilirsiniz birden çok domain tanımlaması yapabilirsiniz.Kullanıcılarınız içeriklerinizi sıkıntısız bir şekilde görebilirler
