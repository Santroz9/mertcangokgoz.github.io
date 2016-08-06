---
layout: post
title: Linux sistemlerde trafik limitleme
date: 2015-02-05 14:30:27.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Trafiğini limitlemek istediğiniz bir sisteminiz ve bir interface olsun genelde bunu yapmaz çoğu kişi ve sistemde çok adam olduğu zaman internetde
---

Trafiğini limitlemek istediğiniz bir sisteminiz ve bir interface olsun genelde bunu yapmaz çoğu kişi ve sistemde çok adam olduğu zaman internetde kasmalar ve boğulmalar baş gösterir.Bunu önlemek için bu makalemizde bahsedeceğimiz uygulamayı kullanabilirsiniz.Program direk olarak interface tanımlayacağınız değer ile trafiği limitlendirmeyi amaçlıyor ve bunu gayet iyi yapıyor.Uygulama biraz eski olsada hala sıkıntısız bir şekilde çalışıyor.

Ubuntu ,Debian

    sudo apt-get install wondershaper

Centos ,RHEL

    sudo yum install wondershaper

Kurulumu başarılı bir şekilde yaptıysanız eğer programın kullanımına geçelim 2 şey tanımlıyorsunuz uygulamada

    wondershaper <interface> <download-rate> <upload-rate>

Tanımlamış olduğunuz aralıklar kbit şeklinde olacak siz ayarlamalarınızı internet bağlantınıza göre bu şekilde yapabilirsiniz. 50000Kbit/s ve 5000kbit/s örnek olarak ayarlayalım

    wondershaper eth0 50000 5000

Yaptığınız ayarlama gün gelirde işnize yaramaz yada bağlantı hızınız değişirse aşağıdaki komut ile tanımlamayı kaldırabilir ve bağlantıyı limitsiz olarak kullanılmasını sağlayabilirsiniz.

    wondershaper clear eth0

Unutmayın yapacağınız tüm işlemleri root izni alarak yapmak zorundasınız yoksa hata ile karşılaşırsınız.
