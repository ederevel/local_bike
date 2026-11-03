SELECT
    order_date as date,
    store_name,
    staff_name,
    count(distinct order_id) as total_daily_number_of_orders,
    sum(total_order_amount) as total_daily_sales,
    avg(total_order_amount) as average_order_amount,
    avg(total_items) as average_daily_total_items_sold,
    avg(total_distinct_items) as daily_average_distinct_items_sold
from {{ ref('int_local_bike__orders')}}
group by date, store_name, staff_name
order by date, store_name, staff_name


