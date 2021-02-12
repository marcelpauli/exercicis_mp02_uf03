
USE videoclub;

DELIMITER //
 
DROP PROCEDURE IF EXISTS sp08_comptaPelisPerActors //
 
CREATE PROCEDURE sp08_comptaPelisPerActors(
    IN pi_sexeactor varchar(4)
) 
BEGIN 


SELECT nom_actor
FROM ACTORS
WHERE sexe_actor = pi_sexeactor;

END //
DELIMITER ;