---
layout: post
title: C Dilinde Karşılaşılan Hatalar ve Çözümleri
date: 2015-03-27
type: post
categories: programlama
description: C dilinde yazılan uygulamalarda genelde 3 tip hatalar bulunur.Tamamı kullanıcı kaynaklı
---

C dilinde yazılan uygulamalarda genelde 3 tip hatalar bulunur.Tamamı kullanıcı kaynaklı olmakla beraber ufak bir göz gezdirme ile çözülebilecek hatalardır.Bunlar sırasıyla;

1. Mantık hataları
2. Çalışma zamanı hataları
3. Derleme hataları

## **Mantık hataları**

Mantık hataları genelde uygulamayı geliştiren yazılımcılardan kaynaklanmaktadır.Uygulama çalışıyordur ancak istenilen sonucu ya vermiyordur yada tutarsızdır.Hata ne yazımdan kaynaklanmaktadır nede kullanımdan bu gibi hataları bulmak zordur genellikle test sırasında bu gibi hatalar bulunup çözülebilir.

## **Çalışma zamanı hataları**

Derleme sırasında hata olarak algılanmayan ancak kullanıcının yapacağı işlemler doğrultusunda oluşan hatalardır.Sayı girilmesi gereken yere karakter girilmesinden dolayı kullanıcıya hata gösterilmemesi ve uygulamanın sorunla karşılaşması yada internet gerektiren bir uygulamanın internetsiz bir ortamda çalıştırılmaya çalışması gibi sorunlardır.Çalışabilir ancak kullanılmaması gereken bir olgu kullanılmış isede bu tip sorunlar oluşabilir.

## **Derleme Hataları**

Program çalışmadan önce derlenir.Bu derleme sırasında oluşan bir yazım hatası yada eksik kodlar bu tip sorunlara yol açabilir.Kodda bu gibi sorunlar varsa zaten çalışmayacaktır ve hatanın bulunduğu satır size görsel olarak "Error List" kısmında gözükecektir.Hatanın ne olduğunu ve kaçıncı satırda olduğunu bu şekilde görebilirsiniz.
