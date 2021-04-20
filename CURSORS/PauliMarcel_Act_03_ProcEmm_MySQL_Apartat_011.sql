USE videoclub;
DROP FUNCTION IF EXISTS act_11;

DELIMITER //
CREATE FUNCTION act_11(cPeli SMALLINT UNSIGNED) 
       RETURNS SMALLINT UNSIGNED
       DETERMINISTIC
BEGIN
   DECLARE visualitzacions SMALLINT UNSIGNED;

   SELECT   COUNT(*)
        INTO visualitzacions
   FROM  VISUALITZACIONS
   WHERE id_peli = cPeli;
   RETURN visualitzacions;
END//
DELIMITER ;

SELECT  titol_peli, act_11(3) "visualitzacions"
FROM    PELLICULES
WHERE   id_peli = 3;