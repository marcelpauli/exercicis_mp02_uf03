use videoclub;
drop procedure if exists act8;
delimiter //
create procedure act8()
begin
   declare recaptat bigint default 0;
   declare pressu bigint default 0;
   declare titol varchar(40);
   declare rendibilitat varchar(15);
   declare final int default false;
   
   declare elcursor cursor for
      select titol_peli, recaudacio_peli, pressupost_peli
      from PELLICULES;

   declare continue handler for not found set final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into titol, recaptat, pressu;
      
      if final = 1 then
         leave elbucle;
      end if;
      
      if (pressu>recaptat) then
         set rendibilitat = "Deficitari";
      elseif (pressu*2 > recaptat) then
         set rendibilitat = "Suficient";
      else
         set rendibilitat = "Bona";
      end if;
      select titol, rendibilitat;
   
   end loop elbucle; 
   close elcursor;
end//

delimiter ;

--Mariadb> CALL act81();

--+-------------+--------------+
--| titol       | rendibilitat |
--+-------------+--------------+
--| La busqueda | Suficient    |
--+-------------+--------------+
--1 row in set (0.01 sec)

--+-------------+--------------+
--| titol       | rendibilitat |
--+-------------+--------------+
--| La terminal | Bona         |
--+-------------+--------------+
--1 row in set (0.01 sec)

--+------------------------------+--------------+
--| titol                        | rendibilitat |
--+------------------------------+--------------+
--| Capitán América: Civil War   | Bona         |
--+------------------------------+--------------+
--1 row in set (0.01 sec)

--+-------+--------------+
--| titol | rendibilitat |
--+-------+--------------+
--| Joker | Deficitari   |
--+-------+--------------+
--1 row in set (0.01 sec)

