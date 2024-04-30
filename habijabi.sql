SELECT * FROM Collections WHERE QuantityKG > 500;

SELECT CollectionPointID, SUM(QuantityKG) AS TotalCollected
FROM Collections
GROUP BY CollectionPointID
HAVING SUM(QuantityKG) > 2000;

SELECT * FROM CollectionPoints WHERE CollectionPointID IN (SELECT CollectionPointID FROM Collections WHERE QuantityKG > 1000);


SELECT * FROM Collections WHERE WasteTypeID = 1 AND (CollectionPointID = 1 OR CollectionPointID = 2);

SELECT * FROM DisposalSites WHERE Name LIKE '%B%';