create database coffee_shop;
use coffee_shop;
select * from coffee_sales;

select count(*) as total_sales from coffee_sales;

-- TOTAL REVENUE
select
    round(sum(transaction_qty * unit_price),2) as total_revenue
from coffee_sales;

-- TOTAL CUPS SOLD
select 
    sum(transaction_qty) as total_cups_sold
from coffee_sales;

-- TOTAL ORDERS
select
    count(distinct transaction_id) as total_orders
from coffee_sales;

-- AVERAGE ORDER VALUE
select 
    round(sum(transaction_qty * unit_price) / count(distinct transaction_id), 2) as average_order_value
from coffee_sales;

-- TOTAL STORE LOCATION
select  
    count(distinct store_location) as total_active_stores
from coffee_sales;

-- TOTAL SALES IN A DAY
select
    str_to_date(transaction_date, '%d/%m/%y') as formatted_date,
    round(sum(transaction_qty * unit_price),2) as daily_revenue,
    sum(transaction_qty) as daily_cups_sold
from coffee_sales
group by formatted_date
order by formatted_date asc;

-- PEAK HOUR CUP SOLD AMMOUNT
select
    hour(transaction_time) as sales_hour,
    sum(transaction_qty) as total_cups_sold,
    round(sum(transaction_qty * unit_price),2)as hourly_revenue
from coffee_sales
group by hour(transaction_time)
order by total_cups_sold desc;

-- BEST SELLING COFFEE
select
    product_category,
    product_detail,
    sum(transaction_qty) as total_quantity_sold,
    round(sum(transaction_qty * unit_price),2) as category_revenue
from coffee_sales
group by product_category, product_detail
order by category_revenue desc;
-- STORE LOACTION PERFORMANCE
select
    store_location,
    count(distinct transaction_id) as total_orders,
    round(sum(transaction_qty * unit_price),2) as location_revenue
from coffee_sales
group by store_location
order by location_revenue desc;

-- DAILY FOOTFALL ORDERS
select 
    transaction_date,
    count(distinct transaction_id) as daily_footfall_orders
from coffee_sales
group by transaction_date
order by daily_footfall_orders desc;
