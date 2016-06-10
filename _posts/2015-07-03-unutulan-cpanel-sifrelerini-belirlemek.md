---
layout: post
title: Unutulan Cpanel Şifrelerini Belirlemek
date: 2015-07-03 14:40:24.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Aşağıda vereceğim olan php dosyasını ilgili cpanel bileşeni ile çalıştırmanız sonucunda sistemdeki Cpanel şifrelerini görebilirsiniz.Böylelikle
---

Aşağıda vereceğim olan **php** dosyasını ilgili **cpanel** bileşeni ile çalıştırmanız sonucunda sistemdeki **Cpanel** şifrelerini görebilirsiniz.Böylelikle Unutulan Cpanel şifrelerini kurtarmış olacaksınız.yada sistemdeki kayıp şifreleri göreceksiniz.Sistem yöneticisi iseniz yedeklemek için bile bu yöntemi kullanabilirsiniz.

### Kullanımından oluşabilecek sorunlardan kullanıcı sorumludur.

Komutu çalıştırabilmeniz için aşağıdaki parametreyi kullanabilirsiniz.

Komut(root yetkileri ile): /usr/local/cpanel/3rdparty/bin/php /var/www/recovery.php

**Dosya** : revovery.php
```php
    <?php

    if(getmyuid() != 0){ die('Yonetici Olarak Calistirmaniz Gerekmektedir.'); }

    foreach(glob('/var/cpanel/sessions/raw/*') as $file){
    	$icerik = file_get_contents($file);
    	if(preg_match("/user=(.*)/" , $icerik , $m1) && preg_match("/pass=(.*)/" , $icerik , $m2)){
    		$sonuc[] = "USER: {$m1[1]}\nPASS: {$m2[1]}\n\n";
    	}
    }

    $sonuc = array_unique($sonuc);
    echo implode('',$sonuc);
    ?>
```

yada direk olarak aşağıdaki dosyadan çağırabilirsiniz.

```php
    #!/usr/local/cpanel/3rdparty/bin/php
    <?php

    if(getmyuid() != 0){ die('Yonetici Olarak Calistirmaniz Gerekmektedir.'); }

    foreach(glob('/var/cpanel/sessions/raw/*') as $file){
    	$icerik = file_get_contents($file);
    	if(preg_match("/user=(.*)/" , $icerik , $m1) && preg_match("/pass=(.*)/" , $icerik , $m2)){
    		$sonuc[] = "USER: {$m1[1]}\nPASS: {$m2[1]}\n\n";
    	}
    }

    $sonuc = array_unique($sonuc);
    echo implode('',$sonuc);
    ?>
```

Bu sayede sistemde kayıtlı olan kullanıcıları ve buna bağlı olarak şifrelerini'de görebilirsiniz.
