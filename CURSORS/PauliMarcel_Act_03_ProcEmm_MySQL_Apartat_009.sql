USE videoclub;
DELIMITER //
DROP PROCEDURE IF EXISTS PardoJoan_Act_03_ProcEmm_MySQL_Apartat_010//
CREATE PROCEDURE PardoJoan_Act_03_ProcEmm_MySQL_Apartat_010(
 IN  pi_actor       smallint)
  BEGIN
   DECLARE pa_nomActor       varchar(30);
   DECLARE pa_edatActor      smallint;
   DECLARE pa_sexeActor      varchar(6);
   DECLARE pa_paper          varchar(50);
SELECT nom_actor, year(curdate())-anynaix_actor, sexe_actor
   INTO pa_nomActor, pa_edatActor, pa_sexeActor
FROM   ACTORS
WHERE  id_actor=pi_actor; 

IF pa_sexeActor = "home" THEN
   IF pa_edatActor<15 THEN
      SET pa_paper = "de nen";
   ELSEIF  pa_edatActor<25 THEN  /* edat>=15 AND edat<=25 /
         SET pa_paper = "d'home adolescent i jove";
   ELSEIF  pa_edatActor<40 THEN  / edat>=25 AND edat<=40 /
         SET pa_paper = "d'home adult";
   ELSEIF  pa_edatActor<60 THEN  / edat>=40 AND edat<=60 /
         SET pa_paper = "d'home madur";
   ELSEIF  pa_edatActor>=60 THEN  / edat>=40 AND edat<=60 /
         SET pa_paper = "d'home gran";
  END IF;
  SELECT concat("L'actor ", pa_nomActor, " té ", pa_edatActor , " anys i pot fer ", pa_paper, ".") AS Frase;
ELSE
   IF pa_edatActor<15 THEN
      SET pa_paper = "nena";
   ELSEIF  pa_edatActor<25 THEN  / edat>=15 AND edat<=25 /
         SET pa_paper = "dona adolescent i jove";
   ELSEIF  pa_edatActor<40 THEN  / edat>=25 AND edat<=40 /
         SET pa_paper = "dona adulta";
   ELSEIF  pa_edatActor<60 THEN  / edat>=40 AND edat<=60 /
         SET pa_paper = "dona madura";
   ELSEIF  pa_edatActor>=60 THEN  / edat>=40 AND edat<=60 */
         SET pa_paper = "dona gran";
     END IF;
    SELECT concat("L'actriu ", pa_nomActor, " té ", pa_edatActor , " anys i pot fer de ", pa_paper, ".") AS Frase;
END IF;
  END //
DELIMITER ;
