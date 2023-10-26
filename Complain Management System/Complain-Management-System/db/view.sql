CREATE OR REPLACE view view_student_info AS
SELECT u.first_name,
       u.last_name,
       u.email,
       u.nic,
       u.contact,
       u.address,
       u.role_id,
       u.faculty_id,
       u.created_at,
       u.updated_at,
       u.status,
       s.registration_no,
       s.room_id
FROM hcms.`user` u,hcms.`student` s
WHERE u.id = s.user_id AND u.role_id = 1;

-- dean information
CREATE OR REPLACE view view_dean_info AS
SELECT u.first_name,
       u.last_name,
       u.email,
       u.nic,
       u.contact,
       u.address,
       u.role_id,
       u.faculty_id,
       u.created_at,
       u.updated_at,
       u.status,
       d.user_id
FROM hcms.`user` u,hcms.`dean` d
WHERE u.id = d.user_id AND u.role_id = 2;

-- senior student counselor information
CREATE OR REPLACE view view_senior_student_counselor_info AS
SELECT u.first_name,
       u.last_name,
       u.email,
       u.nic,
       u.contact,
       u.address,
       u.role_id,
       u.faculty_id,
       u.created_at,
       u.updated_at,
       u.status,
       ss.user_id
FROM hcms.`user` u,hcms.`senior_student_counselor` ss
WHERE u.id = ss.user_id AND u.role_id = 5;

-- sub warden information
CREATE OR REPLACE view view_sub_warden_info AS
SELECT u.first_name,
       u.last_name,
       u.email,
       u.nic,
       u.contact,
       u.address,
       u.role_id,
       u.faculty_id,
       u.created_at,
       u.updated_at,
       u.status,
       sw.user_id
FROM hcms.`user` u,hcms.`sub_warden` sw
WHERE u.id = sw.user_id AND u.role_id = 3;


-- academic warden information
CREATE OR REPLACE view view_academic_warden_info AS
SELECT u.first_name,
       u.last_name,
       u.email,
       u.nic,
       u.contact,
       u.address,
       u.role_id,
       u.faculty_id,
       u.created_at,
       u.updated_at,
       u.status,
       aw.id
FROM hcms.`user` u,hcms.`academic_warden` aw
WHERE u.id = aw.id AND u.role_id = 4;
