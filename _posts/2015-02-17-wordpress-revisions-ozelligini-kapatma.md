---
layout: post
title: WordPress Revisions özelliğini kapatma
date: 2015-02-17 12:05:20.000000000 +02:00
type: post
published: true
status: publish
categories: programlama
description: Wordpress eklenen içeriğin kaç kere düzenlendiği yada revize edildiği konusunda ufak bir bilgi tutulur belki fark etmişsinizdir yazıyı yayımlamadan
---
**Wordpressde** eklenen içeriğin kaç kere düzenlendiği yada revize edildiği konusunda ufak bir bilgi tutulur belki fark etmişsinizdir yazıyı yayımlamadan öncede çıkar karşımıza veritabanına ek yük bindirmek dışında bir zararı yok ama kapatalım gitsin her mysql sorgusu bizim için değerli

**wp-config.php** herhangi bir editör ile açıp

    define('WP_POST_REVISIONS', false);

ekliyorsunuz ve özelliği kapatmış oluyorsunuz.kapatmak istemeyen arkadaşlar olacaktır ama limitlemek isteyeceklerdir belki bunun içinde yapılması gereken

    define('WP_POST_REVISIONS', true);
    define('WP_POST_REVISIONS', 3);

_ilk 3 düzenlemeyi yada revizyonu göstermek için ayarlı 3 den sonraki düzenlemeler kesinlikle gösterilmez yansıtılmaz bile_
