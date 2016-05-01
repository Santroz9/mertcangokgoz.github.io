---
layout: post
title: C ile Asal Sayıları Bulma
date: 2015-03-08  
type: post
categories: Programlama
description: C ile verilen bir sayı içerisindeki asal sayıları çok kolay bir şekilde bulabilirsiniz.Asal sayı bulmayı hemen hemen her programlama dilini
---

C ile verilen bir sayı içerisindeki asal sayıları çok kolay bir şekilde bulabilirsiniz.Asal sayı bulmayı hemen hemen her programlama dilini öğretirken sorarlar tipik ve kalıplaşmış bir örnektir aslında algoritma kasarken işinize yarayacaktır.

```c
{% raw %}
#include < stdio.h >
    int main() {
        int Sayi, bir, iki, Say;
        printf(" Bir sayi giriniz\n");
        scanf("%d", & Sayi);
        for (bir = 2; bir <= Sayi; bir++) {
            Say = 1;
            for (iki = 2; iki < bir; iki++) {
                if (bir % iki == 0) {
                    Say = 0;
                    break;
                }
            }
            if (Say == 1) printf("Sayinin Icindeki Asali %d Olarak bulunmustur \n", bir);
        }
        return 0;
    }
{% endraw %}
```
