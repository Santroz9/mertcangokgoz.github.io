---
layout: post
title: Jekyll ile Statik Web Sayfaları Bölüm 2
date: 2016-03-12
type: post
categories: Linux
description: Jekyll kabaca giriş yaptık genel olarak bir takım özelliklerini
---

Jekyll kabaca giriş yaptık genel olarak bir takım özelliklerini ve nasıl kullanılacağını github pages göre anlattık.Şimdi ise biraz daha devam ediyor ve bir blog nasıl oluşturulur onu göstermek istiyorum ben tema olarak [lagom](https://github.com/swanson/lagom) seçtim hem listeleme olarak güzel gözüküyor hemde skeleton yapısı sayesinde duyarlı bir tema her boyutta ekranda sorunsuz olarak içerikleriniz gözüküyor.

Temayı yapan arkadaşımız özellik eklememiş aslında bu güzel bir şey kullanacak olanlar ekler gözüyle bakmış ve minimal olarak bize sunmuş ancak ben bunlarla yetinmeyip bir kaç bir şey eklemek istedim.

1. Sayfalama yapısı
2. Google Search ile arama yapma imkanı
3. RSS Feed
4. Sitemap
5. SEO ayarlamaları
6. Resimlere responsive özelliği
7. Benzer yazılar
8. Kategorileme
9. Push Notification özelliği
10. Pagespeed iyileştirmeleri
11. Sosyal medya butonları
12. Disqus
13. Google Analytics, Yandex Metrica,Piwik,Gauges Desteği
14. MathJax
15. Ve bunun dışında temada kullanılan css ve dosya güncellemeleri

Sitemde Güvenliği sağlamak ve bildirim özelliğini kullanabilmek için ise ücretsiz olarak **CloudFlarenin** sunmuş olduğu [Universal SSL](https://www.cloudflare.com/ssl/) kullanmaya başladım.Sunucu tarafında githubun bize sunmuş olduğu SSL olduğu içinde hiçbir sıkıntı çıkmadı aslında **CloudFlare SSL** ayarlarından **Full** seçimini yaptığımızda tüm site **HTTPS** otomatik olarak geçmiş oluyor.

Bende sizlere sırasıyla bu eklediklerimi github pages e göre nasıl yaptığımı açıklayacağım sırasıyla gideceğiz tahmini olarak 15 bölüm olacak daha az da olabilir ama fazlası olmayacak

# 1.Sayfalama Yapısı

Şimdi sayfalama yapısı için yapmamız gereken bir kaç ufak ekleme var öncelikle `_layout` kısmında bulunan `page.html` isminde bir dosya oluşturup aşağıdaki kodları içerisine giriyorsunuz.

```
    {% raw %}
    {% if paginator.total_pages > 1 %}
    <div class="pagination">
      {% if paginator.previous_page %}
        <a href="{{ paginator.previous_page_path | prepend: site.baseurl | replace: '//', '/' }}">&laquo; Prev</a>
      {% else %}
        <span>&laquo; Prev</span>
      {% endif %}

      {% for page in (1..paginator.total_pages) %}
        {% if page == paginator.page %}
          <em>{{ page }}</em>
        {% elsif page == 1 %}
          <a href="{{ paginator.previous_page_path | prepend: site.baseurl | replace: '//', '/' }}">{{ page }}</a>
        {% else %}
          <a href="{{ site.paginate_path | prepend: site.baseurl | replace: '//', '/' | replace: ':num', page }}">{{ page }}</a>
        {% endif %}
      {% endfor %}

      {% if paginator.next_page %}
        <a href="{{ paginator.next_page_path | prepend: site.baseurl | replace: '//', '/' }}">Next &raquo;</a>
      {% else %}
        <span>Next &raquo;</span>
      {% endif %}
    </div>
    {% endif %}
    {% endraw %}
```

Tabi bunu kullanmak isterseniz sayfaya eklemeniz gerekiyor sonradan `index.html` dosyanıza ki bu ana dizinde bulunur en alta şu satırları ekleyerek önceki ve sonraki sayfa linkleme işlemlerini getirmiş oluyoruz.

```
    {% raw %}
    <div class="pagination">
      {% if paginator.previous_page %}
        <a href="{{ paginator.previous_page_path }}" class="previous">Önceki Sayfa</a>
      {% else %}
        <span class="previous">Önceki Sayfa</span>
      {% endif %}
      <span class="page_number ">Toplam: {{ paginator.total_pages }} Sayfa İçinden {{ paginator.page }}. Sayfa Gösteriliyor</span>
      {% if paginator.next_page %}
        <a href="{{ paginator.next_page_path }}" class="next">Sonraki Sayfa</a>
      {% else %}
        <span class="next ">Sonraki Sayfa</span>
      {% endif %}
    </div>
    {% endraw %}
```

Daha sonrasında ise `_config.yml` dosyanız içerisine kullanıcıya gösterilecek olan içerik sayısına göre limitleme işlemi yapıyorsunuz.Ayrıca sayfalama linkinin nasıl olacağınıda belirlemek için path ekliyoruz.


```
paginate_path: /page/:num/
paginate:         20
```

Ben 20 adet göstermek istediğim için 20 adet ile sınırladım siz isteğinize göre değiştirebilirsiniz.Tabi blog yazılarınızın content kısmında gözükmesi için sayfalama yapısını o kısmada eklemeniz gerekecek şöyle ki gene `index.html` içerisinde postları çağırdığınız kısma şu şekilde bir değişiklik yapıyorsunuz.

```
    {% raw %}
    <div id="home">
      <h2><i class="fa fa-bookmark"></i> Blog Yazıları</h2>
      <ul id="blog-posts" class="posts">
        {% for post in paginator.posts limit:20 %}
          <li><span>{{ post.date | date_to_string }} &raquo;</span><a href="{{ post.url }}">{{ post.title }}</a></li>
        {% endfor %}
      </ul>
    </div>
    {% endraw %}
```

`limit:20` olarak bahsettiğim yer sayfalama yapısında gösterilecek olan post sayısını ifade eder limitleme nedenim bazı sayfalarda 20 den fazla içerik getirmesi idi bende o kısmı limitleyerek sadece 20 tane gelmesini sağladım sayfalamada buna göre devam etti :)

# 2.Google Search

Googlenin siteler için oldukça güzel bir hizmeti var bu basit bir javascript kodu ile siteniz üzerinde arama yapılması imkanı tanıyor üstedik google servisini kullanıyorsunuz ve googleden trafik geliyor gibi gözüküyor.

[Google CSE](https://cse.google.com/cse/all) Giriyorsunuz ve sitenizin adresini yazıp kodunuzu ediniyorsunuz.Bundan sonrası kodu eklemek istediğiniz bir yere ekleyebilirsiniz.

Örnek Kodumuz:

```javascript
<script>
  (function() {
    var cx = '005109082008503114820:pjla7civnv0';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<gcse:search></gcse:search>
```
