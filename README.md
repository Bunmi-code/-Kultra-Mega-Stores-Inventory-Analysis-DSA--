
## kultra Mega Stores (KMS) — Sales and customer Analysis (2009–2012)

A data-driven project analyzing sales and customer data from Kultra Mega Stores between 2009 and 2012 using SQL. The goal is to extract actionable insights around product performance, customer behavior, shipping efficiency, and revenue strategy.
### Project objectives 
- Create a database
- Clean and transform raw transactional data using SQL.
- Write analytical queries to uncover business insights.
- Present results clearly using query outputs

### Data Source 
Kultra Mega Stores

### Tools and Technologies 

- Excel for data cleaning [download here](https://www.microsoft.com)
- sql server for data queries analysis [download here](https://www.microsoft.com) 

### Data cleaning and preparation 

- Database created for Kultra Mega Stores 
- Data load from a Csv file into the created database 
- Data Cleaning and formatting

### Key Business Questions Answered
1 .Which product category had the highest sales?

2 .What are the Top 3 and Bottom 3 regions in terms of sales?

3 .What were the total sales of appliances in Ontario?

4 .The bottom 10 customers and how to improve revenue from them.

5 .KMS incurred the most shipping cost using which shipping method?

6 .Who are the most valuable customers, and what products or 
services do they typically purchase?

7 .Which small business customer had the highest sales?

8 .Which Corporate Customer placed the most number of orders in 2009 – 2012?

9 .Which consumer customer was the most profitable one?

10 .Which customer returned items, and what segment do they belong to?

11 .Did the company appropriately spend shipping costs based on the order priority?
### SQL Script queries and Insights 
[Download Here](https://github.com/Bunmi-code/-Kultra-Mega-Stores-Inventory-Analysis-DSA--/blob/main/SQLQuery3%5BKultra%20Mega%20Store%20Analysis%5D%20-%20Copy.sql)

#### product category with highest sales 
<PRE>select top 1
[product_category],
Sum([sales]) As Totalsales
from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
Group by [product_category]
Order by Totalsales Desc;
  </PRE>
product_category	Totalsales
Technology	5984248.1820000000

#### Top3 Regions with high sales
<PRE>select top 3
[Region],[Product_category],
sum([sales]) as totalsales
from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
Group by [region] ,[Product_category]
order by totalsales DESC;
</PRE>
Region                                             totalsales
-------------------------------------------------- ---------------------------------------
Nunavut                                            116376.4835000000
Northwest Territories                              800847.3295000000
Yukon                                              975867.3710000000


#### Total Sales of appliances in Ontario
<PRE>select top 3
[Region],[Product_category],
sum([sales]) as totalsales
from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
Group by [region] ,[Product_category]
order by totalsales DESC;
</PRE>
totalsales
---------------------------------------
202346.8400000000

#### Buttom 10 customer by Revenue 
<PRE> select Top 10 [customer_name], [Region],[Product_category],
 count([order_id]) as
 numberoforders,
 avg([Unit_Price]) as
 Averageprice,
 sum([sales]) as totalrevenue
from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
group by [Customer_Name], [Region],[product_category]
order by totalrevenue ASC;</PRE>
customer_name                                      Region                                             Product_category                                   numberoforders Averageprice                            totalrevenue
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -------------- --------------------------------------- ---------------------------------------
Andy Reiter                                        Quebec                                             Office Supplies                                    1              1.8800000000                            3.4200000000
John Grady                                         West                                               Office Supplies                                    1              3.1400000000                            5.0600000000
Dean Katz                                          Yukon                                              Office Supplies                                    1              2.9400000000                            7.0100000000
David Kendrick                                     Yukon                                              Office Supplies                                    1              4.7100000000                            10.3900000000
Roland Murray                                      Prarie                                             Office Supplies                                    1              9.1100000000                            10.9400000000
Doug O'Connell                                     Ontario                                            Furniture                                          1              2.0800000000                            11.0100000000
Rose O'Brian                                       West                                               Office Supplies                                    1              5.8000000000                            11.0800000000
Julie Kriz                                         Atlantic                                           Office Supplies                                    1              1.7600000000                            11.5700000000
Anne McFarland                                     West                                               Furniture                                          1              5.8900000000                            11.7000000000
Michael Oakman                                     Atlantic                                           Furniture                                          1              5.8900000000                            11.8100000000

Recommendation On how to increase Revenue. 

  1. Offer discount on the category of product they purchase
  2.  Personal awareness on the available loyalty offers
  3.   Feedback and personal survey to identify the reason for low sales. 

#### The most use shipping with it cost
<PRE>elect top 1[ship_Mode],
 Count (*) As Usagecount
 from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
 Group By[ship_mode]
 Order by Usagecount Desc;</PRE>

ship_Mode                                          Usagecount
-------------------------------------------------- -----------
Regular Air                                        6270


#### The most valuable customers and with their various products category 
<PRE>Select top 10
[customer_name],[Product_Category],
sum([sales]) as Totalsales
from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
Group by [customer_name],[Product_category]
Order by totalSales Desc;</PRE>

Deborah Brumfield                                  Technology                                         76795.7955000000
Dennis Kane                                        Technology                                         60434.6405000000
Jasper Cacioppo                                    Technology                                         57739.2700000000
Clytie Kelty                                       Technology                                         54454.9500000000
Raymond Book                                       Technology                                         53450.7800000000
Lisa DeCherney                                     Furniture                                          52477.3700000000
Alejandro Grove                                    Office Supplies                                    51696.0200000000
Grant Carroll                                      Office Supplies                                    50837.2700000000
Roy Skaria                                         Furniture                                          50177.2400000000

#### The small business with the highest sales
<PRE>select top 1
 [Customer_Name],
 sum([sales]) as Smallbusinesssales
 from [Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
 where customer_segment='small business'
 Group by [Customer_name]
 order by Smallbusinesssales ASC;</PRE>
 
Customer_Name                                      Smallbusinesssales
-------------------------------------------------- ---------------------------------------
Jeremy Farry                                       85.7200000000


#### Corporate Customer that placed the most number of orders in 2009 – 2012
<PRE>select top 1
[customer_name],[Product_category],
Count([order_id]) as ordercount,
sum (sales) as totalsales
from [Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
where [customer_segment]='corporate'
and try_convert (date,[order_date],120) between '2009-01-01' and '2012-12-31'
group by [customer_name],[product_category]
order by orderCount desc;</PRE>

customer_name                                      Product_category                                   ordercount  totalsales
-------------------------------------------------- -------------------------------------------------- ----------- ---------------------------------------
Adam Hart                                          Office Supplies                                    17          12544.1400000000


#### Most profitable customer 
<PRE> select top 1
 [customer_name],[product_category],
 sum (profit) as totalprofit
 from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
 group by customer_name, product_category
 order by totalprofit desc;</PRE>
 
customer_name                                      product_category                                   totalprofit
-------------------------------------------------- -------------------------------------------------- ---------------------------------------
Emily Phan                                         Technology                                         34233.9900000000


#### Tha customer that returned items, and the segment they belong to
<PRE>SELECT
a.[customer_name],
a.[customer_segment],
b.[status]
from [Database_KMSCasestudy].[dbo].[KMS Sql Case Study] a
join[Database_KMSCasestudy].[dbo].[order_status]b
on a.[Order_id] =b.[order_id]
where b.[status]= 'returned'</PRE>
573  Customers returned item
#### Appropriation of shipping costs based on order priority 
<pre>select [ship_mode],
Round (sum(sales-Profit),2) as EstimatedshippingCost,
AVG(DATEDIFF(day,[Order_Date], [Ship_Date])) AS AvgShipDays
From[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
Group by[ship_mode],[order_priority]
order by [ship_mode],[order_priority]</pre>

ship_mode                                          EstimatedshippingCost                   AvgShipDays
-------------------------------------------------- --------------------------------------- -----------
Delivery Truck                                     1221313.1100000000                      1
Delivery Truck                                     1338507.9800000000                      1
Delivery Truck                                     1332956.1400000000                      3
Delivery Truck                                     976998.9500000000                       1
Delivery Truck                                     1085457.6600000000                      1
Express Air                                        198005.4000000000                       1
Express Air                                        206125.1800000000                       1
Express Air                                        191312.1300000000                       4
Express Air                                        247151.9100000000                       1
Express Air                                        194393.9700000000                       1
Regular Air                                        1122603.2900000000                      1
Regular Air                                        1315653.5500000000                      1
Regular Air                                        1372177.2000000000                      4
Regular Air                                        1311249.5300000000                      1
Regular Air                                        1279926.8400000000                      1

Recommendation

-  Urgent orders should be treated as priority and means of shipping the order should be Express or Regular Air, which are both faster and cheaper based on actual cost data.
 -  Delivery Truck should be assign for low-priority orders or bulk shipments



