{{ config(materialized = 'table') }}
with customerorders as (
    select 
    c.CUSTOMERID,
    concat(c.FIRSTNAME,c.LASTNAME) as CUSTOMER_NAME,
    count(o.ORDERID) AS ORDER_COUNT


     from
    `ops_DataMart_SourceTable.CUSTOMERS` c
    join   `ops_DataMart_SourceTable.ORDERS` o
    on c.customerid = o.customerid
    GROUP BY 1,2
    ORDER BY 1 DESC
)
select * from customerorders