alter table DEPARTAMENTS add qtatTreballadors smallint unsigned;
DELIMITER //
DROP TRIGGER IF EXISTS after_treballadors_comptar//
CREATE TRIGGER after_treballadors_comptar
AFTER INSERT ON TREBALLADORS
FOR EACH ROW
BEGIN
Declare paNumEmpleats smallint unsigned;
SELECT count(*)
INTO paNumEmpleats
FROM TREBALLADORS
WHERE CODI_DEP_TREB = new.CODI_DEP_TREB;

UPDATE DEPARTAMENTS
SET qtatTreballadors = paNumEmpleats
WHERE CODI_DEPT = new.CODI_DEP_TREB;
END //
DELIMITER ;