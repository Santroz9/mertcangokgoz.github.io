---
layout: post
title: Jekyll ile Statik Web Sayfaları Bölüm 3
date: 2016-03-17
type: post
categories: Linux
description: Yapmanız gerekenlerin başında kullanıcıların sitenizi daha
---

Yapmanız gerekenlerin başında kullanıcıların sitenizi daha efektif kullanabilmeleri ve daha iyi bir şekilde yazılarınıza ulaşabilmeyi sağlamalıyız bunuda genelde RSS veya Atom feed ile sağlarız.

# 3. RSS Feed

Normalde bizim bunu manuel bir şekilde oluşturmamız gerekiyor ancak Github pages de eklenti olarakda kullanabiliyoruz.Hal böyle olunca hiç feed.xml şemasına kasmaya gerek yok otomatik olarak kendisinin oluşturması yeter.Bunun için ise `_config.yml` dosyası içerisine aşağıdaki tanımlamayı yapıyoruz.

```
gems:
  - jekyll-feed
```

bundan sonra her githuba push işleminden sonra eklenti aracılığı ile rss feed dosyanız otomatik olarak oluşturulacak.Sizede bu dosyayı istediğiniz şekilde kullanmak kalacak

# 4.Sitemap

Sitemap RSS Feed den farkı sadece linkler ve tarihlerin olduğu bir şablondur aslında isteğe bağlı olarak deiştirilebilen manuel yapıdan ziyada buradada otomatik oluşturulan eklentiden faydalanacağız bunun için RSS Feed de yaptığımız gibi `_config.yml` dosyasına aşağıdaki gibi ekleme yapıyoruz.

```
gems:
  - jekyll-sitemap
```

Her githuba push etme işleminizde otomatik olarak RSS Feed dosyasını oluşturduğu gibi otomatik olarak oluşturacak google,yandex,bing ve diğer arama motorlaruna sitemapınızı rahatlıkla gönderebileceksiniz.

#5. SEO Ayarlamaları

Jekyll ile yapılan web sitelerinde genellikle SEO ayarlamaları yapmazlar yada her ne hikmetse yapamazlar veya onun gibi birşey ki SEO su kötü diyip Jekyll gibi bir uygulamaya çamur atarlar aslında olay oldukça basit ve birazda kafayı kullanmayı gerektirir.

Bir takım özelliklerini Eklenti ile yapabilir.Bir takım özelliklerinide ek ile düzeltebilirsiniz.El ile yapacağımız kısımlara gelirsek

```
{% raw %}
<title>Mertcan GÖKGÖZ - Programlama, Sunucu Yönetimi, Teknoloji ve İnternet</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="generator" content="Jekyll">
<link href="https://plus.google.com/103305118431759296457" rel="publisher" />
<meta name="author" content="{{ site.data.theme.name }}" />
<meta name="description" content="Özgür yazılım üzerine yazılar Sunucu yönetimi,teknoloji ve programlama hakkında türkçe site" />
<link rel="canonical" href="{{ site.url }}{{ page.url | replace:'index.html','' }}" />
<meta name="keywords" content="mertcan,server administration,sunucu yönetimi,linux,mertcan gökgöz,başkent üniversitesi,yönetim bilişim sistemleri,uygulama geliştirme,programlama,yazılım,ubuntu,internet ve teknoloji,özgür yazılım"/>
<meta name="robots" content="noodp"/>
{% endraw %}
```

Gibi bir takım eklemeleri `_layout` dosyanız içerisindeki `default.html` sayfasına eklemesini yapın bu bizim ana sayfadaki şablonumuz olacak post ve categoriler için ben farklı bir şablon kullandığım için onun düzenlemesinide ona göre yaptım böylelikle daha etkili bir SEO çalışması olmuş oldu

Yazılar için kullanmış olduğum bence en etkili olan SEO yapısı ise şu şekilde `defaultpost.html` şablonuma ekledim

```
{% raw %}
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<title>{{ page.title }} | Mertcan GÖKGÖZ</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="generator" content="Jekyll">
<link href="https://plus.google.com/103305118431759296457" rel="publisher" />
<meta name="author" content="{{ site.data.theme.name }}" />
{% if page.description %}
    <meta name="description" content="{{ page.description}}" />
{% endif %}
<link rel="canonical" href="{{ site.url }}{{ page.url | replace:'index.html','' }}" />
<meta name="robots" content="noodp"/>
{% endraw %}
```

Burada sayfanın Title kısmını sizin belirlediğiniz title ile değiştirerek googlede daha iyi görünmesini sağlayacak ardından markdown dosyanız içine tanımlayacağınız bir adet description ilede sayfa hakkında googleye yazı için açıklayıcı kısa bir bilgi verebileceksiniz.
`publisher` kısımlarını ise kendi Google Plus hesabınıza göre değiştirmeyi unutmayınız.

```
{% raw %}
<title>{{ page.title }} | Mertcan GÖKGÖZ</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="generator" content="Jekyll">
<link href="https://plus.google.com/103305118431759296457" rel="publisher" />
<meta name="author" content="{{ site.data.theme.name }}" />
<meta name="description" content="Özgür yazılım üzerine yazılar Sunucu yönetimi,teknoloji ve programlama hakkında türkçe site" />
<link rel="canonical" href="{{ site.url }}{{ page.url | replace:'index.html','' }}" />
<meta name="keywords" content="mertcan,server administration,sunucu yönetimi,linux,mertcan gökgöz,başkent üniversitesi,yönetim bilişim sistemleri,uygulama geliştirme,programlama,yazılım,ubuntu,internet ve teknoloji,özgür yazılım"/>
<meta name="robots" content="noodp"/>
{% endraw %}
```

Kategorileri düzenlerken ise sayfa şablonunu gene ben farklı bir şekilde düzenledim kategorilerde description olmayacağı için gene sitenin description tanımlamasını kullandım ve titlesini kategorinin ismine göre almasını seçtim.Yazar kısmıda otomatik olarak tanımladığınız yazara göre belirlenecek

Gelelim Eklenti ile yapılacak kısma bu son zamanlarda ortaya çıkan ve twitter gibi sosyal medya + genel seo ayarlamaları için kullanılmakta biz zaten eklentiden bir takım yapacaklarını manuel olarak yaptık bu yüzden ekleyeceğimiz kodda ilk olarak title belirlenmesini kapattık.

`_config.yml` ekleyeceğimiz satır.

```
gems:
  - jekyll-seo-tag
```

Aşağıdaki kod parçacığınıda yukarıdaki eklediklerimizin sonuna head tagları arasına eklemeyi unutmayınız.

```
{% raw %}
  {% seo title=false %}
{% endraw %}
```
Title dışındaki tüm SEO ayarlamalarını ise eklentiye yaptırmış olduk bu yaptırdıklarımıza description dahil değil

Eklentinin Bilgileri tam olarak işleyebilmesi için _config.yml dosyası içerisine aşağıdaki tanımlamaları kendinize göre düzenleyerek eklemeyi unutmayın.

```
title:            Mertcan GÖKGÖZ - Programlama, Sunucu Yönetimi, Teknoloji ve İnternet
tagline:          Blog
description:      "Özgür yazılım üzerine yazılar Sunucu yönetimi,teknoloji ve programlama hakkında türkçe site"
url:              https://mertcangokgoz.com

author:
  name:           'Mertcan GÖKGÖZ'
  url:            'https://mertcangokgoz.com'
  email:          'admin@mertcangokgoz.com'
  twitter:	      'http://twitter.com/0x2e88ce4'
```

# 6.Benzer Yazılar

bu benzer yazılar işini javascript ile yapabileceğiniz gibi jekyll nin kodları ilede yapabilirsiniz.Ama benim size önerim javascript ile random olarak yapmanız sitenize gelen ziyaretçiyede bu yönde yardımcı olmanız belki oraya random olarak gelecek bir içerik işine yarayacaktır.Bilemeyiz

Aşağıdaki kodu `post.html` nizin şablonuna ekliyorsunuz.Ben `defaultpost.html` kullandığım için onun içerisine head taglarının arasına ekledim.

```
{% raw %}
<script type="text/javascript">
var postsHREF = [{% for post in site.posts %}"{{ post.url }}"{% unless forloop.last %},{% endunless %}{% endfor %}];
var postsTitle = [{% for post in site.posts %}"{{ post.title }}"{% unless forloop.last %},{% endunless %}{% endfor %}];
</script>
{% endraw %}
```

daha sonrasında ise post.html dosyanız içerisine tamamen javascript kodlarından oluşmuş olan ve random gösterim imkanı sağlayan işlemi gerçekleştiriyoruz.Tasarımı kendi temanıza göre siz ayarlayacaksınız.

```
<script type="text/javascript">

    var randomIndexUsed = [];
    var counter = 0;
    var numberOfPosts = 5;

    while (counter < numberOfPosts)
    {
        var randomIndex;
        var postHREF;
        var postTitle;

        randomIndex = Math.floor(Math.random() * postsHREF.length);

        if (randomIndexUsed.indexOf(randomIndex) == "-1")
        {
            postHREF = postsHREF[randomIndex];
            postTitle = postsTitle[randomIndex];

            if (counter == (numberOfPosts - 1))
            {
                document.write('<ul class="posts"><li><a href="' + postHREF + '">' + postTitle + '</a></li></ul>');
            }
            else
            {
                document.write('<ul class="posts"><li><a href="' + postHREF + '">' + postTitle + '</a></li></ul>');
            }

            randomIndexUsed.push(randomIndex);

            counter++;
        }
    }
</script>
```
