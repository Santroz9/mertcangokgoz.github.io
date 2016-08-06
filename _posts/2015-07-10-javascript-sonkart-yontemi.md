---
layout: post
title: Javascript Sonkart Yöntemi
date: 2015-07-10 14:49:58.000000000 +03:00
type: post
published: true
status: publish
categories: programlama
description: Javascript ile bu örneğimizde son kart yöntemini göreceğiz
    her girdiğimiz sayı bir sonrakinin arkasından gelecek ve sıralı bir şekilde devam
---

**Javascript** ile bu örneğimizde son kart yöntemini göreceğiz her girdiğimiz sayı bir sonrakinin arkasından gelecek ve sıralı bir şekilde devam edecek siz ne zaman "0" sayısını girerseniz program sizden sayı istemeyi kesecek ve sıralı bir şekilde daha önceden yazdıklarınızı önünüze getirecek

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
    </head>
    <body>
        <script type="text/javascript">
            var x = [];
            s = 0;
            while (x[s] != "0") {
                s++;
                x[s] = prompt("sayı?")
            }
            for (y = 1; y <= s; y++) {
                document.write(x[y] + "<br>");
            }

        </script>
    </body>
    </html>
