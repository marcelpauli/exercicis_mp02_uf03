DELIMITER //
USE videoclub//
DROP FUNCTION IF EXISTS act_012//
CREATE FUNCTION act_012(cPeli SMALLINT UNSIGNED)
    RETURNS varchar(30)
    DETERMINISTIC
    BEGIN

    declare NomActor varchar(30) default "";

    SELECT act.nom_actor
        INTO nomActor
    FROM PELLICULES peli
        INNER JOIN ACTORS_PELLICULES act_pel
    ON act_pel.id_peli = peli.id_peli
        INNER JOIN ACTORS act
    ON act.id_actor = act_pel.id_actor
    WHERE peli.id_peli = cPeli AND PRINCIPAL = 1
    LIMIT 1;
    return (NomActor);
    END //

DELIMITER ;