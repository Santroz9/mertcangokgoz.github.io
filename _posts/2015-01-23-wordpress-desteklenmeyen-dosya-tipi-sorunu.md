---
layout: post
title: Wordpress desteklenmeyen dosya tipi sorunu
date: 2015-01-23 15:49:36.000000000 +02:00
type: post
published: true
status: publish
categories: Programlama
description: Wordpress dünya üzerinde en çok kullanılan CMS(içerik yönetim sistemi)bir tanesidir hal böyle olunca en ummadık hatalarda karşınıza çıkabilir.Bunlardan
---
**Wordpress** dünya üzerinde en çok kullanılan **CMS** (içerik yönetim sistemi)bir tanesidir hal böyle olunca en ummadık hatalarda karşınıza çıkabilir.Bunlardan bir taneside "this file type is not permitted for security reasons" bu hatayı wordpressin ön tanımlı dosya formatları dışında **dosya** yüklüyorsanız alacaksınız peki ön tanımlı formatlar neler


- .jpeg
- .jpg
- .png
- .gif
- .pdf
- .doc, .docx
- .ppt, .pptx, .pps, .ppsx
- .odt
- .xls, .xlsx
- .mp3
- .m4a
- .ogg
- .wav
- .mp4, .m4v
- .mov
- .wmv
- .avi
- .mpg
- .ogv
- .3gp
- .3g2


Yukarıdaki dosya uzantıları dışında dosya eklerseniz yada eklemeye çalışırsanızda yukarıda bahsi geçen hatayı alırsınız.Ama bu hatadan kurtulmak oldukça basit tek yapmanız gereken mime type belirlemek ve sisteme tenıtmak

İlk olarak **wp-config.php** dosyanızı açıyorsunuz ve içerisine şu satırı ekliyorsunuz.

    define('ALLOW_UNFILTERED_UPLOADS', true);

Kayıt edip çıkıyorsunuz ardından mime type belirleme aşamasına geldik tüm dosya tiplerine uploadı açmak riskli olduğu için kendiniz tanımlama yapmalısınız.Bu tanımlamayıda tema klasörünüz içinde bulunan **functions.php** ye yapacaksınız.

    function enable_extended_upload ( $mime=array() ) {

       $mime['gz'] = 'application/x-gzip';
       $mime['zip'] = 'application/zip';
       $mime['rtf'] = 'application/rtf';
       $mime['ppt'] = 'application/mspowerpoint';
       $mime['ps'] = 'application/postscript';
       $mime['flv'] = 'video/x-flv';

       unset( $mime['exe'] );
       unset( $mime['bin'] );

       return $mime;
    }

    add_filter('upload_mimes', 'enable_extended_upload');

_Bu yaptığınız ayarlardan sonra exe ve bin dosyaları hariç yukarıda tanımladığınız tüm dosya uzantıları sistem tarafından kabul edilecek._
