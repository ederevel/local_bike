select 
    order_id, 
    sum(quantity * list_price * (1 - discount)) as total_order_amount 
from {{ ref('stg_local_bike__order_item')}}
group by order_id
having total_order_amount < 0