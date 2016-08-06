---
layout: post
title: OpenSSL ile Kendinden İmzalı SSL Oluşturma
date: 2015-05-08 23:28:56.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: OpenSSL Açık kaynak kodlu SSL ve TLS protokolleri için geliştirilmiş bir uygulamalar.Son zamanlarda adı pekde iyi anılmasada OpenSSL şuan için bu protokolde
---

**OpenSSL** Açık kaynak kodlu **SSL** ve TLS protokolleri için geliştirilmiş bir uygulamalar.Son zamanlarda adı pekde iyi anılmasada **OpenSSL** şuan için bu protokolde kullanabileceğimiz neredeyse tek uygulama bugün ise bu **OpenSSL** ile sizlere kendinden imzalı yani **Self-Signed** sertifika oluşturmayı göstereceğim.Sitenizin kullanıcılara gösterilen yerinde kullanmamanızı öneririm kullanıcılar için sıkıntılar oluşturabilir bunun dışında admin paneli yada sitenizin içerisindeki farklı işlevlerde kullanabilirsiniz.

OpenSSL Değilse kurulumu gerçekleştiriyoruz hemen

    sudo su
    apt-get install openssl

Şimdi yapacağımız şey kullanılacak olan **SSL** için özel şifreyi üretmek bunun için

    openssl genrsa -des3 -out test.key 2048

Anahtarı 2048 olarak üretiyoruz gördüğünüz gibi bunu 1024 olarakda oluşturabilirsiniz tek yapmanız gereken 2048 yazan yeri 1024 ile değiştirmek olacak

Sıra geldi **CSR** oluşturmaya bunuda aşağıdaki ufak bir kod yardımı ile kolaylıkla oluşturabilirsiniz.

    openssl req -new -key test.key -out test.csr

Sizden bir takım bilgiler isteyecek doğru bir şekilde girişini yapıyorsunuz.Kendinden imzalı olacağı için onaylatmak için bir firmaya gerek yok haliyle ücret ödemeyeceksinizde ancak geçerliliği tam olmayacak yukarıdaki aşamadan sonra sertifikayı onaylamak için ise

    openssl x509 -req -days 365 -in test.csr -signkey test.key -out test.crt

Son olarak **PEM** oluşturmamız gerekiyor yeni güvenlik yöntemleri ve doğrulama şekli olarak kullanılacağı için oluşturulması zor değil aşağıdaki komut ile oluşturabilirsiniz.

    cat test.key test.crt > test.pem

_Bu son aşamadan sonrada sertifikanızı oluşturdunuz güle güle kullanabilirsiniz.Sisteminizin hızına göre sertifikanın oluşumu 1 dk alabilir teleşlanmayın yada daha uzun sürebilir._
