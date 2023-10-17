# Sales Analysis Dashboard using Looker Studio

This repository contains a Sales Analysis Dashboard created using Looker Studio. The dashboard provides an interactive platform to explore and analyze sales data, offering a range of visualizations and insights.

## Table of Contents
- [Introduction](#introduction)
- [SQL Querying](#sql-query-for-manage-data)
- [Accessing the Dashboard](#accessing-the-dashboard)
- [Dashboard Features](#dashboard-features)

## Introduction

Introduce your Sales Analysis Dashboard by explaining its significance and how it contributes to your business or organization's decision-making processes. Highlight its role in providing insights and driving sales strategies.

## SQL Query for Manage data
<details>
<summary>query for inputation data</summary>
```sql
-- import table penjualan from csv --
CREATE TABLE penjualan (
    id_distributor INT,
    id_cabang INT,
    id_invoice INT,
    tanggal DATE,
    id_customer INT,
    id_barang INT,
    jumlah_barang INT,
    unit VARCHAR(255),
    harga DECIMAL,
    mata_uang VARCHAR(10),
    brand_id INT,
    lini VARCHAR(255)
);

COPY penjualan(id_distributor, id_cabang, id_invoice, tanggal, id_customer, id_barang, jumlah_barang, unit, harga, mata_uang, brand_id, lini)
FROM 'penjualan.csv' DELIMITER ',' CSV HEADER;


-- import table pelanggan from csv --
CREATE TABLE pelanggan (
    id_customer VARCHAR(255) PRIMARY KEY,
    "level" VARCHAR(255),
    nama VARCHAR(255),
    id_cabang_sales VARCHAR(255),
    cabang_sales VARCHAR(255),
    id_group VARCHAR(255),
    "group" VARCHAR(255)
);

COPY pelanggan(id_customer, level, nama, id_cabang_sales, cabang_sales, id_group, "group")
FROM 'pelanggan.csv' DELIMITER ',' CSV HEADER;

-- import table barang from csv --
CREATE TABLE barang (
    kode_barang VARCHAR(255) PRIMARY KEY,
    sektor VARCHAR(255),
    nama_barang VARCHAR(255),
    tipe VARCHAR(255),
    nama_tipe VARCHAR(255),
    kode_lini INT,
    lini VARCHAR(255),
    kemasan VARCHAR(255)
);

COPY barang(kode_barang, sektor, nama_barang, tipe, nama_tipe, kode_lini, lini, kemasan)
FROM 'barang.csv' DELIMITER ',' CSV HEADER;


-- membuat datamart analisis penjualan untuk menjadi acuan dashboard looker studio --
CREATE TABLE analisis_penjualan AS
SELECT DISTINCT
    pj.tanggal,
    pj.jumlah_barang,
    pj.harga,
    pj.lini,
    pl.nama AS nama_toko,
    pl.cabang_sales as kota,
    pl."group",
    b.nama_barang,
    b.kemasan
FROM penjualan AS pj
JOIN pelanggan AS pl ON pj.id_cabang = pl.id_cabang_sales
JOIN barang AS b ON pj.id_barang = b.kode_barang; ```
</details>
## Accessing the Dashboard

Provide information on how users can access the Looker Studio Sales Analysis Dashboard. Include any login credentials, permissions, or access instructions.

**Access Link:** [Sales Analysis Dashboard](https://lookerstudio.google.com/reporting/8b42f3cf-49fc-43fa-903c-c5e4964d16a7/page/KTvdD)

## Dashboard Features

![statistic header](statistics.png)

header ini menjelaskan tentang

![penjualan berdasarkan barang](sort by item.png)

header ini menjelaskan tentang item pembelian

![penjualan berdasarkan barang](sort by location.png)

header ini menjelaskan tentang item pembelian



---
