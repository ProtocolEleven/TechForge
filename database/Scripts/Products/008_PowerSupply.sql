DECLARE @CategoryId INT =
(
    SELECT Id
    FROM Category
    WHERE Name = 'Power Supply'
);

DECLARE @Corsair INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Corsair'
);

DECLARE @ASUS INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'ASUS'
);

DECLARE @MSI INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'MSI'
);

DECLARE @CoolerMaster INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Cooler Master'
);

DECLARE @Gigabyte INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Gigabyte'
);

DECLARE @NZXT INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'NZXT'
);

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='PSU-CORSAIR-RM850X')
BEGIN
INSERT INTO Products
(Name, Description, SKU, Price, StockQuantity, CategoryId, BrandId, IsActive)
VALUES
(
'Corsair RM850x 850W 80+ Gold',
'Fully modular ATX power supply with Cybenetics Gold efficiency.',
'PSU-CORSAIR-RM850X',
169.99,
28,
@CategoryId,
@Corsair,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='PSU-CORSAIR-RM1000X')
BEGIN
INSERT INTO Products
(Name, Description, SKU, Price, StockQuantity, CategoryId, BrandId, IsActive)
VALUES
(
'Corsair RM1000x 1000W 80+ Gold',
'High-performance fully modular PSU for enthusiast builds.',
'PSU-CORSAIR-RM1000X',
229.99,
18,
@CategoryId,
@Corsair,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='PSU-ASUS-LOKI-1000')
BEGIN
INSERT INTO Products
(Name, Description, SKU, Price, StockQuantity, CategoryId, BrandId, IsActive)
VALUES
(
'ASUS ROG Loki SFX-L 1000W Platinum',
'Premium compact power supply for high-end gaming PCs.',
'PSU-ASUS-LOKI-1000',
319.99,
10,
@CategoryId,
@ASUS,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='PSU-MSI-A850GL')
BEGIN
INSERT INTO Products
(Name, Description, SKU, Price, StockQuantity, CategoryId, BrandId, IsActive)
VALUES
(
'MSI MAG A850GL PCIE5 850W',
'ATX 3.1 fully modular PSU supporting PCIe 5 graphics cards.',
'PSU-MSI-A850GL',
159.99,
22,
@CategoryId,
@MSI,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='PSU-CM-MWE850')
BEGIN
INSERT INTO Products
(Name, Description, SKU, Price, StockQuantity, CategoryId, BrandId, IsActive)
VALUES
(
'Cooler Master MWE Gold 850 V2',
'Reliable fully modular 850W gaming power supply.',
'PSU-CM-MWE850',
149.99,
24,
@CategoryId,
@CoolerMaster,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='PSU-GIGABYTE-UD850GM')
BEGIN
INSERT INTO Products
(Name, Description, SKU, Price, StockQuantity, CategoryId, BrandId, IsActive)
VALUES
(
'Gigabyte UD850GM PG5 850W',
'80+ Gold fully modular PSU with PCIe Gen5 support.',
'PSU-GIGABYTE-UD850GM',
139.99,
26,
@CategoryId,
@Gigabyte,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='PSU-NZXT-C850')
BEGIN
INSERT INTO Products
(Name, Description, SKU, Price, StockQuantity, CategoryId, BrandId, IsActive)
VALUES
(
'NZXT C850 Gold ATX 3.1',
'Fully modular 850W PSU designed for modern gaming systems.',
'PSU-NZXT-C850',
164.99,
19,
@CategoryId,
@NZXT,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='PSU-CORSAIR-HX1200')
BEGIN
INSERT INTO Products
(Name, Description, SKU, Price, StockQuantity, CategoryId, BrandId, IsActive)
VALUES
(
'Corsair HX1200 1200W Platinum',
'1200W fully modular power supply for extreme workstation and gaming PCs.',
'PSU-CORSAIR-HX1200',
329.99,
8,
@CategoryId,
@Corsair,
1
);
END;

