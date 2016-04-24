---
layout: post
title: GitHub LFS Nasıl Kullanılır
date: 2016-04-24
type: post
categories: Linux
description: Geçtiğimiz günlerde okulda görmüş olduğumuz derslere ait notları ve yapmış olduğumuz ödevleri internete yükledim ve özgürce
---

Geçtiğimiz günlerde okulda görmüş olduğumuz derslere ait notları ve yapmış olduğumuz ödevleri internete yükledim ve özgürce herkesin kullanabilmesini amaçladım bilenler vardır belki daha öncede FTP üzerinden bu işlemi yapıyordum ancak daha sonradan Github Pages geçmem ile birlikte biraz alan sıkıntısı çektim ve kaldırmak zorunda kaldım hemde toplu bir şekilde indirme işlemi yapılamıyordu çünkü yüklü miktarda trafik harcıyor ve sunucuyu yoruyordu.

Notları yayınladıktan sonra benimde aklıma gelen ama 2.2GB yi nasıl githuba yüklerim diye düşündüğüm olmuştu.LFS vardı ancak nasıl kullanabilirdim ?.Daha sonra Doruk hocamızdan Twitter aracılığı ile güzel bir öneri aldım. Haklıydıda istenildiği gibi kullanılabilecekse niye istenildiği gibi geliştirilemesin veya dosya eklenemesin.

<blockquote class="twitter-tweet" data-partner="tweetdeck"><p lang="tr" dir="ltr"><a href="https://twitter.com/0x2e88ce4">@0x2e88ce4</a> git&#39;e niye koymuyorsun? Isteyen gelistirirdi de.</p>&mdash; Doruk Fişek (@dfisek) <a href="https://twitter.com/dfisek/status/723783887680352256">April 23, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Hemen kolları sıvadım ilk olarak Github hesabımdaki yere baktım benim LFS kullanılabilir alanım 1 GB olarak gözüküyordu ücretsiz olarak haliyle yer yetmeyecekti ,elimdeki dosyada 2.2GB olduğu için ve daha sonradan kullanabileceğimi düşündüğüm için hemen kredi kartımı girdim ve 5 dolar karşılığında alanı 50GB çıkarttım.

ardından resmi sitesinden gerekli olan uygulamayı indirdim.

```bash
cd /home/mertcan/Downloads/
aria2c -x6 https://github.com/github/git-lfs/releases/download/v1.2.0/git-lfs-linux-amd64-1.2.0.tar.gz
tar -xzvf git-lfs-*
```

Bu aşamadan sonra kurulum için root olmam gerekiyordu ve hemen panele girip `su` komutumu verip şifremi girdim.bu aşamadan sonra sadece dosya içerisinden çıkan `install.sh` çalıştırmam yeterliydi

```bash
./install.sh
```

kurulum tamamlandıktan sonra test için aşağıdaki adımı uygulayınız yazıyodu o yüzden şu şekilde bir komut verdik

```bash
git lfs install
```

Bu komutun ardından sistemde bize `Git LFS initialized.` çıktısını vermesi gerekiyor.Eğer bu çıktıyı almışsanız kurulumunuz tamamlanmış demektir.Geriye **LFS** kullanmamız kalıyor.Bunun içinde ilk önce izlenecek olan dosyaları tanımlamamız gerekiyor repo muza bunun için

```bash
git lfs track "*.psd"
git lfs track "*.png"
git lfs track "*.rar"
git lfs track "*.zip"
git lfs track "*.tar"
git lfs track "*.pptx"
git lfs track "*.ppt"
git lfs track "*.doc"
git lfs track "*.jpeg"
git lfs track "*.jpg"
git lfs track "*.docx"
git lfs track "*.txt"
```

Eklendi diyecek her biri için siz başka uzantıda dosya atacaksanız bunlarıda tanımlamanız gerekiyor.Ardından bunları repomuza gönderelim

```bash
git add .gitattributes
```

Bu işlem githuba kardeş ben şu şu uzantılı dosyaları gönderiyorum sen bunları benim **LFS** hesabıma koy ki sıkıntı çekmeyelim diyorsun.Geri kalanıda normal **Github** a ekleme işlemi

```bash
git add .
git commit -m "Note"
git push -u origin master
```

Dosya boyutunuza göre yükleme işlemi baya bir zamanınızı alacaktır.Özellikle Türkiye gibi bir ülkede upload hızımızın düşük olduğunu da düşünürsek şimdiden kolay gelsin.Ayrıca yüklediğim dosyaları sonradan nasıl görürüm diyorsanız onunda kolayı var

```bash
git lfs ls-files
```

Bu işlem sonucunda Tüm Ders Notlarını Github üzerinde barındırmaya başladım. [Görmek için tıklayın](https://github.com/MertcanGokgoz/DersNotlari)

Öptüm bye <3
