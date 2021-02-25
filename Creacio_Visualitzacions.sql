USE videoclub;
DROP TABLE IF EXISTS VISUALITZACIONS;
CREATE TABLE VISUALITZACIONS (
	id_peli  smallint(5) unsigned NOT NULL,
	id_soci	 varchar(10) NOT NULL,
	temps time null, 
    PRIMARY KEY (id_peli,id_soci),
    FOREIGN KEY (id_peli) REFERENCES PELLICULES (id_peli),
	FOREIGN KEY (id_soci) REFERENCES SOCIS (id_soci)
);

INSERT INTO VISUALITZACIONS (id_peli,id_soci,temps) 
    VALUES (1,2222,'01:30:00'),
           (2,3333,'02:30:00'),
           (3,1111,'01:30:00'),
           (4,2222,'03:30:00'),
           (5,7777,'02:30:00'),
           (6,8888,'03:30:00'),
           (7,1111,'04:30:00'),
           (8,3333,'02:30:00'),
           (9,5555,'03:30:00'),
           (10,4444,'04:30:00'),
           (11,8888,'03:30:00'),
           (12,1111,'04:30:00'),
           (13,6666,'02:30:00'),
           (14,5555,'03:30:00'),
           (15,4444,'04:30:00');

