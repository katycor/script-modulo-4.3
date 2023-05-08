//INTEGRANTES
KATHERINE CORDERO
LUIS SEPULVEDA
DIEGO AEDO
DIEGO LOPEZ
ANDRES 



/*Agregue 5 proveedores a la base de datos. En general, los
proveedores venden muchos productos*/

 CREATE TABLE proveedores (
  id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
  representante_legal VARCHAR(50) NOT NULL,
  nombre_corporativo VARCHAR(50) NOT NULL,
  telefono_1 VARCHAR(45) NOT NULL,
  telefono_2 VARCHAR(45) NOT NULL,
  nombre_telefono VARCHAR(50) NOT NULL,
  categoria_productos VARCHAR(255) NOT NULL,
  correo_proveedor VARCHAR(50) NOT NULL
  );	
  
  //Agregue 5 proveedores a la base de datos.
  
  INSERT INTO proveedores (id_proveedor, representante_legal, nombre_corporativo, telefono_1, telefono_2, nombre_telefono, categoria_productos,correo_proveedor) VALUES 
(1, 'Jose Cedeno', 'Electrónicos S.A.', '+1 (555) 123-4567', '+1 (555) 987-6543', 'Juanita González', 'Electrónicos', 'jose.deno@electronicos.com'),
(2, 'Stephanie Castro', 'Tecnología Móvil S.A.', '+1 (555) 555-1212', '+1 (555) 555-3434', 'Pedro García', 'Electrónicos tecnologicos', 'stephanie.castro@tecnologiamovil.com'),
(3, 'Roberto Martinez', 'Insumos Electrónicos S.A.', '+1 (555) 222-2222', '+1 (555) 333-3333', 'María Martínez', 'Insumos Electrónicos', 'robert.martinez@insumoselectronicos.com'),
(4, 'Tatiana Garcia', 'Tecnología de la Información S.A.', '+1 (555) 444-4444', '+1 (555) 555-5555', 'Juan Pérez', 'Tecnología de la Información', 'tatiana.garcia@tecnologiadelainformacion.com'),
(5, 'Jorge Rendon', 'Computadoras S.A.', '+1 (555) 777-7777', '+1 (555) 888-8888', 'María Fernández', 'Computadoras', 'jorge.rendon@computadoras.com');

//crear tabla clientes
 CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nombre_cliente VARCHAR(50) NOT NULL,
  apellido_cliente VARCHAR(50) NOT NULL,
  direccion_cliente VARCHAR(45) NOT NULL
  );	
  
  /*ingresemos solo 5 para probar la nueva base de datos. Cada cliente tiene un nombre, apellido, dirección (solo pueden ingresar una).
  INSERT INTO clientes (id_cliente, nombre_cliente, apellido_cliente, direccion_cliente)*/
VALUES 
(1, 'Ximena', 'Pérez', 'Calle Loto 123'),
(2, 'Marisol', 'García', 'Avenida Cruz 456'),
(3, 'Leoncio', 'Hernández', 'Calle Marina 789'),
(4, 'Andreina', 'Sánchez', 'Avenida Mira 012'),
(5, 'Pablo', 'Martínez', 'Calle Avion 345');

/*TeLoVendo tiene diferentes productos. Ingrese 10 productos y su respectivo stock. Cada producto tiene
información sobre su precio, su categoría, proveedor y color. Los productos pueden tener muchos
proveedores.*/

/* crear tabla de productos*/

CREATE TABLE productos (
  id_producto INT PRIMARY KEY AUTO_INCREMENT,
  nombre_producto VARCHAR(50) NOT NULL,
  stock INT NOT NULL,
  precio INT NOT NULL,
  color VARCHAR(45) NOT NULL,
  categoria_productos VARCHAR(255) NOT NULL,
  id_proveedor INT NOT NULL 
  );	
  
/*TeLoVendo tiene diferentes productos. Ingrese 10 productos y su respectivo stock. Cada producto tiene
información sobre su precio, su categoría, proveedor y color. Los productos pueden tener muchos
proveedores.*/
INSERT INTO productos (nombre_producto, stock, precio, color, categoria_productos, id_proveedor)
VALUES 
('iPhone 13', 100, 999, 'Negro', 'Electrónica', 1),
('Samsung Galaxy S21', 75, 799, 'Gris', 'Electrónica', 2),
('Sony PlayStation 5', 50, 499, 'Blanco', 'Videojuegos', 3),
('Xbox Series X', 40, 499, 'Negro', 'Videojuegos', 4),
('Nintendo Switch', 60, 299, 'Rojo/Azul', 'Videojuegos', 5),
('iMac 24"', 25, 1299, 'Plata', 'Electrónica', 1),
('Dell XPS 13', 30, 1199, 'Negro', 'Electrónica', 2),
('HP Pavilion', 20, 899, 'Blanco', 'Electrónica', 3),
('Asus ROG Zephyrus G15', 15, 1699, 'Gris', 'Electrónica', 4),
('LG Gram 16"', 10, 1299, 'Negro', 'Electrónica', 5);


/*Cuál es la categoría de productos que más se repite.*/
SELECT categoria_productos, COUNT(*) as total
FROM productos
GROUP BY categoria_productos
ORDER BY total DESC
LIMIT 1;

/*Cuáles son los productos con mayor stock*/
SELECT nombre_producto, stock
FROM productos
ORDER BY stock DESC
LIMIT 10;

/*Qué color de producto es más común en nuestra tienda.*/
SELECT color, COUNT(*) as total
FROM productos
GROUP BY color
ORDER BY total DESC
LIMIT 1;

/*Cual o cuales son los proveedores con menor stock de productos.*/
SELECT p.id_proveedor, p.nombre_corporativo, SUM(pr.stock) as total_stock
FROM proveedores p
JOIN productos pr ON p.id_proveedor = pr.id_proveedor
GROUP BY p.id_proveedor, p.nombre_corporativo
ORDER BY total_stock ASC;


/*Cambien la categoría de productos más popular por ‘Electrónica y computación’.*/
SELECT categoria_productos, COUNT(*) as total
FROM productos
GROUP BY categoria_productos
ORDER BY total DESC
LIMIT 1;
UPDATE productos
SET productos.categoria_productos = 'Electrónica y computación'
WHERE productos.categoria_productos = 'Electrónica';
