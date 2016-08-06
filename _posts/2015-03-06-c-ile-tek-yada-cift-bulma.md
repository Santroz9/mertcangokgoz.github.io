---
layout: post
title: C ile Tek yada Çift Bulma
date: 2015-03-06
type: post
categories: programlama
description: C ile tek yada çift bulma işlemi için aşağıdaki kodu kullanabilirsiniz.Bu yaptığımız işlemde hocalar tarafından
---

C ile tek yada çift bulma işlemi için aşağıdaki kodu kullanabilirsiniz.Bu yaptığımız işlemde hocalar tarafından çok sevilen ve her fırsatta deli gibi sorulan bir örnektir karşınıza elbet bir yerde çıkabilir çıkmasa bile işinize algoritmaları öğrenirken yarayacaktır.

```c
{% raw %}
#include < stdio.h >
    int main(void) {
        int sayi;
        printf("Bir Sayi Giriniz\n");
        scanf("%d", & sayi);
        if (sayi % 2 == 0) {
            printf("\nSayi cift");
        } else {
            printf("\nSayi tek");
        }
        return 0;
    }
{% endraw %}
```
