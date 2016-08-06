---
layout: post
title: JSON Verilerini Okunabilir Hale Getirme
date: 2015-01-22 14:30:57.000000000 +02:00
type: post
published: true
status: publish
categories: programlama
description: Python diyelimki bilgisayarınızda kurulu olsun ve elinizde önemli JSON şeklinde datalar var ve okumakda zorluk çekiyorsunuz.Diyelim ki internetinizde
---
<**Python** diyelimki bilgisayarınızda kurulu olsun ve elinizde önemli **JSON** şeklinde datalar var ve okumakda zorluk çekiyorsunuz.Diyelim ki internetinizde kesiliverdi birden ve çevirecek sitelere giremiyorsunuz.Peki **Python** sisteminizde kurulu iken _JSON_ datalarını nasıl okunaklı hale getirebilirsiniz.Bu noktada Pythonun bi kütüphanesi işimize yarayacak ve kolaylıkla okunabilir hale getireceğiz

**JSON** datamız örnek olarak şöyle olsun

    { "one": 1, "two": { "list": [{"item":"A"},{"item":"B"}] } }

Kullanacağımız kodumuz ise

    $JSON_STRING='{ "one": 1, "two": { "list": [{"item":"A"},{"item":"B"}] } }'
    echo $JSON_STRING | python -mjson.tool

_ve sonucumuz..._

![pythonilejsonformattedgorsel1](/assets/pythonilejsonformattedgorsel1.png)
