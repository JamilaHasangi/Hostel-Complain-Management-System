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


-- subWarden

DELIMITER //
CREATE PROCEDURE sp_register_subWarden(
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
    OUT userId INT -- Define an OUT parameter to return the user ID
)
BEGIN
    -- Insert a new user into the 'user' table
    INSERT INTO `user` (`first_name`, `last_name`, `email`, `password`, `nic`, `contact`, `address`, `role_id`, `faculty_id`, `created_at`, `status`)
    VALUES (firstName, lastName, emailAddress, userPassword, nicNo, contactNo, userAddress, roleId, facultyId, createdAt, userStatus);

    -- Get the last inserted user ID
    SET userId = LAST_INSERT_ID();

    -- Insert a new subWarden into the 'subWarden' table
    INSERT INTO `student` (`user_id`)
    VALUES (userId);
END //
DELIMITER ;

CALL sp_register_subWarden(
        'Jamila',
        'Hasangi',
        'jamilahasangi@example1.com',
        'password123',
        '995733110V',
        '0761864773',
        '123 Matara walgama',
        3,
        1,
        '2023-09-18 00:40:20',
        1,
        @userId
    );

-- update subWarden
DELIMITER //
CREATE PROCEDURE sp_update_subWarden(
    IN subWardenId INT,
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
    IN userStatus INT

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
    WHERE `id` = subWardenId;

END //
DELIMITER ;


-- senior student counselor register

DELIMITER //
CREATE PROCEDURE sp_register_senior_student_counselor(
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
    OUT userId INT -- Define an OUT parameter to return the user ID
)
BEGIN
    -- Insert a new user into the 'user' table
    INSERT INTO `user` (`first_name`, `last_name`, `email`, `password`, `nic`, `contact`, `address`, `role_id`, `faculty_id`, `created_at`, `status`)
    VALUES (firstName, lastName, emailAddress, userPassword, nicNo, contactNo, userAddress, roleId, facultyId, createdAt, userStatus);

    -- Get the last inserted user ID
    SET userId = LAST_INSERT_ID();

    -- Insert a new student into the 'senior_student_counselor' table
    INSERT INTO `senior_student_counselor` (`user_id`)
    VALUES (userId);
END //
DELIMITER ;

CALL sp_register_senior_student_counselor(
        'Malsha',
        'Prabuddhi',
        'malsha@gmail.com',
        'password123',
        '1978567812V',
        '0744567899',
        '145 Main St',
        5,
        1,
        '2023-09-18 00:40:20',
        1,
        @userId
    );



-- senior student counselor updated

DELIMITER //
CREATE PROCEDURE sp_update_senior_student_counselor(
    IN sscId INT,
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
    IN userStatus INT
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
    WHERE `id` = sscId;


END //
DELIMITER ;



-- senior student counselor deleted

DELIMITER //
CREATE PROCEDURE sp_remove_senior_student_counselor(
    IN sscId INT

)
BEGIN
    -- delete senior student counselor informations
    DELETE FROM `senior_student_counselor` WHERE `user_id` = sscId;

    -- delete user informations
    DELETE FROM `user` WHERE `id` = sscId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_remove_subWarden(
    IN subWardenId INT

)
BEGIN
    -- delete subWarden information
    DELETE FROM `sub_warden` WHERE `user_id` = subWardenId;

    -- delete user information
    DELETE FROM `user` WHERE `id` = subWardenId;
END //
DELIMITER ;


-- dean

DELIMITER //
CREATE PROCEDURE sp_register_dean(
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
    OUT userId INT -- Define an OUT parameter to return the user ID
)
BEGIN
    -- Insert a new user into the 'user' table
    INSERT INTO `user` (`first_name`, `last_name`, `email`, `password`, `nic`, `contact`, `address`, `role_id`, `faculty_id`, `created_at`, `status`)
    VALUES (firstName, lastName, emailAddress, userPassword, nicNo, contactNo, userAddress, roleId, facultyId, createdAt, userStatus);

    -- Get the last inserted user ID
    SET userId = LAST_INSERT_ID();

    -- Insert a new dean into the 'dean' table
    INSERT INTO `dean` (`user_id`)
    VALUES (userId);
END //
DELIMITER ;

CALL sp_register_dean(
        'Subash',
        'Jayasingha',
        'subashjayasingha@example2.com',
        'password123',
        '665739810V',
        '0714564773',
        '103 Galle Karapitiya',
        2,
        1,
        '2023-09-18 00:40:20',
        1,
        @userId
    );

-- update dean
DELIMITER //
CREATE PROCEDURE sp_update_dean(
    IN deanId INT,
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
    IN userStatus INT

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
    WHERE `id` = deanId;

END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE sp_remove_dean(
    IN deanId INT

)
BEGIN
    -- delete subWarden information
    DELETE FROM `dean` WHERE `user_id` = deanId;

    -- delete user information
    DELETE FROM `user` WHERE `id` = deanId;
END //
DELIMITER ;


-- room

DELIMITER //
CREATE PROCEDURE sp_add_room(
    IN roomFloorId INT,
    IN roomStudentCount INT,
    IN roomNo INT
)
BEGIN
    -- Insert a new details into the 'room' table
    INSERT INTO `room` (`floor_id`, `no_of_students`, `room_no`)
    VALUES (roomFloorId,roomStudentCount,roomNo);

END //
DELIMITER ;

CALL sp_add_room(
        '1',
        '04',
        '203'

    );

-- report
DELIMITER //
CREATE PROCEDURE sp_add_report(
    IN reportContent VARCHAR(255),
    IN reportDateTime DATETIME(6),
    IN userId BIGINT
)
BEGIN
    DECLARE userExists INT;

    SELECT COUNT(*) INTO userExists FROM user WHERE id = userId;

    IF userExists > 0 THEN
        INSERT INTO report (content, date_time, user_id)
        VALUES (reportContent, reportDateTime, userId);
        SELECT 'Report added successfully.' AS Status;
    ELSE
        SELECT 'Invalid user_id. Report not added.' AS Status;
    END IF;
END //
DELIMITER ;

CALL sp_add_report(
        'complain Number 01',
        '2023-10-26 14:30:00.000000',
        1
    );



