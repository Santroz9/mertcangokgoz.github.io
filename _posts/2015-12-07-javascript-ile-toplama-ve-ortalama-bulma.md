---
layout: post
title: Javascript ile Toplama ve Ortalama Bulma
date: 2015-12-07 11:45:52.000000000 +02:00
type: post
published: true
status: publish
categories: programlama
description: Javascript dilinde basit algoritmaları gerçekleştirmek oldukça kolaydır.Pek çok dilde olduğu gibi javascriptdede yazacağız artık standartlaşmaya
---

**Javascript** dilinde basit algoritmaları gerçekleştirmek oldukça kolaydır.Pek çok dilde olduğu gibi javascriptdede yazacağız artık standartlaşmaya başladı diyebiliriz.Kullanıcıdan sayıları alabilmek adına prompt komutunu kullanacağız for döngüsü ile yaklaşık kaç adet sayı gireceğini kullanıcının belirlemesini istiyorum.Örnek kodumuz ise aşağıdaki gibidir.

    <script>
        var sum = 0;
        var count_for = parseInt(prompt("Kaç Tane Sayı Toplanacak"));
        for (var i = 1; i <= count_for; i++) {
            var number = prompt(i + ".Sayi");
            document.write(i + ".number = " + number + "<br />");
            sum = sum + parseInt(number);
        }
        avg = parseInt(sum) / count_for;

        document.write("<br />Sum : " + sum);
        document.write("<br />Avg : " + avg);
    </script>
