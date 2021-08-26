#Qué titulos ha publicado cada autor y en qué tutoriales?
SELECT  b.au_id as Id_autor, b.au_lname as apellido, b.au_fname as nombre, a.title as titulo,  d.pub_name as editorial
FROM titles a 
INNER JOIN titleauthor c on a.title_id = c.title_id
INNER JOIN authors b on b.au_id = c.au_id
INNER JOIN publishers d on a.pub_id =d.pub_id;

#------------ ejercio 2------
SELECT  b.au_id as Id_autor, b.au_lname as apellido, b.au_fname as nombre, count(a.title_id) as cantidad,  d.pub_name as editorial
FROM titles a 
INNER JOIN titleauthor c on a.title_id = c.title_id
INNER JOIN authors b on b.au_id = c.au_id
INNER JOIN publishers d on a.pub_id =d.pub_id
group by  b.au_id , b.au_lname,d.pub_name
order by cantidad;

#------------ ejercio 3------
SELECT b.au_id as Id_autor, b.au_lname as apellido, b.au_fname as nombre, count(sa.title_id) as numero_ventas
FROM sales sa
inner join titles a on sa.title_id = a.title_id
INNER JOIN titleauthor c on a.title_id = c.title_id
INNER JOIN authors b on b.au_id = c.au_id
group by  b.au_id , b.au_lname
order by numero_ventas desc
LIMIT 3;
#------------ ejercio 3------
SELECT b.au_id as Id_autor, b.au_lname as apellido, b.au_fname as nombre, count(sa.title_id) as numero_ventas
FROM sales sa
inner join titles a on sa.title_id = a.title_id
INNER JOIN titleauthor c on a.title_id = c.title_id
INNER JOIN authors b on b.au_id = c.au_id
group by  b.au_id , b.au_lname
order by numero_ventas desc;

SELECT b.au_id as Id_autor, b.au_lname as apellido, b.au_fname as nombre,  ((c.royaltyper/count(a.title_id) ) +( c.royaltyper/count(sa.title_id)) )as PROFIT, c.royaltyper
FROM sales sa
inner join titles a on sa.title_id = a.title_id
INNER JOIN titleauthor c on a.title_id = c.title_id
INNER JOIN authors b on b.au_id = c.au_id
group by  b.au_id , b.au_lname
order by PROFIT desc







/*
select titles.title,authors.au_lname, authors.au_fname, publishers.pub_name
from titles, authors, titleauthor,publishers
where titles.title_id = titleauthor.title_id
and  authors.au_id = titleauthor.au_id 
and publishers.pub_id = titles.pub_id
*/

