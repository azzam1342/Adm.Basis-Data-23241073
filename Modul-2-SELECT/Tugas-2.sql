DROP DATABASE IF EXISTS penjualan_sparepart_motor;
CREATE DATABASE penjualan_sparepart_motor;
USE penjualan_sparepart_motor;

-- Tabel karyawan
CREATE TABLE karyawan (
    nik VARCHAR(20) PRIMARY KEY,
    nama VARCHAR(100),
    alamat TEXT,
    no_tlpn VARCHAR(15),
    jenis_kelamin ENUM('Laki-laki', 'Perempuan')
);

-- Tabel customer
CREATE TABLE customer (
    id_customer VARCHAR(20) PRIMARY KEY,
    nama VARCHAR(100),
    alamat TEXT,
    no_tlpn VARCHAR(15)
);

-- Tabel produk
CREATE TABLE produk (
    id_produk VARCHAR(20) PRIMARY KEY,
    nama VARCHAR(100),
    harga DECIMAL(15,2),
    merek VARCHAR(50),
    warna VARCHAR(30)
);

-- Tabel suplier
CREATE TABLE suplier (
    id_suplier VARCHAR(20) PRIMARY KEY,
    alamat TEXT,
    email VARCHAR(100),
    no_tlpn VARCHAR(15)
);

-- Tabel membeli
CREATE TABLE membeli (
    id_customer VARCHAR(20),
    id_produk VARCHAR(20),
    status_customer VARCHAR(50),
    tanggal_beli DATE,
    jumlah_produk_dibeli INT,
    PRIMARY KEY (id_customer, id_produk),
    FOREIGN KEY (id_customer) REFERENCES customer(id_customer),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

-- Tabel melayani
CREATE TABLE melayani (
    nik VARCHAR(20),
    id_customer VARCHAR(20),
    tanggal_layanan DATE,
    lokasi VARCHAR(100),
    durasi INT, -- dalam menit
    PRIMARY KEY (nik, id_customer),
    FOREIGN KEY (nik) REFERENCES karyawan(nik),
    FOREIGN KEY (id_customer) REFERENCES customer(id_customer)
);

-- Tabel pemasok
CREATE TABLE pemasok (
    id_suplier VARCHAR(20),
    id_produk VARCHAR(20),
    tanggal_pemasokan DATE,
    jumlah INT,
    keterangan TEXT,
    PRIMARY KEY (id_suplier, id_produk),
    FOREIGN KEY (id_suplier) REFERENCES suplier(id_suplier),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

-- Data karyawan
INSERT INTO karyawan VALUES
('123456', 'azam', 'mataram', '098765', 'Laki-laki'),
('876542', 'agus', 'lombok timur', '635352', 'Laki-laki'),
('343533', 'arbyan', 'lombok tengah', '546372','Laki-laki'),
('876547', 'ilham', 'bali', '635358', 'Laki-laki'),
('343531', 'masud', 'mataram', '546371','Laki-laki');

-- Data customer
INSERT INTO customer VALUES
('c001', 'azzam', 'mataram', '087654375'),
('c002', 'agus', 'bali', '081624665'),
('c003', 'arbyan', 'lombok tengah', '09876544'),
('c004', 'ilham', 'bali', '987656785'),
('c005', 'masud', 'mataram', '87654328');

-- Data produk
INSERT INTO produk VALUES
('p001', 'oli mesin eduro', 95000.00, 'pertamina', 'hitam'),
('p002', 'kampas rem depan', 75000.00, 'federal parts', 'abu-abu'),
('p003', 'rantai motor', 250000.00, 'did', 'silver'),
('p004', 'aki motor', 325000.00, 'gs astra', 'biru putih'),
('p005', 'busi motor', 35000.00, 'ngk', 'perak');

-- Data suplier
INSERT INTO suplier VALUES
('s001', 'mataram', 'gsgsgsg@mail.com', '087654375'),
('s002', 'mataram', 'gsgsgs@mail.com', '087654356'),
('s003', 'mataram', 'gsgsgs@mail.com', '087654323'),
('s004', 'mataram', 'gsgsgs@mail.com', '087654376'),
('s005', 'mataram', 'gsgsgs@mail.com', '087654334');

-- Data membeli
INSERT INTO membeli VALUES
('c001', 'p001', 'member', '2025-01-21', 5),
('c002', 'p002', 'biasa', '2024-02-22', 2),
('c003', 'p003', 'member', '2025-01-20', 7),
('c004', 'p004', 'biasa', '2025-01-23', 2),
('c005', 'p005', 'member', '2025-01-25', 6);

-- Data melayani
INSERT INTO melayani VALUES
('123456', 'c001', '2025-06-07', 'bengkel kita', 10),
('876542', 'c002', '2025-01-08', 'bengkel kita', 15),
('343533', 'c003', '2025-03-09', 'bengkel kita', 20),
('876547', 'c004', '2025-05-04', 'bengkel kita', 25),
('343531', 'c005', '2025-02-06', 'bengkel kita', 30);

-- Data pemasok
INSERT INTO pemasok VALUES
('s001', 'p002', '2025-04-03', 100, 'Permintaan reguler'),
('s002', 'p003', '2025-04-05', 75, 'Pengiriman cepat'),
('s002', 'p004', '2025-04-06', 30, 'Stok terbatas'),
('s003', 'p001', '2025-04-07', 40, 'Tambahan stok untuk promo'),
('s003', 'p003', '2025-04-08', 60, 'Stok rutin');

-- Cek hasil
SELECT * FROM karyawan;
SELECT * FROM customer;
SELECT * FROM produk;
SELECT * FROM suplier;
SELECT * FROM membeli;
SELECT * FROM melayani;
SELECT * FROM pemasok;


-- untuk menampilakan kolom nama dari tabel produk
SELECT nama FROM produk;

-- untuk menampilkan kolom id_produk dan harga dari tabel produk
SELECT id_produk,harga FROM produk;

-- untuk menampilkan kolom nama dan nik karyawam dari tabel karyawan
SELECT nama,nik FROM karyawan;

-- mengambil seluruh kolom dari tabel customer
SELECT*FROM customer;

-- untuk menampilkan kolom id_customer dan status_customer dari tabel membeli
SELECT id_customer,status_customer FROM membeli;

-- untuk menampilkan seluruh kolom suplier dari tabel suplier
SELECT*FROM suplier;

-- untuk menampilkan id_suplier dan email dari kolom suplier
SELECT id_suplier,email FROM suplier;

-- untuk mengganti nama sementara dari kolom produk dengan ALIAS
SELECT nama AS AZZAM FROM produk;

-- untuk mengganti nama sementara dari kolom membeli dengan ALIAS
SELECT tanggal_beli AS tb FROM membeli;

-- menggunakan nama database dan tabel sebagai PREFIX untuk kolom harga
SELECT penjualan_sparepart_motor.produk.harga FROM produk;

