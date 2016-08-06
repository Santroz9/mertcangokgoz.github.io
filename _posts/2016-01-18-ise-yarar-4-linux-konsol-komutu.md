---
layout: post
title: "İşe Yarar 3 Linux Konsol Komutu"
date: 2016-01-18 11:10:17.000000000 +02:00
type: post
categories: linux
description: Sürekli olarak bilgisayar başında SSH ile vakit geçiriyorsanız ve konsol sizin için vazgeçilmez ise bu günkü ipuçları sizin işinize oldukça fazla
---

Sürekli olarak bilgisayar başında **SSH** ile vakit geçiriyorsanız ve konsol sizin için vazgeçilmez ise bu günkü ipuçları sizin işinize oldukça fazla bir şekilde yarayacaktır.Sizlere 4 adet kolay ve kullanışlı komut göstermek istiyorum bunlar ile günlük hayatta yaptığınız işlemleri oldukça kolaylaştıracaksınız.

Ben **bash** kullanıyorum siz **zsh** da kullanıyor olabilirsiniz.Her iki uygulamanın da ön tanımlı **rc** dosyası farklıdır.Bu dosyalar sizin sistemi daha iyi bir şekilde kullanımınızı kolaylaştırmak daha iyi bir görünüm kazandırmak için var.Kısacası davranışlarını ne yapması gerektiğini siz tanımlayabilirsiniz.

.bashrc veya .zshrc ana kullanıcı dizinizde gizli dosya olarak bulunmakta bu dosyayı kullandığınız favori metin düzenleme uygulaması açıyorsunuz.

## 1.Git işlemlerini kolaylaştırmak

Yeni bit fonksiyon tanımayacağız bu fonksiyon ile **github** da işlem yaptığımızda uzun uzun komutlar yazıp commit etmek yerine direk bu komutu dosya yolu içerisinde çalıştırarak tüm işlemleri tamamlamış ve dosyamızı github'a yüklemiş olacağız.

Bu fonksiyonu kullanarak 3 adet komut yazmaktan kurtulmuş olduk ve dosya yolumuzdaki dosyalarımız otomatik olarak push edildi.

```
function pushall()
{
         git add -A
         git commit -m "$@"
         git push
}
```

Kullanımı ise şu şekilde;

```
pushall "Add Some Files"
```

Çalışan farklı bir varyasyon ise ki bu benim gibi direk komutu verip commit mesajını unutanlar için birebir.Yukarıdaki gibi kullanabilirsiniz.

```
function gitall() {
    git add .
    if [ "$1" != "" ]
    then
        git commit -m "$1"
    else
        git commit -m update
    fi
    git push
}
```

## 2.Özel Alias Kullanımı

Çok fazla kullandığınız komutları özel aliaslar tanımlayarak kullanabilirsiniz.Özellikle uzun ve yazması zahmetli komutları bu şekilde kısaltıp işinize yarar bir hale getirebilirsiniz.Benim kullandığım bir kaç faydalı alias ise şu şekilde

```
#Konsol temizleme
alias c='clear'
#Geçmiş komutları temizleme
alias h='history -c'
#TCP/UDP port listeleme
alias ports='netstat -tulanp'
#url encode / decode
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
#Link Kısaltma
alias urlkisalt="python -c \"import sys, urllib as ul; print ul.urlopen('http://tinyurl.com/api-create.php?url=%s' % ul.quote_plus(sys.argv[1])).readline()\""
#İletilen Byte
alias transall="ifconfig eth0 | awk '/RX bytes/ {print $7, $8}'"
```

## 3.Export Kullanımı

Ön tanımlı olarak bazı ayarları bu şekilde tutabilirsiniz özellikle unuttuğunuz yada yazdığınız kabuk programında çok fazla kullandığınız bir şeyi bu yöntem ile o an konsol komut satırınız da tutabilirsiniz böylelikle tekrar tekrar yazmak zorunda kalmazsınız ben bunu özellikle sunucuda yedekleme yaptırdığım için dosya yolunu ve veritabanı adını tutmak için kullanıyorum.Siz şifrenizi bile bu yöntem ile tutabilirsiniz.

```
export backup_dir=/backup
export password=123456
```
