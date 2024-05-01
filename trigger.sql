CREATE OR REPLACE TRIGGER UpdateCollectionCapacity
AFTER INSERT ON Collections
FOR EACH ROW
BEGIN
  UPDATE CollectionPoints
  SET Capacity = Capacity - :NEW.QuantityKG
  WHERE CollectionPointID = :NEW.CollectionPointID;
END;
/


CREATE OR REPLACE TRIGGER CheckDisposalCapacity
BEFORE INSERT ON Disposals
FOR EACH ROW
DECLARE
  v_capacity NUMBER;
BEGIN
  SELECT Capacity INTO v_capacity FROM DisposalSites
  WHERE DisposalSiteID = :NEW.DisposalSiteID;
  
  IF :NEW.QuantityKG > v_capacity THEN
    RAISE_APPLICATION_ERROR(-20001, 'Disposal quantity exceeds site capacity');
  END IF;
END;
/
