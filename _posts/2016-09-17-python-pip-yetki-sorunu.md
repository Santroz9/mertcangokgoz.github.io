---
layout: post
title: Python Pip Yetki Sorunu
date: 2016-09-17
type: post
categories: linux
description: Plesk paneldeki aboneliklerin geçerlilik tarihlerini uzatmak için aşağıdaki komutu kullanabilirsiniz.
---

İlginç bir şekilde python paketlerini kuramama sorunu yaşadım root ile kurabilirdim ama buda güvenlik sorununa neden olacağı için tehlikeli olurdu. En iyisi izinleri düzenlemek kalıcı bir çözüm bu sorun neye göre nasıl başladı bilmiyorum ama ilginç bir durum

```python
Exception:
Traceback (most recent call last):
  File "/usr/local/lib/python2.7/dist-packages/pip/basecommand.py", line 215, in main
    status = self.run(options, args)
  File "/usr/local/lib/python2.7/dist-packages/pip/commands/install.py", line 317, in run
    prefix=options.prefix_path,
  File "/usr/local/lib/python2.7/dist-packages/pip/req/req_set.py", line 742, in install
    **kwargs
  File "/usr/local/lib/python2.7/dist-packages/pip/req/req_install.py", line 831, in install
    self.move_wheel_files(self.source_dir, root=root, prefix=prefix)
  File "/usr/local/lib/python2.7/dist-packages/pip/req/req_install.py", line 1032, in move_wheel_files
    isolated=self.isolated,
  File "/usr/local/lib/python2.7/dist-packages/pip/wheel.py", line 378, in move_wheel_files
    clobber(source, dest, False, fixer=fixer, filter=filter)
  File "/usr/local/lib/python2.7/dist-packages/pip/wheel.py", line 324, in clobber
    shutil.copyfile(srcfile, destfile)
  File "/usr/lib/python2.7/shutil.py", line 83, in copyfile
    with open(dst, 'wb') as fdst:
IOError: [Errno 13] Permission denied: '/usr/local/bin/spoof-mac.pyc'
```

şu şekilde çözüyoruz, her iki python sürümündede yapmanızı öneririm.

```console
sudo chown -R mertcan:mertcan /usr/local/lib/python2.7/
sudo chown -R mertcan:mertcan /usr/local/lib/python3.5/
```

ben kendi kullanıcı adım olan `mertcan` göre ayarladım. Artık sizin kullanıcı adınız ne ise ona göre düzenleyin.
