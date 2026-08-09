DECLARE @KeyboardCategory INT =
(
    SELECT Id FROM Category WHERE Name='Keyboard'
);

DECLARE @MouseCategory INT =
(
    SELECT Id FROM Category WHERE Name='Mouse'
);

DECLARE @HeadsetCategory INT =
(
    SELECT Id FROM Category WHERE Name='Headset'
);

DECLARE @Logitech INT = (SELECT Id FROM Brands WHERE Name='Logitech');
DECLARE @Corsair INT = (SELECT Id FROM Brands WHERE Name='Corsair');
DECLARE @Razer INT = (SELECT Id FROM Brands WHERE Name='Razer');
DECLARE @SteelSeries INT = (SELECT Id FROM Brands WHERE Name='SteelSeries');
DECLARE @ASUS INT = (SELECT Id FROM Brands WHERE Name='ASUS');
DECLARE @Keychron INT = (SELECT Id FROM Brands WHERE Name='Keychron');
DECLARE @HyperX INT = (SELECT Id FROM Brands WHERE Name='HyperX');
DECLARE @Sony INT = (SELECT Id FROM Brands WHERE Name='Sony');

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='KB-LOGITECH-GPROXTKL')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Logitech G Pro X TKL',
'Tournament-grade wireless mechanical gaming keyboard.',
'KB-LOGITECH-GPROXTKL',
219.99,
18,
@KeyboardCategory,
@Logitech,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='KB-LOGITECH-G915X')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Logitech G915 X Lightspeed',
'Low-profile wireless mechanical gaming keyboard.',
'KB-LOGITECH-G915X',
259.99,
15,
@KeyboardCategory,
@Logitech,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='KB-CORSAIR-K70RGBPRO')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Corsair K70 RGB Pro',
'Mechanical RGB gaming keyboard with Cherry MX switches.',
'KB-CORSAIR-K70RGBPRO',
189.99,
22,
@KeyboardCategory,
@Corsair,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='KB-CORSAIR-K100AIR')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Corsair K100 Air Wireless',
'Ultra-thin premium wireless gaming keyboard.',
'KB-CORSAIR-K100AIR',
299.99,
10,
@KeyboardCategory,
@Corsair,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='KB-RAZER-BWV4PRO')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Razer BlackWidow V4 Pro',
'Premium RGB mechanical gaming keyboard.',
'KB-RAZER-BWV4PRO',
249.99,
16,
@KeyboardCategory,
@Razer,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='KB-SS-APEXPROTKL')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('SteelSeries Apex Pro TKL',
'Adjustable-actuation mechanical gaming keyboard.',
'KB-SS-APEXPROTKL',
229.99,
18,
@KeyboardCategory,
@SteelSeries,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='KB-ASUS-AZOTH')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('ASUS ROG Azoth',
'75% custom wireless mechanical gaming keyboard.',
'KB-ASUS-AZOTH',
279.99,
12,
@KeyboardCategory,
@ASUS,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='KB-KEYCHRON-Q1MAX')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Keychron Q1 Max',
'Premium hot-swappable wireless mechanical keyboard.',
'KB-KEYCHRON-Q1MAX',
239.99,
20,
@KeyboardCategory,
@Keychron,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MOUSE-LOGITECH-GPX2')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Logitech G Pro X Superlight 2',
'Ultra-lightweight wireless esports gaming mouse.',
'MOUSE-LOGITECH-GPX2',
179.99,
25,
@MouseCategory,
@Logitech,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MOUSE-LOGITECH-G502XPLUS')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Logitech G502 X Plus',
'Wireless RGB gaming mouse with HERO sensor.',
'MOUSE-LOGITECH-G502XPLUS',
159.99,
20,
@MouseCategory,
@Logitech,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MOUSE-RAZER-DAV3PRO')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Razer DeathAdder V3 Pro',
'Ergonomic esports wireless gaming mouse.',
'MOUSE-RAZER-DAV3PRO',
169.99,
20,
@MouseCategory,
@Razer,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MOUSE-RAZER-VIPERV3PRO')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Razer Viper V3 Pro',
'Ambidextrous ultra-light wireless gaming mouse.',
'MOUSE-RAZER-VIPERV3PRO',
179.99,
18,
@MouseCategory,
@Razer,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MOUSE-SS-AEROX5')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('SteelSeries Aerox 5 Wireless',
'Ultra-light RGB gaming mouse.',
'MOUSE-SS-AEROX5',
139.99,
16,
@MouseCategory,
@SteelSeries,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MOUSE-ASUS-HARPEACE')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('ASUS ROG Harpe Ace',
'Professional wireless esports gaming mouse.',
'MOUSE-ASUS-HARPEACE',
149.99,
16,
@MouseCategory,
@ASUS,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MOUSE-CORSAIR-M75AIR')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Corsair M75 Air Wireless',
'Ultra-light competitive gaming mouse.',
'MOUSE-CORSAIR-M75AIR',
129.99,
20,
@MouseCategory,
@Corsair,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='MOUSE-GLORIOUS-MODELO2')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Glorious Model O 2 Wireless',
'Lightweight honeycomb gaming mouse.',
'MOUSE-GLORIOUS-MODELO2',
109.99,
18,
@MouseCategory,
(SELECT Id FROM Brands WHERE Name='Glorious'),
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='HEADSET-SS-NOVAPRO')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('SteelSeries Arctis Nova Pro Wireless',
'Premium wireless gaming headset with ANC.',
'HEADSET-SS-NOVAPRO',
349.99,
12,
@HeadsetCategory,
@SteelSeries,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='HEADSET-LOGITECH-GPROX2')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Logitech G Pro X 2 Lightspeed',
'Professional wireless esports headset.',
'HEADSET-LOGITECH-GPROX2',
249.99,
15,
@HeadsetCategory,
@Logitech,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='HEADSET-RAZER-BSV2PRO')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Razer BlackShark V2 Pro',
'Wireless gaming headset with THX Spatial Audio.',
'HEADSET-RAZER-BSV2PRO',
199.99,
18,
@HeadsetCategory,
@Razer,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='HEADSET-CORSAIR-HS80MAX')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Corsair HS80 Max Wireless',
'Wireless gaming headset with Dolby Atmos support.',
'HEADSET-CORSAIR-HS80MAX',
179.99,
18,
@HeadsetCategory,
@Corsair,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='HEADSET-HYPERX-CLOUD3')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('HyperX Cloud III Wireless',
'Comfortable wireless gaming headset.',
'HEADSET-HYPERX-CLOUD3',
169.99,
20,
@HeadsetCategory,
@HyperX,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='HEADSET-ASUS-DELTA2')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('ASUS ROG Delta II',
'Premium tri-mode wireless gaming headset.',
'HEADSET-ASUS-DELTA2',
229.99,
14,
@HeadsetCategory,
@ASUS,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='HEADSET-SONY-INZONEH9')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('Sony INZONE H9',
'Wireless gaming headset with active noise cancellation.',
'HEADSET-SONY-INZONEH9',
299.99,
10,
@HeadsetCategory,
@Sony,
1);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU='HEADSET-SS-NOVA5')
BEGIN
INSERT INTO Products
(Name,Description,SKU,Price,StockQuantity,CategoryId,BrandId,IsActive)
VALUES
('SteelSeries Arctis Nova 5',
'Wireless multi-platform gaming headset.',
'HEADSET-SS-NOVA5',
149.99,
22,
@HeadsetCategory,
@SteelSeries,
1);
END;