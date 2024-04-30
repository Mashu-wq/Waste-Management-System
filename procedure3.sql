CREATE OR REPLACE PROCEDURE EnvironmentalImpactBySite(p_disposalSiteID IN NUMBER) IS
    v_carbon_saved NUMBER;
    v_waste_reduced NUMBER;
BEGIN
    -- Calculate the sum of carbon saved and waste reduced for the specified disposal site
    SELECT SUM(CarbonSavedKG), SUM(WasteReducedKG)
    INTO v_carbon_saved, v_waste_reduced
    FROM EnvironmentalImpacts
    JOIN Disposals ON EnvironmentalImpacts.DisposalID = Disposals.DisposalID
    WHERE Disposals.DisposalSiteID = p_disposalSiteID;

    -- Output the results
    DBMS_OUTPUT.PUT_LINE('Environmental Impact for Disposal Site ' || p_disposalSiteID || ':');
    DBMS_OUTPUT.PUT_LINE('Total Carbon Saved: ' || v_carbon_saved || ' kg');
    DBMS_OUTPUT.PUT_LINE('Total Waste Reduced: ' || v_waste_reduced || ' kg');
END;
/

BEGIN
    EnvironmentalImpactBySite(1);  -- Example: Passing DisposalSiteID 1
END;
/

