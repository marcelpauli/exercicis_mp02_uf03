  DELIMITER //
  USE videoclub//
  DROP PROCEDURE IF EXISTS Act_03_Apartat_006 //
  CREATE PROCEDURE Act_03_Apartat_006 (
    IN pi_peli smallint unsigned,
    OUT nivell varchar(20)
  )
  BEGIN
    DECLARE varReca bigint unsigned;
    DECLARE varPres bigint unsigned;
    DECLARE titolpeli varchar(40);
    SELECT recaudacio_peli, pressupost_peli, titol_peli
      INTO varReca, varPres, @titolpeli
    FROM PELLICULES
    WHERE id_peli=pi_peli;
    IF varReca < varPres THEN
      SET nivell = "Deficitari";
    ELSEIF varReca < varPres*2 THEN
      SET nivell = "Suficient";
    ELSEIF varReca*2 > varPres THEN
      SET nivell = "Bona";
    END IF;
    SELECT @nivell, @titolpeli;
  END//
  DELIMITER ;
  CALL Act_03_Apartat_006(3, @nivell);