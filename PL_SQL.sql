-- calculate the average quantity of waste collected as recorded in the Collections table
DECLARE
    v_average NUMBER;
BEGIN
    SELECT AVG(QuantityKG) INTO v_average FROM Collections;
    DBMS_OUTPUT.PUT_LINE('Average Quantity of Waste Collected: ' || TO_CHAR(v_average, '9990.99') || ' kg');
END;


