select 
    o.order_id,
    o.order_date,
    c.customer_id,
    c.customer_name,
    c.city,
    c.country,
    p.product_id,
    p.product_name,
    p.category,
    p.price,
    od.quantity,
    (p.price * od.quantity) as total_amount
from Customers c
join Orders o 
    on c.customer_id = o.customer_id
join Order_Details od 
    on o.order_id = od.order_id
join Products p 
    on od.product_id = p.product_id;

-- Total Revenue
select 
    p.product_name,
    sum(p.price * od.quantity) AS total_revenue
from Products p
join Order_Details od 
    on p.product_id = od.product_id
group by p.product_name
order by total_revenue desc;

-- Top-selling Products
select p.product_name, sum(od.quantity) as total_sold
from Products p
join Order_Details od on p.product_id = od.product_id
group by p.product_name
order by total_sold desc;

-- Monthly Sales Trend
select 
    date_format(order_date, '%M-%Y') as month,
    sum(total_amount) AS monthly_sales
from Orders
group by date_format(order_date, '%M-%Y')
order by month;

-- Customer-Wise Sales
select c.customer_name, sum(o.total_amount) as total_spent
from Customers c
join Orders o on c.customer_id = o.customer_id
group by c.customer_name;

select 
    c.city,
    sum(p.price * od.quantity) AS city_revenue
from Customers c
join Orders o 
    on c.customer_id = o.customer_id
join Order_Details od 
    on o.order_id = od.order_id
join Products p 
    ON od.product_id = p.product_id
group by c.city
order by city_revenue desc;
