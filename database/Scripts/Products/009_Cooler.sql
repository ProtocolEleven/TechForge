DECLARE @CategoryId INT =
(
    SELECT Id
    FROM Category
    WHERE Name = 'CPU Cooler'
);

DECLARE @Noctua INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Noctua'
);

DECLARE @CoolerMaster INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Cooler Master'
);

DECLARE @Corsair INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Corsair'
);

DECLARE @NZXT INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'NZXT'
);

IF NOT EXISTS (SELECT 1 FROM Brands WHERE Name='DeepCool')
BEGIN
    INSERT INTO Brands(Name)
    VALUES('DeepCool');
END;

DECLARE @DeepCool INT =
(
    SELECT Id
    FROM Brands
    WHERE Name='DeepCool'
);

IF NOT EXISTS (SELECT 1 FROM Brands WHERE Name='Arctic')
BEGIN
    INSERT INTO Brands(Name)
    VALUES('Arctic');
END;

DECLARE @Arctic INT =
(
    SELECT Id
    FROM Brands
    WHERE Name='Arctic'
);

IF NOT EXISTS (SELECT 1 FROM Brands WHERE Name='be quiet!')
BEGIN
    INSERT INTO Brands(Name)
    VALUES('be quiet!');
END;

DECLARE @BeQuiet INT =
(
    SELECT Id
    FROM Brands
    WHERE Name='be quiet!'
);

IF NOT EXISTS (SELECT 1 FROM Brands WHERE Name='Thermalright')
BEGIN
    INSERT INTO Brands(Name)
    VALUES('Thermalright');
END;

DECLARE @Thermalright INT =
(
    SELECT Id
    FROM Brands
    WHERE Name='Thermalright'
);

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='COOLER-NOCTUA-NHD15G2')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Noctua NH-D15 G2',
'Premium dual-tower air CPU cooler with exceptional cooling performance.',
'COOLER-NOCTUA-NHD15G2',
149.99,
18,
@CategoryId,
@Noctua,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='COOLER-DEEPCOOL-AK620DIGITAL')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'DeepCool AK620 Digital',
'Dual-tower air cooler featuring an integrated digital temperature display.',
'COOLER-DEEPCOOL-AK620DIGITAL',
89.99,
30,
@CategoryId,
@DeepCool,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='COOLER-THERMALRIGHT-PS120SE')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Thermalright Phantom Spirit 120 SE',
'High-value dual-tower air cooler with excellent thermal performance.',
'COOLER-THERMALRIGHT-PS120SE',
54.99,
42,
@CategoryId,
@Thermalright,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='COOLER-BEQUIET-DRP5')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'be quiet! Dark Rock Pro 5',
'Whisper-quiet premium dual-tower CPU cooler.',
'COOLER-BEQUIET-DRP5',
109.99,
22,
@CategoryId,
@BeQuiet,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='AIO-NZXT-KRAKEN360RGB')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'NZXT Kraken Elite 360 RGB',
'360mm AIO liquid cooler featuring an LCD display and RGB fans.',
'AIO-NZXT-KRAKEN360RGB',
299.99,
12,
@CategoryId,
@NZXT,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='AIO-CORSAIR-H150I-LCDXT')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Corsair iCUE H150i Elite LCD XT',
'Premium 360mm liquid cooler with customizable LCD display.',
'AIO-CORSAIR-H150I-LCDXT',
289.99,
14,
@CategoryId,
@Corsair,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='AIO-ARCTIC-LFIII360')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Arctic Liquid Freezer III 360',
'High-performance 360mm liquid CPU cooler with PWM fans.',
'AIO-ARCTIC-LFIII360',
169.99,
20,
@CategoryId,
@Arctic,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='AIO-CM-360ATMOS')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Cooler Master MasterLiquid 360 Atmos',
'Premium 360mm ARGB all-in-one liquid cooler.',
'AIO-CM-360ATMOS',
179.99,
18,
@CategoryId,
@CoolerMaster,
1
);
END;

