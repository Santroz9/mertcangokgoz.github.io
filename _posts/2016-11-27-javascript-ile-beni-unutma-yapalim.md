---
layout: post
title: Javascript ile Beni Unutma Yapalım
date: 2016-11-27
type: post
categories: programlama
description: Gene bir gün öyle normal bir şekilde oturuyorum google'nin bir sitesinde gözüme bir şey ilişti belli bir süre tarayıcıda aynı tab da olmadığınızda
---

Gene bir gün öyle normal bir şekilde oturuyorum google'nin bir sitesinde gözüme bir şey ilişti belli bir süre tarayıcıda aynı tab da olmadığınızda **title** değişiyor. ve Beni unutma, işte buradayım falan gibi şeyler yazmaya başlıyor. Bir an dedim ne oluyoruz ama sonradan araştırınca böyle bir özelliğin olduğunu fark ettim.

Araştırmalarım sonucunda aşağıdaki gibi güzel bir kod çıktı ortaya mevzu tab değişince focus diye bir olay tetiklenmesi yani üzerine gelindiğinde aktif olması başka tab lar da gezdiğinizde ise blur olarak geçiyor ve **title** değiştiriliyor. yani **Focus** bir yere odaklanınca işlem yapmak için kullanılıyor. **Blur** ise odaklanma işlemini sonlandırdığınızda her hangi bir işlem yaptırmak için kullanılıyor.

İsterseniz adama küfür edin istersenizde "Beni Unutma" şeklinde bir şeyler yazın ziyaretçi bakar mı bilmiyorum ama özellik güzel

```
<script src="https://code.jquery.com/jquery-1.12.4.min.js" charset="utf-8"></script>
<script type="text/javascript">
$(function() {
      var message = "Beni Unutma :(";
      var original;

      $(window).focus(function() {
          if (original) {
              document.title = original;
          }
      }).blur(function() {
          var title = $('title').text();
          if (title != message) {
              original = title;
          }
          document.title = message;
      });
});
</script>
```

Bu koda isterseniz bir tanımlama yaparak işte adam tabı unuttuktan 2 dk sonra **title** değiştir gibi şeyleri ekleyebilirsiniz. `timeout` vermeniz her türlü yetecektir.