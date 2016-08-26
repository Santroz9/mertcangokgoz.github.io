---
layout: post
title: Github'da GPG Kullanımı
date: 2016-08-26
type: post
categories: linux
description: Github Bir süre önce sisteme GPG özelliğini eklemiş ve duyurmuştu bu özellik sayesinde yaptığımız commit işlemlerini basit bir şekilde onaylı hale getirebiliyor
---

Github Bir süre önce sisteme GPG özelliğini eklemiş ve duyurmuştu bu özellik sayesinde yaptığımız commit işlemlerini basit bir şekilde onaylı hale getirebiliyor ve imzalıyoruz. Böylelikle commiti sizin yaptığınız sistemde güzel bir şekilde onaylanmış oluyor. Kontrol sistemi olarak getirmişler zaten

Şimdi GPG yardımıyla yeni bir anahtar oluşturmamız gerekiyor.

```console
gpg --gen-key
```

Komutundan sonra size bol miktarda sorular soracak bunları aşağıdaki örneğe göre düzenleyin. Size Mail sorduğu zaman github da üye olurken kullandığınız ve sistemde onaylı olan maili yazmayı unutmayın. Github tarafından önerilen anahtar uzunluğu 4096 bit lütfen daha aşağılarını seçmeyin

Ayrıca Size oluşturma sırasında `passphrase` soracak bu sizin gizli parolanız bunu hatırlayabileceğiniz bir şeyler yapmanızda fayda var sakın ola ki **boş geçmeyin mutlaka parolanızı oluşturun.**

```console
gpg (GnuPG) 1.4.20; Copyright (C) 2015 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Please select what kind of key you want:
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
Your selection? 1
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048) 4096
Requested keysize is 4096 bits
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 0
Key does not expire at all
Is this correct? (y/N) y

You need a user ID to identify your key; the software constructs the user ID
from the Real Name, Comment and Email Address in this form:
    "Heinrich Heine (Der Dichter) <heinrichh@duesseldorf.de>"

Real name: Mertcan Gökgöz
Email address: mertcan.gokgoz@gmail.com
Comment: Github GPG
You are using the `utf-8' character set.
You selected this USER-ID:
    "Mertcan Gökgöz (Github GPG) <mertcan.gokgoz@gmail.com>"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
```

Anahtarınız sisteminizin kriptografik işlemleri yapabilme kabiliteyine göre değişiklik gösterecek süre bakımından birşey söyleyemem ama 1 dk yı geçeceğinide hiç sanmam

Anahtarın uzun İD bilgisini döndürmemiz gerekiyor bunun için

```console
gpg --list-secret-keys --keyid-format LONG
```

Çıktısı aşağıdaki gibi olacaktır.

```console
/home/mertcan/.gnupg/secring.gpg
--------------------------------
sec   4096R/EF64ED4FF0199111 2016-08-25
uid                          Mertcan Gökgöz (Github GPG) <mertcan.gokgoz@gmail.com>
ssb   4096R/A1BDA15B77CF194F 2016-08-25
```

Şimdi burada alınması gereken şey `sec` kısmındaki uzun olan id yi almak ve şu şekilde düzenlemek

```console
gpg --armor --export EF64ED4FF0199111
```

Size `-----BEGIN PGP PUBLIC KEY BLOCK-----` ile başlayan ve `-----END PGP PUBLIC KEY BLOCK-----` ile biten bir dosya döndürmüş olacak başlangıç ve bitiş tagları ile birlikte kopyalayıp githubda ayarlar sekmesinde yer alan GPG keys kısmına gireceksiniz.

[Şu şekilde](https://help.github.com/articles/adding-a-new-gpg-key-to-your-github-account/) yapabilirsiniz. Sistem anahtarınızı onayladığında ise commit işlemlerinizi artık bu anahtar ile yapabileceksiniz.

Kullanacağınız github reposuna geçiş yapıyorsunuz değişikliklerinizi uyguladıktan sonra normal commit parametrenize `-S` ekliyorsunuz ve commit işlemini başlatıyorsunuz.

```console
git commit -S -m "mesajınız"
```

Bu aşamada aşağıdaki gibi bir hata vermesi lazım çünkü anahtarımızı tanıtmadık

```console
gpg: skipped "MertcanGokgoz <mertcan.gokgoz@gmail.com>": secret key not available
gpg: signing failed: secret key not available
error: gpg failed to sign the data
fatal: failed to write commit object
```

Anahtarı bana tanıtmadın ki sen nereye ekleme yapmaya çalışıyorsun birader diyor bize bizde bu aşamayı şu şekilde geçiyoruz.

```console
git config --global user.signingkey EF64ED4FF0199111
```

Artık bu sorunuda çözdüğümüze göre normal bir şekilde commit işlemini gerçekleştirebiliriz. GPG anahtarını oluştururken girmiş olduğunuz şifre ile onaylama işleminide gerçekleştirerek. Hemen ardından `git push` komutu ile değişiklikleri sisteme işleyeceğiz.

Gönderdiğiniz her yeni commit mesajında `commits` kısmında şu şekilde gözükecek.

![commitbro](/assets/signedcommit.png)

öptüm bye <3
