SELECT
    order_date as date,
    product_name,
    brand_name,
    store_name,
    staff_name,
    sum(total_order_amount) as total_daily_sales,
    avg(total_order_amount) as average_order_amount,
    sum(total_items) as daily_total_items_sold,
from {{ ref('int_local_bike__products')}}
group by date, product_name, brand_name, store_name, staff_name
order by date, product_name, brand_name, store_name, staff_name