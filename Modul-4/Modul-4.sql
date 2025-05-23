-- Nama : M.Fathin Al-Azzam
-- NIM : 23241073
-- kelas : B
-- Modul : ORDER BY, FUNGSI AGREGASI, GROUP BY, HAVING

-- Menggunakan Database
USE  pti_mart;

-- ORDER BY
-- Ambil nama produk dan qty dari tabel penjualan urutkan qty
SELECT nama_produk,qty FROM tr_penjualan ORDER BY qty;

-- Ambil nama produk dan qty dari tb penjualan urutkan qty dan nama produk
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty, nama_produk;


-- Latihan Mandiri 1
-- tampilkan semua kolom dari tabel tr_penjualan denggan menggunakan bedasarkan qty dan tgl_transaksi
SELECT * FROM tr_penjualan ORDER BY qty, tgl_transaksi;
-- tampilkan semua kolom dari tabel ms_pelanggan denggan menggunakan bedasarkan nama_pelanggan
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan;
-- tampilkan semua kolom dari tabel ms_pelanggan denggan menggunakan bedasarkan alamat
SELECT * FROM ms_pelanggan ORDER BY alamat;

-- ORDER BY ASC dan DESC
-- Ambil nama produk, qty dari tb_penjualan urutkan qty besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC;

-- Ambil nama produk, qty dari tb_penjualan urutkan qty besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC, nama_produk DESC;

-- Latihan Mandiri 2
-- Menampilkan semua kolom dari tabel tr_penjualan, lalu mengurutkannya dari jumlah paling sedikit ke yang paling banyak jika jumlahnya sama, diurutkan lagi bedasrkan tgl_transaksi terbaru ke terlama
SELECT * FROM tr_penjualan ORDER BY qty ASC, tgl_transaksi DESC;
-- tampilkan semua kolom dari tabel ms_pelanggan lalu mengurutkannya bedasarkan nama_pelanggan dari Z ke A
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan DESC;
-- tampilkan semua kolom dari tabel ms_pelanggan lalu mengurutkannya bedasarkan alamat dari Z ke A
SELECT * FROM ms_pelanggan ORDER BY alamat DESC;

-- ORDER BY dari hasil perhitungan
-- Ambil nama produk,qty,harga,harga*qty,dari tb_penjualan urutkan harga*qty besar kecil
SELECT nama_produk,harga,qty,harga*qty AS total FROM tr_penjualan ORDER BY total DESC;

-- Latihan Mandiri 3
-- cobalah pengurutan dengan ekspresi total harga menggunakan rumusan jumlah barang dikali harga barang dikurangi diskon
SELECT nama_produk, harga, qty, diskon_persen, 
(harga * qty) AS total_harga, (harga * qty) - ((diskon_persen / 100) * (harga * qty)) AS total_bayar
FROM tr_penjualan
WHERE diskon_persen > 0
ORDER BY total_bayar DESC;

-- ORDER BY MENGGUNAKAN WHERE
-- Ambil nama_produk,qty dari tb penjualan yang nama produk bernilai huruf 'f%' urut qty
SELECT nama_produk, qty
FROM tr_penjualan
WHERE nama_produk LIKE 'f%'
ORDER BY qty DESC;

-- Latihan Mandiri 4
-- Menampilkan semua kolom dari tr_penjualan yang memiliki diskon dan diurutkan berdasarkan harga tertinggi
SELECT *
FROM tr_penjualan
WHERE diskon_persen IS NOT NULL
ORDER BY harga DESC;

-- Menampilkan kolom nama produk, jumlah pembelian dan harga dari tabel tr_penjualan hanya produk dengan harga 100.000 atau lebih di urutkan dari harga tertinggi ke terendah
SELECT nama_produk, qty AS kuantitas_pembelian, harga
FROM tr_penjualan
WHERE harga >= 100000
ORDER BY harga DESC;

-- Menampilkan produk yang harganya minimal 100.000 ATAU namanya dimulai dengan huruf 'T', lalu diurutkan berdasarkan diskon terbesar ke terkecil
SELECT nama_produk, qty AS kuantitas_pembelian, harga
FROM tr_penjualan
WHERE harga >= 100000 OR nama_produk LIKE 'T%'
ORDER BY diskon_persen DESC;






