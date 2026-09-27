CREATE DATABASE ShopDB
ON PRIMARY (
    NAME = 'ShopDB_Primary',
    FILENAME = 'C:\SQLData\ShopDB_Primary.mdf'
),
FILEGROUP ShopDB_FG1 (
    NAME = 'ShopDB_FG1_Data',
    FILENAME = 'C:\SQLData\ShopDB_FG1.ndf'
)
LOG ON (
    NAME = 'ShopDB_Log',
    FILENAME = 'C:\SQLData\ShopDB_Log.ldf'
);
GO

USE ShopDB;
GO

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100)
) ON ShopDB_FG1;

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
) ON ShopDB_FG1;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
) ON ShopDB_FG1;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Position VARCHAR(50)
) ON ShopDB_FG1;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
) ON ShopDB_FG1;

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
) ON ShopDB_FG1;
GO