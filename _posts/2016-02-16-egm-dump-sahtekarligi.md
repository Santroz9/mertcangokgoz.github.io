---
layout: post
title: EGM Dump Sahtekarlığı
date: 2016-02-16 15:12:10.000000000 +03:00
type: post
categories: Güvenlik
description: Saat 17.02 sularında ingiliz bir adimiz Emniyet müdürlüğüne ait olduğunu iddaa ettiği bir takım
---

Merhabalar

Saat 17.02 sularında ingiliz bir adimiz Emniyet müdürlüğüne ait olduğunu iddaa ettiği bir takım verileri sızdırdığı belirtildi dosyaları torrent aracılığı ile paylaştı

![leakgorsel1](/assets/leakgorsel1.png)

```
I have been asked to release the following files by ROR[RG], who is responsible for collecting them.
The material was taken from the EGM which is the Turkey National Police.
The source has had persistent access to various parts of the Turkish Government infrastructure for the past 2 years and
in light of various government abuses in the past few months, has decided to take action against corruption by releasing this.

As with everything I share, I do not make any claims for the data. However, please note you may require some knowledge
of databases to be able to properly extrapolate information from this data set. If anyone can make a more accessible
version for the less technically inclined, ping it over to me and I will add it here.
```

Çaldığını iddaa eden kardeşin atmış olduğu tweet

<blockquote class="twitter-tweet" data-lang="tr"><p lang="en" dir="ltr">Another release, this time the EGM (Turkish National Police). Enjoy responsibly. <a href="https://t.co/ABiURM0rq2">https://t.co/ABiURM0rq2</a> <a href="https://t.co/WLYNABqlkf">pic.twitter.com/WLYNABqlkf</a></p>&mdash; TheCthulhu (@CthulhuSec) <a href="https://twitter.com/CthulhuSec/status/699247420803309569">15 Şubat 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Sistemden çaldığını iddaa ettikleri veriler yaklaşık olarak 2014 aralık ayında benim gözüme çarptı yaklaşık olarak 250 TL tutarında bir ücrete satılmakta idi 03.08.2015 17:25 Tarihinde ise internet ortamına forumlarda gözükmeye başladı bazı forum yönetimleri direk olarak konuları kaldırıp imha ettiysede birileri bir şekilde bu arkadaşın eline bu verileri iletmiş

![](/assets/leakforumgorsel1.png)

Bir başka forum görüntüsü şu şekilde

![](/assets/leakgorumgorsel2.png)

Görüldüğü gibi veriler yaklaşık olarak 5-6 ay öncesine kadar internete düşmüş hatta bundan daha öncede var olduğunu söyleyenler var ki hack forumlarında bu görülebilir.

Karşılaştırma yaparak ilerleyeceğiz elimizde forumdan edindiğimiz ve baya uzun zamandır internette olan dosyamız ve çaldığını iddaa eden bu arkadaşımızın verileri bulunuyor.Yer altının karanlık forumlarında özellikle deepweb tarafında leak edilmiş bir şekilde yandex ve dropbox hesaplarında private olarak saklanan bu veriye haliyle ulaşmamız kolay olmadı

Öncelikle belirtmek isterim ki bu veriler Mernis sistemine ait değildir tam olarak 2009 yılına isabet eden ve içerisinde 26 yaş üstü tüm herkesin datası kesin olmamakla birlikte bulunmaktadır.ve kesinlikle **EGM den çalındığına dair bir belirti bulunmamaktadır.**

Buda şu şekilde göstermek isterim

![mernisveri1](/assets/countgorsel.jpg)

Toplam Kayıt sayısı : 46.859.466 Bu da demek oluyorki gerçekten 26 yaşından büyük kişilerin ölü veya diri olarak SQL dosyasında tutulduğu

Ancak dosyayı tekrar incelediğimizde kişilerin bu verileri öylesine kullanmasın diye özel bir String şifreleme fonksiyonu yazılmış. ve tüm veritabanı şifrelenmiş tablolar ve içerisindeki her bir kayıtda bu şekilde korunmuş

![korumagorsel](/assets/egmleakgorsel1.jpg)

Her ne kadar verilerin okunması zorlaştırılmaya çalışsada bir takım tekrar eden verilere rastlamak ve tahmin yürütmek mümkün ancak verileri okuyabilmek için içinin karıştırılmış ve boş veriler ile doldurulmuş `sorgu.exe` nin tamamen reverse edilip algoritmasına ulaşılması gerekiyor.

Şifreleme **algoritmasının** bulunduğu yer

![algoritmagorsel](/assets/sifrelemealgoritma.jpg)

Bilgiler aynısı olsa bile ulaşmış olduğum ve underground forumlarda gezen dosyaların içeriğinde ise özenle hazırlanan bir setup dosyasından kalıntıları görmek mümkün ayrıca dosyanın lisansıda bulunuyor.Bu lisans dosyasını kullanarak lisanslama işlemi yapmadan asıl verilere ve dosyalara ulaşamıyorsunuz.

![gorsel1](/assets/icerikgorsel.png)

Ayrıca exe dosyası içerisinde 1 adet bind edilmiş exe gözükmekte exeyi okumam mümkün olmadı çünkü öncesinde ve sonrasında bazı işlemlerden geçirilmiş.Benim fark ettiğim exe ilk önce delphi obfuscate ile karıştırıldığı ki bu exe yi ilk yazanlar tarafından yapıldığı düşüncesindeyim ardındanda exe ne hikmetse dotfix uygulanarak kötücül olarak gözükmesi engellenmiş ancak comodo yakalamayı başarmış.


Ayrıca araştırmalarıma göre bu dataların vakti zamanında her ne kadar legalliğinden şüphe etsemde avukat ve barolara satıldığı iddaasıda forumlarda yapılmakta.Exe içerisindeki string değerlerde ise uygulamanın lisanslama aşamasında belirli bir ip adresi ile iletişim kurduğu ve bu ip adresininde `89.19.19.210` olduğu gözüküyor.

![ipadresi](/assets/Screenshot_2016-02-16_12-09-42.png)

Ardından daha detaylı bir inceleme yaptığımızda bir hukuk yazılım firmasından bu uygulamanın çalındığını görmekteyiz uygulama içerisindeki string aramasında firmanın telefon numarası bulunmakta ve şaşırtma amaçlı koyulmamış gerçektende böyle bir firmaya ait olma olasılığıda açık.

Sorgu sırasında bir görüntü [Görüntülerin bulunduğu forum adresi](http://deepwebtr.net/konu-Adres-Sorgu-Programi.html?pid=343331#pid343331)

![detay1](/assets/11855449_886336491421499_398067300_n.jpg)

![detay2](/assets/egm17gbdatas.PNG)

**Güncelleme 1 4 Nisan 2016 Saat 20:10**: 3 Nisan Tarihinde İp adresi üzerinden yayın yapan bir web sitesi aracılığı ile yaklaşık olarak 49 milyon vatandaşımızın açık bir şekilde bilgileri yayınlanmıştır. Uygulanan şifrelemeyi kırmış ve karışık olan veri tabanını düzenlemişler oldukça özverili bir şekilde çalıştıklarını veri tabanını tamamen normalizasyon kurallarına göre yeniden şekillendirip uğraşmalarından anlayabiliyoruz.Normalde 17 GB olarak 2 Ay önce **TheCthulhu** tarafından sızdırıldığı iddaa edilmiş ve yayınlanmıştı biz de üstüne basa basa çalma veya sızdırılma olmadığı zaten bu verilerin internet ortamının yer altı dünyasında dolaştığından bahsetmiştik.Bu sefer yayınlayan arkadaşlar ise veriyi sadeleştirip vatandaşlarımızın tüm bilgilerini açık bir şekilde paylaşarak insanlarımızı tehlikeye atmış bulunmaktadır.Bilgiler EGM olayındaki verilerin aynısı olup en son **1991** yılına ait kayıtlar bulunmaktadır.**SQL dosyasında her hangi bir virüs veya benzeri bir öğe bulunmamaktadır.**



### NOT: Daha detaylı bir analizi yapabilecek kadar malesef yeterli bilgi birikimine sahip değilim benden bu kadar.Hatamız olduysa affola...

Yardımlarından dolayı **Furkan KALKAN** ve **Onur ASLAN** ve diğer tüm arkadaşlarıma teşekkürler.
