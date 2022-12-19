/*חלק ב*/
/*שאילתות יצירת הטבלאות*/
create table Category(
Cat_num int primary key,
Cat_name varchar(20),
);
create table SubCategory(
Subcat_name varchar(20) not null primary key,
Cat_num  int references Category(Cat_num),
);
create table "Branch"(
branch_num int not null primary key,
branch_name varchar (20),
branch_address varchar(20),
branch_phone varchar(20),
);
create table Subscriber(
sub_id int not null primary key,
sub_name varchar (20),
sub_lastName varchar (20),
birthday  datetime not null ,
sub_phone varchar (20),
sub_address varchar(20),
);

create table "order"(
order_num int  not null primary key,
order_name varchar(20),
branch_num int not null references Branch(branch_num),
sub_id int not null references Subscriber(sub_id),
);

create table Product(  
product_num int not null primary key,
product_name varchar (20),
order_num int not null references "order"(order_num),
Subcat_name varchar(20) not null references SubCategory(Subcat_name),
);

create table Discount(
dis_num int not null primary key,
dis_name  varchar (20),
);

create table ProDisc(
product_num int not null,
dis_num int not null,
starting_date date,
end_date date,
constraint pk_ProDisc primary key (product_num,dis_num)
);

create table pro_Order(
order_num int not null,
product_num int not null,
quantity varchar(20),
order_date date,
constraint pk_pro_Order primary key (order_num,product_num)
);
/*שאילתות לעדכון סכמה )ALTER:*/
/* הוסף לטבלה מסוימת אילוץ null not על שדה מסוים*/
alter table pro_Order
ALTER COLUMN  quantity int NOT NULL;
/* הוספת מפתחות זרים משני בטבלה מסוימת.*/
alter table ProDisc
add FOREIGN KEY (product_num) references Product(product_num)

alter table ProDisc
add FOREIGN KEY (dis_num) references Discount(dis_num)

alter table pro_Order
add FOREIGN KEY (order_num) references "order"(order_num)

alter table "order"
add FOREIGN KEY (sub_id) references Subscriber(sub_id)



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
/*שאילתות הכנסת הנתונים )INSERT)*/
insert into [Category]([Cat_num],[Cat_name]) values ('1','vegetables&fruits')
insert into [Category]([Cat_num],[Cat_name]) values ('2','milk&eggs&salads')
insert into [Category]([Cat_num],[Cat_name]) values ('3','meats&fish')
insert into [Category]([Cat_num],[Cat_name]) values ('4','organic&healthy')
insert into [Category]([Cat_num],[Cat_name]) values ('5','frozen')


insert into [SubCategory]([Subcat_name],[Cat_num]) values ('fruits','1')
insert into [SubCategory]([Subcat_name],[Cat_num]) values ('vegetables','1')
insert into [SubCategory]([Subcat_name],[Cat_num]) values ('nuts','1')
insert into [SubCategory]([Subcat_name],[Cat_num]) values ('diary','2')
insert into [SubCategory]([Subcat_name],[Cat_num]) values ('eggs','2')
insert into [SubCategory]([Subcat_name],[Cat_num]) values ('salads','2')
insert into [SubCategory]([Subcat_name],[Cat_num]) values ('meats on fire','3')
insert into [SubCategory]([Subcat_name],[Cat_num]) values ('frozen meats','3')
insert into [SubCategory]([Subcat_name],[Cat_num]) values ('fish','3')
insert into [SubCategory]([Subcat_name],[Cat_num]) values ('soy & lactose free','4')
insert into [SubCategory]([Subcat_name],[Cat_num]) values ('sugar free & reduced','4')
insert into [SubCategory]([Subcat_name],[Cat_num]) values ('organic & vegan','4')
insert into [SubCategory]([Subcat_name],[Cat_num]) values ('icecream& popsticle','5')
insert into [SubCategory]([Subcat_name],[Cat_num]) values ('fast food','5')
insert into [SubCategory]([Subcat_name],[Cat_num]) values ('Pizzas pastrie dough ','5')


insert into [Branch] ([branch_num],[branch_name],[branch_address],[branch_phone])  values ('69','G&Sexpress','montreal','444-666-777')
insert into [Branch] ([branch_num],[branch_name],[branch_address],[branch_phone])  values ('75','G&Sexpress','laval','111-222-333')
insert into [Branch] ([branch_num],[branch_name],[branch_address],[branch_phone])  values ('28','G&Sexpress','miami','888-666-777')
insert into [Branch] ([branch_num],[branch_name],[branch_address],[branch_phone])  values ('73','G&Sexpress','la california','722-666-787')
insert into [Branch] ([branch_num],[branch_name],[branch_address],[branch_phone])  values ('76','G&Sexpress','ontario','333-999-888')
insert into [Branch] ([branch_num],[branch_name],[branch_address],[branch_phone])  values ('79','G&Sexpress','toronto','777-323-698')

insert into [Subscriber] ([sub_id],[sub_name],[sub_lastName],[sub_phone],[sub_address],[birthday]) values ('111','sameh','besan','050-8452602','montreal','19990616 10:30:09 AM' )
insert into [Subscriber] ([sub_id],[sub_name],[sub_lastName],[sub_phone],[sub_address],[birthday])  values ('222','george','abu kahlil','123-456789','laval','19980209 12:15:4 PM')
insert into [Subscriber] ([sub_id],[sub_name],[sub_lastName],[sub_phone],[sub_address],[birthday]) values ('333','chen ','cohen','456-789123','miami','19950214 22:22:22 PM')
insert into [Subscriber] ([sub_id],[sub_name],[sub_lastName],[sub_phone],[sub_address],[birthday])values ('444','elie','bandora','696-9333444','toronto','19980614 13:22:22 PM')
insert into [Subscriber] ([sub_id],[sub_name],[sub_lastName],[sub_phone],[sub_address],[birthday]) values ('555','david','crips','695-9333666','ontario','19980318 15:30:22 PM')
insert into [Subscriber] ([sub_id],[sub_name],[sub_lastName],[sub_phone],[sub_address],[birthday])values ('666','tomas','jacobs','456-789121','miami','19950214 22:22:22 PM')
insert into [Subscriber] ([sub_id],[sub_name],[sub_lastName],[sub_phone],[sub_address],[birthday]) values ('777','jayden','henderson','050-8452601','montreal','20000916 18:30:22 PM')
insert into [Subscriber] ([sub_id],[sub_name],[sub_lastName],[sub_phone],[sub_address],[birthday]) values ('888','alex','brucelee','695-9333366','ontario','20020418 16:22:22 PM')
insert into [Subscriber] ([sub_id],[sub_name],[sub_lastName],[sub_phone],[sub_address],[birthday]) values ('999','donald ','trump','456-789162','miami','19920214 19:22:22 PM')

insert into [order] ([order_num],[order_name],[branch_num],[sub_id])  values ('011','sameh','69','111')
insert into [order] ([order_num],[order_name],[branch_num],[sub_id])  values ('012','george','75','222')
insert into [order] ([order_num],[order_name],[branch_num],[sub_id])  values ('013','chen','28','333')
insert into [order] ([order_num],[order_name],[branch_num],[sub_id])  values ('014','elie','79','444')
insert into [order] ([order_num],[order_name],[branch_num],[sub_id])  values ('015','david','76','555')
insert into [order] ([order_num],[order_name],[branch_num],[sub_id])  values ('016','tomas','28','666')
insert into [order] ([order_num],[order_name],[branch_num],[sub_id])  values ('017','jayden','69','777')
insert into [order] ([order_num],[order_name],[branch_num],[sub_id])  values ('018','jayden2x','69','777')

insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('1111','fresh milk','11','diary')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('1112','mozrilla','11','diary')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('1113','chocolette milk','11','diary')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('1114','salty chesse','12','diary')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('1115','blue chesse','12','diary')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('2221','fresh apple','12','fruits')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('2222','banana','14','fruits')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('2223','watermelon','14','fruits')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('3331','tomato','14','vegetables')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('3332','cucumber','14','vegetables')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('3333','potato','14','vegetables')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('3334','sweet potato','14','vegetables')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('3335','red pepper','14','vegetables')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('3336','lettuce','14','vegetables')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('3337','dry onion','14','vegetables')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('4441','burgers','14','meats on fire')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('4442','kebab','13','meats on fire')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('4443','hotdogs','13','meats on fire')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('5551','salty nuts','13','nuts')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('5552','pistachio','13','nuts')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('5553','peanuts','13','nuts')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('6661','eggs box','13','eggs')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('7771','vegetables salad','16','salads')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('7772','fish salad','16','salads')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('7773','humus salad','16','salads')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('8881',' antricot stake','17','frozen meats')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('8882','ground veal','17','frozen meats')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('9991','fresh salamon','17','fish')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('9992','tuna steak','12','fish')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('9993','fish fillet','12','fish')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('10101','soy sauce','12','soy & lactose free')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('10102','almond drink','18','soy & lactose free')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('10104','almond coconut drink','15','soy & lactose free')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('10105','Som chocolate','15','soy & lactose free')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('10106','Alpro Soy Delicacy','15','soy & lactose free')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('10107','Basil-flavored tofu','15','soy & lactose free')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('10108','Barista oats','15','soy & lactose free')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('11111','diet redbull','15','sugar free & reduced')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('11112','cocola zero','15','sugar free & reduced')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('11113','Gold sweetener','15','sugar free & reduced')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('11114','Pecan cookies','15','sugar free & reduced')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('12121','Organic ketchup','14','organic & vegan')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('12122','Black rice noodles','11','organic & vegan')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('12123','Black rice noodles','12','organic & vegan')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('12124','Organic & beans','13','organic & vegan')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('12125','Vegan spread','14','organic & vegan')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('12126','Spelled spruce','14','organic & vegan')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('13131','ben&jerrys choco','15','icecream& popsticle')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('13132','ben&jerrys vanilla','16','icecream& popsticle')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('13133','Cups of ice cream','17','icecream& popsticle')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('13134','cookies','17','icecream& popsticle')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('13135','cafe','14','icecream& popsticle')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('13136','sour&sweet popsticle','14','icecream& popsticle')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('13137','sweet popsticle','14','icecream& popsticle')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values('13138','Fruitflavor glacier','14','icecream& popsticle')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('14141','fries','14','fast food')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values('14142','schnitzel','18','fast food')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('14143','fried chicken','18','fast food')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('14144','beef patty','11','fast food')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values ('15151','Potato borax ','11','Pizzas pastrie dough ')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values('15152','Cheese borax ','11','Pizzas pastrie dough ')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values('15153','Mlawah ','11','Pizzas pastrie dough ')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values('15154','Thin Italian pizza ','12','Pizzas pastrie dough ')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values('15155','Pizza Margarita ','12','Pizzas pastrie dough ')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values('15156','Puff Pastry ','12','Pizzas pastrie dough ')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values('15157','Dough to fill ','13','Pizzas pastrie dough ')
insert into [Product] ([product_num],[product_name],[order_num],[Subcat_name])  values('15158','potato cigars ','15','Pizzas pastrie dough ')


insert into [Discount] ([dis_num],[dis_name])  values ('7887','summer sale')
insert into [Discount] ([dis_num],[dis_name])  values ('3737','winter sale')
insert into [Discount] ([dis_num],[dis_name])  values ('1232','spring sale')
insert into [Discount] ([dis_num],[dis_name])  values ('9494','black friday')
insert into [Discount] ([dis_num],[dis_name])  values ('8968','fall sale')

insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('1111','7887','20210616','20210716')  
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('1112','7887','20210616','20210716')  
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('1113','7887','20210616','20210716')  
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('1114','7887','20210616','20210716')  
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('1115','7887','20210616','20210716')  
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('4441','3737','20210209','20210212')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('4442','3737','20210209','20210212')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('4443','3737','20210209','20210212')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('8881','3737','20210209','20210212')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('8882','3737','20210209','20210212')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('13131','1232','20210404','20210410')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('13132','1232','20210404','20210410')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('13133','1232','20210404','20210410')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('5551','1232','20210404','20210410')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('5553','1232','20210404','20210410')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('1112','9494','20211127','20211207')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('2221','9494','20211127','20211207')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('3331','9494','20211127','20211207')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('4441','9494','20211127','20211207')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('5552','9494','20211127','20211207')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('6661','9494','20211127','20211207')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('7771','9494','20211127','20211207')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('8882','9494','20211127','20211207')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('9991','9494','20211127','20211207')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('10101','9494','20211127','20211207')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('11112','9494','20211127','20211207')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('12121','9494','20211127','20211207')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('13132','9494','20211127','20211207')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('15151','9494','20211127','20211207')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('9991','8968','20210901','20210922')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('9993','8968','20210901','20210922')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('9992','8968','20210901','20210922')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('15154','8968','20210901','20210922')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('15155','8968','20210901','20210922')
insert into [ProDisc] ([product_num],[dis_num],[starting_date],[end_date])  values ('14144','8968','20210901','20210922')

insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values ('011','1111','15','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values ('011','1112','3','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values ('011','1113','6','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values ('011','12122','1','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values ('011','14144','2','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values ('011','15151 ','3','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('011','15152 ','5','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('011','15153','2','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('012','15154','1','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('012','15155 ','2','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('012','15156   ','5','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('012','12123 ','9','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('012','9992','10','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('012','9993 ','11','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('012','101017','2','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('012','1114 ','4','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('012','1115','10','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('012','2221 ','12','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('013','4442 ','6','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('013','4443 ','7','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('013','5551 ','2','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('013','5552 ','1','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('013','5553 ','1','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('013','6661','1','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('013','12124','3','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('013','15157  ','19','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','12121 ','21','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','12125','12','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','12126 ','2','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','13135 ','3','20210716')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values ('014','13136','2','20210921')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','13137','11','20210921') 
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','13138','13','20210921')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','14141','6','20210921')  
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','2222','17','20210921')  
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','2223','19','20210921')  
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','3331','21','20210921')  
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','3332','3','20210921')  
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','3333','23','20210921')  
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','3334','24','20210921')  
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','3335','17','20210921')  
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','3336','14','20210921')  
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','3337','22','20210921')  
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('014','4441','26','20210921')  
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','10104','1','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','10105','31','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','10106','30','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','10107','37','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','10108','35','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','11111','22','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','11112','25','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','11114','11','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','13138','7','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','13131','9','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','15158','16','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','10104','35','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','10105','34','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','10106','30','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','10107','1','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','11111','8','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','11112','8','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','11113','17','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','11114','16','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','13131','18','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('015','15158','10','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('016','13132','4','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('016','7771','9','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('016','7772','34','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('016','7773','35','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('17','8881','4','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('17','8882','3','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('17','9991','4','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('17','13133','4','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('17','13134','27','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('18','14142','40','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('18','14143','21','20210502')
insert into [pro_Order] ([order_num],[product_num],[quantity],[order_date])  values('18','10102','11','20210502')


/*שאילתא שמשנה את השם של אלי לשם החדש רארואה*/
/*2 שאילתות עדכון נתונים )UPDATE.*/
update Subscriber
set sub_name='raroa'
where sub_id ='444'

select *
from Subscriber
where sub_id ='444'

/*שאילתה שמשנה את הכמות של מוצר מספר14142 מ-40 ל25-*/
update pro_Order
set quantity='25'
where product_num='14142'

select *
from pro_Order
where product_num='14142'

/*בשאילתה הזאתי מהטבלה של המנוי רואים את השם של מנוי כתובת שלו ומספר טלפון*/
/* 2 שאילתות SELECT על טבלה אחת*/
select sub_name,sub_address,sub_phone
from Subscriber

/*שאילתה הזאתי מטבלת מנוי רואים בה את תעודת הזהות של המנוי ואת השם וממוין לפי תעודת זהות*/
select sub_id,sub_name
from Subscriber
order by Subscriber.sub_id

/*שאילתה שמוחק מטבלת מנוי את התעודת זהות של המנוי 999 שזה טראמפ*/
/*שאילתא מחיקה מטבלה*/
delete from Subscriber
where sub_id like '999'

select *
from Subscriber
where sub_id like '999'

/*מחיקה ראשונה מהטבלה המקשרת מחיקה את ההזמנה של ג'יידן מספר 18*/
/*שאילתת מחיקה מטבלה שמקושרת לטבלה אחרת יש למחוק את הנתונים מהטבלה
המקשרת תחילה ואז מהטבלה הראשית(*/
delete from pro_Order
where order_num like '18'

select *
from pro_Order
where order_num like '18'

/*מחיקה מטבלה ראשית*/
delete from Product
where order_num like '18'

select *
from Product
where order_num like '18'

/*מחיקה מטבלה ראשית*/
delete from "order"
where order_num like '18'

select *
from "order"
where order_num like '18'

