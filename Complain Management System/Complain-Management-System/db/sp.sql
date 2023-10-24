DROP PROCEDURE IF EXISTS sp_register_student;

DELIMITER //
CREATE PROCEDURE sp_register_student(
    IN firstName VARCHAR(255),
    IN lastName VARCHAR(255),
    IN emailAddress VARCHAR(100),
    IN userPassword VARCHAR(255),
    IN nicNo VARCHAR(12),
    IN contactNo VARCHAR(20),
    IN userAddress VARCHAR(255),
    IN roleId INT,
    IN facultyId INT,
    IN createdAt DATETIME,
    IN userStatus INT,
    IN studentRegNo VARCHAR(20),
    IN roomId INT,
    OUT userId INT -- Define an OUT parameter to return the user ID
)
BEGIN
    -- Insert a new user into the 'user' table
    INSERT INTO `user` (`first_name`, `last_name`, `email`, `password`, `nic`, `contact`, `address`, `role_id`, `faculty_id`, `created_at`, `status`)
    VALUES (firstName, lastName, emailAddress, userPassword, nicNo, contactNo, userAddress, roleId, facultyId, createdAt, userStatus);

    -- Get the last inserted user ID
    SET userId = LAST_INSERT_ID();

    -- Insert a new student into the 'student' table
    INSERT INTO `student` (`user_id`, `registration_no`, `room_id`)
    VALUES (userId, studentRegNo, roomId);
END //
DELIMITER ;

CALL sp_register_student(
        'John',
        'Doe',
        'johndoe@example2.com',
        'password123',
        '1234567812V',
        '0774567890',
        '123 Main St',
        1,
        1,
        '2023-09-18 00:40:20',
        1,
        'S12346',
        1,
        @userId
    );

-- update student
DELIMITER //
CREATE PROCEDURE sp_update_student(
    IN studentId INT,
    IN firstName VARCHAR(255),
    IN lastName VARCHAR(255),
    IN emailAddress VARCHAR(100),
    IN userPassword VARCHAR(255),
    IN nicNo VARCHAR(12),
    IN contactNo VARCHAR(20),
    IN userAddress VARCHAR(255),
    IN roleId INT,
    IN facultyId INT,
    IN updatedAt DATETIME,
    IN userStatus INT,
    IN studentRegNo VARCHAR(20),
    IN roomId INT
)
BEGIN
    -- Update user information
    UPDATE `user` SET `first_name`= firstName,
                      `last_name`= lastName,
                      `email`= emailAddress,
                      `password`= userPassword,
                      `nic`= nicNo,
                      `contact`= contactNo,
                      `address`= userAddress,
                      `role_id`= roleId,
                      `faculty_id`= facultyId,
                      `updated_at`= updatedAt,
                      `status`= userStatus
    WHERE `id` = studentId;

    -- Update user information
    UPDATE `student` SET `registration_no` = studentRegNo,
                         `room_id` = roomId
    WHERE `user_id` = studentId;

END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE sp_remove_student(
    IN studentId INT

)
BEGIN
    -- delete student informations
   DELETE FROM `student` WHERE `user_id` = studentId;

    -- delete user informations
    DELETE FROM `user` WHERE `id` = studentId;
END //
DELIMITER ;


-- asset

DELIMITER //
CREATE PROCEDURE sp_add_asset(
    IN assetCondition VARCHAR(255),
    IN assetDescription VARCHAR(255),
    IN assetName VARCHAR(100),
    IN assetQuantity INT
)
BEGIN
    -- Insert a new asset into the 'asset' table
    INSERT INTO `asset` (`asset_condition`, `description`, `name`, `quantity`)
    VALUES (assetCondition, assetDescription, assetName, assetQuantity);

END //
DELIMITER ;

CALL sp_add_asset(
        'Broken',
        'Two Tables are broken',
        'Table',
        '2'
    );






DELIMITER //
CREATE PROCEDURE sp_update_asset(
    IN assetId INT,
    IN assetCondition VARCHAR(255),
    IN assetDescription VARCHAR(255),
    IN AssetName VARCHAR(100),
    IN assetQuantity INT
)
BEGIN
    -- Update asset information
    UPDATE `asset` SET `asset_condition`= assetCondition,
                  `description`= assetDescription,
                  `name`= AssetName,
                  `quantity`= assetQuantity
    WHERE `id` = assetId;

END //
DELIMITER ;



