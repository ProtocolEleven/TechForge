DECLARE @CategoryId INT =
(
    SELECT Id
    FROM Category
    WHERE Name = 'GPU'
);

DECLARE @NVIDIA INT =
(
    SELECT Id
    FROM Brands
    WHERE Name = 'NVIDIA'
);

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'GPU-NVIDIA-RTX5060')
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
    'NVIDIA GeForce RTX 5060 8GB',
    'Entry-level gaming graphics card with DLSS 4 support',
    'GPU-NVIDIA-RTX5060',
    329.99,
    42,
    @CategoryId,
    @NVIDIA,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'GPU-NVIDIA-RTX5060TI')
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
    'NVIDIA GeForce RTX 5060 Ti 16GB',
    '1440p gaming graphics card with DLSS 4',
    'GPU-NVIDIA-RTX5060TI',
    449.99,
    28,
    @CategoryId,
    @NVIDIA,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'GPU-NVIDIA-RTX5070')
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
    'NVIDIA GeForce RTX 5070 12GB',
    'High-performance gaming GPU for 1440p and 4K',
    'GPU-NVIDIA-RTX5070',
    649.99,
    22,
    @CategoryId,
    @NVIDIA,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'GPU-NVIDIA-RTX5070TI')
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
    'NVIDIA GeForce RTX 5070 Ti 16GB',
    'Premium gaming GPU with DLSS 4 and ray tracing',
    'GPU-NVIDIA-RTX5070TI',
    829.99,
    18,
    @CategoryId,
    @NVIDIA,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'GPU-NVIDIA-RTX5080')
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
    'NVIDIA GeForce RTX 5080 16GB',
    'Flagship gaming GPU designed for high-end 4K gaming',
    'GPU-NVIDIA-RTX5080',
    1199.99,
    14,
    @CategoryId,
    @NVIDIA,
    1
);
END;

IF NOT EXISTS (SELECT 1 FROM Products WHERE SKU = 'GPU-NVIDIA-RTX5090')
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
    'NVIDIA GeForce RTX 5090 32GB',
    'Ultimate enthusiast GPU for AI workloads and 4K gaming',
    'GPU-NVIDIA-RTX5090',
    1999.99,
    8,
    @CategoryId,
    @NVIDIA,
    1
);
END;

