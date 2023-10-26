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
