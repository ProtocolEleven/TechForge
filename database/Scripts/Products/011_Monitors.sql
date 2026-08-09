DECLARE @CategoryId INT =
(
    SELECT Id
    FROM Category
    WHERE Name = 'Monitor'
);

DECLARE @Samsung INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Samsung'
);

DECLARE @LG INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'LG'
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

DECLARE @Gigabyte INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Gigabyte'
);

DECLARE @Dell INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Dell'
);

DECLARE @AOC INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'AOC'
);

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MON-SAMSUNG-G8OLED32')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Samsung Odyssey G8 OLED 32"',
'32-inch 4K OLED gaming monitor with 240Hz refresh rate.',
'MON-SAMSUNG-G8OLED32',
1199.99,
8,
@CategoryId,
@Samsung,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MON-SAMSUNG-G527')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Samsung Odyssey G5 27"',
'27-inch QHD 165Hz curved gaming monitor.',
'MON-SAMSUNG-G527',
299.99,
25,
@CategoryId,
@Samsung,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MON-LG-27GS95QE')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'LG UltraGear 27GS95QE-B',
'27-inch OLED QHD 240Hz gaming monitor.',
'MON-LG-27GS95QE',
899.99,
12,
@CategoryId,
@LG,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MON-LG-32GR93U')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'LG UltraGear 32GR93U',
'32-inch 4K IPS gaming monitor with 144Hz refresh rate.',
'MON-LG-32GR93U',
649.99,
15,
@CategoryId,
@LG,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MON-ASUS-PG32UCDM')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'ASUS ROG Swift PG32UCDM',
'32-inch 4K QD-OLED gaming monitor with 240Hz refresh rate.',
'MON-ASUS-PG32UCDM',
1299.99,
6,
@CategoryId,
@ASUS,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MON-ASUS-VG27AQ3A')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'ASUS TUF Gaming VG27AQ3A',
'27-inch QHD IPS gaming monitor with 180Hz refresh rate.',
'MON-ASUS-VG27AQ3A',
329.99,
20,
@CategoryId,
@ASUS,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MON-MSI-321URX')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'MSI MPG 321URX QD-OLED',
'32-inch UHD QD-OLED gaming monitor.',
'MON-MSI-321URX',
1199.99,
8,
@CategoryId,
@MSI,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MON-GIGABYTE-M32U')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Gigabyte M32U',
'32-inch 4K IPS gaming monitor with KVM support.',
'MON-GIGABYTE-M32U',
699.99,
14,
@CategoryId,
@Gigabyte,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MON-DELL-G2724D')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Dell G2724D',
'27-inch QHD IPS gaming monitor with 165Hz refresh rate.',
'MON-DELL-G2724D',
279.99,
30,
@CategoryId,
@Dell,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MON-AOC-Q27G3XMN')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'AOC Q27G3XMN',
'27-inch Mini LED QHD gaming monitor with 180Hz refresh rate.',
'MON-AOC-Q27G3XMN',
399.99,
18,
@CategoryId,
@AOC,
1
);
END;