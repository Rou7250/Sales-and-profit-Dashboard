create database sales_project;
use sales_project;
select * from sales;
alter table sales
rename column ï»¿Region to Region;
drop table sales;
select count(*) from sales;
select distinct Region from sales;
select count(*) as Total_order from sales;
select  sum(Total_Revenue),Region from sales group by Region;
select sum(Total_Profit) as Total_profit ,Country from sales group by Country order by  Total_profit desc;
select * from sales where Order_Priority='HIGH';
select * from sales where date between 01-01-2021 and 31-12-2021;
select * from sales where Total_Profit>5000;
select * from sales where Sales_Channel='Online';
select avg(Unit_Cost) Avg_sold,Region from sales group by Region;
select sum(Total_Revenue),sum(Total_Profit),Item_Type from sales group by Item_Type;
SELECT Country, Total_Profit_Generated, profit_rank
FROM (SELECT Country, SUM(Total_Profit) AS Total_Profit_Generated, DENSE_RANK() OVER ( ORDER BY SUM(Total_Profit) DESC) AS profit_rank
      FROM sales
      GROUP BY Country
) as t
WHERE profit_rank <= 5;
select count(*), Sales_Channel from sales group by Sales_Channel;
select avg(Total_Profit) avg_profit,Order_Priority from sales group by Order_Priority;
select Order_ID,Total_Revenue,Total_Profit, (Total_Profit / Total_Revenue) * 100 Profit_margin_Percent  from sales;

-- 16Q select * from sales where Total_Cost > Total_Revenue;
SELECT 
    Order_ID,
    Total_Profit,
    IF(Total_Profit > 5000, 'High Profit',
       IF(Total_Profit >= 1000, 'Medium Profit', 'Low Profit')
    ) AS Profit_Category
FROM sales;

select *
from (select sales.*, dense_rank() over(order by Total_Revenue desc) as rk from sales)
as t
where rk<=10;
select *
from (select sales.*, dense_rank() over(order by Order_date desc) as rk from sales )
as t
where rk<=5;
SELECT 
    EXTRACT(MONTH FROM Order_date) AS Month,
    SUM(Total_Cost) AS Total_Cost,
    SUM(Total_Profit) AS Total_Profit
FROM sales
GROUP BY EXTRACT(MONTH FROM Order_Date)
ORDER BY Month;







