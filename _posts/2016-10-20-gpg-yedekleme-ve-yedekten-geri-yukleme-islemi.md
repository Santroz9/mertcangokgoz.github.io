---
layout: post
title: GPG Yedekleme Ve Yedekten Geri Yükleme İşlemi
date: 2016-10-20
type: post
categories: linux
description: Sık sık gpg anahtarını yedekleyip geri yükleyen birisiydim. Sorunlar karşısında çözüme ulaşmak yerine formatı atıp geçerdim
---

Sık sık gpg anahtarını yedekleyip geri yükleyen birisiydim. Sorunlar karşısında çözüme ulaşmak yerine formatı atıp geçerdim ancak artık öyle değil. Ancak bu işlemleri yaparken oldukça fazla vakit geçiriyordum ya bu nasıl yedeklenecek yada nasıl yedekten geri yüklenecek derken bir kaç yöntem keşfettim google amca sağolsun...

public ve secret anahtarları bununla birlikte trust veritabanının yedeklenmesi işlemi

```
cp ~/.gnupg/pubring.gpg /media/mertcan/USB1/GPG/
cp ~/.gnupg/secring.gpg /media/mertcan/USB1/GPG/
cp ~/.gnupg/trustdb.gpg /media/mertcan/USB1/GPG/
gpg --export-ownertrust > mertcangokgoz-ownertrust-gpg.txt
```

yedeklenen bu dosyaların geri yüklenmesi işlemi

```
cp /media/mertcan/USB1/GPG/*.gpg ~/.gnupg/
gpg --import-ownertrust mertcangokgoz-ownertrust-gpg.txt
```

2.yöntem olarak kendi keyiniz dışındakilerde sıkıntınız yoksa yani yedeklemek istemeyecekseniz.

```
gpg -a --export admin@mertcangokgoz.com > mertcangokgoz-public-gpg.key
gpg -a --export-secret-keys admin@mertcangokgoz.com > mertcangokgoz-secret-gpg.key
gpg --export-ownertrust > mertcangokgoz-ownertrust-gpg.txt
```

yedeklediklerinizden geri yüklemek için ise

```
gpg --import mertcangokgoz-secret-gpg.key
gpg --import-ownertrust mertcangokgoz-ownertrust-gpg.txt
```

öptüm bye <3
