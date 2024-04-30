DECLARE
    CURSOR c_waste_details IS
        SELECT cp.Location, wt.Description AS WasteType, c.QuantityKG
        FROM Collections c
        JOIN CollectionPoints cp ON c.CollectionPointID = cp.CollectionPointID
        JOIN WasteTypes wt ON c.WasteTypeID = wt.WasteTypeID
        ORDER BY cp.Location, wt.Description;

    v_location VARCHAR2(255);
    v_waste_type VARCHAR2(100);
    v_quantity_kg NUMBER;
BEGIN
    OPEN c_waste_details;
    LOOP
        FETCH c_waste_details INTO v_location, v_waste_type, v_quantity_kg;
        EXIT WHEN c_waste_details%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Location: ' || v_location || ', Waste Type: ' || v_waste_type || ', Quantity: ' || v_quantity_kg || ' kg');
    END LOOP;
    CLOSE c_waste_details;
END;
/
