-- =============================================
-- TechForge Database Seed Script
-- File: 007_Storage.sql
-- Description: Insert Storage Products
-- =============================================

DECLARE @CategoryId INT =
(
    SELECT Id
    FROM Category
    WHERE Name = 'Storage'
);

DECLARE @Samsung INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Samsung'
);

DECLARE @WD INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Western Digital'
);

DECLARE @Crucial INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Crucial'
);

DECLARE @Kingston INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Kingston'
);

DECLARE @Seagate INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Seagate'
);

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='SSD-SAMSUNG-990PRO-2TB')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Samsung 990 Pro 2TB NVMe SSD',
'PCIe Gen4 NVMe SSD delivering exceptional gaming and workstation performance.',
'SSD-SAMSUNG-990PRO-2TB',
199.99,
35,
@CategoryId,
@Samsung,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='SSD-SAMSUNG-9100PRO-4TB')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Samsung 9100 Pro 4TB NVMe SSD',
'High-capacity PCIe Gen5 SSD for creators and enthusiasts.',
'SSD-SAMSUNG-9100PRO-4TB',
449.99,
12,
@CategoryId,
@Samsung,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='SSD-WD-SN850X-2TB')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'WD Black SN850X 2TB',
'High-performance PCIe Gen4 NVMe gaming SSD.',
'SSD-WD-SN850X-2TB',
189.99,
30,
@CategoryId,
@WD,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='SSD-WD-SN580-1TB')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'WD Blue SN580 1TB',
'Affordable PCIe Gen4 NVMe SSD for everyday computing.',
'SSD-WD-SN580-1TB',
79.99,
48,
@CategoryId,
@WD,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='SSD-CRUCIAL-T705-2TB')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Crucial T705 2TB',
'Ultra-fast PCIe Gen5 NVMe SSD.',
'SSD-CRUCIAL-T705-2TB',
299.99,
18,
@CategoryId,
@Crucial,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='SSD-CRUCIAL-P3PLUS-2TB')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Crucial P3 Plus 2TB',
'Reliable PCIe Gen4 NVMe SSD for gaming and productivity.',
'SSD-CRUCIAL-P3PLUS-2TB',
139.99,
42,
@CategoryId,
@Crucial,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='SSD-KINGSTON-KC3000-2TB')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Kingston KC3000 2TB',
'High-speed PCIe Gen4 NVMe SSD.',
'SSD-KINGSTON-KC3000-2TB',
174.99,
25,
@CategoryId,
@Kingston,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='SSD-SEAGATE-FIRECUDA530-2TB')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Seagate FireCuda 530 2TB',
'Gaming NVMe SSD with high endurance.',
'SSD-SEAGATE-FIRECUDA530-2TB',
209.99,
20,
@CategoryId,
@Seagate,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='HDD-SEAGATE-BARRACUDA-4TB')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Seagate BarraCuda 4TB HDD',
'7200 RPM desktop hard drive for mass storage.',
'HDD-SEAGATE-BARRACUDA-4TB',
94.99,
40,
@CategoryId,
@Seagate,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='SSD-SAMSUNG-870EVO-2TB')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Samsung 870 EVO 2TB SATA SSD',
'Reliable SATA SSD for upgrades and secondary storage.',
'SSD-SAMSUNG-870EVO-2TB',
169.99,
22,
@CategoryId,
@Samsung,
1
);
END;