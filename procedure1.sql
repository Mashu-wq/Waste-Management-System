CREATE OR REPLACE PROCEDURE MonthlyWasteSummary IS
    
    CURSOR c_monthly_totals IS
        SELECT TO_CHAR(c.CollectionDate, 'YYYY-MM') AS Month,
               SUM(c.QuantityKG) AS TotalCollected,
               (SELECT SUM(d.QuantityKG)
                FROM Disposals d
                WHERE TO_CHAR(d.DisposalDate, 'YYYY-MM') = TO_CHAR(c.CollectionDate, 'YYYY-MM')) AS TotalDisposed
        FROM Collections c
        GROUP BY TO_CHAR(c.CollectionDate, 'YYYY-MM')
        ORDER BY TO_CHAR(c.CollectionDate, 'YYYY-MM');
        
    v_month VARCHAR2(7);
    v_total_collected NUMBER;
    v_total_disposed NUMBER;
BEGIN
   
FOR r_monthly_totals IN c_monthly_totals LOOP

        v_month := r_monthly_totals.Month;
        v_total_collected := r_monthly_totals.TotalCollected;
        v_total_disposed := r_monthly_totals.TotalDisposed;

      
        DBMS_OUTPUT.PUT_LINE('Month: ' || v_month || 
                             ', Total Collected: ' || v_total_collected || 
                             'kg, Total Disposed: ' || v_total_disposed || 'kg');
    END LOOP;
END;


BEGIN
    MonthlyWasteSummary;
END;
/
