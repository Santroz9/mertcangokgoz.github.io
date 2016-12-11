---
layout: post
title: Linux Üzerinde CHK Dosyalarının Kurtarılması
date: 2016-12-11
type: post
categories: linux
description: USB belleğin yan basması sonucunda içerisindeki veriler bir şekilde bozulmuş bir USB belleği Windows bir sisteme taktığımızda ki sanırım bu
---

USB belleğin yan basması sonucunda içerisindeki veriler bir şekilde bozulmuş bir USB belleği Windows bir sisteme taktığımızda ki sanırım bu otomatik oluyor `.CHK` uzantılı bir hal almış. Kayıp dosya parçacıklarını dönüştürmüş ve kurtarma işlemi için hazır yapmış Windowsda bunları tool ile çıkartıyorlar tabi linuxde mimetype bakarak dosya uzantısını değiştirmek yetiyor. Belki Windows üzerindede aynı işlemi yapsak düzelecek ancak bu konuda bir bilgim yok

Tabi bu kodu kullanmadan önce klasör içerisinde ne tür dosyaların olduğuna şu şekilde bakabilirsiniz.

```
file --mime-type -b *.CHK | sort | uniq
```

Düzenlenen kodumuz ise şu şekilde kod için **Onur Aslan** Teşekkür ederim. İçinden çıkamadığım sorunu kendisi güzel bir şekilde çözdü :)

```
for file in $(find -iname '*.chk'); do C_EXT=$(file --mime-type $file | cut -d' ' -f2 | xargs -I{} grep {} /etc/mime.types | awk '{ print $2; }'); if [ -n "$C_EXT" ]; then rename -v "s/.chk$/.$C_EXT/i" $file; fi; done
```

Kodda bulunan ufak bir bug var bazı mimelerin birden fazla uzantısı olabiliyor. Örneğin; **ppt** bu gibi dosyalarda grep hepsini aldığı için birden fazla uzantısı varmış gibi gözükebilir. Çok nadir olsa bile böyle bir sorun olduğunu bilmenizde fayda var...