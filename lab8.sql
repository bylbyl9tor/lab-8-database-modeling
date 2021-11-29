SELECT pharmacy_order.id,
       product_id,
       (SELECT name
        FROM warehouse.product product_value
        WHERE product_value.id = order_position.product_id) as product_name
FROM warehouse.pharmacy_order
         INNER JOIN warehouse.order_position ON pharmacy_order.id = order_position.medical_order_id
ORDER BY pharmacy_order.id DESC, order_position.product_id DESC
LIMIT 10;

SELECT pharmacy_order.id, pharmacy_order.medical_id, order_position.product_id, order_position.number_of_product
FROM warehouse.pharmacy_order
         INNER JOIN warehouse.order_position ON pharmacy_order.id = order_position.id
WHERE pharmacy_order.id NOT IN (SELECT order_position.medical_order_id FROM order_position)
  AND pharmacy_order.status = 'OPEN'
ORDER BY pharmacy_order.id DESC, product_id DESC
LIMIT 5;

SELECT *
FROM warehouse.pharmacy_warehouse
         INNER JOIN warehouse.product ON pharmacy_warehouse.product_id = product.id
         INNER JOIN providers ON product.provider_id = providers.id
ORDER BY warehouse.product.name DESC
LIMIT 10;

select providers.id, providers.name, product.name from providers
inner join product on providers.id = product.provider_id;

select providers.id, providers.name, count(product.name) as sumsa from providers
inner join product on providers.id = product.provider_id
group by providers.id
