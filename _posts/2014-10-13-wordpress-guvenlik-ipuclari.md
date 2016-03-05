---
layout: post
title: Wordpress Güvenlik İpuçları
date: 2014-10-13 13:50:03.000000000 +03:00
type: post
published: true
status: publish
categories: Güvenlik
description: Popülerliği yüksek olan Wordpress bildiğimiz gibi pek çok saldırıyada mağruz kalıyor.Peki biz blog sahipleri bu saldırılardan mümkün olduğunca
---
Popülerliği yüksek olan Wordpress bildiğimiz gibi pek çok saldırıyada mağruz kalıyor.Peki biz blog sahipleri bu saldırılardan mümkün olduğunca en az zarara uğrayarak nasıl paçayı sıyırabiliriz.İşte bugün sizlere bu konuda hakkınba bir kaç ufak bilgi biraz eklenti birazda tavsiye vereceğim aslında

Öncelikle Wordpress de güvenlik açıklarının çoğu temalardan kaynaklanmakta yani public edilmiş herhangi bir ücretli tema yada ücretsiz olarak dağıtılmış ancak popüler olan bir tema aynı oranda saldırıya mağruz kalmaktadır çünkü açıkları kullanarak sisteme sızabilecek

Cümlelerin farklı olduğunu bende fark ettim uzatmayalım.Liste Halinde açıklamaya çalışacağım

1.Dizinlerinizi koruyun misal aşağıdaki görüntü pek hoş değil dizinleriniz arasında gezen saldırdan hangi eklenti kullandığınızı ne tip dosyalarınız olduğunu kolaylıkla görebilir ve geliştireceği saldırıları bunlara göre şekillendirebilir.Bu gibi durumlardan kurtulmak için bu tip alt dizin ve dosyalar içerisine index.php oluşturup atınız böylelikle girildiği zaman direk bu şekilde gözükemeyecek...

![wordpressguvenlikipuclarigorsel1](/assets/wordpressguvenlikipuclarigorsel1.jpg)

2.Public Edilmiş açıkları takip edin.Evet yanlış duymadınız exploit sitelerinde gezmenizi istiyorum.Güvenlik açıklarına göz atacaksınız ve sitenizde kullandığınız eklentilerin,temaların vb araçların açıkları varmı bir göz atacaksınız size hacker olun demiyorum sitenizdeki durumu en iyi şekilde idare edin diyorum.Bunun için ise bir kaç site mevcut güvenle kullanabilirsiniz.

- [1337day Inj3ct0r](http://www.1337day.com/search)
- [Exploit-DB](http://www.exploit-db.com/)
- [Rapid7 Vulnerability](http://www.rapid7.com/db/)
- [CXSecurity](http://cxsecurity.com/exploit/)

3.Şifrelerinizi maximum uzunlukta ve karışık bir şekilde oluşturun yani şifreleriniz kolay tahmin edilebilir olmasın ve mümkünse özel karakterler içersin uzunluğu ise minimum 18 karakter olsun ki bruteforce saldırılarında sitenizi savunabilesiniz.

![wordpressguvenlikipuclarigorsel2](/assets/wordpressguvenlikipuclarigorsel2.jpg)

4.Çoğu site sahibinin atladığı belkide en önemli ayarlardan bir taneside wp-config.php içerisindeki salt kısmıdır.ne önemi var lan buranın diyenlerini elbet vardır bu şey cookielerin şifrelenmesinde rol oynar burayı boş bırakırsanız şifrelerinde cookielerinde çalınma riski artar kullanıcıların üye olduğu sisteminiz varsa ve aktif olarak kullanılıyorsa salt kısmını doldurmanızda fayda var doldururkende wordpressin [Salt Generator](https://api.wordpress.org/secret-key/1.1/salt/) Uygulamasını kullanabilirsiniz.

    define('AUTH_KEY', 'put your unique phrase here');
    define('SECURE_AUTH_KEY', 'put your unique phrase here');
    define('LOGGED_IN_KEY', 'put your unique phrase here');
    define('NONCE_KEY', 'put your unique phrase here');
    define('AUTH_SALT', 'put your unique phrase here');
    define('SECURE_AUTH_SALT', 'put your unique phrase here');
    define('LOGGED_IN_SALT', 'put your unique phrase here');
    define('NONCE_SALT', 'put your unique phrase here');

    Doldurulmuş hali

    define('AUTH_KEY', '_%8-Il!U&1C@s3tpDg=*bH,q4<szsNcb0T`d@J/z!a$-,LeNt]:PJ9%$&1;8Rw:H');
    define('SECURE_AUTH_KEY', '/1ES{FHH[>^A*oN8VAe1ygf^W| NOkw(W%4AizO&LcS<T<:Z{,rG$=]HX<+7(W0-');
    define('LOGGED_IN_KEY', 'n;pDaOUn,.jbcVP.DK*9X(`()IRm5.f_;]t_J$J|`HGB=A5?-VFja7M2Xw+vZsM7');
    define('NONCE_KEY', 'w_OwXHSPen+~V.q|fb.^xYB2}W)<qf1e`0t+2E}^; S4H+rx91+=~GqAsIP%~YUe');
    define('AUTH_SALT', 'z`]bH`HM-0A&e$q/>rM7`!.WqgM+|x8d/kW/Fp;K&?gk;r}MU@xS*^>d{bj-fw:|');
    define('SECURE_AUTH_SALT', '/8/CA+LJ-oZ=2pcDo{1&+uv~$+07)ks*|o$}Tw?a*V(:3-{/|U;t/B!vz,wC_k4U');
    define('LOGGED_IN_SALT', 'Wima~x]dK$Q9b7WiV>N#hgdRD- 6@{x2o*$`+kC=>R`D0?YLZTK=nybtqS`3ybmZ');
    define('NONCE_SALT', 'r/{2F-7U~4*!L^s=M~ZGv*EX}/m;>bb0,k_|oFpp?H3]xGM+;_8m_J^tSZJ}dft(');

5.Database ön ekini değiştirin ve benzersiz yapın benzersiz mevzusu özgünlüktür aslında yani aynı ön eki başka bi yerde rastlamanız imkansız nasıl olacak diyorsanız otomatik olarak üreteceksiniz linux sistemlerde bunu otomatik olarak yapabilirsiniz.

    NEWPREFIX=$(echo $RANDOM)
    sed -i "s/'wp_';/'${NEWPREFIX}_';/g" wp-config.php

Böylelikle benzersiz önekler üretebilir ve SQL injection saldırılarını en aza çekebilirsiniz.

6.Wordpress Güncelleştirmelerini takip edin.Çünkü wordpress devamlı kendini geliştiren ve güvenliğini bir o kadar üst seviyelere çeken bir CMS hal böyle olunca Güncel olmayan bir sistem hem sizin hemde kullanıcılarınızın bilgilerini riske atıyor.Ya kim uğraşacak güncellemekden bıktım diyorsanızda wp-config.php içerisine aşağıdaki kodu eklerseniz otomatik olarak güncelleştirmeler yapılır.

    define( 'WP_AUTO_UPDATE_CORE', true );

tabi bununla beraber eklentilerinizi ve temalarınızı güncelde tutmanız önemli bu konudada otomatik güncellemeyi açabilirsiniz.

    add_filter( 'auto_update_plugin', '__return_true' );
    add_filter( 'auto_update_theme', '__return_true' );

7.Dosya izinlerinize çok dikkat edin sakın olaki dışarıdan dosya atılmasına izin veren bir permission ayarı olmasın 777 sakın olaki kullanmayın

- Tüm dizinleri 755 ve(veya) 750 yapın
- Tüm dosyaların izinlerini 644 ve(veya) 640 yapın
- wp-config.php dosya izinlerini 600 yapın

8.Hata gösterimini kapatın.Böylelikle hackerların hatalara göre izleyeceği yolları kapatmış olursunuz ve saldırgan kişinin biraz daha fazla uğraşmasını sağlarsınız.Aşağıdaki kodları wp-config.php ye ekleyiniz...

    error_reporting(0);
    @ini_set(‘display_errors’, 0);

9. htacc kurallarıyla sisteminizi biraz daha koruyabilirsiniz.bunun için yapmanız gerekenler

wp-config.php ulaşılamasın diyorsanız

    <files wp-config.php>
    order allow,deny
    deny from all
    </files>

wp-logine girişleri yasaklayıp sadece kendi ipnize ayarlıyorsunuz böylelikle %10 luk bir güvenlik artışı sağlıyoruz.

    <Files wp-login.php>
    order deny,allow
    Deny from all
    # sisteme girecek ip adresi
    allow from 94.22.41.xxx
    </Files>

wp-includes klasörünüzü koruyun

    <IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /
    RewriteRule ^wp-admin/includes/ - [F,L]
    RewriteRule !^wp-includes/ - [S=3]
    RewriteRule ^wp-includes/[^/]+.php$ - [F,L]
    RewriteRule ^wp-includes/js/tinymce/langs/.+.php - [F,L]
    RewriteRule ^wp-includes/theme-compat/ - [F,L]
    </IfModule>

htacc ile htacc yi koruyacağız delilik gibi gelecek ama evet yapacağız

    <Files .htaccess>
    order allow,deny
    deny from all
    </Files>

10.Bruteforce saldırılarına karşı 2FA kullanabilirsiniz böylelikle cep telefonunuzdan üreteceğiniz kod ile sitenize girişleri zorlaştırabilirsiniz.brute-force saldırıları artık korkunuz olmayacak kullanabileceğiniz sistemler ise;

- [Google Authenticator](http://wordpress.org/plugins/google-authenticator/ "Google Authenticator")
- [Clef](https://getclef.com/ "Clef")
- [Clockwork SMS](http://wordpress.org/plugins/clockwork-two-factor-authentication/ "Clockwork SMS")
- [Duo Two-Factor Authentication](http://wordpress.org/plugins/duo-wordpress/ "Duo Two-Factor Authentication")

![two-step-authorizationgorsel1](/assets/two-step-authorizationgorsel1.jpg)

11.Güvenlik eklentisi ile web sitenizin gücüne güç katın firewall,2Fa,Virüs taraması vb özellikleri ile sisteminizi koruyabilirsiniz. [Ulaşmak için Tıklayın](https://wordpress.org/plugins/wordfence/)

![wordfencegorsel1](/assets/wordfencegorsel1.jpg)
