CREATE TABLE analisis_penjualan AS
SELECT distinct
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
JOIN barang AS b ON pj.id_barang = b.kode_barang;
