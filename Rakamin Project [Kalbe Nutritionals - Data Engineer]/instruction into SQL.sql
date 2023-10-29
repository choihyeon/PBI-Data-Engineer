-- Membuat database "KALBE"
CREATE DATABASE KALBE;

-- Menggunakan database "KALBE"
USE KALBE;

-- Membuat tabel "Inventory"
CREATE TABLE Inventory (
    Item_code INT PRIMARY KEY,
    Item_name VARCHAR(255) NOT NULL,
    Item_price DECIMAL(15, 2) NOT NULL,
    Item_total INT NOT NULL
);

-- Memasukkan data ke dalam tabel Inventory
INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES
(2341, 'Promag Tablet', 3000, 100),
(2342, 'Hydro Coco 250ML', 7000, 20),
(2343, 'Nutrive Benecol 100ML', 20000, 30),
(2344, 'Blackmores Vit C 500Mg', 95000, 45),
(2345, 'Entrasol Gold 370G', 90000, 120);

-- Menampilkan Item_name yang memiliki angka Item_total tertinggi
SELECT Item_name
FROM Inventory
WHERE Item_total = (
	SELECT MAX(Item_total) 
    FROM Inventory
    );
    
-- Membagi 2 value Item_price apabila item tersebut memiliki Item_total tertinggi 
UPDATE Inventory
SET Item_price = Item_price / 2
WHERE Item_name = (SELECT Item_name FROM Inventory WHERE Item_total = (SELECT MAX(Item_total) FROM Inventory));

-- Error Code: 1062. Duplicate entry '2343' for key 'inventory.PRIMARY'
INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES (2343, 'Item Baru', 15000, 10);

--  Menghapus record yang memiliki nilai Item_total terendah
DELETE FROM Inventory
WHERE Item_total = (
	SELECT MIN(Item_total) 
    FROM Inventory
    );

-- Menampilkan semua record dalam customer_orders dengan kondisi yang diberikan
SELECT *
FROM customer_orders
WHERE (purchase_amount < 100 OR (order_date < '2022-08-25' AND customer_id <= 2001));

-- Kesalahan yang mungkin terjadi pada gambar adalah penamaan kolom yang salah pada database
-- Solusinya bisa dilakukan alter table untuk mengganti nama kolom

ALTER TABLE _FormN_168
CHANGE COLUMN ddlPlant Plant VARCHAR(255);








