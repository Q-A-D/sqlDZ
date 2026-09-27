# Блок схема
<img width="2344" height="267" alt="image" src="https://github.com/user-attachments/assets/c87bf673-762c-447f-bb1a-a4eddf17e588" />

# Код

```
CREATE TABLE Countries (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(100)
);

CREATE TABLE Cities (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(100),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
);

CREATE TABLE Hotels (
    HotelID INT PRIMARY KEY,
    HotelName VARCHAR(100),
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES Cities(CityID)
);

CREATE TABLE TourTypes (
    TypeID INT PRIMARY KEY,
    TypeName VARCHAR(100)
);

CREATE TABLE Tours (
    TourID INT PRIMARY KEY,
    TourName VARCHAR(100),
    TypeID INT,
    HotelID INT,
    FOREIGN KEY (TypeID) REFERENCES TourTypes(TypeID),
    FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID)
);

CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(20)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    ClientID INT,
    TourID INT,
    EmployeeID INT,
    BookingDate DATE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (TourID) REFERENCES Tours(TourID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    ClientID INT,
    TourID INT,
    Rating INT,
    Comment VARCHAR(255),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (TourID) REFERENCES Tours(TourID)
);
```
