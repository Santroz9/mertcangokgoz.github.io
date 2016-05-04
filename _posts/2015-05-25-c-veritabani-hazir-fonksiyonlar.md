---
layout: post
title: C# Veritabanı Hazır Fonksiyonlar
date: 2015-05-25
type: post
categories: Programlama
description: Veritabanında çoğu işlemleri uzun uzadıya kod yazarak çözmeye çalışıyoruz.Yada tablodan veri çekilecekse,veritabanına
---

Veritabanında çoğu işlemleri uzun uzadıya kod yazarak çözmeye çalışıyoruz.Yada tablodan veri çekilecekse,veritabanına bağlanacaksa heryere veritabanı kodları ile dolduruyoruz ki bu kod kalabalığından başka bir işe yaramıyor.Hatta güvenlik açıklarına bile neden olabiliyor.Geçenlerde googlede gezerken eskilerden kalma ve bir kaç hatası olan Veritabanı fonksiyonlarının bulunduğu bir github sayfasına rastladım.Hatalarını düzelttim ve paylaşmak istedim.

```csharp
{% raw %}
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    namespace Veritabani
    {
        public class Fonksiyon
        {
            //Veritabanı bağlantısı
            public SqlConnection baglan()
            {
                SqlConnection baglanti = new SqlConnection();
                baglanti.Open();
                return (baglanti);

            }
            //SQL Sorguların çalıştırılması
            public int cmd(string sqlcmle)
            {
                SqlConnection baglan = this.baglan();
                SqlCommand sorgu = new SqlCommand(sqlcmle, baglan);
                int sonuc = 0;
                try
                {
                    sonuc = sorgu.ExecuteNonQuery();
                }
                catch (SqlException ex)
                {

                    throw new Exception(ex.Message + "(" + sqlcmle + ")");
                }
                finally
                {
                    sorgu.Connection.Close();
                }
                sorgu.Dispose();
                baglan.Close();
                return (sonuc);
            }
            //Veri Sayısı Bulma işlemi
            public string GetDataCell(string sql)
            {
                DataTable table = GetDataTable(sql);
                if (table.Rows.Count==0)
                    return null;
                return table.Rows[0][0].ToString();
            }
            //Verileri Çekme
            public DataRow GetDataRow(string sql)
            {
                DataTable table = GetDataTable(sql);
                if (table.Rows.Count == 0)
                    return null;
                return table.Rows[0];
            }
            //DataTable Veri Çekme
            public DataTable GetDataTable(string sql)
            {
                SqlConnection baglan = this.baglan();
                SqlDataAdapter adapter = new SqlDataAdapter(sql, baglan);
                DataTable dt = new DataTable();

                try
                {
                    adapter.Fill(dt);
                }
                catch (SqlException ex)
                {

                    throw new Exception(ex.Message + "(" + sql + ")");
                }
                finally
                {

                }
                adapter.Dispose();
                baglan.Close();
                return dt;
            }
            //DataSet Veri Çekme
            public DataSet GetDataSet(string sql)
            {
                SqlConnection baglan = this.baglan();
                SqlDataAdapter adapter = new SqlDataAdapter(sql, baglan);
                DataSet ds = new DataSet();
                try
                {
                    adapter.Fill(ds);
                }
                catch (SqlException ex)
                {
                    throw new Exception(ex.Message + "(" + sql + ")");
                }
                finally
                {

                }
                adapter.Dispose();
                baglan.Close();
                return ds;
            }
        }
    }
{% endraw %}
```
