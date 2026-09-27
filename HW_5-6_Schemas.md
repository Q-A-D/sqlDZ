## Создание схем

```sql
CREATE SCHEMA Sales;
GO
CREATE SCHEMA Logistics;
GO
```

## Транспортировка таблицы

```sql
CREATE TABLE Sales.Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100)
);
GO

ALTER SCHEMA Logistics TRANSFER Sales.Products;
GO
```
