use videoclub;

delimiter //
DROP TRIGGER IF EXISTS recaptacio_Pelicula//

create trigger recaptacio_Pelicula
      after insert on VISUALITZACIONS
      for each row
         begin
           declare paCodiPeli smallint unsigned;
           set paCodiPeli = new.id_peli;
           update PELLICULES
               set recaudacio_peli = recaudacio_peli + 2
               where id_peli = new.id_peli;
         end//
delimiter ;

/*MariaDB [videoclub]> SELECT titol_peli, recaudacio_peli 
                FROM PELLICULES 
                WHERE id_peli = 4;
*/

/*   +------------+-----------------+
     | titol_peli | recaudacio_peli |
     +------------+-----------------+
     | Colateral  |       217764291 |
     +------------+-----------------+
     1 row in set (0.000 sec)
*/

/*    MariaDB [videoclub]> INSERT INTO VISUALITZACIONS
         ->    VALUES (4,4444,"00:54:00");
      Query OK, 1 row affected (0.002 sec)

      MariaDB [videoclub]> SELECT titol_peli,recaudacio_peli
         -> FROM PELLICULES
         -> WHERE id_peli = 4;
      +------------+-----------------+
      | titol_peli | recaudacio_peli |
      +------------+-----------------+
      | Colateral  |       217764293 |
      +------------+-----------------+
      1 row in set (0.000 sec)
*/
