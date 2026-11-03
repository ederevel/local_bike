select
    product.product_id,
    product_name,
    brand_name,
    o.order_id,
    customer_id,
    order_status,
    order_date,
    required_date,
    store.store_id,
    staff.staff_id,
    store_name,
    store.city as store_city,
    concat(staff.first_name, ' ', staff.last_name) as staff_name,
    round(sum(quantity * oi.list_price * (1 - discount)), 2) as total_order_amount,
    sum(quantity) as total_items,
FROM {{ ref('stg_local_bike__orders')}} o
INNER JOIN {{ ref('stg_local_bike__order_item')}} oi on o.order_id = oi.order_id
INNER JOIN {{ ref('stg_local_bike__staffs')}} staff on o.staff_id = staff.staff_id
INNER JOIN {{ ref('stg_local_bike__stores')}} store on o.store_id = store.store_id
INNER JOIN {{ ref('stg_local_bike__products')}} product on oi.product_id = product.product_id
INNER JOIN {{ ref('stg_local_bike__brands')}} brand on product.brand_id = brand.brand_id


group by
    product_id,
    product_name,
    brand_name,
    order_id,
    customer_id,
    order_status,
    order_date,
    required_date,
    store_id,
    staff_id,
    store_name,
    store_city,
    staff_name