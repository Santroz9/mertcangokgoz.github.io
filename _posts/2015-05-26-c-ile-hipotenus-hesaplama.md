---
layout: post
title: C ile Hipotenüs Hesaplama
date: 2015-05-26
type: post
categories: Programlama
description: C ile iki Dik kenarı bilinen bir üçgenin hipotenüsü bulmaya yarayan program aşağıdadır.Hipotenüsün bulunması için
---

C ile iki Dik kenarı bilinen bir üçgenin hipotenüsü bulmaya yarayan program aşağıdadır.Hipotenüsün bulunması için 2 kenarın girilmesi yeterlidir.Hesaplamaların yapılması için **hipotenushesapla** isminde bir fonksiyon ile işlemler yaptırılmıştır.

```c
{% raw %}
    #include <stdio.h>
    #include <stdlib.h>
    #include <conio.h>
    #include <math.h>

    double hipotenushesapla(double,double);

    int main()
    {
        float kenar1,kenar2;
        printf("Birinci Kenari Giriniz:");
        scanf("%f",&kenar1);
        printf("Ikinci Kenari Giriniz:");
        scanf("%f",&kenar2);
        hipotenushesapla(kenar1,kenar2);
        getch();
        return 0;
    }

    double hipotenushesapla(double kenar1,double kenar2)
    {
        double hipotenus = sqrt(pow(kenar1,2)+pow(kenar2,2));
        printf("Ucgenin Hipotenusu:%g\n",hipotenus);
    }
{% endraw %}
```
