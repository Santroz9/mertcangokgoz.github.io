---
layout: post
title: Javascript ile Modulus Bulma
date: 2015-07-06 16:15:02.000000000 +03:00
type: post
published: true
status: publish
categories: Programlama
description: Javascript ile algoritma yazmaya devam ediyoruz ve bu makalemizde javascript kullanarak modulus işlemini gerçekleştireceğiz.verilen sayıya kadar
---

**Javascript** ile algoritma yazmaya devam ediyoruz ve bu makalemizde **javascript** kullanarak **modulus** işlemini gerçekleştireceğiz.verilen sayıya kadar bölümünden kalanı sıfır olanı süzeceğiz böylelikle hangi sayıların tam olarak bölündüğünü görebileceğiz.Bu örneğimizde 48 sayısına kadar **tam bölenleri** bulmayı amaçladık.Siz istediğiniz bir sayıya kadar alabilirsiniz.

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
    </head>
    <body>
        <script type="text/javascript">
            x = 48; b = 0;
            for (s = 0; s <= x; s++) {
                b = x % s;
                if (b == 0) {
                    document.write(s + "<br>");
                }
            }
        </script>
    </body>
    </html>
