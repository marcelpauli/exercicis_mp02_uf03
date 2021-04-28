DELIMITER //
DROP TRIGGER IF EXISTS before_data_treballadors//
CREATE TRIGGER before_data_treballadors
BEFORE INSERT ON TREBALLADORS
FOR EACH ROW
BEGIN
set new.DATA_ALTA_TREB = curdate();
if (new.SOU_TREB>2500) then
set new.SOU_TREB=2500;
end if;
END //
DELIMITER ;