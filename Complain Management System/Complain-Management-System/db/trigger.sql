DROP TRIGGER IF EXISTS trigger_after_complaint_insert;

DELIMITER //

CREATE TRIGGER trigger_after_complaint_insert
    AFTER INSERT ON complaint
    FOR EACH ROW
BEGIN
    DECLARE userName VARCHAR(255);
    DECLARE assetName VARCHAR(255);
    DECLARE logType VARCHAR(50);
    DECLARE operation VARCHAR(50);
    DECLARE logDescription VARCHAR(255);

    SELECT u.first_name INTO userName FROM user u WHERE u.id = NEW.user_id;
    SELECT a.name INTO assetName FROM asset a WHERE a.id = NEW.asset_id;

    SET logType = 'Complaint';
    SET operation = 'Insert';
    SET logDescription = CONCAT('Complaint updated for user ', userName, ' regarding asset ', assetName);

    CALL sp_insert_action_log(logDescription, logType, operation);
END//
DELIMITER ;