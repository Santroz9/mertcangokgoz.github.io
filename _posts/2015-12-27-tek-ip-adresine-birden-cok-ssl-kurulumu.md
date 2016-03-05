---
layout: post
title: Tek İP Adresine Birden Çok SSL Kurulumu
date: 2015-12-27 13:23:06.000000000 +02:00
type: post
categories: Nginx
description: Herhangi bir web sitesinde SSL aktif etmek için özel bir ip adresi gerekiyor.Hem sunucu sahipleri hemse hosting firmalar özel ip tahsisi
---

Herhangi bir web sitesinde **SSL** aktif etmek için özel bir ip adresi gerekiyor.Hem sunucu sahipleri hemse hosting firmalar özel ip tahsisi konusunda sıkıntılıdırlar.Bu noktada devreye **SNI(Server Name Indication)** devreye giriyor.

SSL ile şifrelenmiş veri kullanıcının tarayıcısında açılıyor.Aradaki bağlantı tamamen şifreli olduğu için iletişim sırasında header yerine ip adresine bakılması gerekiyor bu yüzdende **SSL** kullanımında özel ip gerekiyordu **SNI desteği** aslına bakarsanız bu zorunluluğu ortadan kaldırdı.Özel İP zorunluluğu olmadan tek ip üzerinde birden çok site barındırabilir ve daha sonra bu sitelere SSL kurulumu gerçekleştirebilirsiniz.Ancak bilmenizde yarar var SNI özelliğini eski tarayıcılar desteklemiyor.Destekleyen tarayıcı sürümleri ve [detaylarına ulaşmak için](https://www.digicert.com/ssl-support/apache-secure-multiple-sites-sni.htm)

Ayrıca SNI kullanılan tarayıcı dışında **TLS** desteklemeyen mail server yapılarında sıkıntılara yol açabileceğinden dikkatli olunuz.

## Peki bu SNI kurulumu nasıl gerçekleşir?

İlk olarak yapmanız gereken şey sisteminize nginx kurmak herhangi extra bir pakete gerek yok sade bir şekilde kurulumu yapabilirsiniz.

    sudo apt-get install nginx

kurulum tamamlandıktan sonra Nginx sürümünüzün **SNI** destekleyip desteklemediğini sürüm bilgisi öğrenmek için verdiğiniz komut ile rahatlıkla görebilirsiniz.

![snidesteginginx](/assets/snidesteginginx.png)

Gördüğünüz gibi **"TLS SNI supported enabled"** yazısı ile karşılaştık yani **nginx** bu sürümünde **SNI** desteği aktif olarak geliyor.Şimdi biz bu desteği gördüğümüz için kurulum evresine geçebiliriz.Standart bir Nginx site nasıl kuruluyorsa o şekilde kurulum olacak tek farkı **SSL sertifika** komutlarına gereken sertifikaları gireceğiz ve aktif edeceğiz.

2 site için kurulumu göstereceğim daha fazla sitedede kullanabilirsiniz hiç fark etmiyor sadece **SSL** sertifikası ihtiyacınız olacaktır.

mertcangokgoz.com için

```
    mkdir -p /etc/nginx/ssl/mertcangokgoz.com
```

mertcangokgoz.org için

```
    mkdir -p /etc/nginx/ssl/mertcangokgoz.org
```

Şimdi 2 site içinde issue edilebilsin diye key ve bunun sonrasında **csr** oluşturmamız gerekecek.

```
    cd /etc/nginx/ssl/mertcangokgoz.com
```

klasörü içerisine giriş yapıyoruz.Aşağıdaki komutlar ile **SSL** kurulumuna başlıyoruz.

```
    openssl ecparam -out www_mertcangokgoz_com.pkey -name prime256v1 -genkey && openssl req -new -key www_mertcangokgoz_com.pkey -nodes -out www_mertcangokgoz_com.csr -subj "/C=TR/ST=TR/L=Ankara/O=Mertcan/OU=Mertcan/CN=www.mertcangokgoz.com"
```

**.org** uzantısı içinde aynı aşamayı yapacağız bunun için ise

```
    cd /etc/nginx/ssl/mertcangokgoz.org
```

klasör içerisine giriş yaptık ve ssl için kurulum parametrelerini giriyoruz.

```
    openssl ecparam -out www_mertcangokgoz_org.pkey -name prime256v1 -genkey && openssl req -new -key www_mertcangokgoz_org.pkey -nodes -out www_mertcangokgoz_org.csr -subj "/C=TR/ST=TR/L=Ankara/O=Mertcan/OU=Mertcan/CN=www.mertcangokgoz.org"
```

Şimdi gereken dosyalar ile&nbsp;keyinizi onaylayabileceğiniz bir firma buluyorsunuz [SSLS sitesini](https://www.ssls.com/) bu iş için kullanabilirsiniz oldukça uygun fiyatlarda **SSL** sertifikaları bulunuyor.Oluşturduğunuz **.key** ve **.csr** olacak 2 şey adet bunlardan .csr olanını firmaya gönderiyorsunuz ve firma size 3 adet dosya gönderiyor yaklaşık onaylanması 1-5 dk sürebilir.

Gönderilen bu dosyalar içerisinden gereken işlemi yapalım

Size verilen ve domain adınızı içeren sonu .crt olan sertifika ile CA sertifikasını birleştiriyoruz.

```
    cat siteadresi.com.crt CA.crt >> chainbundle.crt
```

Şimdi birleştirdiğimiz crt dosyasını domainin klasörüne atıyorsunuz ve şu şekilde ilk domaini tanımlıyorsunuz.Tanımlama yaptıktan sonra aynı klasör içerisinde **.key** uzantılı bir private keyiniz olacak bu keyin isminide **ssl\_certificate\_key** satırına gireceğiz

```
    server {

    listen 443;

    ssl on;
    ssl_certificate /etc/nginx/ssl/chainbundle.crt;
    ssl_certificate_key /etc/nginx/ssl/siteadi.com.key;
    .
    .
    .
    .
    }
```

Bir sonraki domain içinde aynı aşamaları izliyorsunuz.

```
    cat siteadresi.org.crt CA.crt >> chainbundle.crt
```

birleştirilmiş olan **crt** dosyasını tekrardan tanımlanacak domainin klasörüne atıyorsunuz ve şu şekilde ikinci domain'i tanımlıyorsunuz. Tanımlama yaptıktan sonra aynı klasör içerisinde **.key** uzantılı bir private keyiniz olacak bu keyin isminide **ssl\_certificate\_key** satırına gireceğiz ilk domain adresinde yaptığımız gibi

```
    server {

    listen 443;

    ssl on;
    ssl_certificate /etc/nginx/ssl/chainbundle.crt;
    ssl_certificate_key /etc/nginx/ssl/siteadi.org.key;
    .
    .
    .
    .
    }
```

işlemler bu şekilde tamamlanıyor.Şimdi yapacağınız şey **nginx** yeniden başlatmak

```
    service nginx restart
```

Başarılı bir şekilde yeniden başlattığınızda aynı ip üzerinde iki farklı site içinde **SSL** kullanmış olacaksınız.
