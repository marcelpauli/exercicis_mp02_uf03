USE videoclub;
DROP PROCEDURE IF EXISTS act9;
DELIMITER //
CREATE PROCEDURE act9()
BEGIN
   DECLARE edat bigint;
   DECLARE nom varchar(30);
   DECLARE sexe varchar(6);
   DECLARE final int default false;
   DECLARE tipusDePaper varchar(6);
   DECLARE elcursor cursor FOR
      SELECT ACTORS.sexe_actor, YEAR(CURDATE())-ACTORS.anynaix_actor, ACTORS.nom_actor
   FROM ACTORS;

   DECLARE CONTINUE handler for NOT found SET final = 1;
   OPEN elcursor;
   elbucle:LOOP
      FETCH elcursor INTO sexe, edat, nom;

      IF final = 1 THEN
         leave elbucle;
      END IF;

      IF edat < 15 THEN
    SET tipusDePaper ="nen";
    ELSEIF edat > 15 AND edat < 25 THEN
    SET tipusDePaper ="jove";
    ELSEIF edat > 26 AND edat < 40 THEN
    SET tipusDePaper ="adult";
    ELSEIF edat > 41 AND edat < 60 THEN
    SET tipusDePaper ="madur";
    ELSEIF edat > 61 THEN
    SET tipusDePaper ="gran";
    END IF;

    SELECT nom, sexe, edat, tipusDePaper;

   END LOOP elbucle; 
   CLOSE elcursor;
END//

DELIMITER ;

call act9();
