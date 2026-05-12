CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE Pharmacy_Inventory (
    Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
    Drug_Name VARCHAR(255),
    Batch_Number VARCHAR(50),
    Expiry_Date DATE,
    Quantity INT
);

INSERT INTO Pharmacy_Inventory
(Drug_Name, Batch_Number, Expiry_Date, Quantity)
VALUES
('Paracetamol', 'B001', '2026-05-10', 100),
('Paracetamol', 'B002', '2025-12-01', 50),
('Amoxicillin', 'B003', '2025-09-15', 70),
('Vitamin C', 'B004', '2027-01-20', 200),
('Paracetamol Extra', 'B005', '2025-08-01', 30);

SELECT *
FROM Pharmacy_Inventory
WHERE Drug_Name = 'Paracetamol'
AND Expiry_Date = '2025-12-01';

EXPLAIN
SELECT *
FROM Pharmacy_Inventory
WHERE Drug_Name = 'Paracetamol'
AND Expiry_Date = '2025-12-01';

CREATE INDEX idx_drug
ON Pharmacy_Inventory(Drug_Name);

CREATE INDEX idx_expiry
ON Pharmacy_Inventory(Expiry_Date);

EXPLAIN
SELECT *
FROM Pharmacy_Inventory
WHERE Drug_Name = 'Paracetamol'
AND Expiry_Date = '2025-12-01';

DROP INDEX idx_drug ON Pharmacy_Inventory;
DROP INDEX idx_expiry ON Pharmacy_Inventory;

CREATE INDEX idx_drug_expiry
ON Pharmacy_Inventory(Drug_Name, Expiry_Date);

EXPLAIN
SELECT *
FROM Pharmacy_Inventory
WHERE Drug_Name = 'Paracetamol'
AND Expiry_Date = '2025-12-01';

SELECT *
FROM Pharmacy_Inventory
WHERE Drug_Name LIKE '%para%';

SELECT *
FROM Pharmacy_Inventory
WHERE Drug_Name LIKE 'Para%';