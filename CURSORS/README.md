# Correcció exercicis

Revisió dels exercicis de la **unitat formativa 3** del **mòdul professional 2**.

|Enunciat|Fitxer|Comentari|Nota|
|--------|------|---------|----|
|**Enunciat 9**|?????|?????|?????|
|**Enunciat 11**|?????|?????|?????|
|**Enunciat 12**|?????|?????|?????|
|**Enunciat 13**|?????|?????|?????|


# Exemple de correcció

Cal que ompliu el fitxer **```README.md```** del vostre repositori amb la següent informació per a cadascun dels enunciats.

# **Enunciat 8**:

## Emprant l’**activitat 6**, dissenya un cursor que llisti els mateixos camps per a totes les pel·lícules.

**1. Enllaç al fitxer**

[Act08.sql](https://github.com/joanpardogine/exercicis_mp02_uf03/blob/master/Cursors/Act08.sql)

**2. Contingut del fitxer**

```sql
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

-- call act8();
```

**3. Sortida de la creació del procediment**
```sql
mysql> use videoclub;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> drop procedure if exists act8;
Query OK, 0 rows affected (1.69 sec)

mysql> delimiter //
mysql> create procedure act8()
    -> begin
    ->    declare recaptat bigint default 0;
    ->    declare pressu bigint default 0;
    ->    declare titol varchar(40);
    ->    declare rendibilitat varchar(15);
    ->    declare final int default false;
    ->    
    ->    declare elcursor cursor for
    ->       select titol_peli, recaudacio_peli, pressupost_peli
    ->       from PELLICULES;
    -> 
    ->    declare continue handler for not found set final = 1;
    ->    open elcursor;
    ->    elbucle:loop
    ->       fetch elcursor into titol, recaptat, pressu;
    ->       
    ->       if final = 1 then
    ->          leave elbucle;
    ->       end if;
    ->       
    ->       if (pressu>recaptat) then
    ->          set rendibilitat = "Deficitari";
    ->       elseif (pressu*2 > recaptat) then
    ->          set rendibilitat = "Suficient";
    ->       else
    ->          set rendibilitat = "Bona";
    ->       end if;
    ->       
    ->       select titol, rendibilitat;
    ->    
    ->    end loop elbucle; 
    ->    close elcursor;
    -> end//
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> delimiter ;
mysql> 
```

**4. Sortida de l'execució del procediment**
```sql
mysql> call act8();
+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| LA BUSQUEDA | Suficient    |
+-------------+--------------+
1 row in set (0.00 sec)

+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| LA TERMINAL | Bona         |
+-------------+--------------+
1 row in set (0.00 sec)

+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| Mar adentro | Bona         |
+-------------+--------------+
1 row in set (0.00 sec)

+-----------+--------------+
| titol     | rendibilitat |
+-----------+--------------+
| Colateral | Bona         |
+-----------+--------------+
1 row in set (0.00 sec)

+--------------------+--------------+
| titol              | rendibilitat |
+--------------------+--------------+
| Los 4 fantásticos  | Suficient    |
+--------------------+--------------+
1 row in set (0.00 sec)

+----------+--------------+
| titol    | rendibilitat |
+----------+--------------+
| Sin City | Suficient    |
+----------+--------------+
1 row in set (0.00 sec)

+----------+--------------+
| titol    | rendibilitat |
+----------+--------------+
| IRON MAN | Bona         |
+----------+--------------+
1 row in set (0.00 sec)

+----------------+--------------+
| titol          | rendibilitat |
+----------------+--------------+
| Los Vengadores | Bona         |
+----------------+--------------+
1 row in set (0.00 sec)

+----------------------------------+--------------+
| titol                            | rendibilitat |
+----------------------------------+--------------+
| Los Vengadores: La era de Ultron | Bona         |
+----------------------------------+--------------+
1 row in set (0.00 sec)

+----------------------------------+--------------+
| titol                            | rendibilitat |
+----------------------------------+--------------+
| La busqueda 2: El diario secreto | Bona         |
+----------------------------------+--------------+
1 row in set (0.00 sec)

+------------+--------------+
| titol      | rendibilitat |
+------------+--------------+
| IRON MAN 2 | Bona         |
+------------+--------------+
1 row in set (0.00 sec)

+------------+--------------+
| titol      | rendibilitat |
+------------+--------------+
| Iron Man 3 | Bona         |
+------------+--------------+
1 row in set (0.00 sec)

+---------------------------------------+--------------+
| titol                                 | rendibilitat |
+---------------------------------------+--------------+
| Capitán América: El primer vengador   | Bona         |
+---------------------------------------+--------------+
1 row in set (0.00 sec)

+-------------------------------------------+--------------+
| titol                                     | rendibilitat |
+-------------------------------------------+--------------+
| Capitán América: El Soldado de Invierno   | Bona         |
+-------------------------------------------+--------------+
1 row in set (0.01 sec)

+------------------------------+--------------+
| titol                        | rendibilitat |
+------------------------------+--------------+
| Capitán América: Civil War   | Bona         |
+------------------------------+--------------+
1 row in set (0.01 sec)

+-------+--------------+
| titol | rendibilitat |
+-------+--------------+
| Joker | Deficitari   |
+-------+--------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)
```

---

# **Enunciat 9**:

## Emprant l’**activitat 7**, dissenya un cursor que llisti els mateixos camps per a tots els intèrprets.

**1. Enllaç al fitxer**
[PauliMarcel_Act_03_ProcEmm_MySQL_Apartat_009](https://github.com/marcelpauli/exercicis_mp02_uf03/blob/master/CURSORS/PauliMarcel_Act_03_ProcEmm_MySQL_Apartat_009.sql)
**2. Contingut del fitxer**
```sql
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
   ELSEIF  pa_edatActor<25 THEN 
         SET pa_paper = "dona gran";
     END IF;
    SELECT concat("L'actriu ", pa_nomActor, " té ", pa_edatActor , " anys i pot fer de ", pa_paper, ".") AS Frase;
END IF;
  END //
DELIMITER ;


```

**3. Sortida de la creació del procediment**
```sql
  MariaDB [videoclub]> CREATE PROCEDURE PardoJoan_Act_03_ProcEmm_MySQL_Apartat_010(
    ->  IN  pi_actor       smallint)
    ->   BEGIN
    ->    DECLARE pa_nomActor       varchar(30);
    ->    DECLARE pa_edatActor      smallint;
    ->    DECLARE pa_sexeActor      varchar(6);
    ->    DECLARE pa_paper          varchar(50);
    -> SELECT nom_actor, year(curdate())-anynaix_actor, sexe_actor
    ->    INTO pa_nomActor, pa_edatActor, pa_sexeActor
    -> FROM   ACTORS
    -> WHERE  id_actor=pi_actor;
    ->
    -> IF pa_sexeActor = "home" THEN
    ->    IF pa_edatActor<15 THEN
    ->       SET pa_paper = "de nen";
    ->    ELSEIF  pa_edatActor<25 THEN
    ->          SET pa_paper = "dona gran";
    ->      END IF;
    ->     SELECT concat("L'actriu ", pa_nomActor, " té ", pa_edatActor , " anys i pot fer de ", pa_paper, ".") AS Frase;
    -> END IF;
    ->   END //
Query OK, 0 rows affected (0.004 sec)

MariaDB [videoclub]> DELIMITER ;


```

**4. Sortida de l'execució del procediment**
```sql
   <La sortida de l'execució del vostre procediment>
```

---

# **Enunciat 11**:

## Dissenya una funció que rebent un codi de pel·lícula torni el nombre d’usuaris que l’han vist.<br>Utilitza aquesta funció per llistar el títol de la pel·lícula i el nom de l’usuari.

**1. Enllaç al fitxer**
[PauliMarcel_Act_03_ProcEmm_MySQL_Apartat_011](https://github.com/marcelpauli/exercicis_mp02_uf03/blob/master/CURSORS/PauliMarcel_Act_03_ProcEmm_MySQL_Apartat_011.sql)
**2. Contingut del fitxer**
```sql
   USE videoclub;
DROP FUNCTION IF EXISTS act_11;

DELIMITER //
CREATE FUNCTION act_11(cPeli SMALLINT UNSIGNED) 
       RETURNS SMALLINT UNSIGNED
       DETERMINISTIC
BEGIN
   DECLARE visualitzacions SMALLINT UNSIGNED;

   SELECT   COUNT(*)
        INTO visualitzacions
   FROM  VISUALITZACIONS
   WHERE id_peli = cPeli;
   RETURN visualitzacions;
END//
DELIMITER ;

```

**3. Sortida de la creació del procediment**
```sql
   MariaDB [videoclub]> DELIMITER //
MariaDB [videoclub]> CREATE FUNCTION act_11(cPeli SMALLINT UNSIGNED)
    ->        RETURNS SMALLINT UNSIGNED
    ->        DETERMINISTIC
    -> BEGIN
    ->    DECLARE visualitzacions SMALLINT UNSIGNED;
    ->
    ->    SELECT   COUNT(*)
    ->         INTO visualitzacions
    ->    FROM  VISUALITZACIONS
    ->    WHERE id_peli = cPeli;
    ->    RETURN visualitzacions;
    -> END//
Query OK, 0 rows affected (0.004 sec)

MariaDB [videoclub]> DELIMITER ;

```

**4. Sortida de l'execució del procediment**
```sql
   MariaDB [videoclub]> SELECT  titol_peli, act_11(2) "visualitzacions"
    -> FROM    PELLICULES
    -> WHERE   id_peli = 2;
+-------------+-----------------+
| titol_peli  | visualitzacions |
+-------------+-----------------+
| La terminal |               2 |
+-------------+-----------------+
1 row in set (0.001 sec)

```

---

# **Enunciat 12**:

## Dissenya una funció que rebi el codi d’una pel·lícula i torni el nom i cognoms del seu actor principal.<br>Utilitza aquesta funció per llistar el títol de la pel·lícula i el nom i cognoms del seu actor principal.

**1. Enllaç al fitxer**
[PauliMarcel_Act_03_ProcEmm_MySQL_Apartat_012](https://github.com/marcelpauli/exercicis_mp02_uf03/blob/master/CURSORS/PauliMarcel_Act_03_ProcEmm_MySQL_Apartat_012.sql)
**2. Contingut del fitxer**
```sql
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
```

**3. Sortida de la creació del procediment**
```sql
   MariaDB [videoclub]> USE videoclub//
Database changed
MariaDB [videoclub]> DROP FUNCTION IF EXISTS act_012//
Query OK, 0 rows affected, 1 warning (0.000 sec)

MariaDB [videoclub]> CREATE FUNCTION act_012(cPeli SMALLINT UNSIGNED)
    ->     RETURNS varchar(30)
    ->     DETERMINISTIC
    ->     BEGIN
    ->
    ->     declare NomActor varchar(30) default "";
    ->
    ->     SELECT act.nom_actor
    ->         INTO nomActor
    ->     FROM PELLICULES peli
    ->         INNER JOIN ACTORS_PELLICULES act_pel
    ->     ON act_pel.id_peli = peli.id_peli
    ->         INNER JOIN ACTORS act
    ->     ON act.id_actor = act_pel.id_actor
    ->     WHERE peli.id_peli = cPeli AND PRINCIPAL = 1
    ->     LIMIT 1;
    ->     return (NomActor);
    ->     END //
Query OK, 0 rows affected (0.004 sec)

MariaDB [videoclub]>
MariaDB [videoclub]> DELIMITER ;

```

**4. Sortida de l'execució del procediment**
```sql
   MariaDB [videoclub]> SELECT titol_peli Titol, act_012(5) "Nom Actor"
    ->     FROM PELLICULES
    ->         WHERE id_peli = 5;
+--------------------+--------------+
| Titol              | Nom Actor    |
+--------------------+--------------+
| Los 4 fantásticos  | Jessica Alba |
+--------------------+--------------+
1 row in set (0.001 sec)

```

---

# **Enunciat 13**:

## Fes una funció que torni el codi de pel·lícula que més ha recaptat.<br>Emprant la funció anterior i la funció de l’**activitat 12**, llista el títol, actor principal i recaptació de la pel·lícula que més ha recaptat.

**1. Enllaç al fitxer**
[PauliMarcel_Act_03_ProcEmm_MySQL_Apartat_013](https://github.com/marcelpauli/exercicis_mp02_uf03/blob/master/CURSORS/PauliMarcel_Act_03_ProcEmm_MySQL_Apartat_013.sql)
**2. Contingut del fitxer**
```sql
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
```

**3. Sortida de la creació del procediment**
```sql
   MariaDB [videoclub]> DROP FUNCTION IF EXISTS act_013//
Query OK, 0 rows affected, 1 warning (0.000 sec)

MariaDB [videoclub]> CREATE FUNCTION act_013()
    ->     RETURNS SMALLINT UNSIGNED
    ->     DETERMINISTIC
    ->     BEGIN
    ->
    ->     declare idPeli SMALLINT UNSIGNED;
    ->
    ->     SELECT id_peli
    ->         INTO idPeli
    ->     FROM PELLICULES
    ->     WHERE recaudacio_peli = (SELECT max(recaudacio_peli) FROM   PELLICULES );
    ->     return (idPeli);
    ->     END //
Query OK, 0 rows affected (0.003 sec)

MariaDB [videoclub]>
MariaDB [videoclub]> DELIMITER ;

```

**4. Sortida de l'execució del procediment**
```sql
   <La sortida de l'execució del vostre procediment>
```

---
