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

