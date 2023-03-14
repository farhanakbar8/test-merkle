with
    d1 as (
        select
            rent.rental_id as rental_id,
            rent.customer_id as customer_id,
            rent.inventory_id as inventory_id,
            rent.rental_date as rental_date,
            rent.return_date as return_date,
            pay.payment_id as payment_id,
            pay.amount as amount,
            sum(pay.amount) as total_revenue
        from rental as rent
        inner join payment as pay on rent.rental_id = pay.rental_id
        group by 1,2,3,4,5,6,7
    ),

    d2 as (
        select
            inv.store_id as store_id,
            inv.film_id as film_id,
            inv.inventory_id as inventory_id,
            film.title as movie_title,
            film.rental_rate as movie_rental_rate
        from inventory as inv
        inner join film on inv.film_id = film.film_id
        group by 1,2,3,4,5
    )

select
    d2.store_id as store_id,
    sum(d1.total_revenue) as total_revenue,
    d1.payment_id as payment_id,
    d1.amount as amount,
    d2.movie_title as movie_title,
    d2.movie_rental_rate as movie_rental_rate
from d1
inner join d2 on d1.inventory_id = d2.inventory_id
where
    substring_index(d1.rental_date, ' ', 1) between '2000-01-01' and '2010-01-01'
    and d2.store_id = 1
group by 1,3,4,5,6;