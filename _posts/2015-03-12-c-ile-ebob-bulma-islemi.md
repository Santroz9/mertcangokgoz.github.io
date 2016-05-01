---
layout: post
title: C ile Ebob Bulma İşlemi
date: 2015-03-12
type: post
categories: Programlama
description: C ile 2 sayının en büyük ortak bölenini yani Ebob'unu Bulma İşlemini kolay bir şekilde aşağıdaki kod parçacığı ile
---

C ile 2 sayının en büyük ortak bölenini yani Ebob'unu Bulma İşlemini kolay bir şekilde aşağıdaki kod parçacığı ile yapabilirsiniz.Kolay olduğunu düşündüğüm için uygulamayı for döngüsü aracılığı ile yaptım.

```c
{% raw %}
#include < stdio.h >
    int main(void) {
        int sayi1;
        int sayi2;
        int ebob;
        int kucuk;
        int h;
        printf("1.sayi\n");
        scanf("%d", & sayi1);
        printf("2.sayi\n");
        scanf("%d", & sayi2);
        if (sayi1 > sayi2) {
            kucuk = sayi1;
        } else {
            kucuk = sayi2;
        }
        for (h = kucuk; h >= 1; h--) {
            if ((sayi1 % h == 0) && (sayi2 % h == 0)) {
                ebob = h;
                break;
            } else {
                continue;
            }
        }
        printf("EBOB %d\n", ebob);
        return 0;
    }
{% endraw %}
```
