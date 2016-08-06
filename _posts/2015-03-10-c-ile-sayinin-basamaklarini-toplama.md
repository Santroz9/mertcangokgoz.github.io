---
layout: post
title: C ile Sayının Basamaklarını Toplama
date: 2015-03-10
type: post
categories: programlama
description: C programlama dili ile girilen bir sayının basamaklarını toplayacağız ve bu sayının bölünüp bölünmediğini kontrol
---

C programlama dili ile girilen bir sayının basamaklarını toplayacağız ve bu sayının bölünüp bölünmediğini kontrol edeceğiz.Bu örneği rastgele bir şekilde aklımıza geldiği için yapmıştık aslına bakarsak biraz saçma

```c
{% raw %}
#include < stdio.h >
    int main(void) {
        int sayi, tmp1, tmp2, basamakToplami = 0;
        printf("Bir Sayi Giriniz\n");
        scanf("%d", & sayi);
        tmp2 = sayi;
        while (1) {
            tmp1 = tmp2 % 10;
            basamakToplami += tmp1;
            tmp2 = tmp2 / 10;
            if (tmp2 < 10) {
                basamakToplami += tmp2;
                break;
            }
        }
        printf("Basamak Toplami : %d\n", basamakToplami);
        if (sayi % basamakToplami == 0) {
            printf("Tam Bolunuyor \n");
        } else {
            printf("Tam Bolunmuyor \n");
        }
        return 0;
    }
{% endraw %}
```
