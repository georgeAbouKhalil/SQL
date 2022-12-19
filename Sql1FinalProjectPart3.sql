/*��� �*/

/*������ ����� �� ���� ������� ��� ��� �� ����� ��� ����� ���� 15*/
/*Top/Top percent*/
select top 3*
from pro_Order
left join  "order"
on  pro_Order.order_num="order".order_num and pro_Order.quantity>15 
order by quantity desc

/*������ ������� ��� ���� ������ ������ �� �20 ������ �������� */
/*���� �� �� 2 ������*/
select *
from Subscriber
left join "order"
on Subscriber.sub_id="order".sub_id
where "order".order_num between 1 and 20
order by subscriber.sub_address,Subscriber.sub_name


/*������ �� ����� �� ���� ������ ����� �� �� ��� ����� ������ ����� ���� ��� ���� ������� ��� ����� �����*/
select *,sub_name+' '+sub_lastName as fullname
from Subscriber
where Subscriber.sub_name like '%a%' OR Subscriber.sub_name like '%e%'
order by sub_address

/*������ �� ������ ������� ����� �� ����� ���� �� ��� �����*/
/*Casting*/
select *, sub_name+' '+sub_lastName as fullname,'mybirthdy is: ' +convert(varchar(30),birthday) as 'my birthday'
from Subscriber


 /*�� ������ ������� �� ������� ��� ��� ����� ������� ��������*/
 /*�� ������ �*/
select  *
from "order" where order_num in
(select Product.order_num
from Product
where Product.Subcat_name= 'organic & vegan')

/*�� ������ ����� �� �� ������� ��� ����� ����� �� ����� ������*/
/*�� ������ �*/
select *
from ProDisc where dis_num in
(select Discount.dis_num
from Discount
where Discount.dis_name='black friday')


/*������ ����� �� ������� �� ������ ������� ��� ������� ��� ���� ����*/
/*����� �� ����� �*/
select *
from "Product" 
left join ProDisc
on Product.product_num=ProDisc.product_num
where Product.Subcat_name in ('diary','vegetables')
order by product.product_num

/**********************************************************************************/
/*������ ����� �� �� ������� ���� ����� �����*/
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


