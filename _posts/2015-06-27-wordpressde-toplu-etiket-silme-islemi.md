---
layout: post
title: Wordpress'de Toplu Etiket Silme İşlemi
date: 2015-06-27 13:28:37.000000000 +03:00
type: post
published: true
status: publish
categories: programlama
description: Wordpress sitenizde toplu olarak tüm etiketleri silmek isteyebilirsiniz.Bunun için yapacaklarınız basittir ilk olarak googleden /tag/ dizinini
---

**Wordpress** sitenizde toplu olarak tüm etiketleri silmek isteyebilirsiniz.Bunun için yapacaklarınız basittir ilk olarak googleden **/tag/** dizinini kaldırtma isteğinde bulunursunuz.Ardından ister meta etiketi istersenizde **robots.txt** ile googlenin tekrardan indexlemesinin önüne geçersiniz.

Spam bir şekilde etiket eklediyseniz ve siteniz uzun vadede çöp olmasın istiyorsanız uygulayabilirsiniz.Burada yapacağımız yöntemin geri dönüşü yoktur o yüzden veritabanınızın tam olarak bi yedeğini almayı unutmayınız oluşabilecek sorunlardan sonra gelipde bana veritabanı uçtu demeyin herşey sizin elinizde

Komutumuz aşağıdaki gibidir.Veritabanı ön ekiniz farklı ise değiştirmeyi sakın unutmayınız **wp\_** kısmını veritabanınızdaki ön ekinize göre değiştiriniz.Veritabanımızda ise aşağıdaki tablolar yapacağımız işlemden etkilenecektir.

- wp\_terms
- wp\_taxonomy
- wp\_relationships

Önce veritabanını seçiyoruz.

    use website_gkl

Veritabanını seçtikten sonra gerekli olan kodumuz şu şekilde düzenliyoruz.

    DELETE t, tr, tt
    FROM wp_terms t
    INNER JOIN wp_term_taxonomy tt ON t.term_id = tt.term_id
    INNER JOIN wp_term_relationships tr ON tt.term_taxonomy_id = tr.term_taxonomy_id
    WHERE tt.taxonomy = 'post_tag'

kodu çalıştırdığımız zaman çıktısı olarak işte şu kadar satır etkilendi diyecek yönetim panelinden kontrol ettiğimiz zaman ise içeriklerdeki ve normal olarak veritabanında tutulan tüm etiketlerin silindiğini göreceğiz eğer bu şekilde değilde yönetim panelinden el ile teker teker silmiş olsaydık içeriklerdeki taglar var gibi gözükecekti ancak öyle bir etiket olmayacağı için sorunlara neren olabilirdi.
