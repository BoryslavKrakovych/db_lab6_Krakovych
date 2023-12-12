--Функція, що видаляє студентів та студенток з таблиць Student і Results, які здали хоча б один тест на менше 60 балів
DROP FUNCTION IF EXISTS remove_students();
CREATE OR REPLACE FUNCTION remove_students() RETURNS void
LANGUAGE 'plpgsql'
AS $$
BEGIN 
    DELETE FROM results
	WHERE student_id IN 
		(SELECT DISTINCT (student_id) FROM results WHERE score<60 ORDER BY student_id);
    DELETE FROM student
    WHERE student_id NOT IN (SELECT student_id FROM results);	
END;
$$;
