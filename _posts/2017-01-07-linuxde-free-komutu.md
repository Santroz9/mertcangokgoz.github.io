---
layout: post
title: Linux'de Free Komutu
date: 2017-01-07
type: post
categories: linux
description: Bir işletim sisteminin herhangi bir kullanıcısı için ortak bir soru, ne kadar bellek kullanıldığı ve ne kadarının boş olduğudur.
---

Bir işletim sisteminin herhangi bir kullanıcısı için ortak bir soru, ne kadar bellek kullanıldığı ve ne kadarının boş olduğudur. Bunu Linux'ta kontrol etme komutu `free` dir.

Bu komutu çalıştırırsınız ve karşınıza bir takım kafa karıştırıcı çıktılar verir;

```
free
```

Çıktısı şu şekilde olacak

```
              total        used        free      shared  buff/cache   available
Mem:       16345216     3762296     9680812      541764     2902108    11720984
Swap:      16684028           0    16684028
```

Sağ tarafta bayt cinsinden değerler gösterildiğini görebilirsiniz. Unix sistemler ilk ortaya çıktığında bunlarda kafa karışıklığı olmazdı çünkü GB'lar sınırlıydı ne olduğu anlaşılırdı ancak şimdi işler o kadarda kolay olmuyor.

İlk olarak bunun insancıl versiyonunu görelim neyin ne olduğunu görmek biraz daha kolaylaşmış olacak

```
free -h
```

Çıktısı şu şekilde olacak

```
              total        used        free      shared  buff/cache   available
Mem:            15G        3.5G        9.3G        526M        2.8G         11G
Swap:           15G          0B         15G
```

Artık GB'ler ve MB'lerin de değerleri kolayca okunabilir oldu.

Peki bu çıktıları nasıl anlamlandırabiliriz.

* Son satır takas alanınızla ilgilidir. Şimdilik işimiz yok gerekli olunan durumlarda kullanılır.
* İlk üç sütun toplam kapasite, toplamın ne kadarının işlemler tarafından kullanıldığı ve toplamın ne kadarının boş olduğu hakkında bilgi verir.
* Sonraki üç sütun biraz daha karmaşık olarak işlemler arasında paylaşılan bellek, çekirdek tarafından arabellek  olarak kullanılan ve sayfalar için önbellekte saklanan bellektir.
* İlk satırda kullanılan free ne kadar RAM'ın kullanıldığını ve ne kadarının boş olduğunu gösterir. free de bulunan numaranın düşük olduğunu görürseniz korkmayın kullanılmayan bellek gereksizdir kafası, bu nedenle çekirdek tampon bellek olarak, ön belleğe almaya çalışır aslında boştur ama size gözükmez
* Kullanılan hafızanın ne kadarının arabellek olarak kullanıldığı ve önbellek de tutulduğu ilk satırda gösteriliyor.

Çalışmakta olan süreçler tarafından gerçekleşen işlemler gerçekten ne kadar bellek kullanıyor bunu hesaplamak istiyorsanız yada bir yanlışlık olduğunu düşünüyorsanız hesabı şu şekildedir.

```
ikinci satırdaki used = İlk satırdaki used - buffers - cached
```

ve

```
Ikinci satırdaki free = Ilk satırdaki free + buffers + cached
```

Bu değerler hakkında biraz kafa yorun ve anlamaya çalışın(yada boşverin hiç gerek yok). İşlemleriniz daha fazla bellek istediğinde, çekirdek tamponlarını(buffers) ve ön belleğe(cached) alınmış kaynakları serbest bırakır ve işlemin devamlılığını sağlar kısacası bellekte süreç için yer açılır ve ona tahsis edilir.

Son olarak, paylaşılanlar yani ikinci satır hesaplamaya dahil edilmemiştir çünkü süreçler arasında zaten paylaşılan bir bellek olduğu için niye hesaplamaya katılsın ki. Zaten kullanılan hafızanın bir parçasıdır.
