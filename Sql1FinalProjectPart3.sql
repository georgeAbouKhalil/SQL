/*חלק ג*/

/*שאילתא שמראה את שלוש המוצרים שיש להם את הכמות הכי גבוהה ומעל 15*/
/*Top/Top percent*/
select top 3*
from pro_Order
left join  "order"
on  pro_Order.order_num="order".order_num and pro_Order.quantity>15 
order by quantity desc

/*שאילתא שממוינת לפי שתיי עמודות ורואים את ה20 הקונים הראשונים */
/*מיון על פי 2 עמודות*/
select *
from Subscriber
left join "order"
on Subscriber.sub_id="order".sub_id
where "order".order_num between 1 and 20
order by subscriber.sub_address,Subscriber.sub_name


/*שאילתא של שרשור של שתיי עמודות עמודה של שם ושם משפחה ומופיע עמודה חדשה בשם המלא ממוינים לפי כתובת המנוי*/
select *,sub_name+' '+sub_lastName as fullname
from Subscriber
where Subscriber.sub_name like '%a%' OR Subscriber.sub_name like '%e%'
order by sub_address

/*שאילתא של קסטינג שמוסיפה עמודה של תאריך לידה של יום הולדת*/
/*Casting*/
select *, sub_name+' '+sub_lastName as fullname,'mybirthdy is: ' +convert(varchar(30),birthday) as 'my birthday'
from Subscriber


 /*תת שאילתא שמחזירה את ההזמנות שיש בהם מוצרי אורגנים וטבעונים*/
 /*תת שאילתא –*/
select  *
from "order" where order_num in
(select Product.order_num
from Product
where Product.Subcat_name= 'organic & vegan')

/*תת שאילתא שמראה את כל המוצרים שיש עליהם הנחות של הבלאק פריידי*/
/*תת שאילתא –*/
select *
from ProDisc where dis_num in
(select Discount.dis_num
from Discount
where Discount.dis_name='black friday')


/*שאילתא שמראה את המוצרים של החלבים והירקות והם ממוינים לפי מספר מוצר*/
/*דברים של מרובה ב*/
select *
from "Product" 
left join ProDisc
on Product.product_num=ProDisc.product_num
where Product.Subcat_name in ('diary','vegetables')
order by product.product_num

/**********************************************************************************/
/*שאילתא שמראה את כל המוצרים שאין עליהם הנחות*/
select *
from Product
left join ProDisc
on Product.product_num=ProDisc.product_num
where ProDisc.product_num is null

/*use ProjectSql*/
select *
from Category

select *
from SubCategory

select *
from "Branch"

select *
from Subscriber

select *
from ProDisc

select *
from Discount

select *
from Product

select *
from "order"

select *
from pro_Order

/*order name branch name*/

select "order".order_name,Branch.branch_name
from "order"
left join Branch
on "order".branch_num=Branch.branch_num

select * from Branch select * from "order"


