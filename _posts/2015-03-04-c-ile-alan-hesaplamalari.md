---
layout: post
title: C ile Alan Hesaplamaları
date: 2015-03-04
type: post
categories: Programlama
description: Alan hesaplamalarını yapacağımız geometrik şekilleri aşağıdaki gibi belirledik ortaya çıkan kodumuz
---

Alan hesaplamalarını yapacağımız geometrik şekilleri aşağıdaki gibi belirledik ortaya çıkan kodumuz ise aşağıdaki gibidir.Yapmış olduğum programda seçmeli bir yapı izledim.gereken komut verilmediği takdirde döngü devam etmektedir.

```c
{% raw %}
#include < stdio.h > #include < conio.h > #include < stdlib.h >
    int main(void) {
        int secim = 0;
        double taban, yukseklik, pi, yaricap, tavan, alan, kenar1, kenar2;
        pi = 3.14;
        while (secim != 5) {
            printf("1-Ucgen\n2-Daire\n3-Dikdortgen\n4-Yamuk\n5-Cikis\n");
            scanf("%d", & secim);
            if (secim == 1) {
                printf("Tabani giriniz \n");
                scanf("%lf", & taban);
                printf("Yukseklik giriniz \n");
                scanf("%lf", & yukseklik);
                alan = taban * yukseklik / 2;
            } else if (secim == 2) {
                printf("Yaricap giriniz \n");
                scanf("%lf", & yaricap);
                alan = pi * yaricap * yaricap;
            } else if (secim == 3) {
                printf("Birinci kenari giriniz \n");
                scanf("%lf", & kenar1);
                printf("ikinci kenari giriniz \n");
                scanf("%lf", & kenar2);
                alan = kenar1 * kenar2;
            } else if (secim == 4) {
                printf("Tabani giriniz \n");
                scanf("%lf", & taban);
                printf("Tavani giriniz \n");
                scanf("%lf", & tavan);
                printf("Yukseklik giriniz \n");
                scanf("%lf", & yukseklik);
                alan = (taban + tavan) * yukseklik / 2;
            }
            if (secim != 5) printf("Yapmis oldugunuz secimde alan %f olarak bulunmustur. \n", alan);
        }
        return 0;
    }
{% endraw %}
```


Uygulamayı çalıştırmak için ise Windows 8 ve 8.1 sistemler için [Orwell Dev-C++](http://sourceforge.net/projects/orwelldevcpp/files/Setup%20Releases/Dev-Cpp%205.3.0.3%20TDM-GCC%20x64%204.6.1%20Setup.exe/download) Kullanabilirsiniz.

Örnek 2 Seçimin string olması

```
{% raw %}
#include < stdio.h >
#include < conio.h >

    main(void) {
        char secim;
        int kenar1, kenar2, yaricap, yukseklik, daire, dikdortgen, kare, ucgen;
        printf("---------MONU--------------\n");
        printf("D veya d Daire\n");
        printf("T veya t Dikdortgen\n");
        printf("K veya k Kare\n");
        printf("U veya u Ucgen\n");
        printf("---------------------------\n");
        printf("Seciminiz= ");
        scanf("%s", & secim);
        printf("---------------------------\n");
        if (secim == 'D' || secim == 'd') {
            printf("yaricap: \n");
            scanf("%d", & yaricap);
            daire = 3.14 * yaricap * yaricap;
            printf("Yaricapi %d olan dairenin alani: %d\n", daire);
        } else if (secim == 'T' || secim == 't') {
            printf("kenar1 ve kenar2 giriniz: \n");
            scanf("%d%d", & kenar1, & kenar2);
            dikdortgen = kenar1 * kenar2;
            printf("Dikdortgenin alani: %d\n", dikdortgen);
        } else if (secim == 'K' || secim == 'k') {
            printf("kenar1: \n");
            scanf("%d", & kenar1);
            kare = kenar1 * kenar1;
            printf("Kenari %d olan karenin alani: %d\n", kare);
        } else if (secim == 'U' || secim == 'u') {
            printf("kenar: \n");
            scanf("%d", & kenar1);
            printf("yukseklik: \n");
            scanf("%d", & yukseklik);
            ucgen = (yukseklik * kenar1) / 2;
            printf("Ucgenin alani: %d\n", ucgen);
        } else {

        }
        getch();
        return 0;
    }
{% endraw %}
```
