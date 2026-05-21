select orderID
from {{ref('orders_fact')}}
where Revenue < 0