select
customerid,
firstname,
lastname,
email,
phone,
Address,
city,
state,
zipcode,
updated_at,
concat(firstname,lastname) as customer_name,
from {{source('bronze','cust')}}