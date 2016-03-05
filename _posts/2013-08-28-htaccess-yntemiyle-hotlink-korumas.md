---
layout: post
title: Htaccess Yöntemiyle Hotlink Koruması
date: 2013-08-28 02:36:13.000000000 +03:00
type: post
published: true
status: publish
categories: Güvenlik
description: Hotlink bir web sitesinin başka web sitelerinde kayıtlı bulunan resim,pdf vb dosyaların kendi sayfaları içinde göstermesidir.Hotlink aslında htaccess
---

Hotlink bir web sitesinin başka web sitelerinde kayıtlı bulunan resim,pdf vb dosyaların kendi sayfaları içinde göstermesidir.Hotlink aslında bant genişliği hırsızlığıdır ve sınırlı barındırma kullanıyorsanız bu size pahalıya patlar.genellikle site sahipleri kendi sunucularında içeirk barındırmazlar ve başka sunuculardaki resim vb içerikleri dışarıdan link yardımıyla kullanmak isterler biz buna kısacası “ **ÇALMAK** ”diyoruz.

“Girdiği evde çalacak bir şey bulamayan hırsız ne çalar? Bozuk çalar.”

### Neyse ki bu sorundan kolaylıkla kurtulabiliriz yapmanız gereken sitenizin kök dizinindeki htaccess dosyasına aşağıdaki satırları eklemek

    # Hotlink koruma www.mertcangokgoz.com
    <IfModule mod_rewrite.c>
    RewriteCond %{HTTP_REFERER} !^$
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteCond %{REQUEST_FILENAME} .(gif|jpe?g?|png)$ [NC]
    RewriteCond %{HTTP_REFERER} !^https?://([^.]+.)?example. [NC]
    RewriteRule .* - [F]
    </IfModule>

#### Example kısmını kendi sitenizin ismi olarak değiştirin ardından hotlink yapılmasını engellemek istediğiniz dosya uzantılarını belirleyin.

    RewriteCond %{REQUEST_FILENAME} .(gif|jpe?g?|png|flv|mp3|mov|mkv)$ [NC]

Sitenizde bulunan ve **hotlinki** engellemek istediğiniz dosya uzantılarını yukarıdaki gibi yapmanız yeterlidir.çalmak isteyenin karşısına 403 Forbidden uyarısı gelecektir.işe biraz eğlence katmak isterseniz yada o kişiyle dalga geçmek isterseniz. **RewriteRule** yi değiştirerek sayfada sizin belirlediğiniz bir resmin gözükmesini sağlayabilirsiniz.

    RewriteRule .* http://example.com/hotlink.bmp [R,L]

##### Yukarıdaki komutu eklediğimiz anda sitesine eklediği anda karşısına sizin belirlemiş olduğunuz resim çıkacaktır.
