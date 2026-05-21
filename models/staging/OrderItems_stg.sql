select
orderitemid,
orderid,
productid,quantity,
UNITPRICE,
quantity*UNITPRICE AS TotalPrice,
updated_at

from {{ source('bronze', 'order_items') }}