---
layout: post
title: C ile Sayıların Toplanması ve Ortalamaları
date: 2015-03-23
type: post
categories: programlama
description: C ile Programa girilen sayıların toplanması ve bu girilen sayıların ortalamalarının alınması basit bir şekilde aşağıdaki örnekde gösterilmiştir.
---


C ile Programa girilen sayıların toplanması ve bu girilen sayıların ortalamalarının alınması basit bir şekilde aşağıdaki örnekde gösterilmiştir.Programda ilk olarak kullanıcıdan kaç adet sayı toplayacağı bilgisini alıyoruz.Ardından toplama ve ortalama işlemlerini yapıyoruz.

```c
{% raw %}
#include < stdio.h >
    int main() {
        int sayi;
        int topla[sayi];
        int toplam = 0;
        float ortalama;
        int g;
        printf("Kac Sayi Toplanacak\n");
        scanf("%d", & sayi);
        for (g = 0; g < sayi; g++) {
            printf("\n%d.sayi : ", g + 1);
            scanf("%d", & topla[g]);
        }
        for (g = 0; g < sayi; g++) {
            toplam = toplam + topla[g];
        }
        ortalama = toplam / sayi;
        printf("Toplami %d \n", toplam);
        printf("Ortalamasi %f \n", ortalama);
        return 0;
    }
{% endraw %}
```
