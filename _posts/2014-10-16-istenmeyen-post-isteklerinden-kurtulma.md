---
layout: post
title: "İstenmeyen POST isteklerinden kurtulma"
date: 2014-10-16 13:50:47.000000000 +03:00
type: post
published: true
status: publish
categories: Güvenlik
description: Ortalıkla son zamanlarda bol miktarda POST isteği ile sitelere saldıran yada birşeyler yapmak isteyen script ve botcuklar dolaşmakta olduğunu
---
Ortalıkla son zamanlarda bol miktarda POST isteği ile sitelere saldıran yada birşeyler yapmak isteyen script ve botcuklar dolaşmakta olduğunu gördüm bunlardan bir kaçı benide ziyaret etti aynı anda farklı şekillerde bir sürü POST isteği sunucuyuda yoracağı için buna bir çözüm olarak .htacc kuralları ile tüm POST isteklerini ve sitemde kullanmadığım istekleri kapatmak aklıma geldi.GET isteğini yasaklarsak sıkıntı çıkar o yüzden POST u yasaklayalım GET sonuçta sitelerin can damarı zaten POST isteklerini kapattığınızda yüksek oranda Spam mesajlarında gelmesi kesilecek

Durum şu POST isteği sunucumuza geliyor.Geri adama ne gönderece yoksa 404 varsa bile sayfayı atacaz e bunun durmadan yapıldığını düşünün sunucuya yazık be kapatalım gitsin ne gerek var.

    <IfModule mod_rewrite.c>
    	RewriteCond %{REQUEST_METHOD} POST
    	RewriteRule .* - [F,L]
    </IfModule>

Yukarıdaki htacc kuralını sitenin ana dizindeki htaccsine eklerseniz tüm POST isteklerini yasaklamış olursunuz Böylelikle gelen isteklere birşey gösterilmez sunucunuzdaki yük bir nebze kalkar.

Misal trafik sadece HTTP 1.0 dan geliyor ve HTTP 1.1 temiz ise sadece HTTP 1.0 için POST isteklerini yasaklayabilirsiniz bir sakıncası yok

    <IfModule mod_rewrite.c>
    	RewriteCond %{THE_REQUEST} ^POST(.*)HTTP/(0\.9|1\.0)$ [NC]
    	RewriteRule .* - [F,L]
    </IfModule>

ve geldik benim en sevdiğim htacc kuralına tüm sistemdeki gereksiz ve kullanmadığım istekleri bu kod ile kapattım ben işimede pek yaradı tavsiye ederim güvenliğinizi arttırabilirsiniz.

    <IfModule mod_rewrite.c>
    	RewriteCond %{REQUEST_METHOD} ^(delete|head|trace|track) [NC]
    	RewriteRule .* - [F,L]
    </IfModule>

Bunu yapınca ne oldu yukardaki 4 istekden birini gönderen arkadaşa hemen ardından direk olarak 403 Gönderdik ve girşini yasakladık hop birader dedik ayık ol aklını alırız dedik ve sonuç

![htaccrulespostisteginikatmakgorsel1](/assets/htaccrulespostisteginikatmakgorsel1.png)
