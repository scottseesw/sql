--Week 5 - Wednesday
--Questions



--1. List all customers who live in Texas (use
--JOINs)

SELECT COUNT(*) AS customer_count
FROM customer
JOIN address ON customer.address_id = address.address_id
WHERE address = 'Texas';





--2. Get all payments above $6.99 with the Customer's Full
--Name
SELECT CONCAT(c.First_Name, ' ', c.Last_Name) AS Full_Name, amount
FROM Payment p
INNER JOIN customer c ON p.customer_ID = c.customer_ID
WHERE amount > 6.99;

--3. Show all customers names who have made payments over $175(use
--subqueries)
SELECT CONCAT(First_Name, ' ', Last_Name) AS Customer_Name
FROM Customer
WHERE Customer_ID IN (
    SELECT Customer_ID
    FROM Payment
    WHERE Amount > 175
);
--4. List all customers that live in Nepal (use the city
--table)
SELECT CONCAT(c.First_Name, ' ', c.Last_Name) AS Customer_Name
FROM Customer c
JOIN Address a ON c.Address_ID = a.Address_ID
JOIN City ct ON a.City_ID = ct.City_ID
JOIN Country cn ON ct.Country_ID = cn.Country_ID
WHERE cn.Country = 'Nepal';

--5. Which staff member had the most
--transactions?
SELECT s.Staff_ID, CONCAT(s.First_Name, ' ', s.Last_Name) AS Staff_Name, COUNT(p.Payment_ID) AS Transaction_Count
FROM Staff s
JOIN Payment p ON s.Staff_ID = p.Staff_ID
GROUP BY s.Staff_ID, Staff_Name
ORDER BY Transaction_Count DESC
LIMIT 1;


--6. How many movies of each rating are
--there?
SELECT Rating, COUNT(*) AS Movie_Count
FROM Film
GROUP BY Rating;
--7.Show all customers who have made a single paymenabove $6.99 (Use Subqueries)
SELECT c.first_name, c.last_name, p.amount
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
WHERE p.amount > 6.99
AND (
    SELECT COUNT(*)
    FROM payment p2
    WHERE p2.customer_id = c.customer_id
    AND p2.amount > 6.99
) = 1;

--8. How many free rentals did our stores give away?
SELECT COUNT(*)
FROM rental
WHERE rental_id = 0;















