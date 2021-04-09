DELIMITER //
USE videoclub //
DROP PROCEDURE IF EXISTS Act_03_Apartat_002 //
CREATE PROCEDURE Act_03_Apartat_002(
)
  BEGIN
    DECLARE codi_pe smallint unsigned;
    SELECT id_peli
      INTO @codi_pe
    FROM PELLICULES
    WHERE  recaudacio_peli = (SELECT MAX(recaudacio_peli)
                         FROM PELLICULES);   
  END //

DELIMITER ;
CALL Act_03_Apartat_002;
SELECT @codipe;
