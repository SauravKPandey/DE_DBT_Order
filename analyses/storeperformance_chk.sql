select
    cr.storeid,
    sum(ofact.Revenue) AS ActualSales,
    sum(st.salestarget) AS TargetSales

from
{{ref('orders_stg')}} cr
join {{ref('orders_fact')}} ofact
    on cast(cr.customerid as string) = cast(ofact.customerid as string)
    
join {{ref('salestargets')}} st
    on cast(st.storeid as string) = cast(cr.storeid as string)
group by 1