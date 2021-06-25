--solution 1
select count(*) 
from film 
where description 
like '%Astronaut%';

--solution 2
select count(*) 
from film 
where rating = 'R'
and replacement_cost between 5 and 15;

--solution 3
select s.staff_id, concat(s.first_name, ' ', s.last_name) as fullname, count(p.payment_id) as "total order handled", sum(p.amount) as "total amount handled"
from payment p join staff s on p.staff_id = s.staff_id 
group by s.staff_id ;

--solution 4
select rating, avg(replacement_cost) as "average replacement cost"
from film
group by rating;

--solution 5
select concat(first_name, ' ', last_name) as fullname, email, sum(amount) as total_spending
from customer c join payment p on c.customer_id = p.customer_id 
group by c.customer_id 
order by total_spending desc 
limit 5;

--solution 6
select f.title, f.film_id, i.store_id, count(f.film_id) as film_copies 
from inventory i join film f on i.film_id = f.film_id 
group by i.store_id, f.film_id 
order by f.film_id asc; 

--solution 7
select concat(c.first_name, ' ', c.last_name) fullname, c.email 
from customer c join payment p on c.customer_id = p.customer_id 
group by fullname, c.email
having count(*) >= 40;