{% snapshot customers_history %}

    {{ config(
        target_schema='ops_DataMart_snapshots',
        strategy='timestamp',
        unique_key='customerid',
        updated_at='updated_at'
    ) }}

    select * from {{ source('bronze', 'cust') }}

{% endsnapshot %}