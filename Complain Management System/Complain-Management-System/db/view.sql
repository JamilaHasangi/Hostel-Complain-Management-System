---create view for student
CREATE OR REPLACE view view_student_info AS
SELECT u.first_name,
       u.last_name,
       u.email,
       u.nic,
       u.contact,
       u.address,
       ur.name AS role_name,
       f.name AS faculty_name,
       u.created_at,
       u.updated_at,
       u.status,
       s.registration_no,
       r.room_no
FROM hcms.`user` u,hcms.`student` s, hcms.`user_role` ur, hcms.`room` r, hcms.`faculty` f
WHERE u.id = s.user_id AND u.role_id = 1 AND u.role_id = ur.id AND s.room_id = r.id AND u.faculty_id = f.id;

-- dean information
CREATE OR REPLACE view view_dean_info AS
SELECT u.first_name,
       u.last_name,
       u.email,
       u.nic,
       u.contact,
       u.address,
       ur.name AS role_name,
       f.name AS faculty_name,
       u.created_at,
       u.updated_at,
       u.status,
       d.user_id
FROM hcms.`user` u,hcms.`dean` d, hcms.`user_role` ur, hcms.`faculty` f
WHERE u.id = d.user_id AND u.role_id = 2 AND u.role_id = ur.id AND u.faculty_id = f.id;

---create view for complaint
CREATE OR REPLACE view view_complaint_info AS
SELECT u.first_name,
       u.last_name,
       ur.name AS role_name,
       f.name AS faculty_name,
       u.created_at,
       u.updated_at,
       a.name AS asset_name,
       cp.description,
       cp.submission_date,
       cp.is_resolved,
       cp.quantity,
       cp.status
FROM hcms.`user` u,hcms.`complaint` cp, hcms.`user_role` ur, hcms.`faculty` f, hcms.`asset` a
WHERE u.id = cp.user_id AND u.role_id = ur.id AND u.faculty_id = f.id AND cp.asset_id = a.id;


-- senior student counselor information
CREATE OR REPLACE view view_senior_student_counselor_info AS
SELECT u.first_name,
       u.last_name,
       u.email,
       u.nic,
       u.contact,
       u.address,
       ur.name AS role_name,
       f.name AS faculty_name,
       u.created_at,
       u.updated_at,
       u.status,
       ss.user_id
FROM hcms.`user` u,hcms.`senior_student_counselor` ss, hcms.`user_role` ur, hcms.`faculty` f
WHERE u.id = ss.user_id AND u.role_id = 5 AND u.role_id = ur.id AND u.faculty_id = f.id;

-- sub warden information
CREATE OR REPLACE view view_sub_warden_info AS
SELECT u.first_name,
       u.last_name,
       u.email,
       u.nic,
       u.contact,
       u.address,
       ur.name AS role_name,
       f.name AS faculty_name,
       u.created_at,
       u.updated_at,
       u.status,
       sw.user_id
FROM hcms.`user` u,hcms.`sub_warden` sw, hcms.`user_role` ur, hcms.`faculty` f
WHERE u.id = sw.user_id AND u.role_id = 3 AND u.role_id = ur.id AND u.faculty_id = f.id;


-- academic warden information
CREATE OR REPLACE view view_academic_warden_info AS
SELECT u.first_name,
       u.last_name,
       u.email,
       u.nic,
       u.contact,
       u.address,
       ur.name AS role_name,
       f.name AS faculty_name,
       u.created_at,
       u.updated_at,
       u.status,
       aw.id
FROM hcms.`user` u,hcms.`academic_warden` aw, hcms.`user_role` ur, hcms.`faculty` f
WHERE u.id = aw.id AND u.role_id = 4 AND u.role_id = ur.id AND u.faculty_id = f.id;


-- create view for report
CREATE OR REPLACE view view_report_info AS
SELECT u.first_name,
       u.last_name,
       ur.name AS role_name,
       r.content,
       r.date_time
FROM hcms.`user` u,hcms.`report` r, hcms.`user_role` ur
WHERE u.id = r.user_id AND u.role_id = ur.id;

