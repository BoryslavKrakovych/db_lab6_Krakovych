--Процедура get_math_score(studentID_arg), яка видає результати тесту з математики для кожного студента з введеним id
DROP PROCEDURE IF EXISTS get_math_score(integer);
CREATE OR REPLACE PROCEDURE get_math_score(studentID_arg integer)
LANGUAGE plpgsql
AS $$
DECLARE record_score results.score%TYPE;
BEGIN
     SELECT score INTO record_score 
     FROM results WHERE student_ID = studentID_arg AND test_id=1;
RAISE INFO 'Math_score: %',record_score;
END;
$$;

