This readme is shows the solution of the business requirements that I have solved

STEP 1 :
/* Find a list of order IDs where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table. */


posey=# SELECT id FROM orders WHERE gloss_qty > 4000 OR  poster_qty > 4000;
  id  
------
  362
  731
 1191
 1913
 1939
 3778
 3858
 3963
 4016
 4230
 4698
 4942
 5791
 6590
(14 rows)

STEP 2 :
/* Write a query that returns a list of orders where the standard_qty is zero and 
either the gloss_qty or poster_qty is over 1000. */

posey=# SELECT id FROM orders WHERE standard_qty = 0 and (gloss_qty > 1000 OR  poster_qty > 1000);
 id 
----
(0 rows)

STEP 3
/* Find all the company names that start with a 'C' or 'W'
, and where the primary contact contains 'ana' or 'Ana', but does not contain 'eana'. */

posey=#  SELECT name FROM accounts WHERE  (name LIKE 'C%' OR name LIKE 'W%') AND (primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') AND primary_poc LIKE '%an
a%' and primary_poc NOT LIKE '%eana%'; 
  name   
---------
 Comcast
(1 row)

STEP 4 :
/* Provide a table that shows the region for each sales rep along with their associated accounts. Your final table should include three columns: the region name,
 the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) by account name. */
posey=# SELECT r.name as region ,s.name as sales_rep_name ,a.name as account_name 
FROM sales_reps s
LEFT JOIN region r 
ON s.region_id = r.id 
LEFT JOIN accounts a 
ON s.id = a.sales_rep_id
ORDER BY account_name;

 region   |    sales_rep_name     |            account_name             
-----------+-----------------------+-------------------------------------
 Northeast | Sibyl Lauria          | 3M
 Southeast | Earlie Schleusner     | ADP
 Southeast | Moon Torian           | AECOM
 Southeast | Calvin Ollison        | AES
 Northeast | Elba Felder           | AIG
 Northeast | Necole Victory        | AT&T
 Midwest   | Julie Starr           | AbbVie
 Midwest   | Chau Rowles           | Abbott Laboratories
 West      | Marquetta Laycock     | Advance Auto Parts
 Northeast | Renetta Carew         | Aetna
 Midwest   | Cliff Meints          | Aflac
 West      | Georgianna Chisholm   | Air Products & Chemicals
 Midwest   | Chau Rowles           | Alcoa
 Northeast | Julia Behrman         | Allstate
 West      | Georgianna Chisholm   | Ally Financial
 Northeast | Tia Amato             | Alphabet
 Midwest   | Charles Bidwell       | Altria Group
 Northeast | Nakesha Renn          | Amazon.com
 Northeast | Samuel Racine         | American Airlines Group
 Southeast | Earlie Schleusner     | American Electric Power
 Northeast | Julia Behrman         | American Express
 West      | Hilma Busick          | American Family Insurance Group
 Southeast | Vernita Plump         | Ameriprise Financial
 Northeast | Ayesha Monica         | AmerisourceBergen
 Midwest   | Delilah Krum          | Amgen
 West      | Georgianna Chisholm   | Anadarko Petroleum
 Northeast | Ayesha Monica         | Anthem
 Northeast | Michel Averette       | Apple
 West      | Arica Stoltzfus       | Applied Materials
 Southeast | Vernita Plump         | Aramark
 Northeast | Gianna Dossey         | Archer Daniels Midland
 Midwest   | Charles Bidwell       | Arrow Electronics
 West      | Arica Stoltzfus       | Assurant
 Midwest   | Delilah Krum          | AutoNation
 West      | Dawna Agnew           | AutoZone
 West      | Dawna Agnew           | Autoliv
 West      | Arica Stoltzfus       | Avis Budget Group
 Northeast | Elna Condello         | Avnet
 West      | Marquetta Laycock     | BB&T Corp.
 Southeast | Maren Musto           | Baker Hughes
 West      | Dawna Agnew           | Ball
:
PREVIEW

