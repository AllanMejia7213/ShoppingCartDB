Create database SanaShoppingCart

go

Use SanaShoppingCart

Go 

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY identity(1,1),
    CategoryName VARCHAR(50),
    Description VARCHAR(255)
);

GO

CREATE TABLE Products (
    ProductID INT PRIMARY KEY identity(1,1),
	ProductCode varchar(50),
    ProductName VARCHAR(100),
    Description VARCHAR(255),
    Price DECIMAL(10, 2),
	Stock int
);

GO

CREATE TABLE ProductCategoryMap (
    ProductID INT,
    CategoryID INT,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

GO

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY identity(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    [Address] VARCHAR(255)
);

GO

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY identity(1,1),
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

GO

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY identity(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- Non-clustered index on Products.ProductName
CREATE NONCLUSTERED INDEX IX_Products_ProductName ON Products(ProductName);

-- Non-clustered index on Customers.Email
CREATE NONCLUSTERED INDEX IX_Customers_Email ON Customers(Email);

-- Non-clustered index on Orders.CustomerID
CREATE NONCLUSTERED INDEX IX_Orders_CustomerID ON Orders(CustomerID);

-- Non-clustered index on Orders.OrderDate
CREATE NONCLUSTERED INDEX IX_Orders_OrderDate ON Orders(OrderDate);

-- Non-clustered index on OrderDetails.OrderID
CREATE NONCLUSTERED INDEX IX_OrderDetails_OrderID ON OrderDetails(OrderID);

-- Non-clustered index on OrderDetails.ProductID
CREATE NONCLUSTERED INDEX IX_OrderDetails_ProductID ON OrderDetails(ProductID);





