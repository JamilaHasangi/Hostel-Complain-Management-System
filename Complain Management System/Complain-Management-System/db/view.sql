---create view for student
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

---create view for complaint
CREATE OR REPLACE view view_complaint_info AS
SELECT u.first_name,
       u.last_name,
       u.role_id,
       u.faculty_id,
       u.created_at,
       u.updated_at,
       cp.asset_id,
       cp.user_id,
       cp.description,
       cp.submission_date,
       cp. is_resolved,
       cp. quantity
FROM hcms.`user` u,hcms.`complaint` cp
WHERE u.id = cp.id ;

----create view for report
CREATE OR REPLACE view view_complaint_info AS
SELECT u.first_name,
       u.last_name,
       u.role_id,
       r.content,
       r.date_time
FROM hcms.`user` u,hcms.`report` r
WHERE u.id = r.user_id ;