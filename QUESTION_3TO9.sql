/*QUESTION 3*/
SELECT T2.CUS_GENDER, COUNT(CUS_ID) AS CUSTOMER_COUNT FROM (SELECT T1.CUS_ID,T1.CUS_GENDER,T1.ORD_AMOUNT FROM (
SELECT CUSTOMER.CUS_NAME, CUSTOMER.CUS_GENDER, order1.* FROM CUSTOMER INNER JOIN ORDER1 ON CUSTOMER.CUS_ID= ORDER1.CUS_ID WHERE ORD_AMOUNT >= 3000) AS t1 group by t1.CUS_ID ) 
AS T2 GROUP BY T2.CUS_GENDER;

/*QUESTION 4*/
select pro_id
pro_name from product where pro_id in(
select supplier_pricing.pro_id from supplier_pricing where supplier_pricing.pricing_id in
(select order1.pricing_id from order1 where order1.cus_id = 2));

/*QUESTION 5*/
SELECT supplier.* from supplier where supp_id in 
(select supp_id from supplier_pricing group by supp_id having count(pro_id)>1);

/*QUESTION 6*/
with t1 as(select pro_id, min(supp_price) price from supplier_pricing)
select distinct category.cat_id, category.cat_name, product.pro_name, T1.price from t1,
product join category on product.cat_id = category.cat_id;

/*QUESTION 7*/
select PRO_ID, PRO_NAME from product where PRO_ID IN (select PRO_ID from supplier_pricing where PRICING_ID IN(select PRICING_ID from order1 where ORD_DATE > '2021-10-05'));

/*QUESTION 8*/
SELECT CUSTOMER.CUS_NAME, CUSTOMER.CUS_GENDER FROM CUSTOMER WHERE CUSTOMER.CUS_NAME LIKE 'A%' OR CUSTOMER.CUS_NAME LIKE '%A';

/*QUESTION 9*/
CREATE PROCEDURE proc()
BEGIN
select report.supp_id,report.supp_name, report.Average

CASE
WHEN report.Average =5 THEN 'Excellent Service' WHEN report.Average >=4 THEN 'Good Service'
WHEN report.Average >2 THEN 'Average Service'
ELSE 'Poor Service'
END AS Type_of_Service from
(select final.supp_id
supplier.supp_name
final.Average from

(select test2.supp_id
sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
(select supplier_pricing.supp_id
test.ORD_ID
test.RAT_RATSTARS from supplier_pricing inner join

(select order1.pricing_id
rating.ORD_ID
rating.RAT_RATSTARS from order1 inner join rating on rating.ord_id = order1.ord_id ) as test on test.pricing_id = supplier_pricing.pricing_id)

as test2 group by supplier_pricing.supp_id)
as final inner join supplier where final.supp_id = supplier.supp_id) as report;
END &&
DELIMITER ;
call proc();