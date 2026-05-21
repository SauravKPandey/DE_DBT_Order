{{config(
    materialized='table',
    schema='ops_DataMart_gold'
)}}

select
    os.customerid,
    cs.customer_name,
    sum(os.OrderCount) AS OrderCount,
    sum(os.Revenue) AS Revenue
from
    {{ref('orders_fact')}} os
join {{ref('customers_stg')}} cs
    on os.customerid = cs.customerid
group by 1,2