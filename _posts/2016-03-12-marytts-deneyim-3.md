---
layout: post
title: MaryTTS Deneyimlerim 3
date: 2016-03-12
type: post
categories: analiz
description: En son MaryTTS için Türkçe lexicon wordlisti hazırlamıştım
---

En son MaryTTS için Türkçe lexicon wordlisti hazırlamıştım. Üzerinden bayağı zaman geçtiği halde cevap gelmemesi ve bu arada başka işlerim olması nedeniyle bu ara MaryTTS projesiyle fazla ilgilenemedim. Fakat 1 hafta önce, gönderdiğim yama kabul edilmiş ve [MaryTTS Deneyimlerim 1](/proje/2015/08/12/marytts-deneyim-1/) yazımda bahsettiğim hata kaydı kapatılmış ```^_^```

Bunun üzerine şapkalı harfler (*circumflexes*) üzerinde yoğunlaşmaya karar verdim. Çünkü şuanki `allophones.tr.xml` dosyası şapkalı harflere izin vermiyor. Bu konuda yoğunlaşmak istememin sebebiyse şapkalı a harfinin (â) Türkçede kritik bir rol oynaması. Modern yazı dilinde â harfini fazla kullanmasak da konuşma dilinde farklı anlamlardaki benzer sözcükleri birbirinden ayırmak için hâlâ kullanıyoruz --farkettiyseniz hala kullanmıyoruz; hâlâ kullanıyoruz :D --. Günlük hayatımızda bu kurala uyan *hâlâ,kâr, âdet,* vb. sözcükleri sıkça kullandığımızdan bu kelimelerin doğru okunması önemli.

# Fonetik Meseleler

MaryTTS Türkçe lexicon<sup>[1]</sup> dosyaları için **SAMPA** formatını kullanıyor. Bu formata göre uzatma işareti olarak `/:/` kullanılması gerekiyor. Örneğin **â** harfinin Sampa'ya göre fonetik<sup>[2]</sup> gösterimi `/a:/` dır. [[Kaynak]](https://www.phon.ucl.ac.uk/home/sampa/turkish.htm)

Fakat düzeltme harfi (şapka) harfin sadece uzun söylenmesini değil tonunun da normalden daha ince olmasını sağlıyor. Proje yöneticisi @psibre nin söylediklerine  göre bu **Suprasegmental Seviyede** *(Türkçe karşılığını bulamadım, ama vurgu,uzunluk ve ton ile alakalı bir şeymiş.)* modelleniyormuş. Ama ince tonla bağlantılı bir allophone<sup>[3]</sup> prozodi<sup>[4]</sup> modelini de geliştirirmiş. En yakın zamanda yeni bir Türkçe dil dosyası yapıp sonuçları aktaracağım.

---

## Terimler:

<sup>1</sup> **Lexicon:** Sözlük, kelime listesi

<sup>2</sup> **Fonetik alfabe(Phonetic transcription):** Bir dildeki seslerin görsel olarak gösterimi.

<sup>3</sup> **Allophone:** Farklı dillerde bir sesin (phoneme) farklı telaffuzlarıdır.

<sup>4</sup> **Prozodi(Prosody):** Seslerin tanımlanması ve bu seslerin, sözcük hecelerindeki kullanımı.

[Furkan KALKAN](http://www.furkankalkan.com/) Tarafından yazılmıştır.
