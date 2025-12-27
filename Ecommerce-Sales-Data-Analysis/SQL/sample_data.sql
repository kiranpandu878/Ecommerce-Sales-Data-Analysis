insert into Customers values
(1,'Rahul Sharma','rahul@gmail.com','Bangalore','India'),
(2,'Anita Verma','anita@gmail.com','Hyderabad','India');

insert into Products values
(101,'Laptop','Electronics',55000),
(102,'Headphones','Electronics',2000);

insert into Orders values
(1001,1,'2024-01-10',57000),
(1002,2,'2024-02-15',2000);

insert into Order_Details values
(1,1001,101,1),
(2,1001,102,1),
(3,1002,102,1);
