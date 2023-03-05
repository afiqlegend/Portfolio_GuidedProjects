Select 
      orders.order_id, 
      Concat(customers.first_name,' ',customers.last_name) as customers_name,
      customers.city, 
      customers.state,
      orders.order_date,
      sum(item.quantity) as total_units,
	  sum(item.quantity*item.list_price) as revenue,
	  products.product_name,
	  categories.category_name,
	  stores.store_name,
	  Concat(staffs.first_name,' ',staffs.last_name) as sales_representative,
	  brands.brand_name
From sales.orders as orders
Join sales.customers as customers
On orders.customer_id=customers.customer_id
Join sales.order_items as item
On orders.order_id=item.order_id
Join production.products as products
On item.product_id=products.product_id
Join production.categories as categories
On products.category_id=categories.category_id
Join sales.stores as stores
On orders.store_id=stores.store_id
Join sales.staffs as staffs
On orders.staff_id=staffs.staff_id
Join production.brands as brands
On products.brand_id=brands.brand_id
Group by
      orders.order_id, 
      Concat(customers.first_name,' ',customers.last_name),
      customers.city, 
      customers.state,
      orders.order_date,
	  products.product_name,
	  categories.category_name,
	  stores.store_name,
	  Concat(staffs.first_name,' ',staffs.last_name),
	  brands.brand_name
      
