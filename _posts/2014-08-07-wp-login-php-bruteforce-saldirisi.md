---
layout: post
title: Wp-login.php Bruteforce Saldırısı
date: 2014-08-07 14:56:53.000000000 +03:00
type: post
published: true
status: publish
categories: Güvenlik
description: Son zamanlarda yüklü miktarda bruteforce saldırıları almaktaydım.Sonra internetten araştırınca milyonlarca wordpress kullanıcısına aynı anda bir saldırı
---
Son zamanlarda yüklü miktarda bruteforce saldırıları almaktaydım.Sonra internetten araştırınca milyonlarca wordpress kullanıcısına aynı anda bir saldırı gerçekleştirildiğini okudum haliyle bunu kesmemiz gerekiyordu çünkü tekde 40 kez şifre denemesi yapıyordu bulacağından değil ama CPU yu kastırma durumu vardı MySQL boşu boşuna yoracaktı ne yapalım ne yapalım derken saldırının nasıl geldiğine bi bakmamız gerekiyordu.Bir baktım ki gelen Saldırılar POST şeklinde bize ulaşıyor botlar aracılığı ile

    "POST /wp-login.php HTTP/1.1" 302 4477 "-" "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 7.1; Trident/5.0)"
    "POST /wp-login.php HTTP/1.1" 302 4479 "-" "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 7.1; Trident/5.0)"
    "POST /wp-login.php HTTP/1.1" 302 4487 "-" "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)"
    "POST /wp-login.php HTTP/1.1" 302 4643 "-" "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)"

İlk olarak dedim ki 2.bir güvenlik şifresi ile doğrulatıp sonra wp-login e ulaşabilirdim ancak bu bana vakit kaybettirirdi ama botların ayağını keserdi.

    AuthUserFile ~/.htpasswd

    AuthName “Hop Dedik...”

    AuthType Basic

    Require valid-user

Ancak en kolayı olan htacc ile POST dan gelen botların önünü kesmek olurdu diye düşündüm bunu ben aynı zamanda spam yorum gelmemesi için kullanmaktaydım ve görüldüğü üzere spam namına birşey gelmemekteydi.

    # Stop spam attack logins and comments
    <IfModule mod_rewrite.c>
    	RewriteEngine On
    	RewriteCond %{REQUEST_METHOD} POST
    	RewriteCond %{REQUEST_URI} .(wp-comments-post|wp-login)\.php*
    	RewriteCond %{HTTP_REFERER} !.*mertcangokgoz.com.* [OR]
    	RewriteCond %{HTTP_USER_AGENT} ^$
    	RewriteRule (.*) http://%{REMOTE_ADDR}/$ [R=301,L]
    </ifModule>

Tabi önceleri ben bunu sadece spam için kullanıyordum o yüzden kodum farklı idi spam sorununuzu eklentisiz çözmek istiyorsanız böyle bir imkanda mevcut.

    # BLOCK NO-REFERRER SPAM
    <IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteCond %{REQUEST_METHOD} POST
    RewriteCond %{HTTP_USER_AGENT} ^$ [OR]
    RewriteCond %{HTTP_REFERER} !(.*)mertcangokgoz.com(.*) [NC]
    RewriteCond %{REQUEST_URI} /wp-comments-post\.php [NC]
    RewriteRule .* - [F]
    </IfModule>
    # END WordPress

Aynı şekilde bir yönlendirme yapmak istemiyorsanız ve direk forbidden döndürmek istiyorsanız bi üstdeki kod işinize yaramaz pek fazla

    # BLOCK NO-REFERRER SPAM
    <IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteCond %{REQUEST_METHOD} POST
    RewriteCond %{HTTP_USER_AGENT} ^$ [OR]
    RewriteCond %{HTTP_REFERER} !(.*)mertcangokgoz.com(.*) [NC]
    RewriteCond %{REQUEST_URI} /wp-login\.php [NC]
    RewriteRule .* - [F]
    </IfModule>
    # END WordPress

Buda wp-logine düzenlenmiş POST req engelleme komutumuz .htacc ye ekliyoruz ve botların ayaklarını bir güzel kesiyoruz ne eklenti nede başka birşey kurmamıza gerek kalıyor.

Nginx Kullanıyorsanız Yapmanız gereken config dosyasına aşağıdaki satırları eklemek.Bu sayede sizlerde spamlardan kurtulabilirsiniz.

    location ~* (wp-comments-posts|wp-login)\.php$ {
            if ($http_referer !~ ^(https://mertcangokgoz.com) ) {
              return 405;
            }
          }
