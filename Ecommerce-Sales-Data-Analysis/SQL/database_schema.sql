create database ecommerce_db;
use ecommerce_db;

create table Customers(
	customer_id int primary key,
    customer_name varchar(100),
    email varchar(100),
    city varchar(50),
    country varchar(50)
);

create table Products(
	product_id int primary key,
    product_name varchar(100),
    category varchar(50),
    price decimal(10,2)
);

create table Orders (
    order_id int primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10,2),
    foreign key (customer_id) references Customers(customer_id)
);

create table Order_Details (
    order_detail_id int primary key,
    order_id int,
    product_id int,
    quantity int,
    foreign key (order_id) references Orders(order_id),
    foreign key (product_id) references Products(product_id)
);
