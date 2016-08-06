---
layout: post
title: Javascript'de For ile Tablo Oluşturma
date: 2015-12-09 12:56:45.000000000 +02:00
type: post
categories: programlama
description: Javascript for döngüsünü kullanarak satır ve sütun sayısı belirli olan herhangi bir tabloyu yapabilirsiniz.Kod yazarken size kolaylık sağlayacaktır.
---

**Javascript** for döngüsünü kullanarak satır ve sütun sayısı belirli olan herhangi bir tabloyu yapabilirsiniz.Kod yazarken size kolaylık sağlayacaktır. içerisine gerekenleri ekleterek zamandan ve koddan tasarruf edebilirsiniz.Programa kaç satır ve kaç sutun olacağını belirtmeniz yeterli.


    <script>
        var a = parseInt(prompt("Kaç Satır Olacak?"));
        var b = parseInt(prompt("Kaç Sutun Olacak?"));
        document.write("<table border='1'>");
        for (var i = 1; i <= a; i++) {
            document.write("<tr>");
            for (var j = 1; j <= b; j++) {
                document.write("<td>" + i + ". * " + j + ". </td>");
            }
            document.write("</tr>");
        }
        document.write("</table>");
    </script>
