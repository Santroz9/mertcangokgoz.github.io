---
layout: post
title: C ile Fibonacci Sayılarının Bulunması
date: 2015-03-20
type: post
categories: programlama
description: C ile fibonacci sayılarını bulmak için diğer dillerde olduğu gibi standart bir tazım şekli bulunmuyor istediğiniz gibi yazabilirsiniz ancak
---

C ile **fibonacci** sayılarını bulmak için diğer dillerde olduğu gibi standart bir tazım şekli bulunmuyor istediğiniz gibi yazabilirsiniz ancak ben aşağıdaki kodu yazmıştım istediğiniz gibi kullanabilirsiniz.

```c
{% raw %}
#include < stdio.h >
    int main() {
        int n, ilk = 0, ikinci = 1, s, c;
        printf("Bir Sayi Giriniz\n");
        scanf("%d", & n);
        printf("ilk %d fibonacci serisi\n", n);
        for (c = 0; c < n; c++) {
            if (c <= 1)
                s = c;
            else {
                s = ilk + ikinci;
                ilk = ikinci;
                ikinci = s;
            }
            printf("%d\n", s);
        }
        return 0;
    }
{% endraw %}
```
