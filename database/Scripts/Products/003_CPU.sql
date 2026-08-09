DECLARE @CategoryId INT =
(
    SELECT Id
    FROM Category
    WHERE Name = 'CPU'
);

DECLARE @AMD INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'AMD'
);

DECLARE @Intel INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'Intel'
);

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'CPU-AMD-9600X')
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
    'AMD Ryzen 5 9600X',
    '6-Core 12-Thread Desktop Processor',
    'CPU-AMD-9600X',
    279.99,
    42,
    @CategoryId,
    @AMD,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'CPU-AMD-9700X')
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
    'AMD Ryzen 7 9700X',
    '8-Core 16-Thread Desktop Processor',
    'CPU-AMD-9700X',
    359.99,
    31,
    @CategoryId,
    @AMD,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'CPU-AMD-9800X3D')
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
    'AMD Ryzen 7 9800X3D',
    '8-Core Gaming Processor with 3D V-Cache',
    'CPU-AMD-9800X3D',
    479.99,
    25,
    @CategoryId,
    @AMD,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'CPU-AMD-9900X')
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
    'AMD Ryzen 9 9900X',
    '12-Core 24-Thread Desktop Processor',
    'CPU-AMD-9900X',
    529.99,
    18,
    @CategoryId,
    @AMD,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'CPU-AMD-9950X')
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
    'AMD Ryzen 9 9950X',
    '16-Core 32-Thread Flagship Desktop Processor',
    'CPU-AMD-9950X',
    699.99,
    14,
    @CategoryId,
    @AMD,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'CPU-INTEL-245K')
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
    'Intel Core Ultra 5 245K',
    '14-Core Desktop Processor',
    'CPU-INTEL-245K',
    299.99,
    37,
    @CategoryId,
    @Intel,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'CPU-INTEL-265K')
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
    'Intel Core Ultra 7 265K',
    '20-Core Desktop Processor',
    'CPU-INTEL-265K',
    429.99,
    28,
    @CategoryId,
    @Intel,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'CPU-INTEL-285K')
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
    'Intel Core Ultra 9 285K',
    '24-Core Flagship Desktop Processor',
    'CPU-INTEL-285K',
    629.99,
    17,
    @CategoryId,
    @Intel,
    1
);
END;

