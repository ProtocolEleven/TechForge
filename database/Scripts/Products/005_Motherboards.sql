DECLARE @CategoryId INT =
(
    SELECT Id
    FROM Category
    WHERE Name = 'Motherboard'
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

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'MB-ASUS-X870E-ROGSTRIX')
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
    'ASUS ROG Strix X870-E Gaming WiFi',
    'AMD X870 ATX motherboard with WiFi 7, PCIe 5.0 and DDR5 support',
    'MB-ASUS-X870E-ROGSTRIX',
    499.99,
    15,
    @CategoryId,
    @ASUS,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'MB-ASUS-B850-TUF')
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
    'ASUS TUF Gaming B850-Plus WiFi',
    'AMD B850 motherboard designed for gaming and reliability',
    'MB-ASUS-B850-TUF',
    259.99,
    28,
    @CategoryId,
    @ASUS,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'MB-ASUS-Z890-MAXIMUS')
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
    'ASUS ROG Maximus Z890 Hero',
    'Intel Z890 flagship motherboard for enthusiasts',
    'MB-ASUS-Z890-MAXIMUS',
    629.99,
    10,
    @CategoryId,
    @ASUS,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'MB-ASUS-Z890-PRIME')
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
    'ASUS PRIME Z890-P WiFi',
    'Intel Z890 motherboard with PCIe 5.0 and DDR5',
    'MB-ASUS-Z890-PRIME',
    299.99,
    20,
    @CategoryId,
    @ASUS,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'MB-MSI-X870-TOMAHAWK')
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
    'MSI MAG X870 Tomahawk WiFi',
    'Premium AMD X870 motherboard with WiFi 7',
    'MB-MSI-X870-TOMAHAWK',
    349.99,
    18,
    @CategoryId,
    @MSI,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'MB-MSI-B850-PRO')
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
    'MSI PRO B850-P WiFi',
    'Business and productivity focused AMD B850 motherboard',
    'MB-MSI-B850-PRO',
    199.99,
    25,
    @CategoryId,
    @MSI,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'MB-MSI-Z890-CARBON')
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
    'MSI MPG Z890 Carbon WiFi',
    'Intel Z890 gaming motherboard with premium VRM design',
    'MB-MSI-Z890-CARBON',
    459.99,
    14,
    @CategoryId,
    @MSI,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'MB-GIGABYTE-X870-AORUS')
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
    'Gigabyte X870 AORUS Elite WiFi7',
    'AMD X870 motherboard featuring PCIe 5.0 and WiFi 7',
    'MB-GIGABYTE-X870-AORUS',
    339.99,
    19,
    @CategoryId,
    @Gigabyte,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'MB-GIGABYTE-B850-GAMINGX')
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
    'Gigabyte B850 Gaming X',
    'AMD B850 motherboard with PCIe 5.0 support',
    'MB-GIGABYTE-B850-GAMINGX',
    219.99,
    24,
    @CategoryId,
    @Gigabyte,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'MB-GIGABYTE-Z890-AORUSPRO')
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
    'Gigabyte Z890 AORUS Pro',
    'Intel Z890 ATX motherboard for gaming and creators',
    'MB-GIGABYTE-Z890-AORUSPRO',
    389.99,
    16,
    @CategoryId,
    @Gigabyte,
    1
);
END;