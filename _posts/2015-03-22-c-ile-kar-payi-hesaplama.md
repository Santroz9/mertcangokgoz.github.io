---
layout: post
title: C ile Kâr Payı Hesaplama
date: 2015-03-22
type: post
categories: programlama
description: C ile kar payı hesaplamak için aşağıdaki örneğe göre işlemleri yapıyoruz.
---

C ile kar payı hesaplamak için aşağıdaki örneğe göre işlemleri yapıyoruz.

Bir satış personeli bir kimya firmasında çalışmaktadır ve aylık ücret olarak 200 TL almaktadır ancak yapmış olduğu belirli bir düzeydeki satıştan kar payı olarak %9 almaktadır.Satıcının alacağı ücreti hesaplayan bir c uygulaması yazınız(Aylık sattığı malzemenin toplam ücreti 4500 TL olduğunu var sayar isek)

```c
{% raw %}
#include < stdio.h >
    int main(void) {
        double sabitucret, karpayi, miktar, ucret;
        ucret = 200;
        printf("Satis miktarinizi giriniz\n");
        scanf("%lf", & miktar);
        karpayi = (miktar * 0.09) + ucret;
        printf("Bu haftaki Karpayiniz ile birlikte toplam ucretiniz %.lf TL\n", karpayi);
        return 0;
    }
{% endraw %}
```
