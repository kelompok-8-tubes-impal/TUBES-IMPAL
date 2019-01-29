SELECT * FROM Customer; "Untuk menampilkan seluruh data customer"

SELECT * FROM Mobil; "Untuk menampilkan seluruh data mobil"

SELECT c.Nama_customer,t.Lama_sewa t.Biaya FROM customer c, transaksi t WHERE c.No_ktp = t.No_ktp  "Untuk menampilkan data nama cusotmer dengan lama sewa dan biaya"

