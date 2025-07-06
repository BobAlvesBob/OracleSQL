FUNCIONES STRING

select chr(65) from dual;
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

================================
ALIAS
select nombre, laboratorio, precio, precio * 0.7 as "precio con descuento", cantidad 
from medicamentos;
select existente*0.2 from MEDICAMENTOS;

================================

COLUMNAS CALCULADAS

update nao e o mesmo
 select * from libros;

  insert into libros 
 values('Tomarnocu', default, 'Ed. New World', 20.30, DEFAULT);

 insert into libros 
 values('El quijote', 'Cervantes', 'Ed. La Mancha', 15.20, 1);

  insert into libros 
 values('Cien anos de soledad', default, 'Ed. La Mancha', 47, 3);

 select titulo, precio, precio*0.9 from libros;
                      !=
  update libros set precio = precio*0.9;

----CONCATENACION

select titulo ||'-'|| autor from libros;
==========================
DEFAULT

create table libros(
  titulo varchar2(40) not null,
  autor varchar2(30) default 'Desconocido',
  editorial varchar2(40) not null, 
  precio number(5,2),
  cantidad number(3) default 0
  );
  
  insert into libros 
 values('Tomarnocu', default, 'Ed. New World', 20.30, DEFAULT);
  
========================
Comando TRUNCATE

  delete from articulos;
  select * from articulos;
  
  truncate table articulos;

=========================
ADICIONAR FOREIGN KEY
DROP TABLE usuarios;

CREATE SEQUENCE seq_usuario_id START WITH 1 INCREMENT BY 1;

CREATE TABLE usuarios(
    id NUMBER CONSTRAINT pk_usuarios PRIMARY KEY, 
    nombre VARCHAR(20) NOT NULL, 
    clave VARCHAR(20) NOT NULL
);

--TRIGGER PARA INCREMENTO
CREATE OR REPLACE TRIGGER trg_usuario_id
    BEFORE INSERT ON usuarios
    FOR EACH ROW
BEGIN 
    :NEW.id =: seq.usuario_id.NEXTVAL;
END;

====================
APENAS ADICIONAR PK:

ALTER TABLE usuarios ADD(id NUMBER)

UPDATE usuarios SET id = ROWNUM;

ALTER TABLE usuarios MODIFY (id not null);
ALTER TABLE usuarios ADD CONSTRAINT pk_usuarios PRIMARY KEY (id);
=================================


-- Adicionar coluna ID
ALTER TABLE usuarios ADD (id NUMBER);

-- Preencher com valores únicos
UPDATE usuarios SET id = ROWNUM;

-- Tornar NOT NULL e criar PK
ALTER TABLE usuarios MODIFY (id NOT NULL);
ALTER TABLE usuarios ADD CONSTRAINT pk_usuarios PRIMARY KEY (id);

=============================

ADICIONAR COLUNA
-- Uma coluna
ALTER TABLE usuarios ADD (email VARCHAR2(50));

-- Múltiplas colunas
ALTER TABLE usuarios ADD (
    email VARCHAR2(50),
    telefone VARCHAR2(15),
    data_criacao DATE DEFAULT SYSDATE
);

-- Com restrições
ALTER TABLE usuarios ADD (
    email VARCHAR2(50) UNIQUE,
    status VARCHAR2(10) DEFAULT 'ATIVO' NOT NULL
);

========================
MODIFICAR COLUNAS

-- Alterar tamanho
ALTER TABLE usuarios MODIFY (nombre VARCHAR2(50));

-- Adicionar/remover NOT NULL
ALTER TABLE usuarios MODIFY (email NOT NULL);
ALTER TABLE usuarios MODIFY (email NULL);

-- Alterar DEFAULT
ALTER TABLE usuarios MODIFY (status DEFAULT 'INATIVO');


========================
PRIMARY KEY


  create table usuarios(
  nombre varchar2(20) not null, 
  clave varchar2(10) not null, 
  primary key(nombre)
  );
  

  
============================
Valores not null



================================
Valores nulos

 create table libros(
 titulo varchar(30) not null,
 autor varchar(20) not null, 
 editorial varchar(15) null, 
 precio number(5,2) null
 );
 select * from libros;
 
 insert into libros 
 values('El quijote', 'Miguel de Cervantes', null, null);
 

============================

Comando Update

update articulos set nombre = 'impresora' where codigo = 8;
 update articulos set nombre = 'impresora', precio =  '500' where codigo = 2;
 update articulos set precio = 1000;

==========================
Comando Delete

delete from agenda where nombre = 'Juan'


==========================

Operadores Relacionales


 select * from articulos where precio < 1000 AND precio >= 100 AND nombre = 'impresora';
 
 select * from articulos where nombre != 'monitor'


============================
Selecting whit WHERE

select * from articulos where nombre = 'impresora';
select nombre, descripcion from articulos where nombre = 'mouse';


=============================

###DATA TYPES IN ORACLE:###

-NUMBER
-CHAR-> CHAR, VARCHAR2, VARCHAR, NCHARVARCHAR2, NVARCHAR2
-LONG
-DATE
-RAW -> BLOB, CLOB, NCLOB
-ROW ID

==================
COMANDO

CREATE USER "CURSO_ORACLE" IDENTIFIED BY "bob";

GRANT CONNECT, RESOURCE TO "CURSO_ORACLE"

CREATE USER usertest2 IDENTIFIED BY bob;

ALTER USER testuser2 DEFAULT TABLESPACE USERS;
ALTER USER testuser2 TEMPORARY TABLESPACE TEMP;
ALTER USER testuser2 QUOTA UNLIMITED ON SYSTEM;

====================


SHOW CON_NAME;

ALTER SESSION SET CONTAINER = CDB$ROOT;

SHOW CON_NAME;

-- AGORA no lugar certo (CDB$ROOT):
CREATE PLUGGABLE DATABASE projeto_teste
ADMIN USER admin IDENTIFIED BY bob
FILE_NAME_CONVERT = 
('/opt/oracle/oradata/XE/pdbseed/',
'/opt/oracle/oradata/XE/projeto_teste/');

-- Abrir a PDB para permitir conexões:
ALTER PLUGGABLE DATABASE projeto_teste OPEN;
=============================





CRIAR CONTAINER QUE NAO SEJA O INICIAL:
-- Conectado no CDB como sysdba:
CREATE PLUGGABLE DATABASE nova_pdb 
FROM PDB$SEED
FILE_NAME_CONVERT = ('/opt/oracle/oradata/XE/pdbseed/', 
                     '/opt/oracle/oradata/XE/nova_pdb/');

-- Abrir a PDB para uso:
ALTER PLUGGABLE DATABASE nova_pdb OPEN;

-- Ver todas as PDBs disponíveis:
SHOW PDBS;

-- Ou mais detalhado:
SELECT con_id, name, open_mode FROM v$containers;

========================

SHOW CON_NAME;

ALTER SESSION SET CONTAINER = XEPDB1;

SELECT 
  SYS_CONTEXT('USERENV', 'CON_NAME') AS container_atual,
  USER AS usuario_atual
FROM DUAL;

==============================



PARA CADA NOVO PROJETO:

# 1. Criar usuário no Oracle
sudo docker exec -it oracle-xe bash -c "
echo 'ALTER SESSION SET CONTAINER = XEPDB1;
CREATE USER NOME_PROJETO IDENTIFIED BY senha123;
GRANT CONNECT, RESOURCE TO NOME_PROJETO;
ALTER USER NOME_PROJETO QUOTA UNLIMITED ON USERS;' | sqlplus / as sysdba
"

# 2. Criar conexão no SQL Developer
No SQL Developer:
Connection Name: NOME_PROJETO
Username: NOME_PROJETO  
Password: senha123
Service Name: XEPDB1

========================

criar usuario


create user miusuario identified by bob
default tablespace  system
temporary tablespace temp
quota unlimited on system;

grant create session to miusuario;

=========================

create table usuario(
idusuario int,
nombre char(10),
fecha_nacimiento date,
telefono char(10),
salario number(6,2)
)

create table empleado(
id_empleado int not null,
nombre varchar2(20),
direccion varchar2(50),
id_documento varchar2(10),
sueldo number(6,2),
fecha_nacimiento date
);


select * from empleado

describe empleado