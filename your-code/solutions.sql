/*CHALLENGE 1 */

SELECT authors.au_id, au_fname, au_lname, title, pub_name
FROM authors
INNER JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
INNER JOIN titles
	ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
	ON titles.pub_id = publishers.pub_id;

SELECT COUNT(*) 
FROM titleauthor; #Misma cantidad de rows que la query anterior #

/*CHALLENGE 2 */

SELECT authors.au_id, au_fname, au_lname, pub_name, COUNT(authors.au_id) AS title_counts
FROM authors
INNER JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
INNER JOIN titles
	ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
	ON titles.pub_id = publishers.pub_id
GROUP BY pub_name;


