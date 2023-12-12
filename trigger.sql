--Тригер, який відслідковує модифікацію таблиці student та створює окрему таблицю student_audit, в якій відображається, яка саме була здійснена операція (INSERT, UPDATE чи DELETE), яким користувачем, та записує час, коли відбулася дана операція
DROP TABLE IF EXISTS orders_audit;
CREATE TABLE student_audit(
	id SERIAL PRIMARY KEY,
	updated TIMESTAMP,
	user_name varchar(50) NOT NULL,
	operation varchar(10) NOT NULL
);
SELECT * FROM student_audit;

--INSERT
CREATE OR REPLACE FUNCTION table_student_insert_audit() RETURNS trigger
LANGUAGE 'plpgsql'
AS $$
BEGIN
	INSERT INTO student_audit(updated, user_name, operation)
		VALUES(NOW(), user, 'INSERT');
	RETURN NULL;
END
$$ ;

CREATE TRIGGER student_insert_details
AFTER INSERT ON student
FOR EACH ROW EXECUTE FUNCTION table_student_insert_audit();

SELECT * FROM student;



--UPDATE
CREATE OR REPLACE FUNCTION table_student_update_audit() RETURNS trigger
LANGUAGE 'plpgsql'
AS $$
BEGIN
	INSERT INTO student_audit(updated, user_name, operation)
		VALUES(NOW(), user, 'UPDATE');
	RETURN NULL;
END
$$ ;

CREATE TRIGGER student_update_details
AFTER UPDATE ON student
FOR EACH ROW EXECUTE FUNCTION table_student_update_audit();



--DELETE
CREATE OR REPLACE FUNCTION table_student_delete_audit() RETURNS trigger
LANGUAGE 'plpgsql'
AS $$
BEGIN
	INSERT INTO student_audit(updated, user_name, operation)
		VALUES(NOW(), user, 'DELETE');
	RETURN NULL;
END
$$ ;


CREATE TRIGGER student_delete_details
AFTER DELETE ON student
FOR EACH ROW EXECUTE FUNCTION table_student_delete_audit();







