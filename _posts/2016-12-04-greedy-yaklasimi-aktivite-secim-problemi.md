---
layout: post
title: Greedy Yaklaşımı Aktivite Seçim Problemi
date: 2016-12-04
type: post
categories: programlama
description: Aktivite seçim problemi, her biri bir başlangıç zamanı (s) ve bitiş zamanı (f) ile işaretlenmiş bir dizi faaliyet göz önüne alındığında
---

Aktivite seçimi problemi, her biri bir başlangıç zamanı (s) ve bitiş zamanı (f) ile işaretlenmiş bir dizi faaliyet göz önüne alındığında, belirli bir zaman çerçevesi içinde çelişmeyen faaliyetlerin seçimiyle ilgili bir kombinatoryal optimizasyon problemidir. Sorun, bir kişinin bir seferde tek bir etkinlikte çalışabileceğini varsayarak, tek bir kişi veya makine tarafından gerçekleştirilebilecek maksimum etkinlik sayısını seçmektir.

Optimizasyon problemlerinin önüne geçmek için sıkça kullanılan algoritmalardır. Her zaman en bariz ve anında fayda sağlayan bir sonraki parçayı seçer.

{% gist MertcanGokgoz/6620972535cb7e4c65d701c25329d36c %}

Her biri bir başlangıç zamanı s ve bitiş zamanı f ile temsil edilen n aktivite bulunduğunu varsayalım. `S ≥ f` veya `s ≥ f` ise iki etkinlik i ve j'nin çelişkili olmadığı söylenir. Aktivite seçim problemi, çelişkili olmayan faaliyetlerin maksimum çözüm setini (S) bulmaktan ibarettir veya daha kesin bir ifadeyle, `|S'| > |S|` Birden fazla maksimal çözümün eşit ebatlara sahip olması durumundadır..