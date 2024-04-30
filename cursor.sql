-- traverse all records in the Collections table
DECLARE
  CURSOR c_collections IS SELECT * FROM Collections;
  v_collections_count NUMBER := 0;
BEGIN
  FOR v_record IN c_collections LOOP
    v_collections_count := v_collections_count + 1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Total collections: ' || v_collections_count);
END;