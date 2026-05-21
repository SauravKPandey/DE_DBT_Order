select
o.orderid,
o.orderdate,
o.customerid,
o.employeeid,
o.storeID,
o.StatusCD,
o.StatusDesc,
o.updated_at,
count(o.orderid) AS OrderCount,
sum(oi.TotalPrice) AS Revenue
from
    {{ref('orders_stg')}} o
join {{ref('OrderItems_stg')}} oi
    on o.orderid = oi.orderid
group by 1,2,3,4,5,6,7,8