---
layout: post
title: Jekyll ile Statik Web Sayfaları Bölüm 4
date: 2016-03-21
type: post
categories: linux
description: Bir Web sitesinin olmazsa olmazlarından biri olan bu kategorileri
---

# 7. Kategorileme İşlemi

Bir Web sitesinin olmazsa olmazlarından biri olan bu kategorileri Jekyll ilede kolaylıkla yapabileceğiz. ilk olarak `_layout` dosyamıza `category.html` adında bir dosya oluşturuyoruz.

```
{% raw %}
---
layout: defaultcategory
---
<h1 class="title">{{ page.title }}</h1>

{% unless page.content == '' %}
  <p>{{ page.content }}</p>
{% endunless %}
<ul id="blog-posts" class="posts">
{% for post in site.categories.[page.category] %}
  <li><span>{{ post.date | date_to_string }} &raquo;</span><a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>
{% endraw %}
```

oluşturduğumuz bu category sayfasının **ana şablonu** ise benim oluşturmuş olduğum. `defaultcategory.html` oda `_layout` dosyası içerisinde şu şekilde bulunuyor.

```
{% raw %}
---
layout: compress
---

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="tr-TR"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="tr-TR"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="tr-TR"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="tr-TR"> <!--<![endif]-->
<head>
  <meta charset="UTF-8">
  <!-- Mertcan Gökgöz 2016 <https://github.com/MertcanGokgoz> -->
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <title>{{ page.title }} | Mertcan GÖKGÖZ</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="generator" content="Jekyll">
  <link href="https://plus.google.com/103305118431759296457" rel="publisher" />
  <meta name="author" content="{{ site.data.theme.name }}" />
  <meta name="description" content="Özgür yazılım üzerine yazılar Sunucu yönetimi,teknoloji ve programlama hakkında türkçe site" />
  <link rel="canonical" href="{{ site.url }}{{ page.url | replace:'index.html','' }}" />
  <meta name="keywords" content="mertcan,server administration,sunucu yönetimi,linux,mertcan gökgöz,başkent üniversitesi,yönetim bilişim sistemleri,uygulama geliştirme,programlama,yazılım,ubuntu,internet ve teknoloji,özgür yazılım"/>
  <meta name="robots" content="noodp"/>
  <meta name="google-site-verification" content="72uYg4UxAer0YwWdtkU93OGqjNq7ZThpqe0M4KxyvIg"/>
  <meta name='yandex-verification' content='410f2e33fe81ce80'/>
  <meta name="msvalidate.01" content="2183CAED5258723C183F825A20DF9C4A"/>
  <link href="//fonts.googleapis.com/css?family=Open+Sans:600,800" rel="stylesheet" type="text/css">
  <link rel="shortcut icon" href="/favicon.ico">
  <link rel="alternate" type="application/rss+xml" title="{{ site.data.theme.name }}" href="{{site.url}}/feed.xml" />
  <link rel="stylesheet" href="/assets/css/all.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
  {% seo title=false %}
</head>
<body>
  <div class="container">
    <div class="three columns sidebar">
      {% include sidebar.html %}
    </div>

    <div class="eight columns content">
      {{ content }}

      <div class="footer">
        {% include footer.html %}
      </div>
    </div>
  </div>

{% include analytics.html %}
</body>
</html>
{% endraw %}
```

Bundan sonrası ise categorylerinizi oluşturmanız şöyle ki her bir kategori için bir dosya ve altında index.html gerekiyor.

Misal : **/category/Analiz** şeklinde yapacaksak dosyaları oluşturuyoruz ve Analiz dosyası içerisine **index.html** açıp içerisini şu şekilde dolduruyoruz.

```
{% raw %}
---
layout: category
title: Analiz
category: Analiz
---
{% endraw %}
```

Bunlar dışında herhangi bir ekleme yada çıkartma işlemi yapmıyorsunuz daha sonrasında jekyll otomatik olarak oluşturacak zaten

# 8. Push Notification Özelliği

Bu özelliği opsiyon olarak düşünebilirsiniz kullanıcılarınıza abone olmalarını isteyebilir yeni yayınladığınız her yazıda kullanıcılara bilgi göndermek isteyebilirsiniz. Bunun için [Bu konuda yazanları yapmanız](https://mertcangokgoz.com/wordpress-icin-push-notification-ozelligi/ "") gerekiyor.Tek farkı ise eklentiyi kurmak yerine default şablon sayfasına şu satırları kendinize göre düzenleyip ekleme yapacaksınız.

```
<link rel="manifest" href="/manifest.json">
<script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async></script>
<script>
    var OneSignal = OneSignal || [];
    OneSignal.push(["init", {
      appId: "0102cb4b-6b21-495b-87bc-0547252a8eb9",
      autoRegister: true,
      welcomeNotification: {
            "title": "mertcangokgoz.com",
            "message": "Abone Olduğunuz için Teşekkürler",
      }
    }]);
</script>
```

Sitenize gelen kullanıcılara bildirim konusunda daha sonra bir takım uyarı balonları çıkacaktır.

# 9. Pagespeed İyileştirmesi

kodlar döngülerden dolayı çok ilginç gözüktüğünü görüyorsunuzdur **jekyll** buna bir çözüm getirse aslında güzel olurdu fakar bu hali bence yeter hiç gerek yok fazlasına o yüzdende biz gerekeni yapalım ve `_layout` bölümünde bi `compress.html` oluşturalım bunun içerisine ise aşağıdaki kodu ekleyelim

```
{% raw %}
{% capture _LINE_FEED %}
{% endcapture %}{% if site.compress_html.ignore.envs contains jekyll.environment %}{{ content }}{% else %}{% capture _content %}{{ content }}{% endcapture %}{% assign _profile = site.compress_html.profile %}{% if site.compress_html.endings == "all" %}{% assign _endings = "html head body li dt dd p rt rp optgroup option colgroup caption thead tbody tfoot tr td th" | split: " " %}{% else %}{% assign _endings = site.compress_html.endings %}{% endif %}{% for _element in _endings %}{% capture _end %}</{{ _element }}>{% endcapture %}{% assign _content = _content | remove: _end %}{% endfor %}{% if _profile and _endings %}{% assign _profile_endings = _content | size | plus: 1 %}{% endif %}{% for _element in site.compress_html.startings %}{% capture _start %}<{{ _element }}>{% endcapture %}{% assign _content = _content | remove: _start %}{% endfor %}{% if _profile and site.compress_html.startings %}{% assign _profile_startings = _content | size | plus: 1 %}{% endif %}{% if site.compress_html.comments == "all" %}{% assign _comments = "<!-- -->" | split: " " %}{% else %}{% assign _comments = site.compress_html.comments %}{% endif %}{% if _comments.size == 2 %}{% capture _comment_befores %}.{{ _content }}{% endcapture %}{% assign _comment_befores = _comment_befores | split: _comments.first %}{% for _comment_before in _comment_befores %}{% if forloop.first %}{% continue %}{% endif %}{% capture _comment_outside %}{% if _carry %}{{ _comments.first }}{% endif %}{{ _comment_before }}{% endcapture %}{% capture _comment %}{% unless _carry %}{{ _comments.first }}{% endunless %}{{ _comment_outside | split: _comments.last | first }}{% if _comment_outside contains _comments.last %}{{ _comments.last }}{% assign _carry = false %}{% else %}{% assign _carry = true %}{% endif %}{% endcapture %}{% assign _content = _content | remove_first: _comment %}{% endfor %}{% if _profile %}{% assign _profile_comments = _content | size | plus: 1 %}{% endif %}{% endif %}{% assign _pre_befores = _content | split: "<pre" %}{% assign _content = "" %}{% for _pre_before in _pre_befores %}{% assign _pres = _pre_before | split: "</pre>" %}{% assign _pres_after = "" %}{% if _pres.size != 0 %}{% if site.compress_html.blanklines %}{% assign _lines = _pres.last | split: _LINE_FEED %}{% capture _pres_after %}{% for _line in _lines %}{% assign _trimmed = _line | split: " " | join: " " %}{% if _trimmed != empty or forloop.last %}{% unless forloop.first %}{{ _LINE_FEED }}{% endunless %}{{ _line }}{% endif %}{% endfor %}{% endcapture %}{% else %}{% assign _pres_after = _pres.last | split: " " | join: " " %}{% endif %}{% endif %}{% capture _content %}{{ _content }}{% if _pre_before contains "</pre>" %}<pre{{ _pres.first }}</pre>{% endif %}{% unless _pre_before contains "</pre>" and _pres.size == 1 %}{{ _pres_after }}{% endunless %}{% endcapture %}{% endfor %}{% if _profile %}{% assign _profile_collapse = _content | size | plus: 1 %}{% endif %}{% if site.compress_html.clippings == "all" %}{% assign _clippings = "html head title base link meta style body article section nav aside h1 h2 h3 h4 h5 h6 hgroup header footer address p hr blockquote ol ul li dl dt dd figure figcaption main div table caption colgroup col tbody thead tfoot tr td th" | split: " " %}{% else %}{% assign _clippings = site.compress_html.clippings %}{% endif %}{% for _element in _clippings %}{% assign _edges = " <e;<e; </e>;</e>;</e> ;</e>" | replace: "e", _element | split: ";" %}{% assign _content = _content | replace: _edges[0], _edges[1] | replace: _edges[2], _edges[3] | replace: _edges[4], _edges[5] %}{% endfor %}{{ _content }}{% endif %}
{% endraw %}
```
Şimdi bu uzun uzun yazan kod parçacığını açıklamaya kalkarsak sıkıntı çıkar bu yüzden siz gerekli dokümantasyona bakabilirsiniz ancak bu değiştirdiğim sürümü [Github](https://github.com/penibelst/jekyll-compress-html) sayfasında istatistikleri ile birlikte düzelttiklerinide gösteriyor hoşuma gitmediği için o kısımları kaldırdım.

Bu layoutu ise şu şekilde kullanmanız gerekiyor elinizde var olan `default.html` içerisine ekleme yapacaksınız bildiğiniz gibi bunun içerisinde herhangi bir **layout** belirten kısım yok bunu belirteceğiz.

```
{% raw %}
---
layout: compress
---
{% endraw %}
```

Ana şablonlar sıkıştırma işleminin yapılacağı şablonu içerisine katacak ve güzel bir şekilde sayfamızda boşlukları yorumları vs yemizleyecek.

`_config.yml` unutmadan eklememiz gerekenleri ekleyelim.

```
{% raw %}
#Compress
compress_html:
  clippings: all
  comments: all
  endings: all
  ignore:
    envs: [local]
  blanklines: false
  profile: true
  startings: [html, head, body]
{% endraw %}
```

öptüm bye <3
