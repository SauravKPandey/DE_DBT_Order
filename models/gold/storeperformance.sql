select
    cr.storeid,
    sum(ofact.Revenue) AS ActualSales,
    sum(st.salestarget) AS TargetSales

from
{{ref('orders_stg')}} cr
join {{ref('orders_fact')}} ofact
    on cr.customerid = ofact.customerid
    
join {{ref('salestargets')}} st
    on st.storeid = cr.storeid
group by 1