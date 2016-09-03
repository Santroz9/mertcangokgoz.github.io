---
layout: post
title: SSH Kullanımı
date: 2016-09-03
type: post
categories: linux
description: SSH bilgisayarınızdan uzak sisteme güvenli bir şekilde bağlanmak için kullanılan bir uygulamadır. SSH ile komutlar verebilir, kontroller yapar ve dosya transferi
---

SSH bilgisayarınızdan uzak sisteme güvenli bir şekilde bağlanmak için kullanılan bir uygulamadır. SSH ile komutlar verebilir, kontroller yapar ve dosya transferi yapabilirsiniz. Güvensiz tüm işlemlerinizi SSH üzerinden yaparak güvenli bir hale getirebilirsiniz.

Linux üzerinde SSH bağlantısını OpenSSH uygulaması ile sağlanmaktadır ve tüm linux dağıtımlarına ön tanımlı olarak gelmektedir. Sistemin hayati uygulamalarından bir tanesidir. Kurulu gelmeyen bir sistem olursa ki öyle bir lüx yok kendinizde SSH uygulamasını kurabilirsiniz.

Kullandığınız sürümü öğrenmek isterseniz

```console
ssh -V
```

Ubuntu'da en son sürüm ise şu şekildedir

```console
OpenSSH_7.2p2 Ubuntu-4ubuntu2.1, OpenSSL 1.0.2g-fips  1 Mar 2016
```

SSH bağlanmak için Linux dağıtımlarında her hangi bir uygulama kurulmasına gerek yoktur. Aşağıdaki komutun çalıştırılması ile çok kolay bir şekilde sistemler arası bağlantı sağlanabilir.

```console
ssh root@sunucuip -p port numarası
```

Windows sistemlerde ise durum biraz daha farklıdır bağlantı sağlayabilmek için uygulama kurulması gerekmektedir bunun için ise `putty` uygulamasından faydalanılabilir.

![puttygorsel](/assets/puttygorsel1.jpg)

Her iki sistemde de ilk defa bağlantı kurduğunuz anda bağlantı kurduğunuz karşı bağlantı tarafının RSA keyi bizim bilgisayarımızdaki `~/.ssh/known_hosts` klasörüne kayıt edilir. Bir sonraki sefer bağlantı sağlanacak ise bu klasöre bakılır ve karşı sistemde bilgiler değişmediği sürece aynı uyarıyı sistem tekrar yapmaz.

```console
mertcan@mertcan:~$ ssh root@193.46.10.100
The authenticity of host '193.46.10.100 (193.46.10.100)' can't be established.
ECDSA key fingerprint is SHA256:I7pDQA9cxozpJvhkvBV4PuVwvokDz+VDv7v8L21OahY.
Are you sure you want to continue connecting (yes/no)?
```

Bunun dışında SSH için alias tanımlayabilirsiniz. Bu sayede bağlantılarınızı yönetebilirsiniz sizin açınızdan kolaylık olacaktır.

```console
sudo nano /etc/ssh/ssh_config
```

İçerisini bağlanacağız sistemlere göre düzenleyebilirsiniz.

```console
Host venus
    HostName 193.46.10.100
    Port 4560
    User mertcan
Host github.com
    IdentityFile ~/.ssh/id_rsa
```

Bunun gibi düzenleyip kayıt ettiğiniz taktirde artık bağlantınızı şu şekilde yapabileceksiniz

```console
ssh venus
```

öptüm bye <3
