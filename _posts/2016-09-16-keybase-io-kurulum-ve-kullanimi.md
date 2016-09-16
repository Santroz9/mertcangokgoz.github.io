---
layout: post
title: Keybase Kurulum ve Kullanımı
date: 2016-09-16
type: post
categories: genel
description: Keybase mesaj ve dosya şifreleme imkanı tanıyan bir servis olarak ilk 2015 de karşımıza çıktı beta olarak kullanılıyordu. Tasarımı ve özellikleri günümüze gelinceye kadar
---

Keybase mesaj ve dosya şifreleme imkanı tanıyan bir servis olarak ilk 2015 de karşımıza çıktı beta olarak kullanılıyordu. Tasarımı ve özellikleri günümüze gelinceye kadar değişti ve güzelleşti varlığından haberdar olduğum bu güzel servisi kullanmaya bende geçtiğimiz günlerde başladım key yönetimi bana zor geliyordu bunu kolaylaştırmak için bir yol ararken aklıma geldi ve kullanmaya başladım

Öncelikli olarak sisteme direk üye oldum tabi üye olmak için davetiye gerekiyor. Bunu sitenin kurucusundan temin edebilirsiniz yada bana iletişim kısmından mail atmanız ve davetiye göndermek için bir mail adresi belirtmeniz yeterli merak etmeyin bir çıkarım yok site bunun için bir ayrıcalık sunmuyor :)

davetiyeti bir şekilde tamamladığınızda siteye ilk üyeliğinizi yaparsınız, bunun hemen ardından sisteminiz için **keybase** sitesinin resmi uygulamasını kurmanız gerekir.

Debian, Ubuntu

```console
curl -O https://prerelease.keybase.io/keybase_amd64.deb
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f
run_keybase
```

Centos, RHEL

```console
sudo yum install https://prerelease.keybase.io/keybase_amd64.rpm
run_keybase
```

Bu uygulama ile;

- GPG key oluşturabilir
- GPG key Paylaşabilir
- Gizli yazışma yapabilir
- Dosya şifreleyebilir
- Gizli mail atabilirsiniz

Ayrıca uygulamada key yönetimi ve oluşturulması oldukça kolay, birden fazla anahtar üretirseniz yönetmede zorluk çekmeyeceksiniz. Ancak uygulamayı hemen kurar kurmaz direk kullanma imkanınız olsada bunu önermiyoruz. İlk olarak hesabınızı bir kaç yer aracılığı ile onaylamalısınız.

Bunun için;

- Twitter
- Github
- Reddit
- hackerne.ws
- coinbase

gibi yerler gerekiyor ayrıca varsa web sitenizi de site üzerinden onaylatmayı unutmayın. Böylelikle diğer insanlar ile takipleşebileceksiniz. Şimdi bir adet gpg key oluşturmamız gerekiyor bunun için

```console
keybase pgp gen --multi
```

Sizden bir takım bilgiler isteyecek bunları dolduruyorsunuz.

```console
# Enter your real name, which will be publicly visible in your new key: Mertcan GÖKGÖZ
# Enter a public email address for your key: mertcan.gokgoz@gmail.com
# Enter another email address (or <enter> when done):
# Push an encrypted copy of your new secret key to the Keybase.io server? [Y/n] Y
```

Keyimizi oluşturduk oluşturduğumuz key için bi sorgulama yapıyoruz.

```console
gpg --list-secret-keys
```

Daha önceki makalelerimdede görmüşsünüzdür. Zaten aynı keyi kullandığım için şu şekilde gözüküyor.

```console
/home/mertcan/.gnupg/secring.gpg
--------------------------------
sec   4096R/EF64ED4FF0199111 2016-08-25
uid                          Mertcan Gökgöz (Github GPG) <mertcan.gokgoz@gmail.com>
ssb   4096R/A1BDA15B77CF194F 2016-08-25
```

İlk aşamamız tamamlandı keyimiz oluştu ve keybase sistesine gönderildi. Şimdi bu keyiniz ile istediğinizi yapabilirsiniz. İster Maillerinizi `Enigmail` ile şifreleyin isterseniz keybase takipçisi olduğunuz arkadaşınız ile gizli bir şekilde mesajlaşın yada github adresinize keyi bağlayıp commitlerinizi onaylayın

Githubda onaylamak için şu şekilde bir yol izleyebilirsiniz.

```console
git config --global user.signingkey EF64ED4FF0199111
git config --global commit.gpgsign true
```

Şimdi GPG keyimiz ile mesajımızı şifreleyelim

```console
keybase pgp encrypt furkankalkan -s -m "mesajınız"
keybase pgp encrypt furkankalkan -i mesaj.txt
keybase pgp encrypt furkankalkan -i mesaj.txt -o sifreli.asc
echo 'mesajınız' | keybase pgp encrypt furkankalkan
```

Size bir mesaj geldi diyelim bunu şu şekilde açacaksınız

```console
keybase pgp decrypt -i mesaj.txt.asc           
keybase pgp decrypt -i mesaj.txt.asc -o mesaj.txt
cat mesaj.txt.asc | keybase pgp decrypt        
```

Oluşturduğunuz bu key ile dosya şifrelemek için

```console
gpg --output test.gpg --encrypt --recipient mertcan.gokgoz@gmail.com test.zip
```

Bunun dışında başka işlemlerde yapabilirsiniz elinizin altında `gpg` ve `keybase` uygulamaları mevcut artık biraz manpage okuyarak geri kalanını kendiniz de yapabilirsiniz.

Unutmadan bahsedeyim keybase uygulamasından kurtulmak istiyorsanız. Ne yapacam diye düşünmenize gerek yok direk olarak aşağıdaki işlemi yaparak gizli anahtarınızı elde edebilirsiniz. Siteye giriş yapıyorsunuz ve keyin **ID** bölümünün yanında yer alan `edit` tıklıyorsunuz.

![exportkey](/assets/exportkey.png)

Yukarıdaki resimdede gördüğünüz `Export my private key from Keybase` tıklıyorsunuz. Şifrenizi girdikten sonra artık gizli anahtarınız elinizde sisteminize istediğiniz bir isim ile kayıt edebilirsiniz. Ve daha sonra başka bir sisteme aktaracaksanızda aşağıdaki komutları çalıştırmanız yeterli

```console
gpg --allow-secret-key-import --import keybase-private.key
gpg --import keybase-public.key
```

öptüm bye <3
