-- Use previously created database
use DWH_Project;

-- Create dim customer
CREATE TABLE dbo.DimCustomer
(
    CustomerID int PRIMARY KEY NOT NULL,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Age int NOT NULL,
    City varchar(50) NOT NULL,
    NoHP varchar(50) NOT NULL
)
GO

-- Create dim product
CREATE TABLE dbo.DimProduct
(
    ProductID int PRIMARY KEY NOT NULL,
    ProductName varchar(255) NOT NULL,
    ProductCategory varchar(255) NOT NULL,
    ProductUnitPrice int NOT NULL
)
GO

-- Create dim status order
CREATE TABLE dbo.DimStatusOrder
(
    StatusID int PRIMARY KEY NOT NULL,
    StatusOrder varchar(50) NOT NULL,
    StatusOrderDesc varchar(50) NOT NULL
)
GO

-- Create fact sales order
CREATE TABLE dbo.FactSalesOrder
(
    OrderID int PRIMARY KEY NOT NULL,
    CustomerID int NOT NULL,
    ProductID int NOT NULL,
    StatusID int NOT NULL,
    Quantity int NOT NULL,
    Amount int NOT NULL,
    OrderData date NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES dbo.DimCustomer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES dbo.DimProduct(ProductID),
    FOREIGN KEY (StatusID) REFERENCES dbo.DimStatusOrder(StatusID)
)
GO