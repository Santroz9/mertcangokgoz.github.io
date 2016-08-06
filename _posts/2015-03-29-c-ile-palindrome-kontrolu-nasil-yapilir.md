---
layout: post
title: C ile Palindrome Kontrolü Nasıl Yapılır
date: 2015-03-29
type: post
categories: programlama
description: C ile girilen bir sayının palindrome olup olmadığını bulmak istiyor olabilirsiniz.Bunu yapmak için
---

C ile girilen bir sayının palindrome olup olmadığını bulmak istiyor olabilirsiniz.Bunu yapmak için aşağıdaki kod örneğine bakabilirsiniz.Palindrome ise tersden okunuşuda aynı olan sayı,cümle,karakter yani aklınıza gelebilecek herşeydir.

Bunlara örnek

- 121
- 6336
- 54245

gibi

```c
{% raw %}
    #include <stdio.h>

    int main()
    {
       int n, k = 0, c;
       printf("Sayi Girinizn");
       scanf("%d",&n);
       c = n;
       while( c != 0 )
       {
          k = k * 10;
          k = k + c%10;
          c = c/10;
       }

       if ( n == k )
          printf("Sayi %d palindromedir n", n);
       else{
       	printf("Sayi %d palindrome degildirn", n);
       }
       return 0;
    }
{% endraw %}
```

Çıktı Örneği

![cilepalindromekontolu](/assets/cilepalindromekontolu.jpg)
