DECLARE @CategoryId INT =
(
    SELECT Id
    FROM Category
    WHERE Name = 'Memory'
);

DECLARE @Corsair INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Corsair'
);

DECLARE @Kingston INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Kingston'
);

DECLARE @Crucial INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Crucial'
);

IF NOT EXISTS (SELECT 1 FROM Brands WHERE Name='G.Skill')
BEGIN
INSERT INTO Brands(Name)
VALUES('G.Skill');
END;

DECLARE @GSkill INT =
(
SELECT Id
FROM Brands
WHERE Name='G.Skill'
);

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='RAM-CORSAIR-VENGEANCE-32-6000')
BEGIN
INSERT INTO Products
(
Name,
Description,
SKU,
Price,
StockQuantity,
CategoryId,
BrandId,
IsActive
)
VALUES
(
'Corsair Vengeance DDR5 32GB (2x16GB) 6000MT/s',
'High-performance DDR5 memory kit optimized for AMD EXPO and Intel XMP.',
'RAM-CORSAIR-VENGEANCE-32-6000',
149.99,
45,
@CategoryId,
@Corsair,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='RAM-CORSAIR-DOMINATOR-64-6400')
BEGIN
INSERT INTO Products
(
Name,
Description,
SKU,
Price,
StockQuantity,
CategoryId,
BrandId,
IsActive
)
VALUES
(
'Corsair Dominator Titanium RGB DDR5 64GB 6400MT/s',
'Premium RGB DDR5 memory with high-speed performance.',
'RAM-CORSAIR-DOMINATOR-64-6400',
339.99,
18,
@CategoryId,
@Corsair,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='RAM-KINGSTON-FURY-32-6000')
BEGIN
INSERT INTO Products
(
Name,
Description,
SKU,
Price,
StockQuantity,
CategoryId,
BrandId,
IsActive
)
VALUES
(
'Kingston Fury Beast DDR5 32GB 6000MT/s',
'Reliable DDR5 gaming memory with low latency.',
'RAM-KINGSTON-FURY-32-6000',
144.99,
38,
@CategoryId,
@Kingston,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='RAM-KINGSTON-RENEGADE-64-6400')
BEGIN
INSERT INTO Products
(
Name,
Description,
SKU,
Price,
StockQuantity,
CategoryId,
BrandId,
IsActive
)
VALUES
(
'Kingston Fury Renegade DDR5 RGB 64GB 6400MT/s',
'Enthusiast-grade DDR5 memory with RGB lighting.',
'RAM-KINGSTON-RENEGADE-64-6400',
324.99,
14,
@CategoryId,
@Kingston,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='RAM-CRUCIAL-PRO-32-5600')
BEGIN
INSERT INTO Products
(
Name,
Description,
SKU,
Price,
StockQuantity,
CategoryId,
BrandId,
IsActive
)
VALUES
(
'Crucial Pro DDR5 32GB 5600MT/s',
'Professional-grade DDR5 memory for gaming and productivity.',
'RAM-CRUCIAL-PRO-32-5600',
134.99,
52,
@CategoryId,
@Crucial,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='RAM-CRUCIAL-PRO-64-6000')
BEGIN
INSERT INTO Products
(
Name,
Description,
SKU,
Price,
StockQuantity,
CategoryId,
BrandId,
IsActive
)
VALUES
(
'Crucial Pro DDR5 64GB 6000MT/s',
'High-capacity DDR5 memory for workstations and gaming PCs.',
'RAM-CRUCIAL-PRO-64-6000',
279.99,
20,
@CategoryId,
@Crucial,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='RAM-GSKILL-TRIDENT-32-6000')
BEGIN
INSERT INTO Products
(
Name,
Description,
SKU,
Price,
StockQuantity,
CategoryId,
BrandId,
IsActive
)
VALUES
(
'G.Skill Trident Z5 Neo RGB DDR5 32GB 6000MT/s',
'Premium AMD EXPO memory kit with RGB lighting.',
'RAM-GSKILL-TRIDENT-32-6000',
169.99,
30,
@CategoryId,
@GSkill,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='RAM-GSKILL-RIPJAWS-32-6400')
BEGIN
INSERT INTO Products
(
Name,
Description,
SKU,
Price,
StockQuantity,
CategoryId,
BrandId,
IsActive
)
VALUES
(
'G.Skill Ripjaws M5 RGB DDR5 32GB 6400MT/s',
'High-speed DDR5 gaming memory for Intel platforms.',
'RAM-GSKILL-RIPJAWS-32-6400',
184.99,
26,
@CategoryId,
@GSkill,
1
);
END;

