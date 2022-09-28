select 
-- from raw orders 
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
--from raw_customer
c.customerid,
c.customername,
c.segment,
c.country,
-- from raw product 
p.productid,
p.category,
p.productname,
p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c 
on o.customer = c.customerid
left join {{ ref('raw_product') }} as p 
on o.productid = p.productid