USE university_management_system;

-- The top grades for each student

SELECT student_name, highest_grade
FROM students s
LEFT JOIN (
	SELECT MAX(grade_value) AS highest_grade, student_id
    FROM grades g
    GROUP BY student_id
) AS g
ON g.student_id = s.student_id;