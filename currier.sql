create database currier;
use currier;

create table Cliente( 
	IdClien int not null,
	nombre varchar(30),
	apellido varchar(30),
	direccion varchar(30),
	Sexo char(1) check(sexo in('F','M')),
	usuario int 
	constraint pk_cliente primary key (IdClien)
	constraint fk_usuario foreign key (usuario) references usuario(IdUser) 
)

create table perfil(
	idProfile int not null,
	tipo varchar(30)
)

Create table usuario(
	idUser int not null,
	usuario varchar(30) not null unique index inx_user,
	contraseña varchar(30) not null,
	perfil int
	constraint pk_user primary key(idUser)
	constraint fk_profile foreign key (perfil) references perfil(idProfile)
)

create table tipo_paquete(
	idTipo int not null,
	tipo varchar(30)
	constraint pk_tipo primary key (idTipo)
)

create table recogida(
	
	idRecogida int not null,
	Descripcion varchar(30),
	fecha date default Getdate(),
	ubicacion varchar(30),
	Tipo_pack int,
	estado int
	constraint pk_recogida primary key(idRecogida)
	constraint fk_tipo foreign key(Tipo_pack) references tipo_paquete(idTipo)
)