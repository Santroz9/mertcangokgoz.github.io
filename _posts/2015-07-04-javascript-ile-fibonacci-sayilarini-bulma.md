---
layout: post
title: Javascript ile Fibonacci Sayılarını Bulma
date: 2015-07-04 18:21:34.000000000 +03:00
type: post
published: true
status: publish
categories: Programlama
description: Javascript ile geçtiğimiz dönem algoritmalar yazıyorduk bana pek mantıklı gelmese de aslında güzel birer örnek oluyordu.Bu örneğimizde ise
---

**Javascript** ile geçtiğimiz dönem algoritmalar yazıyorduk bana pek mantıklı gelmese de aslında güzel birer örnek oluyordu.Bu örneğimizde ise **Finonacci** sayılarını bulacağız.Örnek kodumuzda ise 200 e kadar olan **fibonacci** sayılarını yazdırmış olacağız.

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
    </head>
    <body>
        <script type="text/javascript">
            var a = 0, b = 1, c = 0;
            while (b <= 200) {
                document.write(c + "<br>");
                c = a + b
                a = b;
                b = c;
            }
        </script>
    </body>
    </html>
