# Olist Brazilian E-commerce
Source: Kaggle (https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce), downloaded [04/10/2026]
Used for: the whole DW, all milestones

## Files
### olist_customers_dataset.csv
- Columns: "customer_id","customer_unique_id","customer_zip_code_prefix","customer_city","customer_state"
- Links to: olist_geolocation_dataset.csv, olist_orders_dataset.csv
- Observations: (fill in as you find them)

### olist_geolocation_dataset.csv
- Columns: "geolocation_zip_code_prefix","geolocation_lat","geolocation_lng","geolocation_city","geolocation_state"
- Links to: olist_customers_dataset.csv, olist_sellers_dataset.csv
- Observations: (fill in as you find them)

### olist_order_items_dataset.csv
- Columns: "order_id","order_item_id","product_id","seller_id","shipping_limit_date","price","freight_value"
- Links to: olist_order_payments_dataset.csv, olist_order_reviews_dataset.csv, olist_orders_dataset.csv, olist_products_dataset.csv, olist_sellers_dataset.csv
- Observations: (fill in as you find them)

### olist_order_payments_dataset.csv
- Columns: "order_id","payment_sequential","payment_type","payment_installments","payment_value"
- Links to: olist_order_items_dataset.csv, olist_order_reviews_dataset.csv, olist_orders_dataset.csv
- Observations: (fill in as you find them)

### olist_order_reviews_dataset.csv
- Columns: "review_id","order_id","review_score","review_comment_title","review_comment_message","review_creation_date","review_answer_timestamp"
- Links to: olist_order_items_dataset.csv, olist_order_payments_dataset.csv, olist_orders_dataset.csv
- Observations: (fill in as you find them)

### olist_orders_dataset.csv
- Columns: "order_id","customer_id","order_status","order_purchase_timestamp","order_approved_at","order_delivered_carrier_date","order_delivered_customer_date","order_estimated_delivery_date"
- Links to: olist_customers_dataset.csv, olist_order_items_dataset.csv, olist_order_items_dataset.csv, olist_order_payments_dataset.csv, olist_order_reviews_dataset.csv
- Observations: (fill in as you find them)

### olist_products_dataset.csv
- Columns: "product_id","product_category_name","product_name_lenght","product_description_lenght","product_photos_qty","product_weight_g","product_length_cm","product_height_cm","product_width_cm"
- Links to: 
- Observations: I can't see any other tables/files with product_id so I am unsure of how to connect this with the rest of the model.

### olist_sellers_dataset.csv
- Columns: "seller_id","seller_zip_code_prefix","seller_city","seller_state"
- Links to: olist_geolocation_dataset.csv, olist_order_items_dataset.csv
- Observations: (fill in as you find them)

### product_category_name_translation.csv
- Columns: product_category_name,product_category_name_english
- Links to: 
- Observations: This table/file does not have a stated id column but I am presuming that it should be connected to the products table/file. I am unsure of how though. 