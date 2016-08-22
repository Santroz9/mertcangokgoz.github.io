---
layout: post
title: Jekyll ile Dinamik tema kullanımı
date: 2016-08-22
type: post
categories: jekyll
description: Bazı sitelerde dikkat etmişsinizdir. Seçmeli tema yaparlar ve anlık olarak değişir reddit, 4chan, 2chan ve 8chan sitelerinde özellikle görebilirsiniz. Bu olayın yapılması
---

Bazı sitelerde dikkat etmişsinizdir. Seçmeli tema yaparlar ve anlık olarak değişir reddit, 4chan, 2chan ve 8chan sitelerinde özellikle görebilirsiniz. Bu olayın yapılması oldukça kolay ve oldukça basit bir iştir Javascript gibi bir nimet elimizin altında olduğu sürece herşeyi yapabileceğimizin de bir göstergesidir. Bize sadece 1 adet kütüphane gerekiyor oda haliyle `jQuery` bir kaç tanımlamada kullanacağız onun dışında saf JS kullanacağız.

temada kullanacağımız ve `_includes` içerisine eklemeniz gereken bir html sayfa `themechange.html` veya herhangi bir belirlediğiniz `.html` uzantılı bir şeyin içerisine aşağıdaki gibi bir html ekliyoruz.

```html
<div id="style-changer">
  <a id="light" href="javascript:changeTheme('light');" style="display: inline-block;">
    <img src="/assets/PH_Day_50x50.png">
  </a>
  <a id="dark" href="javascript:changeTheme('dark');" style="display: none;">
    <img src="/assets/PH_Night_50x50.png">
  </a>
</div>
```

Daha sonra nereye ekleyecekseniz `include themec.html` olarak liquit tag şeklinde tanımlıyorsunuz dosya içeriğinizde otomatik olarak oraya ekleniyor.

Ben değiştirme olayı olarak resim kullandım siz direk birşeyler yazabilirsiniz işte karanlık tema şudur aydınlık tema budur diye istediğinizi yapabilirsiniz hayal gücünüze bırakıyorum.

Ana `_layout` sayfalarda aşağıdaki tanımlamaları yapmayı unutmayın temamızın defaultunu belirlememiz ve diğer css dosyalarını göstermemiz gerekiyor.

```javascript
<script>
var default_theme = "light";
var light_theme = "/assets/css/light.css";
var dark_theme = "/assets/css/dark.css";
</script>
```

Her iki css dosyanızıda göstereceksiniz kullanıcı bunlardan birini seçtiği zaman otomatik olarak o css dosyası uygulanacak ön tanımlı olarak ben beyaz renkli temayı tercih etmiştim.

Kilit noktamıza geliyoruz. Jquery ile kodumuzu belirlememiz gerekiyor kodumuzda saate göre ayarlı temanın değişmesi durumu var akşam olduğu zaman tema otomatik olarak kararacak şekilde ayarladım ben şu şekilde

```javascript
jQuery(document).ready((function ($) {
    if (getCookie("themeStyle") == "") {
        if (default_theme == "default") {
            var h = new Date().getHours();
            if (h >= 7 && h <= 20) {
                setCookie("themeStyle", "light");
            } else {
                setCookie("themeStyle", "dark");
            }
        } else if (default_theme == "dark") {
            setCookie("themeStyle", "dark");
        } else {
            setCookie("themeStyle", "light");
        }
    }
    changeTheme(getCookie("themeStyle"));
}));
```

Cookie ayarlaması yapılması gerekiyor yoksa kullanıcının hangi temayı kullandığını bilemeyiz hem cookiyi yazdırmak hemde o cookie yi okumak için gerekli olan javascript kodlarımız

```javascript
function setCookie(c_name, value, expiredays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + expiredays);
    document.cookie = c_name + "=" + escape(value) +
        ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString()) + ";path=/";
}
function getCookie(c_name) {
    if (document.cookie.length > 0) {
        c_start = document.cookie.indexOf(c_name + "=");
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1;
            c_end = document.cookie.indexOf(";", c_start);
            if (c_end == -1) c_end = document.cookie.length;
            return unescape(document.cookie.substring(c_start, c_end));
        }
    }
    return "";
}
```

Bunların ışığında temanın değiştirilmesi durumunuda aşağıdaki güzelim kod yapıcak

```javascript
function loadCss(href) {
    if ($("#defaultStyle").length < 1) {
        var style = document.createElement('link');
        style.rel = 'stylesheet';
        style.type = 'text/css';
        style.id = 'defaultStyle';
        style.href = href;
        document.getElementsByTagName('HEAD').item(0).appendChild(style);
    } else {
        $("#defaultStyle").attr("href", href);
    }
}

function changeTheme(theme) {
    if (theme == "light") {
        $("#style-changer #light").css('display', 'none');
        $("#style-changer #dark").css('display', 'inline-block');
        loadCss(light_theme);
        setCookie("themeStyle", "light");
    } else {
        $("#style-changer #light").css('display', 'inline-block');
        $("#style-changer #dark").css('display', 'none');
        loadCss(dark_theme);
        setCookie("themeStyle", "dark");
    }
}
```

Kodumuz en son şu şekilde bulunması gerekiyor. Ayrı bir js dosyası düzenleyip içine yazmanız derli toplu durması için güzel olacak

```javascript
jQuery(document).ready((function ($) {
    if (getCookie("themeStyle") == "") {
        if (default_theme == "default") {
            var h = new Date().getHours();
            if (h >= 7 && h <= 20) {
                setCookie("themeStyle", "light");
            } else {
                setCookie("themeStyle", "dark");
            }
        } else if (default_theme == "dark") {
            setCookie("themeStyle", "dark");
        } else {
            setCookie("themeStyle", "light");
        }
    }
    changeTheme(getCookie("themeStyle"));
}));

function setCookie(c_name, value, expiredays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + expiredays);
    document.cookie = c_name + "=" + escape(value) +
        ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString()) + ";path=/";
}
function getCookie(c_name) {
    if (document.cookie.length > 0) {
        c_start = document.cookie.indexOf(c_name + "=");
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1;
            c_end = document.cookie.indexOf(";", c_start);
            if (c_end == -1) c_end = document.cookie.length;
            return unescape(document.cookie.substring(c_start, c_end));
        }
    }
    return "";
}

function loadCss(href) {
    if ($("#defaultStyle").length < 1) {
        var style = document.createElement('link');
        style.rel = 'stylesheet';
        style.type = 'text/css';
        style.id = 'defaultStyle';
        style.href = href;
        document.getElementsByTagName('HEAD').item(0).appendChild(style);
    } else {
        $("#defaultStyle").attr("href", href);
    }
}

function changeTheme(theme) {
    if (theme == "light") {
        $("#style-changer #light").css('display', 'none');
        $("#style-changer #dark").css('display', 'inline-block');
        loadCss(light_theme);
        setCookie("themeStyle", "light");
    } else {
        $("#style-changer #light").css('display', 'inline-block');
        $("#style-changer #dark").css('display', 'none');
        loadCss(dark_theme);
        setCookie("themeStyle", "dark");
    }
}
```

Bunun sonucunda temanız çifter olacak isterseniz farklı farklı daha fazlasını yapabilirsiniz. HTML ile bi dropdown yaparsınız eklersiniz seçenekleri ayarlarsınız JS yi hayal gücünüz artık ne kadarına el veriyor ise güzelce halledebilirsiniz.
