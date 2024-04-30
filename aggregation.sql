-- Total Waste Collected by Type
SELECT WasteTypes.Description, SUM(Collections.QuantityKG) AS TotalCollectedKG
FROM Collections
JOIN WasteTypes ON Collections.WasteTypeID = WasteTypes.WasteTypeID
GROUP BY WasteTypes.Description;

-- Total Waste Disposed by Site
SELECT DisposalSites.Name, SUM(Disposals.QuantityKG) AS TotalDisposedKG
FROM Disposals
JOIN DisposalSites ON Disposals.DisposalSiteID = DisposalSites.DisposalSiteID
GROUP BY DisposalSites.Name;


-- Average Waste Disposed Per Disposal Date
SELECT DisposalDate, AVG(QuantityKG) AS AvgDisposedKG
FROM Disposals
GROUP BY DisposalDate;

 -- Total Capacity vs Total Waste Collected by Collection Point
 SELECT CollectionPoints.Location, CollectionPoints.Capacity, SUM(Collections.QuantityKG) AS TotalCollected
FROM CollectionPoints
JOIN Collections ON CollectionPoints.CollectionPointID = Collections.CollectionPointID
GROUP BY CollectionPoints.Location, CollectionPoints.Capacity;

-- Number of Collections by Month
SELECT TO_CHAR(CollectionDate, 'YYYY-MM') AS Month, COUNT(*) AS NumberOfCollections
FROM Collections
GROUP BY TO_CHAR(CollectionDate, 'YYYY-MM')
ORDER BY Month;


SELECT  SUM(QuantityKG), COUNT(*) FROM Collections;


SELECT wt.Description,
  COUNT(*) AS OverCapacityCounts
FROM Collections c
JOIN CollectionPoints cp ON c.CollectionPointID = cp.CollectionPointID
JOIN WasteTypes wt ON c.WasteTypeID = wt.WasteTypeID
WHERE c.QuantityKG > cp.Capacity
GROUP BY wt.Description;
