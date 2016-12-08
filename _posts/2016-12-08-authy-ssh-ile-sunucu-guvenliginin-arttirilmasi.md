---
layout: post
title: Authy SSH İle Sunucu Güvenliğinin Arttırılması
date: 2016-12-08
type: post
categories: guvenlik
description: Sistemlerinizde güvenliği biraz daha arttırmak için Authy web sitesinin bizlere sunmuş olduğu uygulamayı kullanacağız ve sistemlerimizde 2FA
---

Sistemlerinizde güvenliği biraz daha arttırmak için Authy web sitesinin bizlere sunmuş olduğu uygulamayı kullanacağız ve sistemlerimizde 2FA doğrulamayı aktif etmiş olacağız böylelikle sistemlerinize girişte Cep telefon numaranıza gelen veyahut da uygulama ile oluşturulmuş şifreyi girmeniz gerekecektir. Aksi durumda sistemlere giriş yapabilme gibi bir imkanınız bulunmamaktadır.

Önceliklik olarak bu kuruluma başlamadan önce [https://www.authy.com/signup](https://www.authy.com/signup) adresinden üye olmanız ve size verilen **token** bilgilerini kayıt etmeniz gerekmektedir. Kurulumu başarılı bir şekilde tamamladığınızda sistemlerinize girmek için 2FA doğrulaması yapmanız gerekmektedir.

## Kurulum İşlemi

Terminalde aşağıdaki komutları yazın:

```
curl -O 'https://raw.githubusercontent.com/authy/authy-ssh/master/authy-ssh'
sudo bash authy-ssh install /usr/local/bin
```

Ardından, kullanıcı için iki faktörlü kimlik doğrulamayı etkinleştirin:
```
sudo /usr/local/bin/authy-ssh enable `whoami` <your-email> <your-country-code> <your-cellphone>
```
Test yapıyoruz ve her şeyin çalıştığından emin oluyoruz.

```
authy-ssh test
```
SSH sunucunuzu yeniden başlatın

```
sudo service ssh restart
```

#### Ssh sunucunuzu yeniden başlatma

**Ubuntu**

```
sudo service ssh restart
```

**Debian**

```
sudo service sshd restart
```

**RedHat and Fedora Core Linux**

```
sudo /sbin/service sshd restart
```

**Suse linux**

```
sudo /etc/rc.d/sshd restart
```

###  Root ayrıcalıkları olmadan kurulum işlemi

Terminalde aşağıdaki komutları yazın:

```
curl 'https://raw.githubusercontent.com/authy/authy-ssh/master/authy-ssh' -o authy-ssh
bash authy-ssh install ~/.authy-ssh/
```

Şimdi kullanıcıyı korumak için gerekli komutu girin:

```
bash ~/.authy-ssh/authy-ssh protect
```

## Bir kullanıcı da iki faktörlü kimlik doğrulamayı etkinleştirmek

Kurulum bittikten sonra, korumak istediğiniz kullanıcılar için iki faktörlü kimlik doğrulamayı proaktif olarak etkinleştirmeniz gerekir.

Kullanıcıları etkinleştirmek için aşağıdaki komutu yazın ve karşınıza çıkacak olan formu doldurun:

```
sudo authy-ssh enable
```

Tek satırda yapmak isterseniz aşağıdaki komutu vermeniz gerekmektedir:

```
sudo authy-ssh enable <local-username> <user-email> <user-cellphone-country-code> <user-cellphone>
```

## Nasıl çalışır

Authy-ssh, her girişten önce kendini çalıştırmak için `sshd_config` yönergesine ` ForceCommand` kullanmaktadır. Yüklemeyi tamamladıktan sonra sshd_config dosyanızın görünümünü aşağıda görebilirsiniz:

```
[root@ip-10-2-113-233 ~]# cat  /etc/ssh/sshd_config | grep ForceCommand
ForceCommand /usr/local/bin/authy-ssh login
```

Authy-ssh her çalıştırıldığında, `/usr/local/bin/authy-ssh.conf` dosyasından yapılandırmaları okuyacaktır.

Örnek:

```
[root@ip-10-2-113-233 ~]# cat /usr/local/bin/authy-ssh.conf
banner=Good job! You've securely logged in with Authy.
api_key=05c783f2db87b73b198f11fe45dd8bfb
user=root:1
user=daniel:1
```

Bu durumda kullanıcı rootu ve daniel'in iki faktörlü olduğu ve 1'in  `authy_id` olduğu anlamına gelir. Bir kullanıcı bu listede yoksa, `authy-ssh` otomatik olarak içeri girmesine izin verir.

## İki aşamalı kimlik doğrulamasını otomatik dağıtım araçları ile kullanma.


**capybara**, **chef**, **puppet**, **cfengine**, **git** kullanırsanız, bu araçlarla ilgili yeni kullanıcılar oluşturabilirsiniz; böylece, ikş aşamalı kimlik doğrulamayı kullanabilirsiniz.
Alternatif olarak, `ForceCommand` yönergesini kullanarak kullanıcıları eşleştirebilirsiniz.

Buna iyi bir örnek iki faktörlü bir kullanıcı grubu oluşturmaktır.

```
groupadd two-factor
usermod  -a -G two-factor root
```

Şimdi benim root kullanıcım iki faktörlü gruba girdiğinde, `/etc/ssh/sshd_config` dosyamı düzenliyorum

```
[root@ip-10-2-113-233 ~]# cat /etc/ssh/sshd_config | grep ForceCommand -A 1 -B 1
match Group two-factor
ForceCommand /usr/local/bin/authy-ssh login

service sshd restart
Stopping sshd:                                             [  OK  ]
Starting sshd:                                             [  OK  ]
```

Şimdi `force` komutu yalnızca iki faktörlü gruba ait kullanıcılar üzerinde çalışacaktır.

## `Scp`,` sftp`, `mosh` ve `git push` iki aşamalı kimlik doğrulama kullanımı.

`Scp`,` sftp`, `mosh` ve ` git clone | fetch | push` gibi etkileşimli olmayan komutları etkinleştirmek için ortam değişkenini `AUTHY_TOKEN` istemciden geçirmemize izin vermelisiniz. Bunu yapmak için `sshd_config` düzenleyin (normalde` /etc` veya `/etc/ssh/` da bulunur) ve `AUTHY_TOKEN` i AcceptEnv yönergesine ekleyin:

```
AcceptEnv AUTHY_TOKEN
```

Ardından, istemciyi bu değişkeni sunucuya gönderecek şekilde yapılandırabilirsiniz, ilk önce `~ /.ssh/config` açıp bunu yapabilir ve aşağıdakileri ekleyebilirsiniz:

```
Host *
	SendEnv AUTHY_TOKEN
```

And finally pass the token before the command:

```
    AUTHY_TOKEN="valid-token" git push origin master
    AUTHY_TOKEN="valid-token" scp server:path/to/file local-file
    AUTHY_TOKEN="valid-token" mosh server
```

### NOT

Geçersiz bir belirteç girerseniz `sftp` gibi durumlarda, *"Received message too long 458961713"* gibi bir yanıt alabilirsiniz. Bunun nedeni, etkileşimli komutun, program tarafından döndürülen uygun çıktı, metin mesajını oluşturamamasıdır.

## Aynı unix hesabı paylaşan birden çok kullanıcı.

Tek bir giriş bilgilerini paylaşmanız gereken birçok kullanıcınız varsa, aynı tokeni paylaşmadan güçlü iki faktörlü kimlik doğrulamasını kullanabilirsiniz. Bu, her kullanıcının kendi reddine izin vermeyecek şekilde kendi Authy Token'ine sahip olabileceği anlamına gelir.

Bunu başarmak için `ForceCommand` yönergesini `sshd_config` den silin veya yorumlayın:

```
sudo sed -ie 's/^\(ForceCommand.*authy-ssh.*\)/#\1/g' /etc/ssh/sshd_config
```

Ve sonra her kişi için aşağıdaki komutu kullanarak ssh anahtarını ekleyin:

```
sudo authy-ssh protect
```

Bitmiş gibi gözüken bir `authorized_keys` dosyası örneğin:

```
command="/usr/local/bin/authy-ssh login 13386" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGRJbWu+WLVXYVADY3iQPE1kA7CIOSqHmskPM8qIAzKzq+1eRdmPwDZNmAvIQnN/0N7317Rt1bmTRLBwhl6vfSgL6677vUwsevPo27tIxdja67ELTh55xVLcJ3O8x2qkZsySgkLP/n+w3MUwLe1ht31AZOAsV7J7imhWipDijiysNgvHyeSWsHqExaL1blPOYJVHcqPbKY4SxFRq/MWeyPf/Sm24MFSKEaY6u0kNx8MLJ1X9X/YxmY9rdvzsZdQ7Z/PYhYt2Ja/0mzfYx2leeP2JQBsVfZZzAoFEPpw6mSP9kJREGe2tXvS9cRenhz/+V0+mvSJKG0f0Zzh428pTzN
command="/usr/local/bin/authy-ssh login 20" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyvj2d0rSDukDT04mK7njUxtXffUrOnDCm2Bqub0zN7LQS733nBHp89aMuBI5ENjw1SQ2qXhLxvK1Xhr0pQr+dOWNn3emQjQuiA+YL39yp2RLLpflerJ3KAVY09CHYLFxdKj/DJgXsH+LMAPe2uVmWCP2xAV5ZcLnz3CdS2SX/EVlbNrftesZx9uAbmwKPLY1pmW7q/75AhJRow8VTP7zM/VS7jEHkj03g51BZGB8tMI3G8RDVEDtu2jVwZiq+8BaNCyjYVlsLfu6uGhnXeeUS3swu/atlt+pxy+QTf/HGvrJR58tER+foqheWtV3LqXN4oLckzqTVkDDmnNJlmrpYQ==
```

Önceki komut ssh genel anahtarı, cep telefonu ve e-postayı kullanıcıdan isteyecektir.

## Kaldırma

Aşağıdaki komutların girilmesi halinde sistemden Authy SSH uygulaması tamamen kaldırılacaktır.

```
sudo authy-ssh uninstall
sudo service ssh restart
```

