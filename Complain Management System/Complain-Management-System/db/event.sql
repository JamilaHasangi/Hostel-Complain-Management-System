-- reports
DROP EVENT IF EXISTS event_generate_daily_report;

DELIMITER //
CREATE EVENT event_generate_daily_report
    ON SCHEDULE EVERY 1 DAY
        STARTS CONCAT(DATE(NOW()), ' 23:55:00')
    ON COMPLETION PRESERVE
    DO
    BEGIN
        CALL sp_generate_daily_reports();
    END;
//
DELIMITER ;


DROP EVENT IF EXISTS event_generate_monthly_report;

DELIMITER //
CREATE EVENT event_generate_monthly_report
    ON SCHEDULE EVERY 1 MONTH
        STARTS CONCAT(DATE(NOW()), ' 23:55:00')
    ON COMPLETION PRESERVE
    DO
BEGIN
CALL sp_generate_monthly_reports();
END;
//
DELIMITER ;