-- ============================================
-- 1.3 STORED LOGIC (Triggers, Views, Procedures)
-- ============================================

-- TRIGGER: Validate Start_Date and End_Date
DELIMITER $$

CREATE TRIGGER trg_validate_disaster_dates
BEFORE INSERT ON disaster_event
FOR EACH ROW
BEGIN
    IF NEW.Start_Date > NEW.End_Date THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Start_Date cannot be later than End_Date.';
    END IF;
END$$

DELIMITER ;



-- ============================================
-- VIEW 1: Disaster Summary
-- ============================================

CREATE VIEW view_disaster_summary AS
SELECT 
    de.Event_ID,
    ht.Name AS Hazard_Type,
    b.Barangay_Name,
    de.Start_Date,
    de.End_Date,
    de.Severity_Scale,
    de.Description
FROM disaster_event de
JOIN hazard_type ht ON de.Hazard_Type_ID = ht.Hazard_Type_ID
JOIN barangay b ON de.Barangay_ID = b.Barangay_ID;



-- ============================================
-- VIEW 2: Total Losses Per Event
-- ============================================

CREATE VIEW view_total_losses_per_event AS
SELECT 
    de.Event_ID,
    ht.Name AS Hazard_Type,
    COALESCE(SUM(ia.Estimated_Loss_Value), 0) AS Total_Loss
FROM disaster_event de
LEFT JOIN impacted_asset ia ON de.Event_ID = ia.Event_ID
JOIN hazard_type ht ON de.Hazard_Type_ID = ht.Hazard_Type_ID
GROUP BY de.Event_ID, ht.Name;



-- ============================================
-- STORED PROCEDURE (ACID Transaction)
-- ============================================

DELIMITER $$

CREATE PROCEDURE sp_add_disaster_with_human_impact(
    IN p_Event_ID INT,
    IN p_Hazard_Type_ID INT,
    IN p_Barangay_ID INT,
    IN p_Start DATE,
    IN p_End DATE,
    IN p_Severity INT,
    IN p_Description VARCHAR(255),

    IN p_Human_Impact_ID INT,
    IN p_Segment_ID INT,
    IN p_Deaths INT,
    IN p_Injuries INT,
    IN p_Affected INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Transaction failed and was rolled back.';
    END;

    START TRANSACTION;

    INSERT INTO disaster_event
    (Event_ID, Hazard_Type_ID, Barangay_ID, Start_Date, End_Date, Severity_Scale, Description)
    VALUES
    (p_Event_ID, p_Hazard_Type_ID, p_Barangay_ID, p_Start_Date, p_End_Date, p_Severity, p_Description);

    INSERT INTO human_impact
    (Human_Impact_ID, Event_ID, Segment_ID, Deaths_Count, Injuries_Count, People_Affected_Count)
    VALUES
    (p_Human_Impact_ID, p_Event_ID, p_Segment_ID, p_Deaths, p_Injuries, p_Affected);

    COMMIT;
END$$

DELIMITER ;
