---
layout: post
title: HTML Kodlama Dersleri - Bölüm 1
date: 2015-06-10 15:55:55.000000000 +03:00
type: post
published: true
status: publish
categories: programlama
description: "İnternet'de haddinden fazla html makalesi ve kodlama derslerinin olduğunun farkındayım ancak adam akıllı olarak bir ders serisine başlamak"
---

İnternet'de haddinden fazla html makalesi ve kodlama derslerinin olduğunun farkındayım ancak adam akıllı olarak bir ders serisine başlamak istedim ve bu makalemde HTML hakkında sizlere bir kaç ufak bilgi vermek istiyorum.Bu bilgiler dahilinde umuyorum ki bir web sayfası oluşturabilecek seviyeye geleceksiniz.

**H** yper **T** ext **M** arkup **L** anguage baş harflerinin birleşmesinden HTML ortaya çıkmıştır.Web sayfalarını oluştururken kullanacağınız temel dildir.Türkçeye adam akıllı çevrilemesede Metin işaretleme dili şeklinde adlandırılır.Unutmamak gerekiyor HTML bir programlama dili değildir.İlk olarak HTML 1990 yılında geliştirildi ve bugüne geliştirile geliştirile getirildi.

![htmltarihigorsel1](/assets/htmltarihigorsel1.jpg)

En son geliştirilen HTML5 dir.Bizde geliştirme yaparken HTML5 kullanacağız ve tüm standartlara uymaya çalışacağız.HTML Kodlarını oluştururken etiket adı verilen kodlardan oluşur bunlar "\<" ve "\>" içerisine yazılırlar.Açılan her etiketin bir kapanışı mutlaka olmak zorundadır tabi bazı istisnalar hariç kapatırkende "/" işaretini kullanırız. "Örn: \</body\>" kullanarak body etiketini kapatmış oluruz.

    <!DOCTYPE html>
    <html>
    <head>
    <title>Sayfanın Başlığı</title>
    </head>
    <body>
    <p>Birinci Paragraf</p>
    </body>
    </html>

Yukarıdaki örnekde görüldüğü gibi açılan tüm etiketler doğru bir şekilde kapatıldı.Kapatılmadığı zaman ise çalışmama gibi bir durumu yoktur tarayıcı tarafından yorumlandığı için geliştirilen son tarayıcılarda kapatmadığınız taglarda sorun çıkartmayacaktır.Düzgün bir biçimde gözükecektir ancak standartlar gereği açılan her etiketin kapatılması **ZORUNLUDUR.**

Yukarıda kullandığımız kodlar neler peki

- **DOCTYPE** diyerek sayfanın tipini tarayıcıya belirttik
- **\<html\>** ve **\</html\>** yazılacak olan kodlar bu tagların içerisinde olması zorunludur bu sayede html kodları tarayıcı tarafından yorumlanır.
- **\<head\>** ve **\</ head\>** arasına sayfa hakkında kullanıcıya ve arama motoru botlarına verilecek bilgiler tanımlanır.
- **\<title\>** ve **\</ title\>** arasına sayfanın başlığı yazılır.
- **\<body\>** ve **\</body\>** arasına kullanıcıya gösterilen kısımların tanımlamalarını yaparız yani etiketler buraya tanımlanır.
- **\<h1\>** ve **\</h1\>** arasına yazılan herşey başlık olarak gözükür.
- **\<p\>** ve **\</p\>** arasına yazılan herşey paragraf olarak gözükür.

Bütün HTML kodları **\<html\>** ve **\</html\>** etiketleri arasına yazılır.Bu etiketler dışına yazılan tüm kodlar geçersizdir.Bunların dışında HTML öğrenmesi oldukça basit bir dildir.
