 /*
 SUBQUERIES
 IN, ANY, SOME
 */
select nombre, domicilio from clientes
where codigopais in(
 SELECT CODIGO FROM PAISES 
 WHERE NOMBRE_PAIS IN ('Argentina','Colombia', 'Rep. Dominicana'));

 select nombre_pais, codigo from paises
  where codigo = any(
 select codigopais from clientes 
 where nombre like '%Perez%');

SELECT * FROM PAISES;
SELECT * FROM CLIENTES;


 drop table clientes;
drop table paises;

 create table paises(
  codigo number(2),
  nombre_pais varchar2(20),
  primary key (codigo)
 );

 create table clientes (
  codigo number(4),
  nombre varchar2(50),
  domicilio varchar2(100),
  codigopais number(2) not null,
  primary key(codigo),
  constraint FK_clientes_paises
   foreign key (codigopais)
   references paises(codigo)
   on delete cascade
 );
 
 insert into paises values(1,'Argentina');
 insert into paises values(2,'Brasil');
 insert into paises values(3,'Bolivia');
 insert into paises values(4,'Colombia');
 insert into paises values(5,'Venezuela');
 insert into paises values(6,'Chile');
 insert into paises values(7,'Uruguay');
 insert into paises values(8,'Costa Rica');
 insert into paises values(9,'Rep. Dominicana');

 insert into clientes values (101,'Jorge Perez','Calle 1ra No 001',1);
 insert into clientes values (102,'Manuel Gonzales','Calle 2da No.33',2);
 insert into clientes values (103,'Perez Ana','San Martin 333',2);
 insert into clientes values (104,'Garcia Juan','Principal 444',3);
 insert into clientes values (105,'Perez Luis','Sarmiento 555',3);
 insert into clientes values (106,'Gomez Ines','Altos del Llano 899',4);
 insert into clientes values (107,'Torres Fabiola','La Encenada 256',5);
 insert into clientes values (108,'Garcia Luis','Principal 155',6);
 insert into clientes values (109,'Federico Suarez','La Hondonada 344',7);
 insert into clientes values (110,'Mauricio Sarmiento','El Retiro 152',9);
 insert into clientes values (111,'Ana Jimenez','Reparto las Flores',8);
 insert into clientes values (112,'Humberto Velez','Ensache Las Praderas',8);
 insert into clientes values (113,'Heridania Sanchez','Urbanización Constelación',6);

 
 /*
 SUBQUERIES
 */
 select * from students
 where grade=(select  max(grade) from STUDENTS);

 select * from students
 where grade < (select ROUND(avg(grade)) AS Promedio from STUDENTS );

 DELETE FROM STUDENTS
 WHERE GRADE<(SELECT ROUND(AVG(GRADE)) AS PROMEDIO FROM STUDENTS);
 
 SELECT * FROM students;

 drop table  students;

create table students(
document char(8),
name varchar2(30),
grade number(4,2),
primary key(document));


insert into students values('30111111','Ana Algarbe',10);
insert into students values('30222222','Bernardo Bustamante',9);
insert into students values('30333333','Carolina Conte',8);
insert into students values('30444444','Diana Dominguez',9);
insert into students values('30555555','Fabian Fuentes',8);
insert into students values('30666666','Gaston Gonzalez',7);
insert into students values('30644556','Federico Suarez',6);
insert into students values('30689898','Miguel Pantaleon',6);
 
 /*
 MODIFY
 */
 create table tipo_dato(
  valor int null);
 
 select * from tipo_dato;

insert into tipo_dato values(100);

insert into tipo_dato values('hola');

alter table tipo_dato
modify valor varchar2(20);

truncate table tipo_dato;


 /*
 ADD, REMOVE COLUMNS
 */


 alter table libros

 add cantidad int;
 
 update libros set cantidad=3;

 alter table libros
 add (existencia int default 0 not null);

 select * from libros;

alter table libros
add (vendidos int default 0 not null, 
en_stock int default 0 not null);

alter table libros
drop column en_stock;

alter table libros 
drop(existencia);

 DROP TABLE libros;
 
 create table libros(
  codigo number(5) not null,
  titulo varchar2(40) not null,
  autor varchar2(40) not null,
  editorial varchar2(40),
  precio number(8,2)
 )

 -- Inserindo dados na tabela libros
INSERT INTO libros VALUES (10001, 'Don Quijote de la Mancha', 'Miguel de Cervantes', 'Planeta', 45.50);
INSERT INTO libros VALUES (10002, 'Cien años de soledad', 'Gabriel García Márquez', 'Sudamericana', 38.75);
INSERT INTO libros VALUES (10003, 'El amor en los tiempos del cólera', 'Gabriel García Márquez', 'Oveja Negra', 42.30);
INSERT INTO libros VALUES (10004, 'La casa de los espíritus', 'Isabel Allende', 'Plaza & Janés', 35.80);
INSERT INTO libros VALUES (10005, 'Rayuela', 'Julio Cortázar', 'Alfaguara', 41.20);
INSERT INTO libros VALUES (10006, 'El túnel', 'Ernesto Sabato', 'Seix Barral', 28.90);
INSERT INTO libros VALUES (10007, 'Pedro Páramo', 'Juan Rulfo', 'Fondo de Cultura Económica', 32.45);
INSERT INTO libros VALUES (10008, 'La tregua', 'Mario Benedetti', 'Nuevo Siglo', 29.60);
INSERT INTO libros VALUES (10009, 'Ficciones', 'Jorge Luis Borges', 'Emecé', 36.75);
INSERT INTO libros VALUES (10010, 'El Aleph', 'Jorge Luis Borges', 'Emecé', 34.25);
INSERT INTO libros VALUES (10011, 'La ciudad y los perros', 'Mario Vargas Llosa', 'Seix Barral', 39.80);
INSERT INTO libros VALUES (10012, 'Conversación en La Catedral', 'Mario Vargas Llosa', 'Seix Barral', 48.90);
INSERT INTO libros VALUES (10013, 'El señor de las moscas', 'William Golding', 'Alianza Editorial', 33.50);
INSERT INTO libros VALUES (10014, '1984', 'George Orwell', 'Destino', 31.75);
INSERT INTO libros VALUES (10015, 'Crónica de una muerte anunciada', 'Gabriel García Márquez', 'Diana', 37.20);
INSERT INTO libros VALUES (10016, 'El principito', 'Antoine de Saint-Exupéry', 'Salamandra', 25.40);
INSERT INTO libros VALUES (10017, 'Los detectives salvajes', 'Roberto Bolaño', 'Anagrama', 44.60);
INSERT INTO libros VALUES (10018, 'La sombra del viento', 'Carlos Ruiz Zafón', 'Planeta', 40.35);
INSERT INTO libros VALUES (10019, 'El código Da Vinci', 'Dan Brown', 'Umbriel', 42.80);
INSERT INTO libros VALUES (10020, 'Harry Potter y la piedra filosofal', 'J.K. Rowling', 'Salamandra', 35.90);

-- Algunos registros con editorial NULL para mostrar variación
INSERT INTO libros VALUES (10021, 'Antología poética', 'Federico García Lorca', NULL, 27.50);
INSERT INTO libros VALUES (10022, 'Veinte poemas de amor', 'Pablo Neruda', NULL, 24.80);
INSERT INTO libros VALUES (10023, 'Manual de programación', 'Autor Desconocido', NULL, 55.00);

-- Confirmar los datos insertados
COMMIT;

 select * from libros;

 /*
 MINUS
 */
 SELECT documento, nombre, domicilio from medicos
 MINUS
 SELECT documento,nombre, domicilio from pacientes;


/*
INTERSECT
*/
 SELECT documento, nombre, domicilio from medicos
 intersect
 SELECT documento,nombre, domicilio from pacientes;

describe pacientes
/*
UNION
*/



SELECT table_name FROM user_tables;

SELECT * FROM medicos;
select * from pacientes;


select nombre, domicilio from medicos
union all
select nombre, domicilio from pacientes
order by nombre;


drop table medicos;
 drop table pacientes;

 create table medicos(
  legajo number(3),
  documento varchar2(8) not null,
  nombre varchar2(30),
  domicilio varchar2(30),
  especialidad varchar2(30),
  primary key(legajo)
 );
 create table pacientes(
  documento varchar2(8) not null,
  nombre varchar2(30),
  domicilio varchar2(30),
  obrasocial varchar2(20),
  primary key(documento)
 );
 insert into medicos values(1,'20111222','Ana Acosta','Avellaneda 111','clinica');
 insert into medicos values(2,'21222333','Betina Bustos','Bulnes 222','clinica');
 insert into medicos values(3,'22333444','Carlos Caseros','Colon 333','pediatria');
 insert into medicos values(4,'23444555','Daniel Duarte','Duarte Quiros 444','oculista');
 insert into medicos values(5,'24555666','Estela Esper','Esmeralda 555','alergia');

 insert into pacientes values('24555666','Estela Esper','Esmeralda 555','IPAM');
 insert into pacientes values('23444555','Daniel Duarte','Duarte Quiros 444','OSDOP');
 insert into pacientes values('30111222','Fabiana Fuentes','Famatina 666','PAMI');
 insert into pacientes values('31222333','Gaston Gonzalez','Guemes 777','PAMI');
/*
FOREIGN KEY ON DELETE
*/
alter table clientes
drop constraint fk_codigoprovincia


SELECT * FROM CLIENTES;
SELECT * from provincias;
drop table clientes;
 drop table provincias;

 ALTER TABLE CLIENTES
 add constraint fk_codigoprovincia 
 FOREIGN KEY (codigoprovincia) references provincias(codigo)
 on delete set null;

  ALTER TABLE CLIENTES
 add constraint fk_codigoprovincia 
 FOREIGN KEY (codigoprovincia) references provincias(codigo)
 on delete cascade;

 delete from PROVINCIAS where codigo=2;

 select * from provincias;

 delete from PROVINCIAS where codigo=3;


 create table clientes (
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  codigoprovincia number(2),
  primary key(codigo)
 );

 create table provincias(
  codigo number(2),
  nombre varchar2(20),
  primary key (codigo)
 );

 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes values(100,'Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes values(101,'Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes values(102,'Acosta Ana','Avellaneda 333','Posadas',3);drop table clientes;
 drop table provincias;

 create table clientes (
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  codigoprovincia number(2),
  primary key(codigo)
 );

 create table provincias(
  codigo number(2),
  nombre varchar2(20),
  primary key (codigo)
 );

 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes values(100,'Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes values(101,'Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes values(102,'Acosta Ana','Avellaneda 333','Posadas',3);


drop table clientes;
 drop table provincias;

 create table clientes (
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  codigoprovincia number(2),
  primary key(codigo)
 );

 create table provincias(
  codigo number(2),
  nombre varchar2(20),
  primary key (codigo)
 );

 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes values(100,'Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes values(101,'Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes values(102,'Acosta Ana','Avellaneda 333','Posadas',3);

/*
FK VALIDATE
*/
insert into CLIENTES
values(110, 'Garcia Omar', 'San Martin 100', 'La Pampa', 6);

alter table clientes
disable novalidate
constraint fk_codigoprovincia;

alter table clientes
disable novalidate
constraint fk_codigoprovincia;


select constraint_name, status, validated
from user_constraints
where table_name = 'CLIENTES';

alter table clientes
add constraint fk_codigoprovincia
foreign key(codigoprovincia) 
references provincias(codigo)novalidate;

SELECT * from clientes;

select * from provincias;


drop table clientes;
drop table provincias;

create table clientes (
codigo number(5),
nombre varchar2(30),
domicilio varchar2(30),
ciudad varchar2(20),
codigoprovincia number(2),
primary key(codigo)
);

create table provincias(
codigo number(2),
nombre varchar2(20),
primary key (codigo)
);

insert into provincias values(1,'Cordoba');
insert into provincias values(2,'Santa Fe');
insert into provincias values(3,'Misiones');
insert into provincias values(4,'Rio Negro');

insert into clientes values(100,'Perez Juan','San Martin 123','Carlos Paz',1);
insert into clientes values(101,'Moreno Marcos','Colon 234','Rosario',2);
insert into clientes values(102,'Garcia Juan','Sucre 345','Cordoba',1);
insert into clientes values(103,'Lopez Susana','Caseros 998','Posadas',3);
insert into clientes values(104,'Marcelo Moreno','Peru 876','Viedma',4);
insert into clientes values(105,'Lopez Sergio','Avellaneda 333','La Plata',5);

/*
 SELF -REFERENCED FK
*/
drop table clientes;

create table clientes(
  codigo number(5), 
  nombre varchar2(30), 
  domicilio varchar2(30),
  ciudad varchar2(20),
  referenciadopor number(5),
  primary key(codigo)
);

alter table clientes
rename constraint SYS_C008264 to "pk_clientes";

alter table clientes 
add constraint fk_referencia
foreign key (referenciadopor) 
references clientes(codigo);

update clientes set REFERENCIADOPOR = 90 where REFERENCIADOPOR = 9;


 insert into clientes values (50,'Juan Perez','Sucre 123','Cordoba',null);
 insert into clientes values(90,'Marta Juarez','Colon 345','Carlos Paz',null);
 insert into clientes values(110,'Fabian Torres','San Martin 987','Cordoba',50);
 insert into clientes values(125,'Susana Garcia','Colon 122','Carlos Paz',90);
 insert into clientes values(140,'Ana Herrero','Colon 890','Carlos Paz',9);
/*
FOREIGN KEY
*/
alter table clientes
add constraint fk_codigoprovincias
foreign key (codigoprovincia) 
references provincias(codigo)

alter table clientes
drop constraint fk_codigoprovincias


describe provincias
select * from PROVINCIAS;
select  *  from clientes;

drop table CLIENTES;
drop table provincias;

create table provincias(
  codigo number(2) primary key not null,
  nombre varchar2(20)
);
create table clientes(
  codigo number(5),
  nombre varchar2(30), 
  domicilio varchar2(20), 
  ciudad varchar2(20),
  codigoprovincia number(2)
);

 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes values(100,'Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes values(101,'Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes values(102,'Acosta Ana','Avellaneda 333','Posadas',3);
 insert into clientes values(103,'Luisa Lopez','Juarez 555','La Plata',6);
/*
JOIN DE MAS DE DOS TABLAS
*/
SELECT s.nombre , d.nombre as "Nombre del Deporte", i.anio as ano
from deportes d
right join inscriptos i
on i.codigodeporte = d.codigo
left join socios s
on i.documento = s.documento;

SELECT * FROM SOCIOS;
SELECT * FROM DEPORTES;
SELECT * FROM INSCRIPTOS;

drop table socios;
drop table deportes;
drop table inscriptos;
 
--creando tabla de socios
 create table socios(
  documento char(8) not null, 
  nombre varchar2(30),
  domicilio varchar2(30),
  primary key(documento)
 );

--creando tabla deportes
 create table deportes(
  codigo number(2),
  nombre varchar2(20),
  profesor varchar2(15),
  primary key(codigo)
 );

--creando tabla inscriptos
 create table inscriptos(
  documento char(8) not null, 
  codigodeporte number(2) not null,
  anio char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,anio)
 );

--llenando tabla socios
 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

--llenando tabla deportes
 insert into deportes values(1,'basquet','Juan Juarez');
 insert into deportes values(2,'futbol','Pedro Perez');
 insert into deportes values(3,'natacion','Marina Morales');
 insert into deportes values(4,'tenis','Marina Morales');

--llenando tabla inscriptos
 insert into inscriptos values ('22222222',3,'2016','s');
 insert into inscriptos values ('23333333',3,'2016','s');
 insert into inscriptos values ('24444444',3,'2016','n');
 insert into inscriptos values ('22222222',3,'2015','s');
 insert into inscriptos values ('22222222',3,'2017','n');
 insert into inscriptos values ('24444444',1,'2016','s');
 insert into inscriptos values ('24444444',2,'2016','s');
 insert into inscriptos values ('26666666',0,'2016','s');

/*
CROSS JOIN
*/
select n.nombre, t.domicilio, t.descripcion 
from guardias n 
cross join 
tareas t
where (n.sexo ='f' and t.descripcion='vigilancia interior') or (n.sexo='m' and t.DESCRIPCION='vigilancia exterior');

select n.nombre, n.domicilio, t.descripcion 
from guardias n
cross join tareas t;

SELECT * from guardias;
select * from tareas;
drop table guardias;
 drop table tareas;

 create table guardias(
  documento char(8),
  nombre varchar2(30),
  sexo char(1), /* 'f' o 'm' */
  domicilio varchar2(30),
  primary key (documento)
 );


alter table  guardias modify nombre varchar2(40) not null;

alter table guardias add constraint chk_sexo
CHECK (sexo IN ('f', 'm'));

 create table tareas(
  codigo number(2),
  domicilio varchar2(30),
  descripcion varchar2(30),
  horario char(2), /* 'AM' o 'PM'*/
  primary key (codigo)
 );

 insert into guardias values('22333444','Juan Perez','m','Colon 123');
 insert into guardias values('24333444','Alberto Torres','m','San Martin 567');
 insert into guardias values('25333444','Luis Ferreyra','m','Chacabuco 235');
 insert into guardias values('23333444','Lorena Viale','f','Sarmiento 988');
 insert into guardias values('26333444','Irma Gonzalez','f','Mariano Moreno 111');

 insert into tareas values(1,'Colon 1111','vigilancia exterior','AM');
 insert into tareas values(2,'Urquiza 234','vigilancia exterior','PM');
 insert into tareas values(3,'Peru 345','vigilancia interior','AM');
 insert into tareas values(4,'Avellaneda 890','vigilancia interior','PM');

/*
FULL
JOIN
*/
SELECT * from inscriptos;
select * from deportes;

select i.documento, i.matricula, de.nombre as Deporte, de.profesor
from inscriptos i
full join deportes de
on de.codigo = i.CODIGODEPORTE;

select d.nombre as "Nombre del Esporte", 
d.profesor, 
count(i.documento) as "Cantidad de Inscriptos" 
 from deportes d 
full join inscriptos i on d.CODIGO = i.CODIGODEPORTE
group by d.nombre, d.profesor;

drop table deportes;
 drop table inscriptos;

 create table deportes(
  codigo number(2),
  nombre varchar2(30),
  profesor varchar2(30)
 );

 create table inscriptos(
  documento char(8),
  codigodeporte number(2),
  matricula char(1) --'s'=paga; 'n'=impaga
 );

 alter table deportes
  add constraint PK_deportes
  primary key(codigo);

 alter table inscriptos
  add constraint PK_inscriptos
  primary key(documento,codigodeporte);


 insert into deportes values(1,'tenis','Marcelo Roca');
 insert into deportes values(2,'natacion','Marta Torres');
 insert into deportes values(3,'basquet','Luis Garcia');
 insert into deportes values(4,'futbol','Marcelo Roca');
 
 insert into inscriptos values('ins-0001',3,'s');
 insert into inscriptos values('ins-0002',3,'s');
 insert into inscriptos values('ins-0003',3,'n');
 insert into inscriptos values('ins-0004',2,'s');
 insert into inscriptos values('ins-0005',2,'s');
 insert into inscriptos values('ins-0006',4,'n'); 
 insert into inscriptos values('ins-0007',5,'n');

/*
RIGHT JOIN
*/

SELECT c.nombre, c.domicilio, p.nombre as nom_provincia
from provincias p
right JOIN 
clientes c
on c.CODIGOPROVINCIA = p.CODIGO
where p.codigo is not null;

  drop table clientes;
 drop table provincias;

 create table clientes (
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  codigoprovincia number(2),
  primary key(codigo)
 );

 create table provincias(
  codigo number(2),
  nombre varchar2(20),
  primary key (codigo)
 );

 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Corrientes');

 insert into clientes values (101,'Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values (102,'Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values (103,'Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes values (104,'Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values (105,'Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values (106,'Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes values (107,'Garcia Luis','Sucre 475','Santa Rosa',5);

/*
LEFT JOIN
*/

SELECT * FROM PROVINCIAS ;
SELECT * FROM CLIENTES;

select c.nombre, c.domicilio, c.ciudad, p.nombre as "Provincia"
from provincias p
left join clientes c
on c.codigoprovincia = p.codigo;

SELECT c.nombre, c.domicilio, c.ciudad, p.nombre as "Nombre de Provincia"
from clientes c
join provincias p
on c.CODIGOPROVINCIA = p.CODIGO
order by 3 
group by ciudad;
--borrar tablas existentes
drop table clientes;
drop table provincias;

--crear nuevas tablas
 create table clientes (
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  codigoprovincia number(3)
 );

 create table provincias(
  codigo number(3),
  nombre varchar2(20)
 );

 --configurar restricciones
 alter table clientes
  add constraints UQ_clientes_codigo
  unique (codigo);

 alter table provincias
  add constraints UQ_provincias_codigo
  unique (codigo);

  --insertar registros
 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Corrientes');
 insert into provincias values(4,'Santa Cruz');
 insert into provincias values(null,'Salta');
 insert into provincias values(null,'Jujuy');

 insert into clientes values (100,'Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values (200,'Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values (300,'Garcia Juan','Rivadavia 333','Villa Maria',null);
 insert into clientes values (400,'Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values (500,'Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values (600,'Torres Fabiola','Alem 777','La Plata',5);
 insert into clientes values (700,'Garcia Luis','Sucre 475','Santa Rosa',null);
/*
INNER JOIN
*/
--BORRAR TABLAS ANTERIORES
drop table clientes;
drop table provincias;

--CREAR TABLAS
 create table clientes (
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  codigoprovincia number(2)
 );

 create table provincias(
  codigo number(2),
  nombre varchar2(20)
 );

 --INSERTAR DATOS
 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Corrientes');
 insert into provincias values(null,'La Pampa');

 insert into clientes values (1,'Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values (2,'Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values (3,'Garcia Juan','Rivadavia 333','Villa Maria',null);
 insert into clientes values (4,'Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values (5,'Pereyra Lucas','San Martin 555','Cruz del Eje',1);
 insert into clientes values (6,'Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values (7,'Torres Fabiola','Alem 777','Ibera',3);
 insert into clientes values (8,'Garcia Paco','Avellaneda 888','Rawson',5);


 --CONSULTA ENLAZANDO LAS DOS TABLAS:
SELECT * FROM CLIENTES;
SELECT * FROM PROVINCIAS;

SELECT c.nombre, c.domicilio, c.ciudad, p.nombre as "Nombre de Provincia"
from clientes c
join provincias p
on c.CODIGOPROVINCIA = p.CODIGO
order by 3 
group by ciudad;
/*
Index
*/
/*
ALTER TABLE
CHECK
*/
select * from libros;

alter table libros
add constraint ck_libros_precio 
check (precio>=0 and precio<1000);

alter table libros 
add constraint ck_libros_not_null
check (precio is not null and titulo is not null);
/*
ALTER TABLE
UNIQUE
*/

create table usuarios(
  idusuario int not NULL primary key,
  nombre_usuario varchar(30) not null,
  dlave_usuario varchar(20) not null
);

select * from usuarios;
alter table usuarios rename column dlave_usuario to clave_usuario

alter table usuarios add constraint UQ_nombreusuario 
unique  (nombre_usuario)
describe usuarios

insert into USUARIOS values(1, 'usuario1', 'clave1');
insert into USUARIOS values(2, 'usuario2', 'clave2');

alter table usuarios
drop constraint UQ_nombreusuario;


insert into USUARIOS values(3, 'usuario2', 'clave3');
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

