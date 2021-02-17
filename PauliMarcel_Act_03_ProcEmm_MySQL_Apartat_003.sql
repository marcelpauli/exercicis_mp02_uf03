USE videoclub;

DELIMITER //
USE videoclub //
DROP PROCEDURE IF EXISTS Act_03_Apartat_003 //

CREATE PROCEDURE Act_03_Apartat_003(
)
  BEGIN

    SELECT  titol_peli, recaudacio_peli
    FROM PELLICULES
    WHERE  recaudacio_peli = (SELECT MAX(recaudacio_peli)
                         FROM PELLICULES);
      
  END //

DELIMITER ;

CALL Act_03_Apartat_003;