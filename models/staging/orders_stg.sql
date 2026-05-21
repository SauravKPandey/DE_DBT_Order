{{config(
	materialized='incremental',
	description="This is the staging model for orders data. incremental materialization"
)}}

select
orderid,
orderdate,
customerid,
employeeid,
storeID,
STATUS AS StatusCD,
CASE
  WHEN STATUS = '01' THEN 'ÍN-PROGRESS' WHEN STATUS = '02' THEN 'COMPLETED'
	WHEN STATUS = '03' THEN 'CANCELLED'
	ELSE NULL
end AS StatusDesc,
case when storeid = '1000' then 'online' else 'offline' end as OrderChannel,
updated_at,
current_timestamp AS dbt_updated_at

from {{ source('bronze', 'orders') }}

{% if is_incremental() %}
where updated_at >= (select max(dbt_updated_at) from {{this}})
{% endif %}