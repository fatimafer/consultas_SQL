USE jardineria;

/*EJ 1*/
SELECT codigo_oficina, ciudad
FROM oficina;

/*EJ 2*/
SELECT ciudad, telefono
FROM oficina
WHERE pais = 'España';

/*EJ 3*/
SELECT nombre, apellido1, apellido2, email, codigo_jefe
FROM empleado
WHERE codigo_jefe = 7;

/*EJ 4*/
SELECT puesto, nombre, apellido1, apellido2, email, codigo_jefe
FROM empleado
WHERE codigo_jefe IS NULL;

/*EJ 5*/
SELECT nombre, apellido1, apellido2, puesto
FROM empleado
WHERE puesto <> "Representante Ventas";

/*EJ 6*/
SELECT nombre_cliente, pais 
FROM cliente
WHERE pais = "Spain";

/*EJ 7*/
SELECT DISTINCT estado
FROM pedido;

/*EJ 8*/

/*Con funcion YEAR*/
SELECT DISTINCT codigo_cliente, YEAR(fecha_pago) AS anio_pago
FROM pago
WHERE YEAR(fecha_pago) = 2008;

/*Con funcion DATE_FORMAT*/
SELECT DISTINCT codigo_cliente, DATE_FORMAT(fecha_pago, '%Y') AS anio_pago
FROM pago
WHERE DATE_FORMAT(fecha_pago, '%Y') = '2008';

/*Con otra funcion*/
SELECT DISTINCT codigo_cliente, fecha_pago
FROM pago
WHERE fecha_pago LIKE '2008%';

/*otra forma*/
SELECT DISTINCT codigo_cliente, fecha_pago
FROM pago
WHERE fecha_pago BETWEEN '2008-01-01' AND '2008-12-31';

/*EJ 9*/
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega 
FROM pedido
WHERE fecha_entrega > fecha_esperada;

/*EJ 10*/

/*con ADDDATE*/
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega, ADDDATE(fecha_esperada, -2) AS 'fecha_esperada_-2'
FROM pedido
WHERE fecha_entrega <= ADDDATE(fecha_esperada, -2);

/*con DATEDIFF*/
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega, DATEDIFF(fecha_entrega, fecha_esperada) AS dias_diferencia
FROM pedido
WHERE DATEDIFF(fecha_entrega, fecha_esperada) <= -2;


/*EJ 11*/
SELECT codigo_pedido, estado, fecha_entrega
FROM pedido
WHERE estado = 'Rechazado' AND YEAR(fecha_entrega) = 2009;


/*EJ 12*/
SELECT codigo_pedido, estado, fecha_entrega
FROM pedido
WHERE estado = 'Entregado' AND MONTH(fecha_entrega) = 01;

/*EJ 13*/

/*En elo enunciado se pide ordenar el resultado de mayor a menor
Pero no se indica si se ordena por fecha o ID de transaccion
Así que lo hago de las dos maneras*/

/*Ordenado fecha pago*/
SELECT id_transaccion, fecha_pago, forma_pago
FROM pago
WHERE YEAR(fecha_pago) = 2008 AND forma_pago = 'Paypal'
ORDER BY fecha_pago DESC;

/*Ordenado ID TRANSACCION*/
SELECT id_transaccion, fecha_pago, forma_pago
FROM pago
WHERE YEAR(fecha_pago) = 2008 AND forma_pago = 'Paypal'
ORDER BY id_transaccion DESC;


/*EJ 14*/
SELECT DISTINCT forma_pago
FROM pago;

/*EJ 15*/

/*El enunciado especifica productos con más de 100 unidades, 
por lo tanto, no tengo en cuenta productos que sean justo 100 uds.
En la query he pedido que sólo me muestre productos con 101 uds. o más*/
SELECT codigo_producto, nombre, cantidad_en_stock, precio_venta
FROM producto
WHERE gama = 'Ornamentales' AND cantidad_en_stock > 100
ORDER BY precio_venta DESC;

/*EJ 16*/

SELECT codigo_cliente, nombre_cliente, ciudad, codigo_empleado_rep_ventas
FROM cliente
WHERE ciudad = 'Madrid' AND (codigo_empleado_rep_ventas = 11 OR codigo_empleado_rep_ventas = 30);

