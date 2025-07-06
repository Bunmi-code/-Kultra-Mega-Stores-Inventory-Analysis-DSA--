SELECT TOP (1000) [Row_ID]
      ,[Order_ID]
      ,[Order_Date]
      ,[Order_Priority]
      ,[Order_Quantity]
      ,[Sales]
      ,[Discount]
      ,[Ship_Mode]
      ,[Profit]
      ,[Unit_Price]
      ,[Shipping_Cost]
      ,[Customer_Name]
      ,[Province]
      ,[Region]
      ,[Customer_Segment]
      ,[Product_Category]
      ,[Product_Sub_Category]
      ,[Product_Name]
      ,[Product_Container]
      ,[Product_Base_Margin]
      ,[Ship_Date]
 ----------------Show my imprted tables----
 SELECT *FROM [Database_KMSCasestudy].[dbo].[KMS Sql Case Study]

 -[1]---Product Category With The Higest Sales----
 select top 1
 [product_category],
 Sum([sales]) As Totalsales
 from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
 Group by [product_category]
 Order by Totalsales Desc;
  
  ---[2]----3 buttom(Lowest) in terms of sales Per Region----
  select top 3
  [Region],
  sum([sales]) as totalsales
  from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
  Group by [region]
  order by totalsales ASC;

    -------Top3 (highest) in terms of sales Per Region----
  
  select top 3
  [Region],[Product_category],
  sum([sales]) as totalsales
  from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
  Group by [region] ,[Product_category]
  order by totalsales DESC;

  ----[3]---Total Sales Of Aplliaince In Ontario-----
  select
  sum([sales]) as totalsales
  from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
  where [product_sub_category] =
  'Appliances'
  and [province] = 'Ontario';

  ------ 10th lowest sales----
  select top 10
  [Customer_Name],
  sum([sales]) as totalsales
  from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
  Group by [Customer_name]
  order by totalsales ASC;

  ---4]---BUTTOM 10 CUSTOMER ,Revenue, by customer---
  select Top 10 [customer_name], [Region],[Product_category],
  count([order_id]) as
  numberoforders,
  avg([Unit_Price]) as
  Averageprice,
  sum([sales]) as totalrevenue
 from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
 group by [Customer_Name], [Region],[product_category]
 order by totalrevenue ASC;
 ------since the number of oder from this set is one all through, i reconmmend an aggressive campaigns in other to get more orders---
 -------since the average price is 60% of totalrevenue,i suggest a reduction in the product quantity=----
 
 ----[5]---Highest shipping method-----
 
 Select top 1[ship_Mode],
 Count (*) As Usagecount
 from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
 Group By[ship_mode]
 Order by Usagecount Desc;

 --[5]--shipping method with highest cost----
 Select Top 10[ship_mode],
 count (*) As Usagecount,
 sum([shipping_cost]) As Totalshippingcost
 from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
 Group by[ship_mode]
 Order by Totalshippingcost desc;

 --[6]--List of top 10 valuable customers with their choice of product/service----
 Select top 10
 [customer_name],[Product_Category],
 sum([sales]) as Totalsales
 from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
 Group by [customer_name],[Product_category]
 Order by totalSales Desc;

 ----Product with highest discount----
 Select top 10 [product_sub_category],[discount]
 from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
 Where [Discount]=(select max([discount])
 from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
 );
 
 
 ---[7]- Small business owner with the highest sales ----
 select top 1
  [Customer_Name],
  sum([sales]) as Smallbusinesssales
  from [Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
  where customer_segment='small business'
  Group by [Customer_name]
  order by Smallbusinesssales ASC;

  -[8]---corporate customer that place the highest number of order btw 2009-2012----


 select top 1
 [customer_name],[Product_category],
 Count([order_id]) as ordercount,
 sum (sales) as totalsales
 from [Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
 where [customer_segment]='corporate'
 and try_convert (date,[order_date],120) between '2009-01-01' and '2012-12-31'
 group by [customer_name],[product_category]
 order by orderCount desc;


 ---[9]---The most profitable customer---
 select top 1
 [customer_name],[product_category],
 sum (profit) as totalprofit
 from[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
 group by customer_name, product_category
 order by totalprofit desc;

 ----[10]--customer that returnes items and the segment they belong to----
 select * from [Database_KMSCasestudy].[dbo].[order_status]

SELECT
a.[customer_name],
a.[customer_segment],
b.[status]
from [Database_KMSCasestudy].[dbo].[KMS Sql Case Study] a
join[Database_KMSCasestudy].[dbo].[order_status]b
on a.[Order_id] =b.[order_id]
where b.[status]= 'returned'


--------question 11-----Appropriation of shipping costs based on order priorty-----

select
[order_priority],
[ship_mode],
count(order_id) as ordercount,
sum(shipping_cost) as Totalsgippingcost
from [Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
group by [order_priority],[ship_mode]
order by [order_priority],[ship_mode]

----company is not optimizing the shipping cost relative to urgency which will definitely result to unnecessary expenses-----
select [ship_mode],
Round (sum(sales-Profit),2) as EstimatedshippingCost,
AVG(DATEDIFF(day,[Order_Date], [Ship_Date])) AS AvgShipDays
From[Database_KMSCasestudy].[dbo].[KMS Sql Case Study]
Group by[ship_mode],[order_priority]
order by [ship_mode],[order_priority]


