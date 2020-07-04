USE university_management_system;
-- The average grade that is given by each professor

SELECT 
	p.professor_name,
    g.grade_average
FROM professors p
LEFT JOIN (
		SELECT course_id, professor_id 
        FROM courses
        GROUP BY professor_id
	) as c
ON c.professor_id = p.professor_id
LEFT JOIN (
	SELECT AVG(grade_value) AS grade_average, grades_course_id
		FROM grades
		GROUP BY grades_course_id
	) AS g
ON g.grades_course_id = c.course_id;