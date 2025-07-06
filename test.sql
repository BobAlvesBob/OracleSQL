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

