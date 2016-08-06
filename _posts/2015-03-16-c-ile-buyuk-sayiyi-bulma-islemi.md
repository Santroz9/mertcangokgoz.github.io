---
layout: post
title: C ile En Buyuk Sayıyı Bulma İşlemi
date: 2015-03-16
type: post
categories: programlama
description: C ile uygulamaya girilen 3 adet sayıdan en büyük sayıyı bulmak için aşağıdaki vermiş olduğum kod parçacığını kullanabilirsiniz.Bu örneği değişken
---

C ile uygulamaya girilen 3 adet sayıdan en büyük sayıyı bulmak için aşağıdaki vermiş olduğum kod parçacığını kullanabilirsiniz.Bu örneği değişken sayısını arttırarak daha fazla sayı için kullanabilirsiniz veya array ile dahada fazla sayı için kullanılabilir

```c
{% raw %}
#include < stdio.h >
    int main(void) {
        int sayi1, sayi2, sayi3, max;
        printf("3 Adet Sayi Giriniz");
        scanf("%d%d%d", & sayi1, & sayi2, & sayi3);
        max = sayi1;
        if (sayi2 > max) {
            max = sayi2;
        }
        if (sayi3 > max) {
            max = sayi3;
        }
        printf("(%d %d %d) Bu Sayilarin En Buyugu = %d", sayi1, sayi2, sayi3, max);
        return 0;
    }
{% endraw %}
```
