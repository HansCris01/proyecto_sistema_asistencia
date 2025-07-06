create database bdAsistencia;
use bdAsistencia;

create table Usuario(
codigo_usuario int identity(1,1) primary key,
nombre_usuario varchar(25) not null,
clave varbinary(100) not null,
estado bit not null
);

create table estado_personal(
 codigo_estado_personal int identity(1,1) primary key,
 estado varchar(25) not null
);

create table tipo_contrato(
codigo_tipo_contrato int identity(1,1) primary key,
contrato varchar(30) not null
);


create table personal(
codigo_personal int identity(1,1) primary key,
nombre varchar(30) not null,
apellido_paterno varchar(30) not null,
apellido_materno varchar(30) not null,
dni char(8) not null,
codigo_estado_personal int,
codigo_tipo_contrato int,

constraint FK_estado_personal foreign key (codigo_estado_personal) references estado_personal(codigo_estado_personal),
constraint FK_tipo_contrato foreign key (codigo_tipo_contrato) references tipo_contrato(codigo_tipo_contrato)
);

create table estado_asistencia(
codigo_estado_asistencia int identity(1,1) primary key,
estado varchar(25) not null
);

create table asistencia(
 codigo_asistencia int identity(1,1) primary key,
 fechahora datetime not null,
 codigo_personal int not null,
 codigo_estado_asistencia int not null, 
 estado bit,

 constraint FK_personal foreign key (codigo_personal) references personal(codigo_personal),
 constraint FK_estado_asistencia foreign key (codigo_estado_asistencia) references estado_asistencia(codigo_estado_asistencia)
);

insert into estado_asistencia (estado) values ('Puntual');
insert into estado_asistencia (estado) values ('Tarde');
insert into estado_asistencia (estado) values ('Falto');

insert into estado_personal (estado) values ('Despedido');
insert into estado_personal (estado) values ('Vacaciones');
insert into estado_personal (estado) values ('Trabajando');

insert into tipo_contrato (contrato) values ('Recibo por honorario');
insert into tipo_contrato (contrato) values ('Planilla');

select * from estado_asistencia;

select * from estado_personal;




