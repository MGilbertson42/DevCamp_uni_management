USE university_management_system;

-- Group students by the courses that they are enrolled in

SELECT 
	c.course_name AS "Course Name",
    COALESCE(g.enrollment_numbers) AS "Enrollment Stats"
FROM courses c
LEFT JOIN (
	SELECT COUNT(student_id) AS enrollment_numbers, grades_course_id
    FROM grades
    GROUP BY grades_course_id
) AS g
ON g.grades_course_id = c.course_id
ORDER BY g.enrollment_numbers DESC;