



/* Top 3 values of Total Invoice */

SELECT total 
FROM invoice$
ORDER BY total DESC


/* countries with most Invoices*/

SELECT COUNT(*) AS count, billing_country 
FROM invoice$
GROUP BY billing_country
ORDER BY count DESC


/*  The senior most employee based on job title */

SELECT Top(1) title, last_name, first_name 
FROM employee$
ORDER BY levels DESC


/*  Which city has the best customers? 
Return both the city name & sum of all invoice totals */

SELECT top(1)  billing_city,SUM(total) AS InvoiceTotal
FROM invoice$
GROUP BY billing_city
ORDER BY InvoiceTotal DESC


/* Best customer based on who has spent the most money  
 returns the person who has spent the most money.*/

SELECT top(1) customer$.customer_id, first_name, last_name, SUM(total) AS total_spending
FROM customer$
JOIN invoice$ ON customer$.customer_id = invoice$.customer_id
GROUP BY customer$.customer_id
ORDER BY total_spending DESC


/*  Return all the email, first name, last name, & Genre of all Rock Music listeners. 
ordered alphabetically by email starting with A.*/


SELECT DISTINCT email,first_name, last_name
FROM customer$
JOIN invoice$ ON customer$.customer_id = invoice$.customer_id
JOIN invoice_line$ ON invoice$.invoice_id = invoice_line$.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track$
	JOIN genre$ ON track$.genre_id = genre$.genre_id
	WHERE genre$.name LIKE 'Rock'
)
ORDER BY email


/* Invite the artists who have written the most rock music in dataset. 
Return the Artist name and total track count of the top 10 rock bands. */

SELECT top (10)
artist$.artist_id, artist$.name,COUNT(artist$.artist_id) AS number_of_songs
FROM track$
JOIN album$ ON album$.album_id = track$.album_id
JOIN artist$ ON artist$.artist_id = album$.artist_id
JOIN genre$ ON genre$.genre_id = track$.genre_id
WHERE genre$.name LIKE 'Rock'
GROUP BY artist$.artist_id
ORDER BY number_of_songs DESC



