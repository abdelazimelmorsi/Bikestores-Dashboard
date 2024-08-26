select 
ord.order_id,
ord.order_date,
concat(cus.first_name,' ',cus.last_name) as 'customers',
cus.city,
cus.state,
sum(it.quantity) as 'sales_volum',
sum( it.quantity * it.list_price) as revenue,
pro.product_name,
cat.category_name,
br.brand_name,
st.store_name,
concat (sta.first_name, ' ', sta.last_name) as 'sales_rep'


from sales.customers cus join sales.orders ord
on cus.customer_id = ord.customer_id
join sales.order_items it
on it.order_id = ord.order_id
join production.products pro
on it.product_id = pro.product_id
join production.categories cat
on pro.category_id= cat.category_id
join production.brands br
on br.brand_id = pro.brand_id
join sales.stores st
on st.store_id = ord.store_id
join sales.staffs sta
on sta.staff_id = ord.staff_id

group by 
ord.order_id,
ord.order_date,
concat(cus.first_name,' ',cus.last_name),
cus.city,
cus.state,
pro.product_name,
cat.category_name,
br.brand_name,
st.store_name,
concat (sta.first_name, ' ', sta.last_name)
