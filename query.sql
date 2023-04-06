CREATE DATABASE dbpos;
USE dbpos;

CREATE TABLE kartu(
id int auto_increment primary key,
kode varchar(6) unique,
nama varchar(30) not null,
diskon double,
iuran double);

CREATE TABLE pelanggan(
id int auto_increment primary key,
kode varchar(10) unique,
nama varchar(45),
jk char(1),
tmp_lahir date,
email varchar(45),
kartu_id int not null references kartu(id));

CREATE TABLE pesanan(
id int auto_increment primary key,
tanggal date,
total double, 
pelanggan_id int not null references pelanggan(id));

CREATE TABLE pembayaran(
id int not null auto_increment primary key,
nokuitansi varchar(10) unique,
tanggal date,
jumlah double,
ke int,
pesanan_id int not null references pesanan(id));

CREATE TABLE jenis_produk(
id int not null auto_increment primary key,
nama varchar(45));

CREATE TABLE produk(
id int not null primary key auto_increment,
kode varchar(10) unique,
nama varchar(45),
harga_beli double,
harga_jual double,
stok int,
min_stok int,
jenis_produk_id int not null references jenis_produk(id));

CREATE TABLE pesanan_items(
id int auto_increment not null primary key,
produk_id int not null references produk(id),
pesanan_id int not null references pesanan(id),
qty int,
harga double);

CREATE TABLE vendor(
id int not null auto_increment primary key,
nomor varchar(4),
nama varchar(40),
kota varchar(30),
kontak varchar(30));

CREATE TABLE pembelian(
id int not null auto_increment primary key,
tanggal varchar(45),
nomor varchar(10),
produk_id int not null references produk(id),
jumlah int,
harga double,
vendor_id int not null references vendor(id));

ALTER TABLE pelanggan ADD alamat varchar(40);

ALTER TABLE pelanggan RENAME COLUMN nama TO nama_pelanggan;

ALTER TABLE pelanggan MODIFY COLUMN nama_pelanggan varchar(50);