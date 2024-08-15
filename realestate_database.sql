
CREATE DATABASE IF NOT EXISTS RealEstateDB;
USE RealEstateDB;


CREATE TABLE IF NOT EXISTS Agents (
    AgentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS Clients (
    ClientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS PropertyTypes (
    TypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(50) -- E.g., Single Family, Condo, Apartment, etc.
);


CREATE TABLE IF NOT EXISTS Properties (
    PropertyID INT AUTO_INCREMENT PRIMARY KEY,
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    ListingPrice DECIMAL(10, 2),
    ListingDate DATE,
    TypeID INT,
    AgentID INT,
    FOREIGN KEY (TypeID) REFERENCES PropertyTypes(TypeID) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE,
    FOREIGN KEY (AgentID) REFERENCES Agents(AgentID) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS PropertyDetails (
    PropertyID INT,
    Bedrooms INT,
    Bathrooms DECIMAL(3, 1),
    SquareFeet INT,
    YearBuilt INT,
    ParkingSpaces INT,
    FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS PropertyStatus (
    StatusID INT AUTO_INCREMENT PRIMARY KEY,
    StatusName VARCHAR(50) -- E.g., Available, Under Contract, Sold
);


CREATE TABLE IF NOT EXISTS PropertyAmenities (
    AmenityID INT AUTO_INCREMENT PRIMARY KEY,
    AmenityName VARCHAR(100) -- E.g., Pool, Gym, Garage, etc.
);

CREATE TABLE IF NOT EXISTS PropertyAmenityAssignments (
    PropertyID INT,
    AmenityID INT,
    FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (AmenityID) REFERENCES PropertyAmenities(AmenityID) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    PropertyID INT,
    ClientID INT,
    AgentID INT,
    SalePrice DECIMAL(10, 2),
    SaleDate DATE,
    StatusID INT,
    FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE,
    FOREIGN KEY (AgentID) REFERENCES Agents(AgentID) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE,
    FOREIGN KEY (StatusID) REFERENCES PropertyStatus(StatusID) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE
);


INSERT INTO Agents (FirstName, LastName, Email, PhoneNumber) VALUES
('John', 'Doe', 'johndoe@example.com', '555-1234'),
('Jane', 'Smith', 'janesmith@example.com', '555-5678'),
('Jim', 'Brown', 'jimbrown@example.com', '555-8765'),
('Sara', 'White', 'sarawhite@example.com', '555-4321'),
('Paul', 'Green', 'paulgreen@example.com', '555-6789'),
('Lisa', 'Blue', 'lisablue@example.com', '555-9988');  

INSERT INTO Clients (FirstName, LastName, Email, PhoneNumber) VALUES
('Alice', 'Johnson', 'alicej@example.com', '555-2345'),
('Bob', 'Williams', 'bobw@example.com', '555-3456'),
('Charlie', 'Davis', 'charlied@example.com', '555-4567'),
('Emily', 'Clark', 'emilyc@example.com', '555-5678'),
('Frank', 'Miller', 'frankm@example.com', '555-6789'),
('Nancy', 'Turner', 'nancyturner@example.com', '555-7890'); 


INSERT INTO PropertyTypes (TypeName) VALUES
('Single Family'),
('Condo'),
('Townhouse'),
('Apartment'),
('Duplex');

INSERT INTO PropertyStatus (StatusName) VALUES
('Available'),
('Under Contract'),
('Sold');


INSERT INTO PropertyAmenities (AmenityName) VALUES
('Pool'),
('Gym'),
('Garage'),
('Backyard'),
('Fireplace');


INSERT INTO Properties (Address, City, State, ZipCode, ListingPrice, ListingDate, TypeID, AgentID) VALUES
('123 Main St', 'Los Angeles', 'CA', '90001', 450000.00, '2023-01-15', 1, 1),
('456 Elm St', 'San Francisco', 'CA', '94102', 800000.00, '2023-02-10', 2, 2),
('789 Oak St', 'New York', 'NY', '10001', 650000.00, '2023-03-05', 3, 3),
('101 Pine St', 'Chicago', 'IL', '60601', 500000.00, '2023-04-12', 4, 4),
('202 Birch St', 'Miami', 'FL', '33101', 300000.00, '2023-05-20', 1, 5),
('303 Cedar St', 'Dallas', 'TX', '75201', 700000.00, '2023-06-18', 2, 1),
('404 Maple St', 'Seattle', 'WA', '98101', 900000.00, '2023-07-22', 3, 2),
('505 Walnut St', 'Denver', 'CO', '80201', 350000.00, '2023-08-15', 4, 3),
('606 Cherry St', 'Boston', 'MA', '02101', 750000.00, '2023-09-10', 5, 4),
('707 Aspen St', 'Las Vegas', 'NV', '89101', 400000.00, '2023-10-05', 1, 5),
('909 Ash St', 'Portland', 'OR', '97035', 500000.00, '2024-01-01', 4, 3),
('333 Oak Ave', 'San Diego', 'CA', '92101', 600000.00, '2024-02-01', 2, 2);


INSERT INTO PropertyDetails (PropertyID, Bedrooms, Bathrooms, SquareFeet, YearBuilt, ParkingSpaces) VALUES
(1, 3, 2.5, 2000, 1990, 2),
(2, 2, 1.5, 1500, 1985, 1),
(3, 4, 3.0, 2500, 2005, 2),
(4, 3, 2.0, 1800, 1995, 2),
(5, 2, 1.0, 1200, 2000, 1),
(6, 3, 2.5, 2200, 2010, 2),
(7, 4, 3.5, 3000, 2015, 3),
(8, 2, 2.0, 1600, 2003, 1),
(9, 3, 2.5, 2400, 2018, 2),
(10, 2, 1.5, 1400, 2007, 1),
(11, 3, 2.5, 2000, 1992, 2),
(12, 4, 3.0, 2500, 2003, 2);


INSERT INTO PropertyAmenityAssignments (PropertyID, AmenityID) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 1),
(3, 2),
(3, 5),
(4, 3),
(4, 4),
(5, 2),
(6, 1),
(6, 5),
(7, 3),
(8, 1),
(8, 4),
(9, 1),
(9, 2),
(10, 3),
(11, 3), 
(12, 2); 


INSERT INTO Transactions (PropertyID, ClientID, AgentID, SalePrice, SaleDate, StatusID) VALUES
(1, 1, 1, 440000.00, '2023-04-01', 3), 
(2, 2, 2, 790000.00, '2023-04-15', 3),  
(3, 3, 3, 640000.00, '2023-05-10', 3),  
(4, 4, 4, 490000.00, '2023-06-01', 3), 
(5, 5, 5, 290000.00, '2023-07-01', 3),  
(6, NULL, 1, NULL, NULL, 1),           
(7, 2, 2, 880000.00, NULL, 2),          
(8, NULL, 3, NULL, NULL, 1),            
(9, NULL, 4, NULL, NULL, 2),            
(10, 5, 5, 390000.00, '2023-12-01', 3); 


select p.city, p.state, a.firstName, a.LastName
from Properties p
Inner join Agents a ON p.AgentID = a.AgentID;

select t.TransactionID, p.Address, p.city, p.state
from transactions t
Inner join properties p ON t.PropertyID = p.PropertyID; 

select a.AgentID, p.address, p.city, p.state, p.listingPrice
from properties p
inner join agents a ON a.AgentID = p.AgentID
where p.AgentID = 3;

select tr.TransactionID, c.FirstName, c.LastName, c.Email, p.address, p.city, p.state
from transactions tr
Inner join clients c on c.ClientID = tr.ClientID
inner join properties p on p.PropertyID = tr.PropertyID;

select a.firstName, a.lastName, a.email, a.phoneNumber, p.address, p.city, p.state
from agents a
left join properties p ON a.agentID = p.AgentID;

select p.address, p.city, p.state, p.listingPrice, tr.TransactionID, tr.salePrice
from properties p
left join transactions tr ON tr.PropertyID = p.PropertyID;

select c.FirstName, c.LastName, c.email, c.phoneNumber, p.address, p.city, p.state
from clients c
left join Transactions tr on tr.clientID = c.clientID
left join properties p on p.PropertyID = tr.PropertyID;

select pt.TypeName, p.address, p.city, p.state
from PropertyTypes pt
left join Properties p on pt.TypeID = p.TypeID;


-- Ticket 4 
select p.address, p.city, p.state, p.listingPrice, a.firstName, a.lastName, a.email
from properties p
right join agents a on p.AgentID = a.AgentID;

select tr.TransactionID, tr.salePrice, tr.saleDate, c.firstName, c.lastName, c.email, c.phoneNumber
from transactions tr
right join clients c on tr.clientID = c.clientID;

select pt.TypeName, p.address, p.city, p.state
from PropertyTypes pt
right join Properties p ON pt.TypeID = p.TypeID;


select tr.TransactionID, tr.saleDate, c.firstName, c.lastName, c.email, c.phoneNumber
from transactions tr
right join clients c on c.clientID = tr.clientID;
-- Ticket 5
select a.firstName, a.LastName, a.email, p.address, p.city, p.state, p.listingPrice
from Agents a
CROSS JOIN Properties p
order by a.firstName;

select c.FirstName, c.lastName, c.email, p.address, p.city, p.state, p.listingPrice
from clients c
cross join properties p
order by c.lastName;

select pt.TypeName, p.address, p.city, p.state, p.listingPrice
from PropertyTypes pt
cross join Properties p
order by pt.TypeName;

select a.firstName, a.lastname, a.email, c.firstName, c.lastName, c.email
from agents a
cross join clients c
order by a.lastName;