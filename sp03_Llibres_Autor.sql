/* Canviem a la base de dades LLIBRERIA per
*  assegurar-nos que és la base de dades seleccionada. */
USE LLIBRERIA;

-- Modifiquem el delimitador de sentències a //
DELIMITER //

/* Procedim a esborrar el procediment que volem
*  crear per assegurar-nos que el creem des de zero. */
DROP PROCEDURE IF EXISTS sp02_Llibres_Autor//

/* Procedim a crear el nou procediment amb la 
*  clàusula CREATE PROCEDURE seguida del nom del procediment
*  i la definició de paràmetres si cal. En aquest cas
*  creem un paràmetre d'entrada (IN) que anomenem
*  p_autor i del tipus varchar(30). */
CREATE PROCEDURE sp02_Llibres_Autor(
      IN  p_autor varchar(30))
  BEGIN

    SELECT TITOL, EDITORIAL, PREU
    FROM   LLIBRES
    WHERE  AUTOR = p_autor;

-- La clàusula END indica el final del procediment.
  END//

-- Modifiquem el delimitador de sentències a l'estàndard que és ;
DELIMITER ;