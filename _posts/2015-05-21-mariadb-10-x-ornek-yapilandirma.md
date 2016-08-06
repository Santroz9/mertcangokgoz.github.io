---
layout: post
title: MariaDB 10.x Örnek Yapılandırma
date: 2015-05-21 18:15:29.000000000 +03:00
type: post
published: true
status: publish
categories: programlama
description: MariaDB Geçtik ama ayarlamalarını nasıl yapacağız sorgularımız nasıl hızlı olacak ve en önemlisi sistemde kaynak kullanımı ne kadar olacak diye
---

MariaDB Geçtik ama ayarlamalarını nasıl yapacağız sorgularımız nasıl hızlı olacak ve en önemlisi sistemde kaynak kullanımı ne kadar olacak diye düşünüyorsanız.Aşağıdaki ayarları kullanabilirsiniz. 2GB Ram ve çift işlemcili VPS ve sunucularda ciddi oranda iyileşmelere neden olacaktır.

Sisteminizde **/etc/mysql** yolundaki **my.cnf** içerisine aşağıdaki komutları ekleyiniz.

    [client]
    socket = MySQL
    port = 3306
    socket = /var/run/mysql/mysql.sock

    [mariadb]
    default-storage-engine = MyISAM
    optimizer_switch = 'derived_merge=off,derived_with_keys=off,materialization=off'

    [mysqld]
    port = 3306
    socket = /var/run/mysql/mysql.sock
    key_buffer_size = 64M
    max_allowed_packet = 1M
    table_open_cache = 512
    sort_buffer_size = 2M
    net_buffer_length = 16K
    read_buffer_size = 512K
    read_rnd_buffer_size = 1M
    myisam_sort_buffer_size = 16M
    thread_cache_size = 4
    query_cache_size = 4M
    tmp_table_size = 16M
    max_heap_table_size = 16M

    innodb_buffer_pool_size = 72M
    innodb_log_file_size = 5M
    innodb_log_buffer_size = 8M
    innodb_flush_log_at_trx_commit = 1
    innodb_lock_wait_timeout = 50
    innodb_file_per_table = 1
    innodb_open_files = 512
    innodb_autoextend_increment = 8

    [mysqldump]
    quick
    quote-names
    max_allowed_packet = 16M

    [mysql]
    no-auto-rehash

    [myisamchk]
    key_buffer_size = 10M
    sort_buffer_size = 10M
    read_buffer = 1M
    write_buffer = 1M

    [mysqlhotcopy]
    interactive-timeout

Ekeleme yaptıktan sonra mysql servisini yeniden başlatmanız ile birlikte ayarlar geçerli olacaktır.Kontrol işlemleri ve doğru ayarları yaptığınızı anlamak istiyorsanız.

    sudo apt-get install mysqltuner

Kurulumu yapabilirsiniz bu uygulama veritabanı ayarlarınızı yapmanıza yardımcı olacaktır.

![mysqltunergorsel1](/assets/mysqltunergorsel1-e1431872782709.png)
