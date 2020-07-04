USE university_management_system;

-- Create a summary report of courses and their average grades, sorted by the most challenging course (course with the lowest average grade) to the easiest course

SELECT c.course_name, average_grade
FROM courses c
LEFT JOIN (
	SELECT AVG(grade_value) AS average_grade, grades_course_id
    FROM grades
    GROUP BY grades_course_id
) AS g
ON g.grades_course_id = c.course_id
ORDER BY average_grade ASC;