USE university_management_system;

-- Finding which student and professor have the most courses in common

SELECT professor_name AS "Professor Name", student_name AS "Sudent Name", COUNT(s.student_name) AS "Classes In Common"
FROM professors p
LEFT JOIN courses c
ON c.professor_id = p.professor_id
LEFT JOIN grades g
ON g.grades_course_id = c.course_id
LEFT JOIN students s
ON s.student_id = g.student_id
GROUP BY s.student_name, p.professor_name
ORDER BY COUNT(s.student_name) DESC
LIMIT 1;
