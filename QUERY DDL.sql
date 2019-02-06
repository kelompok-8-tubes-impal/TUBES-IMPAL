CREATE DATABASE db_Rental;

CREATE TABLE Customer(
	No_ktp CHAR(16),
	Nama_customer VARCHAR(20),
	No_telp CHAR(13),
	Alamat VARCHAR(50),
	PRIMARY KEY(No_ktp)
);

CREATE TABLE Rental_mobil(
	Id_rental CHAR(8),
	Nama_rental VARCHAR(10),
	No_telp CHAR(13),
	Alamat VARCHAR(50),
	PRIMARY KEY(Id_rental)
);

CREATE TABLE Mobil(
	No_polisi CHAR(9),
	Id_rental CHAR(8),
	Merek VARCHAR(10),
	Model VARCHAR(10),
	Kapasitas CHAR(2),
	Tahun_buat CHAR(4),
	Harga_sewa INT,
	PRIMARY KEY(No_polisi),
	FOREIGN KEY(Id_rental) REFERENCES Rental_mobil(Id_rental) ON DELETE CASCADE
);

CREATE TABLE Transaksi(
	Id_transaksi CHAR(8),
	No_ktp CHAR(16),
	No_polisi CHAR(9),
	Tgl_sewa DATE,
	Lama_sewa INT,
	Biaya INT,
	PRIMARY KEY(Id_transaksi),
	FOREIGN KEY(No_ktp) REFERENCES Customer(No_ktp) ON DELETE CASCADE,
	FOREIGN KEY(No_polisi) REFERENCES Mobil(No_polisi) ON DELETE CASCADE
);

CREATE TABLE Rekap_pembayaran(
	Id_rekap CHAR(8),
	Tgl_rekap DATE,
	PRIMARY KEY(Id_rekap)
);

CREATE TABLE Pembayaran(
	Id_pembayaran CHAR(8),
	Id_transaksi CHAR(8),
	Id_rekap CHAR(8),
	Jenis_pembayaran VARCHAR(10),
	Tgl_pembayaran DATE,
	PRIMARY KEY(Id_pembayaran),
	FOREIGN KEY(Id_transaksi) REFERENCES Transaksi(Id_transaksi) ON DELETE CASCADE,
	FOREIGN KEY(Id_rekap) REFERENCES Rekap_pembayaran(Id_rekap) ON DELETE CASCADE
);