select
    str.store_id as store_id,
    adr.address as store_address,
    count(cst.store_id) as customer_count,
    str.address_id as address_id,
    adr.address as address1,
    adr.address2 as address2,
    adr.district as district,
    adr.city_id as city_id,
    adr.postal_code as postal_code,
    adr.phone as phone,
    adr.location as store_location
from
    store as str
    inner join address as adr on str.address_id = adr.address_id
    inner join customer as cst on str.store_id = cst.store_id
where
    str.store_id = 1
group by 1,2,4,5,6,7,8,9,10,11;