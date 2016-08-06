---
layout: post
title: Htaccess yöntemiyle Spamlara karşı blogunuzu koruyun
date: 2013-08-27 01:46:12.000000000 +03:00
type: post
published: true
status: publish
categories: guvenlik
description: Bir kullanıcı sitenizdeki her hangi bir yazıya yorum yaptığı zaman Wordpress wp-comment-post.php adresini kullanır ve sizin yorumunuzu gereken
---

Bir kullanıcı sitenizdeki her hangi bir yazıya yorum yaptığı zaman Wordpress **wp-comment-post.php** adresini kullanır ve sizin yorumunuzu gereken sayfaya işler ne yazık ki bu dosya spamcılar tarafından iyi bilindiği için açık hedef durumundadır ve bu siteniz için çok kötü sonuçlar ortaya çıkartıcaktır.Ancak bu spamcıları engellemek kolaydır **wp-comment-post.php** yi botlara ve komut yollayan scriptlere kapatmamız mümkündür.tek yapmanız gereken aşağıdakileri sitenizin ana **.htaccess** dosyasına eklemenizdir.

Bu Özelliği kullanmanız için Serverinizde,Hostunuzda **mod\_rewrite.c** modülü çalışır durumda olmalıdır.

    # Block Spammers Bots And Command Scripts
    <IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteCond %{REQUEST_METHOD} POST
    RewriteCond %{HTTP_USER_AGENT} ^$ [OR]
    RewriteCond %{HTTP_REFERER} !(.*)example.com(.*) [NC]
    RewriteCond %{REQUEST_URI} /wp-comments-post.php [NC]
    RewriteRule .* - [F]
    </IfModule>

Bundan sonra yapmanız gereken tek bir şey kalmaktadır. Siteadiniz.com yazan yeri kendi site adresinize göre düzenlemek ve doğru çalıştığından emin olmak için yardımcı araçlar kullanmak

Bunun içinde yapmanız gerekenler

[http://www.botsvsbrowsers.com/SimulateUserAgent.asp](http://www.botsvsbrowsers.com/SimulateUserAgent.asp)

Adresine girerek

- URL kısmına www.siteadresiniz.com/wp-comments-post.php yazmak
- method kısmını POST olarak seçmek
- ve Go tuşuna basmak olacaktır.

Örnek

![useragent](/assets/useragent1.png)

Eğer Çalışıyor ise o Sayfada **403:Forbidden** yazması gerekmektedir ve ana sayfaya yönlendirecektir kodları girmediğiniz zaman 200:OK diyecektir.

Olaya birazda eğlence katmak isteyebilirsiniz mesela spam yapmak isteyen kişiye belirlemiş olduğunuz bir resmi gösterebilirsiniz bunun için yapmanız gereken

    RewriteRule komutunu aşağıdaki gibi değiştirmektir.
    RewriteRule .* http://example.com/oops.png [R=301,L]

## Böylelikle kişi ana sayfaya yönlenmek yerine sizin belirleyeceğiniz resmi görüntüleyecektir.
