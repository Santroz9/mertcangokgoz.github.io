---
layout: post
title:  Yazıcılar İçin CSS Düzenlemeleri
date: 2016-07-05
type: post
categories: Programlama
description: Normal şartlar altında css yazmayı sevmem çünkü bir yerini düzeltirken aynı zamanda bir başka yeri bozabiliyorsunuz. print css
---

Normal şartlar altında css yazmayı sevmem çünkü bir yerini düzeltirken aynı zamanda bir başka yeri bozabiliyorsunuz.Yazıcılar için ise CSS yazmak oldukça zevkli çünkü sadece CTRL + P tuş kombinasyonu ile çalıştırabilirsiniz veya javascript ile tetikleyebileceksiniz.

Çıktısının alınmasını istediğiniz sayfalarınıza aşağıdaki gibi bir css dosyası ekliyoruz.Bunu ayrı tutacağız hem bizim açımızdan işler kolay olacak hemde tarayıcıya yol göstermiş olacağız

```html
<link rel="stylesheet" type="text/css" media="print" href="/assets/css/print.css">
```

Şimdi belirli standartlara göre düzenlemeler yapmamız gerekiyor yapacağımız bu düzenlemeler akademik makalelerde kullanılan bir şablona göre.Birebir tabi ki de aynı değil çünkü birebir aynısını yaptığımız zaman oldukça fazla sayfa oluşuyor bunun nedeni sayfanın 4 bir yanından içeri 3 cm kadar girinti yapmamız olurdu biz bu şekilde bir düzenleme yapmayacağız.Ama sayfada yazdırırken görüntüsü oldukça hoşunuza gidecek

```css
/*Print.css
Copyleft © Mertcan GÖKGÖZ 2016*/

@media only print {

  @page { size: A4; margin: 1.5cm !important; }

  body {
    width:100% !important;
    margin:0 !important;
    padding:0 !important;
    filter:none !important;
    -ms-filter: none !important;
    border-top: none;
    background: none;
    color: black;
    text-align: justify;
    font-family: Garamond, 'Times New Roman', serif;
    line-height: 1.45;
    font-size: 14pt;
    word-spacing: 1px;
    letter-spacing: 0.2px;
  }

  *,
  *:before,
  *:after,
  *:first-letter,
  *:first-line {
    background: transparent !important;
    color: #000 !important;
    box-shadow: none !important;
    text-shadow: none !important;
    border-bottom: none;
  }

  h1,h2,h3,h4,h5,h6 { page-break-after:avoid; page-break-inside:avoid; }
  h1,h2,h3 { text-transform: capitalize; }
  h1 { font-size:19pt; }
  h2 { font-size:17pt; }
  h3 { font-size:15pt; }
  h4,h5,h6 { font-size:14pt; }

  p, h2, h3 { orphans: 3; widows: 3; }
 
  .content h1 { text-align: center; }
  
  .content {
    background: transparent;
    border-left: none;
    width: 100%;
    margin: 0;
    padding: 0;
    color: black;
    float: none !important;
  }

  table { margin: 1px; text-align:left; }
  th { border-bottom: 1px solid #333;  font-weight: bold; }
  td { border-bottom: 1px solid #333; }
  th,td { padding: 4px 10px 4px 0; }
  tfoot { font-style: italic; }
  caption { background: #fff; margin-bottom:2em; text-align:left; }
  thead {display: table-header-group;}
  img,tr {page-break-inside: avoid;}

  pre, blockquote, table { page-break-inside: avoid; }

  pre { padding-left: 0.8cm; color: #FE7FAC !important; white-space: pre-wrap; word-wrap: break-word; }
  code { font: 12pt Courier, monospace; }
  blockquote { margin: 1.2em; padding: 1em;  font-size: 12pt; }

  ul, ol, dl { page-break-before:avoid }

  img { float: left; margin: 1em 1.5em 1.5em 0; max-width: 100% !important; }
  a img { border: none; }
  /* gözükmesini istemediginiz idlerimiz */
  #nav, #sidebar, #paylasim, #related, #disqus_thread{ display: none; }
  /* gözükmesini istemediğiniz classlarımız */
  .sidebar, .disclaimer, .meta, .seo, .pagination, .menuM{ display: none; }

  hr { display: none; }

  a:link, a:visited { background: transparent; font-weight: 700; text-decoration: underline;color:#333; }

  a[href]:after { content: " (" attr(href) ")"; }

  abbr[title]:after { content: " (" attr(title) ")"; }

  .ir a:after,a[href^="javascript:"]:after,a[href^="#"]:after { content: ""; }

  aside { display:block; page-break-before: always; }
}
```

Bu CSS kodlarını sitenize bahsettiğim şekilde eklediğiniz anda yazıcılar için güzel bir düzen elde etmiş olacaksınız.Kodlarda belirtiğim yerleri sayfanızda yazdırılmasını istemediğiniz alanların class ve id lerini ekleyerek düzenleyebilirsiniz.