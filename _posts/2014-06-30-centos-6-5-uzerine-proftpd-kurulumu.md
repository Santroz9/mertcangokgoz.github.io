---
layout: post
title: Centos 6.5 Üzerine ProFTPD Kurulumu
date: 2014-06-30
type: post
categories: linux
description: istemlerin hemen hepsinde bulunan özelliklede web serverlarda sıkça görülen bu uygulama sayesinde uzaktan sunucunuza dosya transferi yapabilirsiniz yada sunucunuz da
---

**Centos** sistemlerin hemen hepsinde bulunan özelliklede web serverlarda sıkça görülen bu uygulama sayesinde uzaktan sunucunuza dosya transferi yapabilirsiniz yada sunucunuz da bulunan bir dosyayı kendi sisteminize indirebilirsiniz.Ancak gerek duyulmadıkça açık tutulmaması gerekmektedir bir güvenlik zafiyeti doğurabilmektedir.Proftpd kullanırken bilminmesi gereken bir başka nokta ise centos sistemler ile şifre uyuşmazlığı yapması yani hali hazırda bulunan kullanıcı adınızı kullandırmayabiliyor bu durumda da şifrenizi sıfırlayarak çözüme kolaylıkla ulaşabilirsiniz.

# Kurulumu

Bize gerekli olan **Epel** kütüphanesini kuruyoruz.

```console
yum -y install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
```

Kurduğumuz **epel** kütüphanesini sistemden pasif etmemiz gerekiyor bunun için **sed** parametresini kullanarak işlemlerimizi kolaylaştırıyoruz.

```console
sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/epel.repo
```

işlemimiz tamamlandı şimdi sıra geldi kütüphanelerimizin adreslerini güncellemeye

```console
yum update
```

Son olarakda kuracağımız paketin **epel** içerisinde olduğunu belirtmek ve kuruluma geçmek olacak

```console
yum --enablerepo=epel -y install proftpd
```

Kurulumu tamamladıktan sonra bir kaç izin vermemiz gerekecek conf dosyasını düzenlememiz gerekiyor.

```console
nano  /etc/proftpd.conf
```

bunlar sırasıyla

```console
ServerName      "mertcangokgoz.com"
ServerAdmin     "noreply@mertcangokgoz.com"
ExtendedLog     /var/log/proftpd/access.log WRITE,READ default
ExtendedLog     /var/log/proftpd/auth.log AUTH auth
```

Yukarıda ne yaptık **server** ismini sunucumuzun domain adresine göre düzenledik iletişim kısmına mail adresimizi girdik ve **log** tutması için parametreleri yazdık CTRL + X dedik ve kayıt edip çıktık

Şimdi sıra geldi bağlanacak kullanıcıları ayarlamaya bunu yaparken gene sistem dosyalarında değişiklik yapmamız gerekecek

```console
nano /etc/ftpusers
```

Giriş yaptıktan sonra yüksek ihtimal 1 test account ve diğer kullanıcıları görmemiz mümkün eklemek istediğiniz kullanıcı adını son satıra eklemeniz ve kayıt edip çıkmanız gerekmekte daha sonrasında servisi başlattıktan sonra çok kolay bir biçimde **FTP** ye ulaşabilirsiniz.

```console
service proftpd start
```

yada

```console
/etc/rc.d/init.d/proftpd start
```

sunucuya **restart** attıktan sonra otomatik olarak çalışmasını isterseniz başlangıç kısmına eklemeniz gerekmekte ben önermiyorum ancak kullanmak isteyen arkadaşlar için

```console
chkconfig proftpd on
```

İşlemlerimiz tamamlandı artık **proftpd** kullanıma hazır **FTP** servisiniz hayırlı olsun güvenlik önlemlerinizi almayı unutmayınız.
