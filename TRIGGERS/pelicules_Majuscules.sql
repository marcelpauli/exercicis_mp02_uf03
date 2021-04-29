use videoclub;
delimiter //
DROP TRIGGER IF EXISTS pelicules_Majuscules//
create trigger pelicules_Majuscules
 before insert on PELLICULES
      for each row
         begin 
            set new.titol_peli = upper(new.titol_peli);
         end//

create trigger act_14_2
      before update on PELLICULES
      for each row
         begin 
            set new.titol_peli = upper(new.titol_peli);
         end//

delimiter ;
