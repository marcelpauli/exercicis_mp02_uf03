
DELIMITER //
USE videoclub //
DROP PROCEDURE IF EXISTS Act_03_Apartat_004 //

CREATE PROCEDURE Act_03_Apartat_004(
  IN c_peli smallint
)
  BEGIN

    SELECT  id_actor
    FROM ACTORS_PELLICULES
    WHERE  principal = 1 AND id_peli = c_peli; 
      
  END //

DELIMITER ;

CALL Act_03_Apartat_004(2);