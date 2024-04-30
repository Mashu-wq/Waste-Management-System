
## Waste Management System

This database is designed to manage waste collection and disposal activities, tracking the types of waste, collection points, disposal sites, collections, disposals, and the associated environmental impacts.

## Create Table

```sql

CREATE TABLE WasteTypes (
    WasteTypeID NUMBER PRIMARY KEY,
    Description VARCHAR2(100)
);
CREATE TABLE CollectionPoints (
    CollectionPointID NUMBER PRIMARY KEY,
    Location VARCHAR2(255),
    Capacity NUMBER
);
CREATE TABLE DisposalSites (
    DisposalSiteID NUMBER PRIMARY KEY,
    Name VARCHAR2(255),
    Type VARCHAR2(100),
    Capacity NUMBER
);
CREATE TABLE Collections (
    CollectionID NUMBER PRIMARY KEY AUTOINCREMENT,
    CollectionPointID NUMBER REFERENCES CollectionPoints(CollectionPointID),
    WasteTypeID NUMBER REFERENCES WasteTypes(WasteTypeID),
    QuantityKG NUMBER,
    CollectionDate DATE
);
CREATE TABLE Disposals (
    DisposalID NUMBER PRIMARY KEY,
    DisposalSiteID NUMBER REFERENCES DisposalSites(DisposalSiteID),
    WasteTypeID NUMBER REFERENCES WasteTypes(WasteTypeID),
    QuantityKG NUMBER,
    DisposalDate DATE
);
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    Name VARCHAR2(255),
    Role VARCHAR2(100), 
    ContactInfo VARCHAR2(255)
);
CREATE TABLE Vehicles (
    VehicleID NUMBER PRIMARY KEY,
    LicensePlate VARCHAR2(50),
    Capacity NUMBER,
    Type VARCHAR2(100) 
);
CREATE TABLE Schedules (
    ScheduleID NUMBER PRIMARY KEY,
    CollectionPointID NUMBER REFERENCES CollectionPoints(CollectionPointID),
    VehicleID NUMBER REFERENCES Vehicles(VehicleID),
    EmployeeID NUMBER REFERENCES Employees(EmployeeID),
    ScheduledDate DATE,
    Status VARCHAR2(50) 
);
CREATE TABLE EnvironmentalImpacts (
    RecordID NUMBER PRIMARY KEY,
    DisposalID NUMBER REFERENCES Disposals(DisposalID),
    CarbonSavedKG NUMBER,
    WasteReducedKG NUMBER,
    DateRecorded DATE
);

```

## Insert Data

``` sql

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

INSERT INTO Disposals (DisposalID, DisposalSiteID, WasteTypeID, QuantityKG, DisposalDate)
VALUES (1, 1, 1, 500, '2024-05-01');
INSERT INTO Disposals (DisposalID, DisposalSiteID, WasteTypeID, QuantityKG, DisposalDate)
VALUES (2, 2, 2, 500, '2024-05-02');
INSERT INTO Disposals (DisposalID, DisposalSiteID, WasteTypeID, QuantityKG, DisposalDate)
VALUES (3, 3, 3, 100, '2024-05-03');
INSERT INTO Disposals (DisposalID, DisposalSiteID, WasteTypeID, QuantityKG, DisposalDate)
VALUES (4, 4, 4, 5000, '2024-05-04');
INSERT INTO Disposals (DisposalID, DisposalSiteID, WasteTypeID, QuantityKG, DisposalDate)
VALUES (5, 5, 5, 1000, '2024-05-05');
INSERT INTO Disposals (DisposalID, DisposalSiteID, WasteTypeID, QuantityKG, DisposalDate)
VALUES (6, 6, 6, 400, '2024-05-01');

```

## SQL Query:

## ------ DDL ------

``` sql
--drop table ajaira;
alter table Collectios add location char(20);
alter table Disposals modify location varchar(23);
alter table Collections rename column location to location2;
select * from Collections; 
select* from Disposals;

```

## ------ DDL ------

``` sql
INSERT INTO CollectionPoints (CollectionPointID, Location, Capacity) VALUES (1, 'Dhaka', 1000);
update CollectionPoints set location2='ctg' where CollectionPointID=12;
delete from CollectionPoints  where dept_id=12;-- delete the row
alter table CollectionPoints drop column location2; --DDL--
select * from CollectionPoints where Location like '%C%';
select * from CollectionPoints order by Location;
```
## ------ Aggregate function ------
``` sql
SELECT SUM(QuantityKG) AS TotalWasteCollected FROM Collections; -- Quantity of Waste Collected 
SELECT CollectionPointID, AVG(QuantityKG) AS AvgWasteCollected FROM Collections GROUP BY CollectionPointID; -- Average Waste Collected at Each Collection Point
SELECT COUNT(DISTINCT WasteTypeID) AS NumberOfWasteTypes FROM WasteTypes; -- Total Number of Different Waste Types Collected
SELECT MAX(QuantityKG) AS MaxWasteCollected FROM Collections; -- Maximum Waste Collected in a Single Collection Event
SELECT Location, COUNT(*) AS NumberOfCollectionPoints FROM CollectionPoints GROUP BY Location; -- Count of Collection Points by Location
SELECT SUM(Capacity) AS TotalDisposalCapacity FROM DisposalSites; -- Total Capacity of All Disposal Sites
SELECT DisposalSiteID, AVG(QuantityKG) AS AvgDisposalQuantity FROM Disposals GROUP BY DisposalSiteID; -- Average Disposal Quantity at Each Disposal Site
SELECT WasteTypeID, COUNT(*) AS DisposalEvents FROM Disposals GROUP BY WasteTypeID; -- Count of Disposal Events Per Waste Type
SELECT DisposalDate, SUM(QuantityKG) AS TotalWasteDisposed FROM Disposals GROUP BY DisposalDate; -- Total Waste Disposed of On a Particular Date
SELECT SUM(CarbonSavedKG) AS TotalCarbonSaved, SUM(WasteReducedKG) AS TotalWasteReduced FROM EnvironmentalImpacts; -- Total Waste Disposed of On a Particular Date

```
## JOIN 
``` sql
SELECT * FROM Collections NATURAL JOIN Disposals WHERE CollectionPointID = 7;
SELECT c.CollectionID, c.QuantityKG, d.DisposalID, d.QuantityKG FROM Collections c
JOIN Disposals d USING (WasteTypeID);
SELECT c.CollectionID, c.QuantityKG, d.DisposalID, d.QuantityKG
FROM Collections c
JOIN Disposals d USING (WasteTypeID);
SELECT c.CollectionID, c.QuantityKG, d.DisposalID, d.QuantityKG
FROM Collections c
LEFT JOIN Disposals d USING (WasteTypeID);
SELECT c.CollectionID, c.QuantityKG, d.DisposalID, d.QuantityKG
FROM Collections c
RIGHT JOIN Disposals d USING (WasteTypeID);
SELECT c.CollectionID, c.QuantityKG, d.DisposalID, d.QuantityKG
FROM Collections c
FULL OUTER JOIN Disposals d USING (WasteTypeID);

```
## PL/SQL

``` sql
DECLARE
  CURSOR c_collections IS SELECT * FROM Collections;
  v_collections_count NUMBER := 0;
BEGIN
  FOR v_record IN c_collections LOOP
    v_collections_count := v_collections_count + 1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Total collections: ' || v_collections_count);
END;

DECLARE
  TYPE t_varray IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
  v_messages t_varray;
BEGIN
  v_messages(1) := 'First';
  v_messages(2) := 'Second';
  v_messages(3) := 'Third';
  
  FOR i IN 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE(v_messages(i));
  END LOOP;
END;
/
```

## Procedure:
```sql
CREATE OR REPLACE PROCEDURE MonthlyWasteSummary IS
    
    CURSOR c_monthly_totals IS
        SELECT TO_CHAR(c.CollectionDate, 'YYYY-MM') AS Month,
               SUM(c.QuantityKG) AS TotalCollected,
               (SELECT SUM(d.QuantityKG)
                FROM Disposals d
                WHERE TO_CHAR(d.DisposalDate, 'YYYY-MM') = TO_CHAR(c.CollectionDate, 'YYYY-MM')) AS TotalDisposed
        FROM Collections c
        GROUP BY TO_CHAR(c.CollectionDate, 'YYYY-MM')
        ORDER BY TO_CHAR(c.CollectionDate, 'YYYY-MM');
        
    v_month VARCHAR2(7);
    v_total_collected NUMBER;
    v_total_disposed NUMBER;
BEGIN
   
FOR r_monthly_totals IN c_monthly_totals LOOP

        v_month := r_monthly_totals.Month;
        v_total_collected := r_monthly_totals.TotalCollected;
        v_total_disposed := r_monthly_totals.TotalDisposed;

      
        DBMS_OUTPUT.PUT_LINE('Month: ' || v_month || 
                             ', Total Collected: ' || v_total_collected || 
                             'kg, Total Disposed: ' || v_total_disposed || 'kg');
    END LOOP;
END;

```
## Function:

``` sql
CREATE OR REPLACE FUNCTION GetTotalWasteCollectedByType (
    p_WasteTypeID IN WasteTypes.WasteTypeID%TYPE
)
RETURN NUMBER
IS
    v_total_collected NUMBER;
BEGIN
   
    SELECT NVL(SUM(QuantityKG), 0) INTO v_total_collected
    FROM Collections
    WHERE WasteTypeID = p_WasteTypeID;
    RETURN v_total_collected;

    SELECT GetTotalWasteCollectedByType(1) AS TotalOrganicWaste FROM DUAL;

```
## Trigger: 

```sql
CREATE OR REPLACE TRIGGER UpdateCapacityAfterCollection
AFTER INSERT ON Collections
FOR EACH ROW
DECLARE
    v_capacity NUMBER;
    v_used_capacity NUMBER;
BEGIN
    SELECT Capacity, UsedCapacity INTO v_capacity, v_used_capacity
    FROM CollectionPoints
    WHERE CollectionPointID = :NEW.CollectionPointID
    FOR UPDATE OF UsedCapacity;
    v_used_capacity := v_used_capacity + :NEW.QuantityKG;
    IF v_used_capacity > v_capacity THEN
        RAISE_APPLICATION_ERROR(-20002, 'Exceeds collection point capacity');
    ELSE
        UPDATE CollectionPoints
        SET UsedCapacity = v_used_capacity
        WHERE CollectionPointID = :NEW.CollectionPointID;
    END IF;
END;

```
## Cursor: 

```sql
DECLARE
    CURSOR c_collections IS
        SELECT CollectionPointID, QuantityKG
        FROM Collections;
    v_collectionPointID Collections.CollectionPointID%TYPE;
    v_quantityKG Collections.QuantityKG%TYPE;
    TYPE t_totalWaste IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
    v_totalWaste t_totalWaste;
BEGIN
    OPEN c_collections;
    LOOP
        FETCH c_collections INTO v_collectionPointID, v_quantityKG;
        EXIT WHEN c_collections%NOTFOUND; 
        IF v_totalWaste.EXISTS(v_collectionPointID) THEN
            v_totalWaste(v_collectionPointID) := v_totalWaste(v_collectionPointID) + v_quantityKG;
        ELSE
            v_totalWaste(v_collectionPointID) := v_quantityKG;
        END IF;
    END LOOP;
    CLOSE c_collections;
    DBMS_OUTPUT.PUT_LINE('Total Waste Collected by Collection Point:');
    FOR i IN v_totalWaste.FIRST .. v_totalWaste.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('Collection Point ' || i || ': ' || v_totalWaste(i) || ' KG');
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        IF c_collections%ISOPEN THEN
            CLOSE c_collections;
        END IF;
END;
```



