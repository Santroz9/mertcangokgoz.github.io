---
layout: post
title: C ile Faktöriyel Hesaplama
date: 2015-03-18
type: post
categories: Programlama
description: C ile girilen bir sayının faktöriyel kaç olduğunu aşağıda ki yazmış olduğumuz kod aracılığı ile kolaylıkla bulabilirsiniz.
---

C ile girilen bir sayının faktöriyeli'nin kaç olduğunu aşağıda ki yazmış olduğumuz kod aracılığı ile kolaylıkla bulabilirsiniz.Girilen yüksek sayıların değerleri bulunabilsin diye long kullanılmıştır. İnt kullanıldığında belli bir sayıdan sonra 0 değeri göreceksiniz.

```c
{% raw %}
#include < stdio.h >
    int main() {
        long a, sayi, faktor;
        printf("Faktoriyeli hesaplanacak sayi girin\n");
        scanf("%ld", & sayi);
        faktor = 1;
        for (a = 1; a <= sayi; a++) {
            faktor *= a;
        }
        printf("%ld! = %ld\n", sayi, faktor);
        return 0;
    }
{% endraw %}
```
