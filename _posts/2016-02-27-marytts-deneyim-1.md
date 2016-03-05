---
layout: post
title: MaryTTS Deneyimlerim 1
date: 2016-02-27
type: post
categories: Analiz
description: Çok uzun sayılmaz ama bir süredir MaryTTS'nin Türkçe desteğini iyileştirmeye
---

Çok uzun sayılmaz ama bir süredir MaryTTS'nin Türkçe desteğini iyileştirmeye çalışıyorum. Henüz ortada elle tutulur, gözle görülür bir şey olmasa da bu projeyle ilgili Türkçe doküman olmadığı ve İngilizce dokümanlarının da biraz üstü kapalı bir şekilde anlatıldığı için deneyimlerimi bu blog üzerinden paylaşmayı düşünüyorum.

### Neden MaryTTS ?
MaryTTS ile lisedeyken görme engelliler için basit betikler yazarken, GNU/Linux ortamında çoğunlukla kullanılan **espeak**'in çok anlaşılır bir Türkçe desteği sunmadığını farketmem ve bunun üzerine daha farklı motorları araştırmam üzerine tanıştım. Daha önce adını duymadığım bir proje olmasına rağmen espeak'ten çok daha anlaşılır bir şekilde Türkçe konuştuğu için ilgimi çekmişti. Fakat Server/Client şeklinde kullanılması amacım bakımından uygun olmadığından yoluma espeak ile devam ettim.

##### Mary, Bana Şiir oku :)
Dilimizde olan fakat resmi olarak alfabemizde olmayan bazı fonetik sesler
(şapkalı harfler/*circumflexes*) henüz Mary tarafından tanınmasa da doğru noktalama işaretleri kullanıldığı sürece düzgün bir şekilde şiir bile okuyabildiğine tanık oldum.

Örnek:
</br>
<audio controls>
<source src="https://drive.google.com/uc?id=0B_9cFv5wWQGoeEozT0djYVBhQk0&authuser=0&export=download" type="audio/wav">
Your browser does not support the audio element.
</audio>

### İlk commit faciası
Geçenlerde MaryTTS'de gelişme var mı diye kontrol ederken bazı kelimeleri düzgün okuyamadığı farkederek `lexicon` dizinindeki `tr.txt` dosyasını gördüğüm öreneklere göre düzenleyip Github deposuna ilk pull requestimi attım fakat atmaz olaydım :D

Dosyanın yapısı yaklaşık şu şekilde:

```
ve 've functional
da '-da functional
de '-de functional
olarak o-la-'rak
bu 'bu functional
ile I-'le functional
Bu 'bu functional
olan o-'lan functional
için I-'tSIn functional
...
```
Ben de haliyle cahil cesaretiyle eklediğim bütün kelimelerin sonuna `functional` takısı koydum fakat yaklaşık 2 saat sonra adam bug bildiriminde bulunmuş lexicon dosyasındaki bütün eklenen kelimeler functional takısını içeriyor diye.  

> **Arkadaşlar siz siz olun ciddi bir projeye katkıda bulunmadan önce hemen atlamak yerine lütfen ne yaptığınızı biraz olsun araştırın.**

Neyse, biraz araştırmadan sonra fuctional ın anlamını öğrendim. [Şuraya](https://en.wikipedia.org/wiki/Function_word) göre edatlar, zamirler, yardımcı fiiller ve bağlaçları bu grup içerisinde değerlendirmemiz gerekiyormuş. İsim, sıfat, zarf vb içinse burayı boş bırakıyoruz.

Hatta bu dosyayı elle tek tek düzenlemek yerine Builder paketi içindeki [şöyle](http://mary.opendfki.de/wiki/TranscriptionTool) bir uygulama kullanabilirsiniz. Bu uygulama `tr.txt` dosyasını aynı dizindeki `allophones.xml` içerisindeki fonetik tanımlamalara göre doldurur.

[Furkan KALKAN](http://www.furkankalkan.com/) Tarafından yazılmıştır.
