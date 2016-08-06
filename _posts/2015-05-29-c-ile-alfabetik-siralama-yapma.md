---
layout: post
title: C ile Alfabetik Sıralama Yapma
date: 2015-05-29
type: post
categories: programlama
description: C ile string bir şekilde girilen ifadelerin sıralamaları ile oynamak ve bunları alfabetik olarak sıralayabilirsiniz.
---

C ile string bir şekilde girilen ifadelerin sıralamaları ile oynamak ve bunları alfabetik olarak sıralayabilirsiniz.Uygulamaya kaç adet veri girileceğini girmeniz yetecektir bundan sonrasında ise karşınıza sıralanmış ve sıralanmamış şekilleri ile çıkacaktır.

```c
{% raw %}
    #include <stdio.h>
    #include <string.h>
    #include <conio.h>
    void main()
    {
    	char isimler[10][8], tisimler[10][8], tmp[8];
    	int i, j, n;
    	printf("Kac Adet isim girilecek \n");
    	scanf("%d", &n);
    	printf("%d adet ismi giriniz \n", n);
    	for (i = 0; i < n; i++)
    	{
    		scanf("%s", isimler[i]);
    		strcpy(tisimler[i], isimler[i]);
    	}
    	for (i = 0; i < n - 1 ; i++)
    	{
    		for (j = i + 1; j < n; j++)
    		{
    			if (strcmp(isimler[i], isimler[j]) > 0)
    			{
    				strcpy(tmp, isimler[i]);
    				strcpy(isimler[i], isimler[j]);
    				strcpy(isimler[j], tmp);
    			}
    		}
    	}
    	printf("\n----------------------------------------\n");
    	printf("Yazdiklariniz\tSiralanmis Sekli\n");
    	printf("------------------------------------------\n");
    	for (i = 0; i < n; i++)
    	{
    		printf("%s\t\t%s\n", tisimler[i], isimler[i]);
    	}
    	printf("------------------------------------------\n");
    	getch();
    }
{% endraw %}
```
