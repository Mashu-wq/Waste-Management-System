CREATE OR REPLACE PROCEDURE TotalWasteByType(p_wasteTypeID IN NUMBER) IS
    v_total_collected NUMBER;
    v_total_disposed NUMBER;
BEGIN
    SELECT SUM(QuantityKG)
    INTO v_total_collected
    FROM Collections
    WHERE WasteTypeID = p_wasteTypeID;

    SELECT SUM(QuantityKG)
    INTO v_total_disposed
    FROM Disposals
    WHERE WasteTypeID = p_wasteTypeID;

   
    DBMS_OUTPUT.PUT_LINE('Total Collected for Waste Type ' || p_wasteTypeID || ': ' || v_total_collected || ' kg');
    DBMS_OUTPUT.PUT_LINE('Total Disposed for Waste Type ' || p_wasteTypeID || ': ' || v_total_disposed || ' kg');

END;
/
BEGIN
    TotalWasteByType(1);  -- Example: Passing WasteTypeID 1
END;
/
