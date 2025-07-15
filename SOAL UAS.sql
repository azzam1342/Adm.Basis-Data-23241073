-- nama : M.Fathin Al-Azzam
-- nim : 23241073
-- kals : B

USE pti_mart;


--  1.
SELECT t.kode_pelanggan,t.nama_produk,t.qty AS jumlah, t.harga,(t.qty * t.harga) AS
total_harga
FROM tr_penjualan t 
WHERE (t.qty * t.harga) > = 200000
ORDER BY (t.qty * t.harga) ASC;


--  2. tampilkan nama pelanggan dan niali transaksinya dengan nilai transaksi terbesar
SELECT 
    p.nama AS nama_pelanggan,
    t.total_transaksi
FROM 
    pelanggan p
JOIN 
    transaksi t ON p.id_pelanggan = t.id_pelanggan
ORDER BY 
    t.total_transaksi DESC
LIMIT 1;


-- 3. tampilakn nama produk kategori dan harga dari produk yang tidak pernah terjual
SELECT 
    p.nama_produk,
    p.kategori,
    p.harga
FROM 
    produk p
LEFT JOIN 
    detail_transaksi dt ON p.id_produk = dt.id_produk
WHERE 
    dt.id_produk IS NULL;

