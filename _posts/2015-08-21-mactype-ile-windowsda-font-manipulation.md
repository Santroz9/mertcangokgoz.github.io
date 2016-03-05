---
layout: post
title: MacType ile Windows'da Font Manipulation
date: 2015-08-21 19:13:25.000000000 +03:00
type: post
published: true
status: publish
categories: Windows
description: MacType keşfedeli sanırım yaklaşık 14 saat oluyor dün gece tam bilgisayarı kapatırken fark ettim MacOSX deki GDI yi windowsda nasıl kullanırız

---

**MacType** keşfedeli sanırım yaklaşık 14 saat oluyor dün gece tam bilgisayarı kapatırken fark ettim **MacOSX** deki **GDI** yi **Windows** da nasıl kullanırız diye düşünüyordum bir kaç kütüphane ve uygulama gördüm ancak güncel değillerdi en sonda bu **MacType** adında programı buldum.Uygulama **Mac** fontlarını **Windows** sistemlerde kullanmamız için geliştirilmiş ama istediğiniz gibi özelleştirebilirsiniz **CSS** yazar gibi font ayarlarını yapabilirsiniz.Uygulamayı geliştiren arkadaş şuanda ne yapıyor yada ne zaman tekrar uygulamayı günceller bilemiyorum ancak uygulamada otomatik güncelleme özelliği mevcut

Uygulamayı ben son sürümünü buldum **2014 tarihinde** güncellenmiş.Aşağıdaki linkten indirebilirsiniz.

[MacType İndirmek İçin Tıklayın](https://mega.nz/#!hARVWTrZ!O0da0Z1F9QFutiLgrtOPsja4lGOS9cN9XzP-6MFNKUY)

İndirdiğiniz uygulamayı yönetici olarak kuruyorsunuz tabi kurulum esnasında her şey&nbsp; **Çince** &nbsp;olacak bunu siz bir güzel **English** diye seçerek düzeltin.Kurulumu İngilizce olarak tamamlayın.

![mactypegorsel1](/assets/mactypegorsel1-e1440174410188.jpg)

Buradan etkileşimli modu yani uyumluluk modunu aktif edelim bazı programlarda sıkıntı çıkmaması için bunu seçiyoruz siz **Manual** olanı da seçebilirsiniz her açtığınızda fontların değişik gözükmesini istemeyebilirsiniz. **Next** diyip ilerlediğimizde ise fontların ve ekran tiplerini seçeceğimiz bir ekran gelecek **Default** seçiyoruz.

![mactypegorsel2](/assets/mactypegorsel2-e1440174422913.jpg)

Bu ekranda seçip **finish** dedikten sonra işlemleriniz sonuçlanıyor.Bilgisayarınıza bir kereye mahsus **reset** attık dan sonrada artık mac fontlarını kullanabilirsiniz yada istediğiniz bir fontu özelleştirebilirsiniz.

Bu işlemlerden sonra tüm uygulamalarda fontlar değişecek fazla bir ayar yapmanıza gerek yok bir tek chrome de fontlar değişmeyecek çünkü chrome&nbsp;da&nbsp; **DirectWrite** denen bir özellik kapalı geliyor bunu açmamız lazım eski sürümlerde olsa idi chrome de baya uğraşacaktık ama 38 ve üstü sürümlerde bu özellik var.

    chrome://flags/#disable-direct-write

yukarıdaki komutu direk olarak chrome tarayıcısına yapıştırın gelen yerden Etkinleştir e basın chromeyi yeniden başlattıktan sonra ayarlarınız aktif olacak ve yeni fontunuz ile chrome kullanabileceksiniz.
