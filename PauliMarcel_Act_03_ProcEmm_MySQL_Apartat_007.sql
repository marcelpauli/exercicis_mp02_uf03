  DELIMITER //
  USE videoclub//
  DROP PROCEDURE IF EXISTS Act_03_Apartat_007 //
  CREATE PROCEDURE Act_03_Apartat_007 (
    IN pi_actor smallint unsigned,
    OUT estat varchar(60)
  )
  BEGIN
    DECLARE nomactor varchar(40);
    DECLARE sexea varchar(4);
    DECLARE any smallint unsigned;
    SELECT nom_actor, sexe_actor, YEAR(CURDATE())-anynaix_actor
      INTO @nomactor, @sexea, @any
    FROM ACTORS
    WHERE id_actor=pi_actor;
    IF any < 15 THEN
      SET estat = "nen";
    ELSEIF any >= 15  AND any <= 25 THEN
      SET estat = "home adolescent i jove";
    ELSEIF any >= 26  AND any <= 40 THEN
      SET estat = "home adult";
    ELSEIF any >= 41  AND any <= 60 THEN
      SET estat = "home madur";  
    ELSEIF any > 61 THEN
      SET estat = "home gran";    
    END IF;

    SELECT @estat, @any, @nomactor, @sexea ;
  END//
  DELIMITER ;
  CALL Act_03_Apartat_007(3, @estat);