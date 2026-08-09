
DECLARE @CategoryId INT =
(
    SELECT Id
    FROM Category
    WHERE Name = 'Case'
);

DECLARE @NZXT INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'NZXT'
);

DECLARE @Corsair INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Corsair'
);

DECLARE @LianLi INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Lian Li'
);

DECLARE @Fractal INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Fractal Design'
);

DECLARE @Phanteks INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Phanteks'
);

DECLARE @CoolerMaster INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Cooler Master'
);

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='CASE-NZXT-H7FLOW')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'NZXT H7 Flow',
'Mid-tower ATX case optimized for airflow with tempered glass side panel.',
'CASE-NZXT-H7FLOW',
149.99,
22,
@CategoryId,
@NZXT,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='CASE-NZXT-H9FLOW')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'NZXT H9 Flow',
'Dual-chamber premium ATX case with panoramic tempered glass.',
'CASE-NZXT-H9FLOW',
189.99,
18,
@CategoryId,
@NZXT,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='CASE-CORSAIR-4000D')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Corsair 4000D Airflow',
'Popular airflow-focused ATX mid-tower case.',
'CASE-CORSAIR-4000D',
119.99,
34,
@CategoryId,
@Corsair,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='CASE-CORSAIR-5000D')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Corsair 5000D Airflow',
'Premium mid-tower chassis with exceptional cooling support.',
'CASE-CORSAIR-5000D',
179.99,
20,
@CategoryId,
@Corsair,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='CASE-LIANLI-O11EVO')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Lian Li O11 Dynamic EVO',
'Highly modular dual-chamber chassis for custom PC builds.',
'CASE-LIANLI-O11EVO',
199.99,
16,
@CategoryId,
@LianLi,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='CASE-FRACTAL-NORTHXL')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Fractal Design North XL',
'Premium airflow case with natural wood front panel.',
'CASE-FRACTAL-NORTHXL',
189.99,
15,
@CategoryId,
@Fractal,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='CASE-PHANTEKS-NV5')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Phanteks NV5',
'Showcase ATX case featuring panoramic tempered glass.',
'CASE-PHANTEKS-NV5',
159.99,
18,
@CategoryId,
@Phanteks,
1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='CASE-CM-TD500MESHV2')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
(
'Cooler Master TD500 Mesh V2',
'Airflow-focused gaming case with ARGB fans.',
'CASE-CM-TD500MESHV2',
129.99,
24,
@CategoryId,
@CoolerMaster,
1
);
END;

