---
layout: post
title: Jekyll ile Statik Web Sayfalarına Giriş
date: 2016-03-11
type: post
categories: jekyll
description: Şubat 20 de bir karar alarak Wordpress kullanımını bırakma kararı
---

Şubat 20 de bir karar alarak Wordpress kullanımını bırakma kararı alıp hızlı bir şekilde jekyll geçmek için kolları sıvadım böyle bir karar almamda en büyük etken maliyetler oldu çünkü hizmetleri güvenlik şüphelerimden dolayı türkiyeden almıyordum kabaca açıklamam gerekirse

- OVH firmasından VPS hizmeti 3 ayda 1 kereye olmak suretiyle 34 Euro
- Cloudflare Pro Aylık 20 Dolar
- Alexa Pro Aylık 10 Dolar
- Wordpress Eklentileri aylık toplamda 15 dolar

Ayrıca bu giderler dışında reklam ve tanıtım amaçlı alınan ve ücreti 3 bin TL yi geçen SEO ve iyileştirme çalışmalarıda yer almakta

Baktım olacak gibi değil bende tüm bu giderleri kısma kararı aldım ve öncelikli olarak tüm sitenin yedeğini alarak işe başladım yedekleri aldıktan sonra site içerisinde bulunan ve yaklaşık 551 adet olan yazıları markdown çevirmem gerekiyordu bunun için jekyll nin hali hazırda wordpress sitelerin kullanması için geliştirilen Jekyll İmport [Jekyll İmport](https://import.jekyllrb.com/docs/wordpressdotcom/) aracını kullandım.

Bu aracı kullanırkende aşağıdaki komut ile kurulum yapmam gerekti

```
gem install jekyll-import
```

Sonrada kullanacağımız komutumuz şu şekilde source olarak wordpressden xml olarak export almanız gerekiyor.Ayrıca sadece yazıları almanız gerekmekte

```bash
ruby -rubygems -e 'require "jekyll-import";
    JekyllImport::Importers::WordpressDotCom.run({
      "source" => "wordpress.xml",
      "no_fetch_images" => false,
      "assets_folder" => "assets"
    })'
```

Ancak bu araç pekde istenildiği gibi bir iş çıkartmıyordu çünkü wordpress veritabanı içerisinde bulunan ve eski eklentilerden kalan artıklarıda alıyor ve markdown dosyasına ekliyordu bende uzun uğraşlar sonucunda tüm hepsini temizleyip tam olarak Jekyll ye aktarabildim bunu yapmak yaklaşık olarak geceli gündüzlü 4 günümü aldı

Bunlar gerçekleşirken sistemime jekyll nin gereken tüm paketleri kurmam gerekiyordu ve kurdumda.

```
sudo -i
apt-get install jekyll
```

Ardından kullandığım jekyll temasının gerektirdiklerini kurmam gerekiyordu çünkü **github pages** kullanmadan önce uyumluluğunu görmemiz gerekiyor bu yüzden sisteminizde bi derleme işlemi yapmamız lazım derleme demişken sadece dosyaları oluşturacağız.

```
bundle install
```

Kullanacağınız temaya göre içerisindeki gemfile aracılığı ile gereken paketlerin listesi alınıp kurulmaya başlayacak tabi bu işlemleri gerçekleştirmeden önce root kullanıcıdan çıkmanızı öneririm.

Şimdi şematik bir şekilde Jekyll nin dosya yapısından bahsetmek istiyorum şu şekilde göstermem gerekiyor

```
├── _config.yml
├── _drafts
|   ├── begin-with-the-crazy-ideas.textile
|   └── on-simplicity-in-technology.markdown
├── _includes
|   ├── footer.html
|   └── header.html
├── _layouts
|   ├── default.html
|   └── post.html
├── _posts
|   ├── 2007-10-29-why-every-programmer-should-play-nethack.textile
|   └── 2009-04-26-barcamp-boston-4-roundup.textile
├── _data
|   └── members.yml
├── _site
├── .jekyll-metadata
└── index.html
```

Şimdi burada gördüğünüz gibi bir çok dosya ve belge var.

`_config.yml` bu sitenizin oluşturulmasındaki ana ayarları barındıran dosyadır.Yapılacak olan temel jekyll ayarlamalarını yapmanıza imkan tanır.

`_drafts` yayınlanmamış yazıları atabileceğiniz dosyadır tarihsiz olarak atmanız önerilir.

`_includes` bu bölümde sayfalara ekleyebileceğiniz dosyaları tanımlayabiliriz bunlar footer olabilir header olabilir yada social diye oluşturup sosyal medya butonları ekleyebilirsiniz bu kısım sizin hayal gücünüz ile sınırlı css ve js dosyalarınıda barındırabilirsiniz.

`_layouts` bu kısımda ise site için kullanılacak olan ana şablonları belirliyoruz.Ön tanımlı bir adet pattern belirlememiz gerekiyor. yapacağınız işlemlere göre bunun sayısını arttırabilir ve customize edebilirsiniz.

`posts` Yazıların bulunduğu alandır tarihe göre eklemeniz gerekmektedir normalde textile ve md desteklemektedir ancak github pages kullanılacak ise sadece sonu .md olacak şekilde kullanılması önerilir.

`_data` bu kısımda jekyll içerisinde kullanacağınız biçimlendirilmiş verileriniz olacak yani yazarların isimlerini tutabilirsiniz.Analitik kodlarını temalarda uygulanabilecek değişiklikleri vs size kalmış genellikle `.yml` uzantısı kullanılır.Ama isteğe bağlı olarak **json** ve **csv** de kullanabilirsiniz.

Bunlar tamamlandıktan sonra deploy etmemiz gerekiyor.

```
jekyll build --safe
```

Bu aşamada herhangi bir hata görürseniz kırmızı renkde bilin ki github pages de kullanamazsınız.Warningler önemli değil ama hataların olmaması gerekiyor.

Dikkat Etmeniz Gerekenler

- Github pages kullanacaksanız jekyll eklentilerinin tamamını kullanamazsınız
- Barındırma alanınız sadece githubun size verdiği 1 GB lik alan ile sınırlıdır.İsterseniz ek alan satın alabilirsiniz.
- Github politikaları değişirse bundan kesinlikle etkilenirsiniz.Kaçarınız yok bu yüzden fazla alan kaplamamaya bakın :)

İkinci bölümde görüşmek üzere
