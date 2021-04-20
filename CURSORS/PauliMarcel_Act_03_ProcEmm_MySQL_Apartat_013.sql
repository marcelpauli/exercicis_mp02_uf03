DELIMITER //
USE videoclub//
DROP FUNCTION IF EXISTS act_013//
CREATE FUNCTION act_013()
    RETURNS SMALLINT UNSIGNED
    DETERMINISTIC
    BEGIN

    declare idPeli SMALLINT UNSIGNED;

    SELECT id_peli
        INTO idPeli
    FROM PELLICULES
    WHERE recaudacio_peli = (SELECT max(recaudacio_peli) FROM   PELLICULES );
    return (idPeli);
    END //

DELIMITER ;

