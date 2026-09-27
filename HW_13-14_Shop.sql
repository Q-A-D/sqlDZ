CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO

INSERT INTO Categories (CategoryID, CategoryName) VALUES (1, 'Электроника'), (2, 'Книги');
INSERT INTO Products (ProductID, ProductName, Price, CategoryID) VALUES (1, 'Ноутбук', 1000.00, 1), (2, 'Роман', 20.00, 2);
INSERT INTO Customers (CustomerID, FirstName, LastName, Email) VALUES (1, 'Иван', 'Иванов', 'ivan@mail.ru'), (2, 'Петр', 'Петров', 'petr@mail.ru');
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES (1, 1, '2023-10-01'), (2, 2, '2023-10-02');
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES (1, 1, 1, 1), (2, 2, 2, 3);
GO
