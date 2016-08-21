---
layout: post
title: Jekyll ile Ajax Kullanımı
date: 2016-08-21
type: post
categories: linux
description: Jekyll ile biraz daha fantastik şeyler yapabileceğimizi biliyorum sonuçta statik bir içerik ile uğraşıyoruz
---

Jekyll ile biraz daha fantastik şeyler yapabileceğimizi biliyorum sonuçta statik bir içerik ile uğraşıyoruz. Bunu oluştururkende jekyll kardeşi aracı olarak kullanıyoruz peki ajax niye kullanmayalım. Buna biraz farklı bir açıdan bakmak lazım kullanıcıları şaşırtabiliriz "yok artık lan bu kadar hızlı açılır mı" diyebilir mantıken ama pratikte öyle olmayacaktır çünkü senin sitenden daha hızlı açılanlarda var yani dünyaca ünlü siteler

Ama onları bir kenara bırakırsak piyasadaki çoğu sitenin hızını geçebilecek birşeyler yapabilirsin 2 şeye ihtiyacımız var

- Jquery
- Sabır

Sabır özellikle gerekli Javascript biraz zaman alıyor ve doğru çalıştırana kadar uğraşabiliyorsunuz. Ben bu uğraşı yaptım ve size çalışır olan hazır kodları vereceğim.

Şimdi şöyle bir yol izleyeceğiz. Kullanacak olduğumuz JS ler ve dosyalar şöyle olmayacak

- [History.js](https://github.com/browserstate/history.js/)
- [Jekyll AJAX](https://github.com/joelhans/Jekyll-AJAX)
- [Jquery](https://github.com/jquery/jquery)

history ve jquery dosyalarını gerekli olan yerlere güzelce ekliyorsunuz genelde bunlar `_layout` klasörü içerisinde bulunan ve `.html` uzantılı olan dosyalardır.

Her birine sırasıyla ekleyin öncelikli olarak `Jquery` gelecek sonrasında `History.js` yi ekleyeceksiniz.

Şöyleki

```html
<script type="text/javascript" src="/assets/js/jquery.js"></script>
<script type="text/javascript" src="/assets/js/history.js"></script>
```

hemen ardından başlıyoruz işlemlerimize şimdi biz a taglarını hook etmemiz gerekiyor ki kullanıcıların geldiklerini vs yaptıklarını çözebilelim.

Yukarıdaki repoyu hazırlayan arkadaşta aynısını yapmış ancak burada ortaya bir sorun çıkıyor bazı linkler çalışmayabiliyor. Yapısı saçma bir şekilde bozuluyor ama kod şu şekilde

```javascript
jQuery(document).ready(function($) {
    var siteUrl = 'https://'+(document.location.hostname||document.location.host);
    $(document).delegate('a[href^="/"],a[href^="'+siteUrl+'"]', "click", function(e) {
        e.preventDefault();
        History.pushState({}, "", this.pathname);
    });

    History.Adapter.bind(window, 'statechange', function(){
        var State = History.getState();
        NProgress.start();

        $.get(State.url, function(data){
            document.title = data.match(/<title>(.*?)<\/title>/)[1];

            $('.content').html($(data).find('.content').html());

            _gaq.push(['_trackPageview', State.url]);
        });
        NProgress.done();
    });
});
```

Şimdi bu kodumuzda hayeti 2 olay var bunlardan birincisi içeriği aldığımız kısım

```javascript
$('.content').html($(data).find('.content').html());
```

ikincisi ise googleye linkin ve içeriğin değiştiğini belirtme aşaması bunu yapmazsak kimin nerede ne yaptığı hangi linke girdiğini takip edemeyiz kullanıcı davranışlarını takip etmek önemlidir

```javascript
_gaq.push(['_trackPageview', State.url]);
```

Bu işlem sonlandığında tüm siteniz Ajax destekli olacak ama benim gibi sizde sorun yaşarsanız ki bu sorun özellikle linklerin yapısında olursa aşağıdaki gibi çözebilirsiniz.

```javascript
function loadBlog(obj) {
    var url = $(obj).attr("href");
    loadBlogByURL(url, true);
}

function loadBlogByURL(url, isSetReplaceState) {
    $.ajax({
        type: "get",
        url: url,
        timeout: 10000,
        beforeSend: function () {
            NProgress.start();
        },
        success: function (dates) {
            if (isSetReplaceState) {
                History.replaceState(null, null, url);
            }
            var State = History.getState();
            $('.content').html($(dates).find('.content').html());
            document.title = dates.match(/<title>(.*?)<\/title>/)[1];
            _gaq.push(['_trackPageview', State.url]);
        },
        complete: function () {
            NProgress.done();
        },
        error: function () {
            alert("Başarısız, Lütfen Sayfayı Yenileyin!");
        }
    });
}
```

direk olarak bir fonksiyon geliştirme işlemi yaptık herşeyi içinde barındırıyor ve birde içerik gelmez ise hata mesajımızı kondurduk tam bir ajax oldu

burada gözünüze çarpan NProgress uygulamasını olmuştur github aracılığı ile onu da edinebilirsiniz.

- [NProgress](https://github.com/rstacruz/nprogress)

Bu uygulama sayesindede Medium, Youtube gibi sitelerde bulunan progress bar özelliğini getirmiş olacaksınız.

yukarıda vermiş olduğum kodun tam çalışması içinde a tagları içerisine veya kullandığınız yapıda artık neyse oraya şu şekilde bir ekleme yapıyorsunuz ki fonksiyon çalışabilsin `onclick="loadBlog(this)"` bu aşamadan sonra kayıt edip `push` ettiğinizde otomatik olarak linkler çalışacak.

istediğiniz gibi çalışmaz ise ne yapacaksınız a tagını değiştireceksiniz default olarak a tagı zaten linki açacazğı için çift yükleme yapmasını bekliyorum ben deneme fırsatım pek olmadı açıkçası o yüzden yorum olarak yazabilirsiniz.

bu gibi durumda a tagını değiştirip farklı birşeyler yazıp daha sonra onuda css ile a tagına benzetebilirsiniz zor birşey değil :)

öptüm bye <3
