---
layout: post
title: Cpanel Sunuculara mod_pagespeed Kurulumu
date: 2015-05-22 12:11:49.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Mod_pagespeed bilindiği üzere açık kaynak kodlu sunucu taraflı bir performans uygulamasıdır apache ve nginx web serverlarında sorunsuz bir şekilde
---

Mod\_pagespeed bilindiği üzere açık kaynak kodlu sunucu taraflı bir performans uygulamasıdır apache ve nginx web serverlarında sorunsuz bir şekilde çalışmaktadır.Geçtiğimiz yıllarda sitelerin hızlarını iyileştirmek adına ortaya çıkmıştır.panelsiz kullanılan sunucular için derlemesi oldukça kolaydır.Ancak işin içine panel girdiği zaman iş biraz karışıyor ama buradada cpanelin bize sağlamış olduğu güzellikde bulunuyor.Lafı fazla uzatmanın anlamı yok

<iframe width="640" height="360" src="https://www.youtube.com/embed/6uCAdQSHhmA" frameborder="0" allowfullscreen></iframe>

Videoyu izleyerek teknik detaylara ve birkaç ufak ipucuna göz atabilirsiniz.

İlk olarak scripti sisteme dahil edelim sonrasında uzun bir süre rardan çıkartma ve yükleme işlemi yapacağız zaman şimdiden hazırlıklı olun

    /usr/local/cpanel/3rdparty/bin/git clone https://github.com/pagespeed/cpanel.git /tmp/pagespeed/

dosyamız oluştu şimdi sıra bunları rardan çıkartıp işleme geçmeye geldi

    cd /tmp/pagespeed/Easy
    tar -zcvf Speed.pm.tar.gz pagespeed
    mkdir -p /var/cpanel/easy/apache/custom_opt_mods/Cpanel/Easy
    mv Speed.pm Speed.pm.tar.gz -t /var/cpanel/easy/apache/custom_opt_mods/Cpanel/Easy/
    cd && rm -rf /tmp/pagespeed

Bu aşamadan sonra WHM paneline geçiş yapıyorsunuz EasyApache altında mod\_pagespeed seçeneğini göreceksiniz.Bu şekilde kurulumu tamamlıyorsunuz ben böyle yapmak istemiyorum kardeşim ben komut satırı ile yapıcam dersenizde

    /scripts/easyapache

Komutunu verip apacheyi ve diğer bileşenlerini tekrar compile edip işinize gücünüze bakabilirsiniz.Sunucunuzu yeniden başlatmayı unutmayınız.Ayarlamalarını yapacağınız dizin ise gözünüze çarpmazsa hemen söyleyeyim **/usr/local/apache/conf/** dizini içerisinde bulunan **pagespeed.conf** Ayarlamaları yaparken kullanacağınız yönergeler ise;

- [Modül Ayarları](https://developers.google.com/speed/pagespeed/module/configuration)
- [Modül Filtreleri](https://developers.google.com/speed/docs/mod_pagespeed/config_filters)

Kullanabileceğiniz bir **pagespeed.conf** yapılandırması

    LoadModule pagespeed_module modules/mod_pagespeedi_ap24.so


        ModPagespeed on
    ModPagespeedFetchWithGzip on
    SetOutputFilter DEFLATE

        AddOutputFilterByType MOD_PAGESPEED_OUTPUT_FILTER text/html

    ModPagespeedFileCachePath "/var/mod_pagespeed/cache/"
    ModPagespeedGeneratedFilePrefix "/var/mod_pagespeed/files/"

    ModPagespeedRewriteLevel PassThrough

    ModPagespeedFileCacheSizeKb 102400
    ModPagespeedFileCacheCleanIntervalMs 3600000
    ModPagespeedLRUCacheKbPerProcess 1024
    ModPagespeedLRUCacheByteLimit 16384
    ModPagespeedCssInlineMaxBytes 2048
    ModPagespeedImageInlineMaxBytes 2048
    ModPagespeedCssImageInlineMaxBytes 2048
    ModPagespeedJsInlineMaxBytes 2048
    ModPagespeedCssOutlineMinBytes 3000
    ModPagespeedJsOutlineMinBytes 3000

    ModPagespeedEnableFilters extend_cache,combine_css,move_css_to_head,rewrite_javascript,rewrite_images,add_head,rewrite_css,collapse_whitespace,remove_comments,remove_quotes,sprite_images,convert_meta_tags
    ModPagespeedRespectVary on


              SetHandler mod_pagespeed_beacon



            Order allow,deny
            Allow from localhost
            Allow from 127.0.0.1
            SetHandler mod_pagespeed_statistics


        ModPagespeedMessageBufferSize 100000

            Allow from localhost
            Allow from 127.0.0.1
            SetHandler mod_pagespeed_message


            Allow from localhost
            Allow from 127.0.0.1
            SetHandler mod_pagespeed_referer_statistics

Test etmek için ise sisteminize GET Requesti atmanız yeterli Header içerisinde " **X-Mod-Pagespeed**" ile başlayan bir bilgi görüyorsanız modül sorunsuz çalışıyor demektir.
