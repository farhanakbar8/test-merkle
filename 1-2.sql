select
    str.store_id as store_id,
    adr.address as store_address,
    count(cst.store_id) as customer_count
from
    store as str
    inner join address as adr on str.address_id = adr.address_id
    inner join customer as cst on str.store_id = cst.store_id
group by 1,2;