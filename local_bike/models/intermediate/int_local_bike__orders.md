{% docs int_local_bike__orders %}

This model provides an aggregated view of orders, combining data from multiple sources such as order items, staff, and stores. It enriches the order data with the following metrics:
- **Total Order Amount**: The sum of all order items for each order after discount.
- **Total Items**: The total quantity of items in the order.
- **Total Distinct Items**: The count of distinct product types in the order.
- **Staff Information**: Enriches the order with staff-specific data.
- **Store Information**: Enriches the order with store-specific data.

It provides a comprehensive view of each order, allowing for easy analysis of order performance.

{% enddocs %}
