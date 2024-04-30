DECLARE
    CURSOR c_environmental_impact IS
        SELECT ds.Name, SUM(ei.CarbonSavedKG) AS TotalCarbonSaved, SUM(ei.WasteReducedKG) AS TotalWasteReduced
        FROM EnvironmentalImpacts ei
        JOIN Disposals d ON ei.DisposalID = d.DisposalID
        JOIN DisposalSites ds ON d.DisposalSiteID = ds.DisposalSiteID
        GROUP BY ds.Name
        ORDER BY ds.Name;

    v_site_name VARCHAR2(255);
    v_total_carbon_saved NUMBER;
    v_total_waste_reduced NUMBER;
BEGIN
    OPEN c_environmental_impact;
    LOOP
        FETCH c_environmental_impact INTO v_site_name, v_total_carbon_saved, v_total_waste_reduced;
        EXIT WHEN c_environmental_impact%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Site: ' || v_site_name || ', Total Carbon Saved: ' || v_total_carbon_saved || ' kg, Total Waste Reduced: ' || v_total_waste_reduced || ' kg');
    END LOOP;
    CLOSE c_environmental_impact;
END;
/
