-- using inner join
SELECT c.*, wt.Description FROM Collections c JOIN WasteTypes wt ON c.WasteTypeID = wt.WasteTypeID;

-- using left join
SELECT cp.*, c.CollectionID FROM CollectionPoints cp LEFT JOIN Collections c ON cp.CollectionPointID = c.CollectionPointID;

-- using right join
SELECT d.*, ds.Name FROM Disposals d RIGHT JOIN DisposalSites ds ON d.DisposalSiteID = ds.DisposalSiteID;

-- using full join
SELECT c.CollectionID, d.DisposalID FROM Collections c FULL OUTER JOIN Disposals d ON c.WasteTypeID = d.WasteTypeID;

-- using natural join
SELECT ds.Name, SUM(d.QuantityKG) AS TotalDisposed
FROM Disposals d
JOIN DisposalSites ds ON d.DisposalSiteID = ds.DisposalSiteID
GROUP BY ds.Name, ds.Capacity
HAVING SUM(d.QuantityKG) > ds.Capacity * 0.8;


SELECT wt.Description, AVG(d.DisposalDate - c.CollectionDate) AS AvgDays
FROM Collections c
JOIN Disposals d ON c.WasteTypeID = d.WasteTypeID
JOIN WasteTypes wt ON c.WasteTypeID = wt.WasteTypeID
GROUP BY wt.Description;

