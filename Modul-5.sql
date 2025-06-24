-- Nama : M.Fathin Al-Azzam
-- klas : B
-- Modul : Modul 5: join, Unnion, limit

-- Menggunakan Database
USE pti_mart;
-- join
-- Menggunakan dua buah tabel bedasarkan kolom yang sama

-- Praktek 1
-- Ambil nama pelanggan yang pernah bertransaksi beserta qty nya
-- artinya ambil kolom kode_pelanggan, nama_pelanggan, dan qty dari
-- penggabungan tabel penjualan dan tabel pelanggan

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
From tr_penjualan as tp 
join ms_pelanggan as mp 
on tp.kode_pelanggan = mp.kode_pelanggan;

-- Praktek 2
-- Mengghubungkan dua tabel tanpa memperhatikan relational keys 
-- Ambil nama pelanggan yang pernah bertransaksi beserta qty nya
-- Menggabungkan tabel penjualan dan tabel pelanggan tanpa memperhatikan kolom yang menjadi pc
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
From tr_penjualan as tp
join ms_pelanggan as mp
on TRUE;

-- INNER join
-- join yang mengambil data dari dua sisi tabel yang berhubungan 
-- Praktek 3
-- Ambil kode pelanggan, nama pelanggan, nama produk, qty
-- dari hasil join tabel penjualan dan tabel pelanggan

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.nama_produk, tp.qty
From tr_penjualan as tp
INNER join ms_pelanggan as mp
on tp.kode_pelanggan = mp.kode_pelanggan
INNER JOIN ms_produk pr on tp.kode_produk = pr.kode_produk;


-- Latihan Mandiri
-- 1. Buatlah join untuk ketiga tabel yang terdapat pada dqlabmartbasic dengan INNER JOIN 
SELECT * FROM ms_pelanggan p
JOIN tr_penjualan t
JOIN ms_produk pr ON TRUE;

-- 2. Buatlah join untuk letiga tabel dengan urutan ms_pelanggan, tr_penjualan dan ms_produk
--  yang terdapat pada dqlabmartbasic dengan LEFT JOIN, kemudian filter untuk qty yang tidak
--  bernilai NULL dengan operator IS NOT NULL
SELECT p.kode_pelanggan, p.nama_pelanggan, t.kode_transaksi, t.tgl_transaksi, t.qty, pr.kode_produk, pr.nama_produk, pr.kategori_produk,
    pr.harga AS harga_produk
FROM ms_pelanggan p
LEFT JOIN tr_penjualan t ON p.kode_pelanggan = t.kode_pelanggan
LEFT JOIN ms_produk pr ON t.kode_produk = pr.kode_produk
WHERE t.qty IS NOT NULL;



-- 3. Buatlah join untuk ketiga tabel dengan urutan ms_pelanggan, tr_penjualan dan ms_produk
-- yang terdapat pada dqlabmartbasic dengan INNER JOIN, kemudian tampilkan groping untuk kolom kategori
-- produk dari penjumlahan qty.
SELECT pr.kategori_produk, SUM(t.qty) AS total_qty FROM ms_pelanggan AS p
INNER JOIN 
    tr_penjualan AS t ON p.kode_pelanggan = t.kode_pelanggan
INNER JOIN ms_produk AS pr ON t.kode_produk = pr.kode_produk
GROUP BY pr.kategori_produk;



-- 4. Latihan khusus: Cobalah lakukan JOIN ms_produk dengan tabel ms_produk juga dengan kolom relationship
-- kode_produk (benar, Anda tidak salah baca) - ini kita lakukan join dengan tabel sendiri yang memang bisa
-- dilakukan, jangan lupa untuk menggunakan alias
SELECT 
    mpra.kode_produk, 
    mprb.nama_produk
FROM ms_produk AS mpra
JOIN ms_produk AS mprb ON mpra.kode_produk = mprb.kode_produk;



