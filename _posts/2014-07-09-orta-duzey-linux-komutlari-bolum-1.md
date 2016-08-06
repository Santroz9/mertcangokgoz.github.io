---
layout: post
title: Orta Düzey Linux Komutları
date: 2014-07-09 12:22:12.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Yazacağım ve açıklayacağım Linux komutları hali hazırda yayınlanmış olan tüm Linux dağıtımlarında çalışmakta olup en işe yarar komutların
---

Yazacağım ve açıklayacağım Linux komutları hali hazırda yayınlanmış olan tüm **Linux** dağıtımlarında çalışmakta olup en işe yarar komutların derlenmesinden oluşturulmuştur. Burada öğrenecekleriniz ile sizde kendi Linux sisteminizi rahatlıkla ayarlama yapabilirsiniz. Böylelikle hiçbir ek ücret ödemenize de gerek kalmayacak ve düzenlemeleri kendiniz yapabileceksiniz.

Öncelikle linux’un temel kodlarından biri bana göre bulunduğunuz dizin içerisindeki yerel dosyaları ekrana getirmenize yardım edelim.

    ls –la

Çıktımız aşağıdaki gibi

![ortaduzeylinuxkomutlarigorsel1](/assets/ortaduzeylinuxkomutlarigorsel1.png)

Bu çıktımızı bir dosyaya yazdıralım sonradan bir işimize yarar belki

    ls –la > liste

Dosya içeriğini görmek ister isek

    cat liste

Ve dosya içeriğimiz

![ortaduzeylinuxkomutlarigorsel2](/assets/ortaduzeylinuxkomutlarigorsel2.png)

Peki hatalı durumlarda ne yapılması gerekiyor dosya çıktısının nasıl alınması gerekiyor. Ama öncelikle bunun için hata verdirmemiz lazım bu noktada ls /deneme adında dosyamıza girmeye çalıştık ve hatamızı aldık bu hatayı dosyaya yazdırmak için

    ls /deneme 2>hata

Şeklinde komutunuzu vermemiz lazım ki 2\> şeklinde komutu yeniden düzenlediğimiz anda verilen hatayı hata dosyasına yazmış olacak…

![ortaduzeylinuxkomutlarigorsel3](/assets/ortaduzeylinuxkomutlarigorsel3.png)

Standart çıktı yada standart hatayı bir dosyaya yönlendirirken yukarıda görmüş olduğunuz \> işaretini kullandık bu işareti kullandığımızda dosya yoksa oluşur var ise içeriği silinerek son çıkan çıktılar eklenir ancak var olan dosya içerisindekilerin silinmesini istemiyorsanız o zaman aşağıdaki gibi kullanmanız gerekiyor ki dosyanın içerisine eklensin.

![ortaduzeylinuxkomutlarigorsel4](/assets/ortaduzeylinuxkomutlarigorsel4.png)

Örnekte görmüş olduğunuz gibi ilk komut ile deneme.txt adında dosya oluşturduk ikinci komut ise dosyanın içeriğini koruyarak ikinci dosyanın çıktısını dosyanın sonuna ekliyor.

    echo deneme1 < deneme.txt
    cat deneme.txt
    echo deneme2 << deneme.txt
    cat deneme.txt

Gelelim bir başka yöntem olan ve **UNİX** sistemlerin desteklemiş olduğu yönteme bu yöntemde ise çıkan standart çıktı ve standart hatayı mail yoluyla gönderebilirsiniz yani işin özü çıkan çıktı ve hataları Unix sistemlerde hem dosyaya yönlendirebilir hem de programa yönlendirebilirsiniz. Bunun için

    mail –s “rapor” Mertcan < raporlar.txt

Mail fonksiyonları kurulu değil ise

    sudo apt-get install mailutils

Demeniz yeterlidir.

Linux sistemlerin olmazsa olmazlarından bir tanesi de man komutudur. Bu komut sayesinde parametreler hakkında bilgi sahibi olabilirsiniz.

    man man

Dediğinizde bile man komutu size man komutu hakkında parametre ve nasıl kullanılacağı hakkında bilgi verecektir. Bu sayede bilmediğiniz komutların ne işe yaradığını da görmüş olacaksınız.

![ortaduzeylinuxkomutlarigorsel5](/assets/ortaduzeylinuxkomutlarigorsel5.png)

Aynı şekilde komutlar hakkında bilgi ve parametrelerin nasıl kullanılacağını görmek adına

    info man

Dememizde yeterli olacaktır man komutu gibi kullanılacak olan parametreleri ve kullanım şekillerini ekrana yazdıracaktır.

**Default** olarak size tanımladıkları **root** şifresinden kurtulmak istiyor olabilirsiniz haklısınız da Türkiye de ki çoğu yer sağlayıcı firma kullanıcısının ne yaptığını gözetlemek ve gizliliğini tehdit amacıyla böyle bir yola gidiyor. Tamamen zaten sunucuyu size teslim hiçbir zaman etmediler etmiyorlar da etmeyecekler de buna alışın uzun lafın kısası fazla isyan etmenin lüzumu yok

    passwd

Komutunu yazıyorsunuz sonrasında yeni şifrenizi rahatlıkla tanımlayabilirsiniz.

![ortaduzeylinuxkomutlarigorsel6](/assets/ortaduzeylinuxkomutlarigorsel6.png)

Linux belli bir hiyerarşiye göre gittiğinden dolayı şifrelerin depolandığı yere hemen bir bakalım

    cat /etc/passwd

Komutumuzu veriyoruz görüldüğü üzere bize uzunca bir liste çıkıyor burada kullanı adları ve dosyanın izinleri ile birlikte dosya yolu gözükmekte

![ortaduzeylinuxkomutlarigorsel7](/assets/ortaduzeylinuxkomutlarigorsel7-e1404811842665-565x576.png)

Görüldüğü gibi listemiz uzayıp gidiyor buradan istediğimiz bir kullanıcının da şifresini değiştirebiliriz bunun için aşağıdaki komutu kullanabilirsiniz.

    passwd kullanıcı adı

![ortaduzeylinuxkomutlarigorsel8](/assets/ortaduzeylinuxkomutlarigorsel8.png)

Genel olarak kullanılan **Linux** komutlarımız bu şekilde devam etmektedir. Makalelerimizin aşırı uzun olmaması açısından bir sonraki bölümde orta düzeyli Linux komutlarını göstermeye ve açıklamaya devam edeceğim…
