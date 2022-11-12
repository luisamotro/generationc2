-- creacion de tabla proveedores

CREATE TABLE proveedores(
	id INT primary KEY NOT NULL AUTO_INCREMENT,
	nombre varchar(100) NOT NULL,
	telefono INT NOT NULL
);

-- insercion de valores a proveedores
insert into proveedores (nombre,telefono)
values 
("Prolact",123456),
("Proaseo",223456),
("Proaba",323456),
("Procar",423456),
("profer",234568)
;

-- creacion de tabla productos
CREATE TABLE productos(
	id INT primary KEY NOT NULL AUTO_INCREMENT,
	nombre varchar(100) NOT NULL,
	cantidad INT NOT null,
	precio INT not null,
	tipoproducto_id INT not null,
	foreign key (tipoproducto_id) references tipoproductos(id)
);

-- insercion de datos a productos
insert into productos (nombre,cantidad,precio,tipoproducto_id)
values 
("yogurt",20,300,1),
("cloro",12,2000,2),
("arroz",15,1500,3),
("pollo",10,4000,4),
("helado",10,3000,1),
("repisa",2,5000,5)
;

-- creacion de tabla tipoproductos
CREATE TABLE tipoproductos(
	id INT primary KEY NOT NULL AUTO_INCREMENT,
	categoria varchar(100) NOT null,
	proveedor_id INT not null,
	foreign key (proveedor_id) references proveedores(id)
);

-- insercion de datos en tipoproductos
insert into tipoproductos (categoria, proveedor_id)
values 
("lacteos",1),
("aseo",2),
("abarrotes",3),
("carnes",4),
("madera",5),
("fierro",5)
;

-- creacion de tabla pedidos
CREATE TABLE pedidos(
	id INT primary KEY NOT NULL AUTO_INCREMENT,
	fecha date NOT null,
	monto INT not null,
	cliente varchar(100) not null
);

-- insercion de valores en pedidos
insert into pedidos (fecha,monto,cliente)
values 
(220101,2000,"diego"),
(220201,1500,"juan"),
(220301,4000,"pedro"),
(220601,5000,"esteban"),
(220801,3000,"maria")
;
insert into pedidos (fecha,monto,cliente)
values (221001,2000,"luisa");

-- creacion de tabla intermedia/relacional
create table pedidos_productos(
	id int primary key not null auto_increment,
	producto_id int not null,
	pedido_id int not null,
	foreign key (producto_id) references productos(id),
	foreign key (pedido_id) references pedidos(id)
);

-- insercion de datos a pedidos_productos 
insert into pedidos_productos (pedido_id, producto_id)
values 
(1,2),
(2,3),
(3,4),
(4,5),
(5,1)
;
insert into pedidos_productos  (pedido_id, producto_id)
values (6,1);

-- corroboracion del ingreso de datos
select * from productos;
select * from proveedores;
select * from tipoproducto;
select * from pedidos;
select * from pedidos_productos;

-- consultas 

-- consulta de ganancias anuales y venta para un informe
select SUM(monto) total from pedidos;

-- consulta  que tipo de producto vende el proveedor 5
SELECT t.id FROM tipoproductos t 
INNER JOIN   proveedores p 
ON t.id = p.id;

-- consulta todos los proveedores con los productos que venden
select p.id,p2.id  from proveedores p 
inner join productos p2
on p.id = p2.id;

-- consulta pedidos donde se compraron productos del tipo 1
select p.id  from pedidos p 
inner join productos p2  
on p.id  = p2.id
where p2.id = 1;

















