--1. Tampilkan distinct country dari table country
----- JAWABAN SOAL NOMOR 1 -----
select * from country

SELECT DISTINCT country FROM country;


--2. Gunakan fungsi concat untuk menggabungkan address & address2 dari table address
----- JAWABAN SOAL NOMOR 2 ------
SELECT CONCAT('address', '' ,'address2') AS Gabung_adrress
from address;

--NOTE
--(hasil 1 jika sesuai soal)addressaddres2
--(jika dibalik)address2addres


--3. Tampilkan count payment_id & sum amount untuk masing-masing customer dari table
--payment. Urutkan berdasarkan count transaction terbesar ke terkecil.
-- JAWABAN SOAL NOMOR 3
select *from payment

SELECT customer_id, COUNT(payment_id) AS total_transactions, SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id
ORDER BY total_transactions DESC;


-- 4. Tampilkan count payment_id untuk semua city dengan awalan huruf ‘A’ dari table payment.
-- JAWABAN SOAL NOMOR 4
-- note (city > address > customer > payment)
select * from city
select * from address
select * from customer
select * from payment

SELECT
    c.city,
    COUNT(p.payment_id) AS payment_count
FROM
    payment p
JOIN
    customer cu ON p.customer_id = cu.customer_id
JOIN
    address a ON cu.address_id = a.address_id
JOIN
    city c ON a.city_id = c.city_id
WHERE
    c.city LIKE 'A%'
GROUP BY
    c.city
ORDER BY
    payment_count DESC;



