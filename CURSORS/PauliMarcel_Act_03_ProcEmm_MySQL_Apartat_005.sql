DELIMITER //
USE videoclub //
DROP PROCEDURE IF EXISTS Act_03_Apartat_005 //
CREATE PROCEDURE Act_03_Apartat_005(
  IN c_peli smallint
)
  BEGIN
    DECLARE nomactor varchar(30);
    DECLARE edatactor smallint unsigned;
    SELECT  nom_actor, YEAR(CURDATE())-anynaix_actor
      INTO @nomactor, @edatactor
    FROM  ACTORS
    INNER  JOIN ACTORS_PELLICULES
     ON  ACTORS.id_actor = ACTORS_PELLICULES.id_actor
    WHERE  principal = 1 AND ACTORS_PELLICULES.id_peli = c_peli;      
  END //
DELIMITER ;
CALL Act_03_Apartat_005(2);
SELECT @nomactor, @edatactor;
