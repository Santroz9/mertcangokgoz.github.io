---
layout: post
title: C ile Kabarcık Sıralaması
date: 2015-05-18
type: post
categories: Programlama
description: C ile Sıralama algoritması yazmak istersek aşağıdaki gibi bir yol izleyebiliriz böylelikle kolaylıkla sıralama
---

C ile Sıralama algoritması yazmak istersek aşağıdaki gibi bir yol izleyebiliriz böylelikle kolaylıkla sıralama işlemini yapabiliriz.Kabarcık Sıralama en çok kulanılan ve hocalarında ödev olarak vermeyi sevdiği sıralama algoritmalarından bir tanesidir.

Örnek Olarak

```c
{% raw %}
    #include <stdio.h>
    #define Deger 10

    void main()
    {
    	int datalar[Deger];
    	int i, j, veri, gec;

    	printf("Kac Adet Veri Gireceksiniz \n");
    	scanf("%d", &veri);

    	printf("Verileri Teker teker giriniz \n");
    	for (i = 0; i < veri; i++)
    	{
    		scanf("%d", &datalar[i]);
    	}

       /* Bubble sorting begins */
    	for (i = 0; i < veri; i++)
    	{
    		for (j = 0; j < (veri - i - 1); j++)
    		{
    			if (datalar[j] > datalar[j + 1])
    			{
    				gec = datalar[j];
    				datalar[j] = datalar[j + 1];
    				datalar[j + 1] = gec;
    			}
    		}
    	}

    	printf("Siralanan Degerler\n");
    	for (i = 0; i < veri; i++)
    	{
    		printf("%d\n", datalar[i]);
    	}
    	getch();
    	return 0;
    }
{% endraw %}
```
