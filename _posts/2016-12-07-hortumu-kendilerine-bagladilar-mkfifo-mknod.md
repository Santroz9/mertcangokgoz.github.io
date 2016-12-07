---
layout: post
title: Hortumu Kendilerine Bağladılar(mkfifo, mknod)
date: 2016-12-07
type: post
categories: linux
description: Borular, işlemler arası iletişim için sıklıkla kullanılır. Ancak boruların en büyük dezavantajı, yalnızca bir süreç (aynı süreç içinde okuyucular ve yazarlar var)
---

Dikkat her ne kadar **pipe** olarak bilinsede makalenin gidişatını etkilediği için türkçe bir şekilde boru, borular ve borulama olarak göreceksiniz korkmayın...

Borular, işlemler arası iletişim için sıklıkla kullanılır. Ancak boruların en büyük dezavantajı, yalnızca bir süreç (aynı süreç içinde okuyucular ve yazarlar var) veya aynı dosya tanımlayıcı tablosunu paylaşan süreçlerdir (normalde işlemler, alt süreçler ve(veya) bunlar tarafından oluşturulan işlemler) kullanılabilir olmasıdır ). Böylece borular büyük bir kısıtlamaya sahit olurlar ilgisiz süreçler arasında bilgi aktaramazlar. Bunun nedeni, aynı dosya tanımlayıcı tablosunu paylaşmamalarıdır.

Ancak borulara isimler verilirse, normal bir dosya gibi onlarda veri okuyabilir veya yazabilirler. Süreçler, birbirleriyle hiçbir şeyi paylaşmaya bile gerek duymazlar. **FIFO (First In First Out)** olarak adlandırılmış borular olarak da bilinirler.

Peki kardeş iyi hoş anlatıyonda FIFO'nun özellikleri neler ne yapabiliyorlar;

Araştırmalarıma göre aşağıdaki 3 şekilde davranış sergiliyor.

1. Boruların FIFO özelliğini uygular
2. Adlarını kullanarak normal dosyalar gibi açılabilirler
3. Veri, fifo'dan okunabilir veya fifo'ya yazılabilir

Peki bunu nasıl yapabiliriz, Enes kardeşim bundan yaklaşık bi 2 hafta önce ya şunu anlayamadım gençler bu ne diyerek gelmişti ufak bi man pages ufak bi profesör gıdıklaması ile ne olduğunu çözdük tabi oldukça mantıklı ve hoş bir durumdu

Şimdi `man mkfifo` diyerek neyin ne olduğuna bakabilirsiniz oldukça basittir. Dosya oluşturmak ve bunun üzerinde çalışma yapabilmek için bir kaç adıma ihtiyaç duyarsınız

Dosya oluşturma işlemi

```
mkfifo stream
```

bu aşamada Mknod'u kullanarak FIFO'yu kullanmanın bir başka yolu daha var tabi. Mknod, blok veya karakter özel dosyaları oluşturmak için kullanılır.

Tabi onda dosya oluşturmak için şu şekilde bir yol izlemeniz gerekir.

```
mknod stream p
```

Burada p, dosya türüne karşılık gelir ve bunu korur. Şimdi gelelim bu dosyalar üzerinde okuma ve yazma işlemi yapmaya genelde bu `mknod` ve `mkfifo` kafalarını pentest aşamasında kullanıyorlar `/tmp/` dizini altına bununla bir dosya oluşturup uzaktan istedikleri kodu çalıştırabiliyorlar `cat` ile ekrana basmak falan yetiyor. İlginç ama güzel düşünülmüş bir hareket

Şimdi bunu denemek için en basitinden 2 adet terminal açmanızı öneriyorum ilkine aşağıdaki komutu verin ve atın bir köşeye cat in açık olduğu satır bildiğiniz gibi deneyimizi yapacağımız ve okuma işlemini gerçekleştireceğimiz terminal

```
cat > stream
```

şimdi yapacağımız oldukça değişik olacak niye derseniz bu dosyalar yanlış bilmiyorsam stream dosyaları oluyor. yani bir akış işlemi gerçekleştiriyor. Normalde siz bir dosyaya `cat test.txt` gibi bir komut verdiğiniz de `test.txt` içeriğini ekrana yazdırıp süreci bitiriyor ancak fifo ile oluşturulmuş dosyalarda bu işlem bu şekilde yürümüyor. Siz ne kadar kayıt veya komut gönderirseniz oda o şekilde davranıyor ve işlemi sonlandırmıyor.

```
cat stream
```

komutunu gönderdiğinizde sürecin sonlanmadığını anlayacaksınız ve `cat > stream` komutunu verdiğiniz terminal içeriğine ne girerseniz diğer terminalde de aynı kayıtların geçtiğini göreceksiniz

İlk terminalde CTRL + D tuşlarına basmak, fifo'ya yazmayı sonlandıracaktır. Bu aynı zamanda ikinci işlemi de sonlandırır, çünkü fifo'dan okumak artık "BROKEN PIPE" sinyali ile mümkün değildir. Bunun varsayılan eylemi işlemi sonlandırmaktır.

Peki bu dosyalar herhangi bir dosyadan farklı mı ?

```
  File: 'stream'
  Size: 0         	Blocks: 0          IO Block: 4096   stream
Device: 808h/2056d	Inode: 5376186     Links: 1
Access: (0644/prw-r--r--)  Uid: ( 1000/ mertcan)   Gid: ( 1000/ mertcan)
Access: 2016-12-05 20:18:36.755379117 +0300
Modify: 2016-12-05 20:18:36.755379117 +0300
Change: 2016-12-05 20:18:36.755379117 +0300
 Birth: -
```

Dikkat ederseniz, FIFO'lar normal bir dosya gibi, inode numarası, bağlantı sayısı, erişim, değiştirme süreleri, boyut ve erişim izinleri gibi tüm ayrıntılara sahiptir yani evet diğer dosyalar ile tamamen aynıdır.

Bir boru birden çok okuyucu ve yazan kişi olabilir. Bir boruyu okumak ve yazmak için birden fazla terminal açmayı deneyebilirsiniz. Hatta bunu bir takım uygulamalar ile uzaktan yapabilme imkanınız da bulunmaktadır.
