--Перевірка роботи функції
SELECT remove_students();
--Перевірка, що з таблиць Students та Results видалились всі студенти та студентки, які задли хоча б один тест на менше ніж 60 балів
SELECT * FROM student ORDER BY student_id;

--Перевірка роботи процедури
call get_math_score(1)

--Перевірка роботи тригера
--Додавання нового студента (з Id=11) таблиці Student
INSERT INTO Student(Student_ID, Gender, Ethnicity) VALUES(11, 'male', 'group E');
SELECT * FROM student_audit;
SELECT * FROM student ORDER BY student_id;
--Оновлення даних студента з Id=11 таблиці Student
UPDATE student SET Ethnicity = 'group A' WHERE student_id = 11;
SELECT * FROM student_audit;
SELECT * FROM student ORDER BY student_id;
--Видалення студента з Id=11 з таблиці Student
DELETE FROM student WHERE student_id=11;
SELECT * FROM student_audit;
SELECT * FROM student ORDER BY student_id;
