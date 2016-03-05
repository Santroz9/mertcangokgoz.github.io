---
layout: post
title: "İlişkisel Veritabanı Tasarlamak"
date: 2014-07-15 17:19:10.000000000 +03:00
type: post
published: true
status: publish
categories: Programlama
description: Sizlere örnek olarak bir veritabanı tasarlamak istiyorum, özellikle de belirtmek istiyorum veritabanı tasarlamak oldukça önemli
---

Sizlere örnek olarak bir **veritabanı** tasarlamak istiyorum, özellikle de belirtmek istiyorum veritabanı tasarlamak oldukça önemli bir iş olduğundan ve iyi bir araştırma sonucu yapılması gerektiğinden dikkat etmenizde fayda var. İleride farklı projelerde kullanılacaksa veya kullanacağınız veritabanını geliştirmek istiyorsanız belirli bir hiyerarşik yapıya göre tasarlamalısınız ki ileride verileriniz arttığı zaman yönetebilmenizi kolaylaşsın normal hayatta yapacağınız işlerde bile belli bir sıra varken veritaba'nın da da neden böyle olmasın ki

Örnek verecek olursak sıradan bir veritabanı tasarlayalım

![veritabanitasarimigorsel1](/assets/veritabanitasarimigorsel1.png)

Gördüğünüz gibi tablomuz güzel bir şekilde oluşturulmuş. Çalışanların bilgileri girilmiş ve ilgili alanlar tam olarak doldurulmuş durumdadır. Gerektiği bilgiyi sistem yöneticisi artık isme göre rahatlıkla arayabilir. Ancak **veritaba'nın** da bulunan veriler arttıkça yapacağınız bu aramanın hem hızı hem de sistemi yorma olasılığınız artar. Ayrıca velev ki departmanların bir takım özellikleri bulunması durumunda ayrı bir şekilde listelememiz gerekecek ve bu tabloya ait bilgilerinde ilişkili biçimde çalışanlara aktarılması gerekir işte bu noktada yukarıdaki yaptığımız şekilde ki bir yapıda ileriye dönük olarak ne bir işlem yapabiliriz nede bizim yapacağımız işlemler kısalır tam tersi işlemlerin süresi uzar ve sistemi efektif olarak kullanamayız hal böyle olunca mümkün mertebe ilişkisel durumlar göz önüne alınır ve veritabanı tasarlanırken buna dikkat ederek işlemlere başlarız.

![veritabanitasarimigorsel2](/assets/veritabanitasarimigorsel2.png)

Görüldüğü üzere doğru bir veritabanı tasarımı işte bu şekilde yapılmaktadır yapacağınız işlemler ve tutacağınız veriler artarsa kafanızı biraz karıştırabilir ancak ilerleyen zamanlarda işinize fazlasıyla yarayacak ve sefasını rahatlıkla süreceksiniz…
