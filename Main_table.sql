-- wasteTypes table
CREATE TABLE WasteTypes (
    WasteTypeID NUMBER PRIMARY KEY,
    Description VARCHAR2(100)
);
-- CollectionPoints table
CREATE TABLE CollectionPoints (
    CollectionPointID NUMBER PRIMARY KEY,
    Location VARCHAR2(255),
    Capacity NUMBER
);
-- DisposalSites table
CREATE TABLE DisposalSites (
    DisposalSiteID NUMBER PRIMARY KEY,
    Name VARCHAR2(255),
    Type VARCHAR2(100),
    Capacity NUMBER
);
-- Collections table
CREATE TABLE Collections (
    CollectionID NUMBER PRIMARY KEY ,
    CollectionPointID NUMBER REFERENCES CollectionPoints(CollectionPointID),
    WasteTypeID NUMBER REFERENCES WasteTypes(WasteTypeID),
    QuantityKG NUMBER,
    CollectionDate DATE
);
--Disposals Table

CREATE TABLE Disposals (
    DisposalID NUMBER PRIMARY KEY,
    DisposalSiteID NUMBER REFERENCES DisposalSites(DisposalSiteID),
    WasteTypeID NUMBER REFERENCES WasteTypes(WasteTypeID),
    QuantityKG NUMBER,
    DisposalDate DATE
);



INSERT INTO WasteTypes (WasteTypeID, Description) VALUES (1, 'Organic');
INSERT INTO WasteTypes (WasteTypeID, Description) VALUES (2, 'Recyclable');
INSERT INTO WasteTypes (WasteTypeID, Description) VALUES (3, 'Inorganic');
INSERT INTO WasteTypes (WasteTypeID, Description) VALUES (4, 'industrial');
INSERT INTO WasteTypes (WasteTypeID, Description) VALUES (5, 'agricultural');
INSERT INTO WasteTypes (WasteTypeID, Description) VALUES (6, 'radioactive');


INSERT INTO CollectionPoints (CollectionPointID, Location, Capacity) VALUES (1, 'Dhaka', 1000);
INSERT INTO CollectionPoints (CollectionPointID, Location, Capacity) VALUES (2, 'Khulna', 2000);
INSERT INTO CollectionPoints (CollectionPointID, Location, Capacity) VALUES (3, 'Bogura', 1500);
INSERT INTO CollectionPoints (CollectionPointID, Location, Capacity) VALUES (4, 'Sylhet', 1700);
INSERT INTO CollectionPoints (CollectionPointID, Location, Capacity) VALUES (5, 'Bashantapur', 100);
INSERT INTO CollectionPoints (CollectionPointID, Location, Capacity) VALUES (6, 'Rupsha', 1000);


INSERT INTO DisposalSites (DisposalSiteID, Name, Type, Capacity) VALUES (1, 'Dhaka Mahanagar', 'Recycling Center', 5000);
INSERT INTO DisposalSites (DisposalSiteID, Name, Type, Capacity) VALUES (2, 'Moylapota', 'Moylapota Center', 3000);
INSERT INTO DisposalSites (DisposalSiteID, Name, Type, Capacity) VALUES (3, 'AHC', 'Shatmatha', 2000);
INSERT INTO DisposalSites (DisposalSiteID, Name, Type, Capacity) VALUES (4, 'Feluda Shohor', 'Feluda Center', 2500);
INSERT INTO DisposalSites (DisposalSiteID, Name, Type, Capacity) VALUES (5, 'Doulatpur', 'Habijabi center', 5000);
INSERT INTO DisposalSites (DisposalSiteID, Name, Type, Capacity) VALUES (6, '7noGhat', 'Center', 5000);




INSERT INTO Collections (CollectionID, CollectionPointID, WasteTypeID, QuantityKG, CollectionDate)
VALUES (1, 1, 1, 500, TO_DATE('2024-04-01', 'YYYY-MM-DD'));
INSERT INTO Collections (CollectionID, CollectionPointID, WasteTypeID, QuantityKG, CollectionDate)
VALUES (2, 2, 2, 200, TO_DATE('2024-04-01', 'YYYY-MM-DD'));
INSERT INTO Collections (CollectionID, CollectionPointID, WasteTypeID, QuantityKG, CollectionDate)
VALUES (3, 3, 3, 1500, TO_DATE('2024-04-02', 'YYYY-MM-DD'));
INSERT INTO Collections (CollectionID, CollectionPointID, WasteTypeID, QuantityKG, CollectionDate)
VALUES (4, 4, 4, 300, TO_DATE('2024-04-03', 'YYYY-MM-DD'));
INSERT INTO Collections (CollectionID, CollectionPointID, WasteTypeID, QuantityKG, CollectionDate)
VALUES (5, 5, 5, 1200, TO_DATE('2024-04-04', 'YYYY-MM-DD'));
INSERT INTO Collections (CollectionID, CollectionPointID, WasteTypeID, QuantityKG, CollectionDate)
VALUES (6, 6, 6, 1000, TO_DATE('2024-04-05', 'YYYY-MM-DD'));


>Record a disposal:
INSERT INTO Disposals (DisposalID, DisposalSiteID, WasteTypeID, QuantityKG, DisposalDate)
VALUES (1, 1, 1, 500, TO_DATE('2024-05-01', 'YYYY-MM-DD'));
INSERT INTO Disposals (DisposalID, DisposalSiteID, WasteTypeID, QuantityKG, DisposalDate)
VALUES (2, 2, 2, 500, TO_DATE('2024-05-02', 'YYYY-MM-DD'));
INSERT INTO Disposals (DisposalID, DisposalSiteID, WasteTypeID, QuantityKG, DisposalDate)
VALUES (3, 3, 3, 100, TO_DATE('2024-05-04', 'YYYY-MM-DD'));
INSERT INTO Disposals (DisposalID, DisposalSiteID, WasteTypeID, QuantityKG, DisposalDate)
VALUES (4, 4, 4, 5000, TO_DATE('2024-05-05', 'YYYY-MM-DD'));
INSERT INTO Disposals (DisposalID, DisposalSiteID, WasteTypeID, QuantityKG, DisposalDate)
VALUES (5, 5, 5, 1000, TO_DATE('2024-05-06', 'YYYY-MM-DD'));
INSERT INTO Disposals (DisposalID, DisposalSiteID, WasteTypeID, QuantityKG, DisposalDate)
VALUES (6, 6, 6, 400, TO_DATE('2024-05-01', 'YYYY-MM-DD'));




-- Employee table
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    Name VARCHAR2(255),
    Role VARCHAR2(100), 
    ContactInfo VARCHAR2(255)
);

-- Vehicles table
CREATE TABLE Vehicles (
    VehicleID NUMBER PRIMARY KEY,
    LicensePlate VARCHAR2(50),
    Capacity NUMBER,
    Type VARCHAR2(100) 
);

-- Schedules table
CREATE TABLE Schedules (
    ScheduleID NUMBER PRIMARY KEY,
    CollectionPointID NUMBER REFERENCES CollectionPoints(CollectionPointID),
    VehicleID NUMBER REFERENCES Vehicles(VehicleID),
    EmployeeID NUMBER REFERENCES Employees(EmployeeID),
    ScheduledDate DATE,
    Status VARCHAR2(50) 
);
-- EnvironmentalImpacts table
CREATE TABLE EnvironmentalImpacts (
    RecordID NUMBER PRIMARY KEY,
    DisposalID NUMBER REFERENCES Disposals(DisposalID),
    CarbonSavedKG NUMBER,
    WasteReducedKG NUMBER,
    DateRecorded DATE
);

