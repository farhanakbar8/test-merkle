with
    d1 as (
        select
            cst.customer_id as customer_id,
            inv.film_id as film_id,
            cst.first_name as first_name,
            cst.last_name as last_name,
            cst.email as email,
            rent.rental_date as rental_date,
            rent.return_date as return_date
        from
            rental as rent
            inner join customer as cst on cst.customer_id = rent.customer_id
            inner join inventory as inv on inv.inventory_id = rent.inventory_id
        where
            cst.customer_id = 3
        group by 1,2,3,4,5,6,7
    ),

    d2 as (
        select
            film_id,
            title
        from film
        group by 1,2
    )

select
    d1.customer_id as customer_id,
    d1.first_name as first_name,
    d1.last_name as last_name,
    d1.email as email,
    d2.title as title,
    d1.rental_date as rental_date,
    d1.return_date as return_date
from
    d1
    inner join d2 on d2.film_id = d1.film_id
group by 1,2,3,4,5,6,7;