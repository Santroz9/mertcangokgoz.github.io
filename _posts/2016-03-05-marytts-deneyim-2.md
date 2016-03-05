---
layout: post
title: MaryTTS Deneyimlerim 2
date: 2016-03-05
type: post
categories: Analiz
description: Evet arkadaşlar, uzunca bir süre boyunca MaryTTS'nin Vikipedi makalelerinden devrişirilen
---

Evet arkadaşlar, uzunca bir süre boyunca MaryTTS'nin Vikipedi makalelerinden devrişirilen wordlistini temizlemeye çalışıyordum. Bunun için önce `sort` komutuyla listeyi alfabetik olarak sıraladım. Bu sırada ilk hayal kırıklığımı yaşadım. Wordlist içerisinde hatrı sayılır miktarda Arapça ve Rusça da olmak üzere bir çok yabancı kelime vardı. Hemen onları text editöründe temizledikten sonra `sed` ile Türkçede olmayan `q,w,x` harflerini içeren satırları sildim. Bu da bir miktar daha İngilizce (veya diğer latin tabanlı diller) kelimenin daha listeden çıkmış olması demek fakat malesef geri kalanını elle temizlemeye çalışırken hala tonlarca böyle kelimenin olduğunu gördüm. Gerek elle düzenlemek için dosya boyutunun muazzam olması (**Yaklaşık 2MB**) gerek se düzenlenmesi gereken çok fazla şey olması nedeniyle aklıma daha temiz bir kaynak kullanarak sıfırdan bir wordlist yaratmak geldi.

#### Yeni Wordlist Yolunda Adımlar...
Yeni wordlist için kullanacağım kaynağın derli toplu,kapsamlı,sistematik ve diğer dillerdeki sözcüklerden olabildiğince yalıtılmış olması önemliydi.
Basit bir Google araması yaparak işime yarayabilecek 3 tane wordlist buldum:

- Birincisi, ve aradığıma en yakını Türkçe NLP yazılımı olan Zemberek tarafından oluşturulan [wordlist](https://zemberek.googlecode.com/files/full.txt.tr.tar.gz). Boyutu biraz fazla olmasına rağmen (**açılmış hali 19 MB**) tam aradığım özelliklere sahip bir kelime listesi bu.

- İkincisi, bir Vikisözlük parseri kullanılarak üretilmiş bir başka [wordlist](https://github.com/mertemin/turkish-word-list).
Bu kelime listesinin hoşuma gitmeyen tarafı sadece sözcükleri değil, deyimleri ve tamlamalarını da içermesi oldu. Gerçi küçük bir Regexp sorgusuyla filtrelenebilir fakat sıkıntı çıkarmayacak bir alternatifi olduğu sürece gerek görmedim.

- Üçüncüsü ise Wiktionary tarafından yayınlanan [Türkçe sözcük sıklığı istatistikleri](https://en.wiktionary.org/wiki/Wiktionary:Frequency_lists/Turkish_WordList_20K). Hem çok kısa olması hem de bol miktarda İngilizce sözcük içermesi nedeniyle kullanmadım.

- Hack sitelerindeki wordlistler ise bruteforce saldırılarında kullanılmak amacıyla hazırlanmış isim, sayı ve  noktalama işaretleri kombinasyonlarından oluşan devasa büyüklükteki (**Genelde GBlarca**) text dosyaları oldukları için zaten araştırmamın dışında tuttum.

#### Biraz Otomasyon

> Makinalara yaptırılabilecek bir şey insanlara yaptırılmamalıdır.

Zaten buradaki işlemleri elle yapmaya kalksam bu tempoyla ne kadar sürer tahmin bile edemiyorum :)

Neyse, işe `sed 's/[0-9]*//g'` komutuyla kelimelerin yanındaki frekansları kaldırmakla başladım. Sonra daha kolay işleyebilmek için `split` ile dosyaları 2MB lık parçalara böldüm.

Kelime listemizi hazırladığımıza göre şimdi bu listeyi transcripte edebiliriz, fakat öncelikle listemizin boyutunu düşürmeliyiz.
Bunun için bölümlediğimiz her parçadan yaklaşık biner rastgele kelime seçip yazdıran bir Python betiği yazdım:

```python
from Crypto.Random.random import randint

lines = [line.rstrip('\n') for line in open('xab')]
for i in range(0,1000):
    print lines[randint(0,len(lines))]
```

Transkripte işlemine gelirsek, önceki dosyadaki örneklere göre önce kelimeleri hecelememiz lazım. Ben bu işlem için heceleri liste elemanı olarak verebildiği için [şuradaki](https://github.com/emineker/3-yeni-hesap/blob/master/algoritma/heceleme.py) örneği kullandım. Hecelerin arasına tire işareti eklenmeli ve vurgunun olduğu hecenin başına tek tırnak işareti (**'**) eklenmeli. Türkçe'de vurgu genellikle son hecede olduğundan çok sıkıntı çıkmadı bu aşamada. Son olarak  Python'un `.replace("foo","bar")` fonksiyonu kullanarak hecelerdeki harfleri `allophones.xml` de tanımlanan fonetik halleriyle değiştirerek asıl kelimelerin yanına yazdırdım ve [bir önceki gönderideki](/programlama/2015/08/12/marytts-deneyim-1/) gibi bir görünüm elde ettim. Son olarak birkaç functional ifadesi ekleyince eskisinden çok daha iyi bir wordlist oldu :-)
Tabi yoğurttan bir kere ağzım yandığından henüz pull request göndermedim fakat geliştiriciye bu konuda mesaj attım. Dosyanın yeni haline gözatmak [için](https://github.com/geekdinazor/marytts/blob/master/marytts-languages/marytts-lang-tr/lib/modules/tr/lexicon/tr.txt).

[Furkan KALKAN](http://www.furkankalkan.com/) Tarafından yazılmıştır.
