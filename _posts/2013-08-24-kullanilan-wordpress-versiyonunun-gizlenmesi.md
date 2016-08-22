---
layout: post
title: Kullanılan wordpress versiyonunun gizlenmesi
date: 2013-08-24
type: post
categories: guvenlik
description: Merhaba arkadaşlar bu makalemizde size kullandığınız wordpress versiyonunu nasıl gizliyeceğinizi göstereceğim bunu niye yapıyoruz diye soruyorsanız
---

Merhaba arkadaşlar bu makalemizde size kullandığınız wordpress versiyonunu nasıl gizliyeceğinizi göstereceğim bunu niye yapıyoruz diye soruyorsanız güvenlik açısından gereklidir saldırgan sitemizde **exploit** denemeleri yapmak isteyecektir.Bu tip saldırılardan bir nebze korunmak için ve saldırganı biraz daha uğraştırmak için kullanmış olduğunuz wordpress versiyonunu gizlememiz gerekmektedir.Bu işlem yapıldıktan sonra versiyonu size dahil gözükmeyecek ve saldırganlardan kolaylıkla kurtulmuş olacaksınız.

Yapmanız gerekenler **wp-content** dosyası içerisinde temanızda bulunan `functions.php` klasörümüzü gereken bilgileri eklememizdir.

```php
function wptao_disable_version_info() { return ''; }
add_filter('the_generator', 'wptao_disable_version_info');
```

yukarıdaki kodları `functions.php` dosyasına `<?php` den hemen sonra eklemeniz ve kayıt edip çıkmanızdır. Bu işlemleri yaptıktan sonra web sitenizde kullanmış olduğunuz wordpress versiyonu asla gözükmeyecektir.

Dipnot: bazı paralı temalarda `functions.php` klasörü ioncube aracılığıyla şifrelenmiş olacaktır.Hal böyle olunca yukarıdaki kodları ekliyemeyeceğiniz anlamına gelmektedir.eklemek isterseniz de temanızı düzenleyen ile iletişime geçiniz
