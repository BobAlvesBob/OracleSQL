/*
ALTER TABLE
PRIMARY KEY
*/


select * from USER_CONS_COLUMNS where constraint_name = 'CODIGO_PK';
select * from all_objects where object_name='CODIGO_PK';

ALTER TABLE articulos 
add constraint codigo_pk
primary key (id_articulo);

ALTER TABLE ARTICULOS
DROP CONSTRAINT codigo_pk;

select * from ARTICULOS;

describe articulos;

SELECT constraint_name, column_name
FROM user_cons_columns 
WHERE table_name = 'ARTICULOS';

SELECT constraint_name 
FROM user_constraints 
WHERE table_name = 'ARTICULOS' 
AND constraint_type = 'P';

ALTER TABLE articulos 
RENAME CONSTRAINT SYS_C008224 TO codigo_pk;


/*
SEQUENCE
*/
--NOMBRE DE SECUENCIA
--VALOR ENTERO
--VALOR MINIMO
--CICLO

CREATE SEQUENCE seq_teste
START WITH 1
INCREMENT BY 2
MINVALUE 1
MAXVALUE 19
NOCYCLE
CACHE 10
ORDER;


CREATE SEQUENCE seq_libros
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
MINVALUE 1
CYCLE;

select seq_teste.nextval from dual;

alter sequence seq_teste CACHE 5;
alter sequence seq_teste CYCLE;
alter sequence seq_teste MAXVALUE 190;

CREATE TABLE libros(
  idlibro int not null primary KEY,
  titulo varchar(40) not null, 
  autor varchar(40) null,
  precio number(5,2)
);

select * from libros;

insert into libros values(seq_teste.currval, 'El quijote', 'Miguel de Cervantes', 500.00);
insert into libros values(seq_libros.nextval, 'Cien anos de soledad','Gabriel G. Marquez', 600.00 );


truncate table libros;
drop SEQUENCE seq_teste;
/*
DISTINCT
*/

select distinct provincia from clientes;

select COUNT(distinct provincia) as cantidad
from clientes;

select distinct ciudad from clientes 
where provincia='Cordoba';

select ciudad, count(ciudad) as "Clientes por Ciudad" from clientes where provincia='Cordoba' group by ciudad;
/*
HAVING
*/

SELECT * FROM CLIENTES;


SELECT ciudad, provincia, count(*) as "Cantidad"
from clientes group by ciudad, provincia
having count(*)>1;

select ciudad,count(*) from clientes
where domicilio like '%San Martin%'
group by ciudad having count(*)<2 and ciudad <> 'Cordoba';

create table clientes (
  nombre varchar2(30) not null,
  domicilio varchar2(30),
  ciudad varchar2(20),
  provincia varchar2(20),
  telefono varchar2(11)
);

 insert into clientes
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null');
 insert into clientes
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
 insert into clientes
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
 insert into clientes
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null);
 insert into clientes
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685');
 insert into clientes
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525');
 insert into clientes
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455');
 insert into clientes
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null);
 insert into clientes
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366');
 insert into clientes
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

/*
GROUP BY
*/
select * from visitors;

SELECT city as Ciudad, count(*) as Numero_de_Chicas from visitors where age<30
group by city;

select city, count(phone) as Telefono from visitors
group by city; 

select sex as Sexo, sum(purchase_amount) as MontoCompra from visitors
where sex is not null
group by sex;

select sex as Sexo, city as Ciudad, max(purchase_amount) as "Mayor",
min(purchase_amount) as "Menor" from VISITORS
where sex is not null AND purchase_amount is not null
group by sex, city;


create table visitors(
name varchar2(30),
age number(2),
sex char(1) default 'f',
address varchar2(30),
city varchar2(20) default 'Cordoba',
phone varchar2(11),
email varchar2(30) default 'none',
purchase_amount number(6,2)
);

-- 1. Primeiro INSERT (este funcionou)
INSERT INTO visitors
VALUES ('Susana Molina', 35, default, 'Colon 123', default, null, null, 59.80);


INSERT INTO visitors
VALUES ('Marcos Torres', 29, 'm', 'Colon 123', 'Carlos Paz', default, 'marcostorres@hotmail.com', 150.50);

INSERT INTO visitors
VALUES ('Mariana Juarez', 45, default, default, 'Carlos Paz', null, default, 23.90);

INSERT INTO visitors (name, age, sex, phone, email)
VALUES ('Fabian Perez', 36, 'm', '4556677', 'fabianperez@xaxamail.com');

INSERT INTO visitors (name, city, purchase_amount)
VALUES ('Alejandra Gonzalez', 'La Falda', 280.50);

INSERT INTO visitors (name, age, sex, city, email, purchase_amount)
VALUES ('Gaston Perez', 29, 'm', 'Carlos Paz', 'gastonperez1@gmail.com', 95.40);

INSERT INTO visitors
VALUES ('Liliana Torres', 40, default, 'Sarmiento 876', default, default, default, 85);

INSERT INTO visitors
VALUES ('Gabriela Duarte', 21, null, null, 'Rio Tercero', default, 'gabrielaltorres@hotmail.com', 321.50);

/*
MAX,
MIN,
SUM,
AVG
*/
SELECT * FROM EMPLEADOS;
SELECT MAX(SUELDO)  AS "MAYOR SUELDO",
MIN(SUELDO) AS "MENOR SUELDO" FROM EMPLEADOS;

SELECT MAX(cantidadhijos) AS "HIJOS" FROM EMPLEADOS WHERE UPPER(NOMBRE) LIKE UPPER('%Perez%');

SELECT MIN(cantidadhijos) AS "HIJOS" FROM EMPLEADOS WHERE UPPER(NOMBRE) LIKE UPPER('%Perez%');

ALTER TABLE empleados ADD cantidadhijos number(3);
ALTER TABLE empleados MODIFY cantidadhijos default 0;
SELECT * FROM EMPLEADOS;
UPDATE EMPLEADOS set cantidadhijos = TRUNC(DBMS_RANDOM.VALUE(0,5));
INSERT INTO EMPLEADOS VALUES('Maria Cucaracha', 12343235, 'Calle de las putas 21', '12/12/99', 'Secretaria', 700, default);

SELECT round(avg(CANTIDADHIJOS)) from empleados;

SELECT round(AVG(SUELDO)) AS "Promedio sueldos", max(Sueldo) as "Maximo sueldo" from empleados;

select sum(sueldo) as "Soma de los sueldos" from empleados;
/*
COUNT
*/
SELECT * FROM MEDICAMENTOS;
SELECT COUNT(*) AS ANTIBIOTICOS FROM MEDICAMENTOS WHERE NOMBRE LIKE 'Amox%';

SELECT
  (SELECT COUNT(*) FROM MEDICAMENTOS WHERE PRECIO<5) AS PRECIO_BAJO, 
(SELECT COUNT(*)  FROM MEDICAMENTOS WHERE  CANTIDAD<100) AS CON_CANTIDAD_BAJA 
FROM DUAL;

SELECT COUNT(FECHAVENCIMIENTO) FROM MEDICAMENTOS;


/*
LIKE, 
NOT LIKE
*/

SELECT * FROM EMPLEADOS WHERE DOMICILIO LIKE '%Colon%';

SELECT * FROM EMPLEADOS WHERE nombre LIKE '%erez%';

select * from empleados where nombre not like '%erez%';

select * from empleados where documento like '35%';--35 AL PRINCIPIO

select * from empleados where documento like '35%' and DOMICILIO not like '%Col%';

select * from empleados where documento like '35%8%';

select * from empleados where seccion like 'G_______';

select * from empleados where sueldo like '5__%';--DECIMALES SON IGNORADOS


drop table empleados;
 
 create table empleados(
  nombre varchar2(30),
  documento char(8) not null,
  domicilio varchar2(30),
  fechaingreso date,
  seccion varchar2(20),
  sueldo number(6,2),
  primary key(documento)
 );
  insert into empleados
  values('Juan Perez','22333444','Colon 123',to_date('08/10/1990','dd/mm/yyyy'),'Gerencia',900.50);
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987',to_date('18/12/1995','dd/mm/yyyy'),'Secretaria',590.30);
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235',to_date('15/05/2005','dd/mm/yyyy'),'Sistemas',790);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873',to_date('12/02/1999','dd/mm/yyyy'),'Secretaria',550);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801',to_date('22/09/2002','dd/mm/yyyy'),'Contaduria',630.70);
 insert into empleados
  values('Yolanda perez','35111222','Colon 180',to_date('08/10/1990','dd/mm/yyyy'),'Administracion',400);
 insert into empleados
  values('Rodolfo perez','35555888','Coronel Olmedo 588',to_date('28/05/1990','dd/mm/yyyy'),'Sistemas',800);



/*
IN, NOT IN
*/
SELECT * FROM medicamentos WHERE LABORATORIO IN ('Bayer','Bago') ORDER BY 3 ASC;

SELECT * FROM medicamentos WHERE LABORATORIO NOT IN ('Bayer','Bago') ORDER BY 2 ASC;

SELECT * FROM MEDICAMENTOS WHERE CANTIDAD IN (10,200);
SELECT * FROM MEDICAMENTOS WHERE CANTIDAD BETWEEN 10 and 200;

select * from MEDICAMENTOS WHERE EXTRACT(year from FECHAVENCIMIENTO) in (2019,2020);

select * from MEDICAMENTOS WHERE EXTRACT(month from FECHAVENCIMIENTO) in (02, 10);
/*
BETWEEN
*/

select * from MEDICAMENTOS where precio between 5 and 15 order by CANTIDAD desc;

select * from MEDICAMENTOS where cantidad BETWEEN 100 and 200 order by CODIGO;


select * from MEDICAMENTOS where FECHAVENCIMIENTO BETWEEN TO_DATE('01/12/2017', 'DD/MM/YYYY') and TO_DATE('01/02/2018', 'DD/MM/YYYY');
drop table medicamentos;

 create table medicamentos(
  codigo number(6) not null,
  nombre varchar2(20),
  laboratorio varchar2(20),
  precio number(6,2),
  cantidad number(4),
  fechavencimiento date not null,
  primary key(codigo)
 );

 insert into medicamentos
  values(102,'Sertal','Roche',5.2,10,to_date('01/02/2020','dd/mm/yyyy'));
 insert into medicamentos 
  values(120,'Buscapina','Roche',4.10,200,to_date('01/12/2017','dd/mm/yyyy'));
 insert into medicamentos 
  values(230,'Amoxidal 500','Bayer',15.60,100,to_date('28/12/2017','dd/mm/yyyy'));
 insert into medicamentos
  values(250,'Paracetamol 500','Bago',1.90,20,to_date('01/02/2018','dd/mm/yyyy'));
 insert into medicamentos 
  values(350,'Bayaspirina','Bayer',2.10,150,to_date('01/12/2019','dd/mm/yyyy'));
 insert into medicamentos 
  values(456,'Amoxidal jarabe','Bayer',5.10,250,to_date('01/10/2020','dd/mm/yyyy'));

/*CONDICIONALES 
AND, OR
Y NOT
*/

select * from PELICULAS WHERE actor='Tom Cruise' or ACTOR='Richard Gere' or TITULO LIKE '%Potter%' and duracion < 150;


--TABLA A CREAR
create table peliculas(
  codigo number(4) primary key,
  titulo varchar2(40) not null,
  actor varchar2(20),
  duracion number(3)
  );

 --Ingreso de registros

 insert into peliculas values(1020,'Mision imposible','Tom Cruise',120);
 insert into peliculas values(1021,'Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas values(1022,'Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas values(1200,'Mision imposible 2','Tom Cruise',120);
 insert into peliculas values(1234,'Mujer bonita','Richard Gere',120);
 insert into peliculas values(900,'Tootsie','D. Hoffman',90);
 insert into peliculas values(1300,'Un oso rojo','Julio Chavez',100);
 insert into peliculas values(1301,'Elsa y Fred','China Zorrilla',110);



--ORDER BY
SELECT * from ARTICULOS ORDER BY ID_ARTICULO desc;

SELECT * from ARTICULOS ORDER BY 2 asc;

--TABLE TO CREATE
CREATE TABLE ARTICULOS(
ID_ARTICULO	INT NOT NULL PRIMARY KEY,
ARTICULO VARCHAR2(50) NOT NULL,
COD_FABRICANTE	NUMBER(10) NOT NULL,
PESO NUMBER(4) NOT NULL,
CATEGORIA	VARCHAR2(50),
PRECIO_VENTA NUMBER(6,2),
PRECIO_COSTO NUMBER(6,2),
EXISTENCIAS	NUMBER(5)
);
     
insert into articulos values(2,'TALADRO WALT',1012546955,45,'CONSTRUCCION',400,560,20);
insert into articulos values(3,'ALICATE ACE',1012432365,23,'MECANICA',200,350.25,120);
insert into articulos values(4,'PALA SENIC',1012345678,16,'CONSTRUCCION',100,230.5,200);
insert into articulos values(5,'TALADRO MILLWAKEE',1012545210,55,'CONSTRUCCION',300,423.5,50);
insert into articulos values(6,'GRIFO APERTURA MANOS',1010023654,26,'PLOMERIA',400,560.25,90);
insert into articulos values(7,'FREGADERO MURAL',1015487966,200,'PLOMERIA',600,780.50,52);
insert into articulos values(8,'TALADRO ELECTRICO BOSCH',1025493013,34,'CONSTRUCCION',250,380.25,41);
insert into articulos values(9,'CEPILLO CONICO ONDULADO',1025852000,44,'EBANISTERIA',150,240.25,88);
insert into articulos values(10,'CEPILLO TAZA ONDULADO',122247789,49,'EBANISTERIA',148,240.50,90);
insert into articulos values(11,'CEPILLO TAZA TRENZADA',1016467985,	42,'EBANISTERIA',139,210.50,89);

/*FUNCIONES 
DATE
*/
--funcion add_months
select add_months(to_date('10/10/2020','dd/mm/yyyy'),5) from dual;
select add_months(to_date('10/10/2020','dd/mm/yyyy'),-5) from dual;


--funcion last_day
select last_day(to_date('09/02/2020','dd/mm/yyyy')) from dual;

--funcion months_between
select abs(months_between(to_date('09/05/2020','dd/mm/yyyy'), to_date('19/08/2020','dd/mm/yyyy'))) from dual;

--funcion next_day
select next_day(to_date('06/07/2025','dd/mm/yyyy'), 'SATURDAY') from dual;

--funcion current_date
select current_date from dual;

--funcion sysdate
select sysdate from dual;

--funcion current_timestamp
select current_timestamp from dual;

--funcion systimestamp
select systimestamp from dual;

--funcion to_char
SELECT to_char('10/10/2020') from dual;

/*FUNCIONES 
MATEMATICAS 
*/
--funcion abs
select abs(-50) from dual;
select abs(10+10) from dual;

--funcion ceil
select ceil(30.49) from dual;

--funcion ceil
select floor(30.49) from dual;

--funcion mod (residuo)
select mod(10,2) from dual;

--funcion power
select power(10,2) from dual;

--funcion div
select 10/2 from dual;

--funcion round
select round(123.345, 1) from dual;

--funcion trunc
select trunc(1234.1234, 3) from dual;

--funcion sqrt
select sqrt(9) from dual;



-----------------------------------------------------

--funciones String
select chr(65) from dual;
select ascii('d') from dual;
--funcion concat
select concat('buenas', ' tardes') from dual;
--funcion initcap
select initcap('buenas tardes') from dual;
--funcion lower 
select lower('BUENAS TARDES') from dual;
--funcion upper
select upper('buenas tardes') from dual;
--funcion lpad
select lpad('oracle',11,'abc') from dual;
--funcion rpad
select rpad('oracle',11,'abc') from dual;
--funcion ltrim
select ltrim('curso de oracle', 'cur') from dual;
--funcion rtrim
select rtrim('curso de oracle', 'veld') from dual;
--funcion trim
select trim('  oracle  ') from dual;
--funcion replace
select replace('www.oracle.com','w','p') from dual;
--funcion substring
select substr('www.oracle.com', 1, 10) from dual;
select substr('www.oracle.com', -3) from dual;
--funcion length
select length('www.oracle.com') as cantidad from dual;
--funcion instr
select instr('oracle curso or', 'or') from dual;
--funcion translate
select translate('Curso de ORACLE', 'AOE', 'XYZ') from dual;




select nombre, laboratorio, precio, precio * 0.7 as "precio con descuento", cantidad 
from medicamentos;
select existente*0.2 from MEDICAMENTOS;

 update MEDICAMENTOS set precio = 2 where nombre = 'Sertal gotas';

 SELECT * from MEDICAMENTOS;

 create table medicamentos(
  codigo number(5) not null,
  nombre varchar2(20) not null,
  laboratorio varchar2(20),
  precio number(5,2),
  cantidad number(3,0) not null
 );

 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(1,'Sertal gotas',null,null,100); 
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(2,'Sertal compuesto',null,8.90,150);
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(3,'Buscapina','Roche',null,200);


select titulo ||'/'|| autor from libros;
select titulo ||' - $ '|| precio from libros;

create table libros(
  titulo varchar2(40) not null,
  autor varchar2(30) default 'Desconocido',
  editorial varchar2(40) not null, 
  precio number(5,2),
  cantidad number(3) default 0
  );

  select * from libros;

  insert into libros 
 values('Tomarnocu', default, 'Ed. New World', 20.30, DEFAULT);

 insert into libros 
 values('El quijote', 'Cervantes', 'Ed. La Mancha', 15.20, 1);

  insert into libros 
 values('Cien anos de soledad', default, 'Ed. La Mancha', 47, 3);

 select titulo, precio, precio*0.9 from libros;

 update libros set precio = precio*0.9;

