---
layout: post
title: Otomatik güncellemeyi açma veya kapatma
date: 2015-02-20 13:45:51.000000000 +02:00
type: post
published: true
status: publish
categories: Programlama
description: Wordpress de uzun bir süre önce otomatik güncelleme özelliği gelmişti pek çok arkadaşda bundan dert yanıyordu yok tema uyumsuzlukları eklenti
---
**Wordpress** de uzun bir süre önce otomatik güncelleme özelliği gelmişti pek çok arkadaşda bundan dert yanıyordu yok tema uyumsuzlukları eklenti hataları vs uğraşıyoruz **otomatik** güncellemeyi nasıl kapatabiliriz deniliyordu wordpress ekibi sizleri düşünerek ufak bir iyilik yapmışlar aslında

**wp-config.php** herhangi bir editör ile açıp içerisine

Eklentiler ve Temaların güncellenmesini **kapatmak** için

    define('AUTOMATIC_UPDATER_DISABLED', false); //tekrar açmak için true yapmanız yeterli

Wordpress Ana dosyalarının güncellenmesini **kapatmak** için

    define('WP_AUTO_UPDATE_CORE', false); //tekrar açmak için true yapmanız yeterli

bu şekilde **wordpressin** otomatik yapacağı güncellemelerin önüne geçebilirsiniz.Yapmanızı pek tavsiye etmiyorum güncel olmayan bir sistemde güvenlik açıkları fazlasıyla olacaktır dikkat etmekde fayda var
