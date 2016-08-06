---
layout: post
title: C ile EKOK Bulma İşlemi
date: 2015-03-14
type: post
categories: programlama
description: C ile klavyeden girilen 2 sayının kolaylıkla en küçük ortak katını yani Ekokunu kolaylıkla
---

C ile klavyeden girilen 2 sayının kolaylıkla en küçük ortak katını yani Ekok'unu kolaylıkla aşağıdaki kod aracılığı ile bulabilirsiniz.En kolay yöntem diye düşündüğüm için uygulamayı oluştururken while döngüsü kullanmayı seçtim.

```c
{% raw %}
#include < stdio.h >
    int main(void) {
        int sayi1;
        int sayi2;
        int ekok;
        int c = 1;
        printf("1.sayi\n");
        scanf("%d", & sayi1);
        printf("2.sayi\n");
        scanf("%d", & sayi2);
        while (1) {
            c++;
            if ((c % sayi1 == 0) && (c % sayi2 == 0)) {
                ekok = c;
                break;
            }
        }
        printf("EKOK %d\n", ekok);
        return 0;
    }
{% endraw %}
```
