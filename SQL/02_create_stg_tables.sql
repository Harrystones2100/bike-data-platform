USE OlistDW;
GO

DROP TABLE IF EXISTS stg.customers;
GO

CREATE TABLE stg.customers (
    customer_id                 NVARCHAR(100),
    customer_unique_id          NVARCHAR(100),
    customer_zip_code_prefix    NVARCHAR(100),
    customer_city               NVARCHAR(100),
    customer_state              NVARCHAR(100)
);
GO

BULK INSERT stg.customers
FROM 'C:\Olist\olist_customers_dataset.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a'
);
GO

DROP TABLE IF EXISTS stg.orders;
GO

CREATE TABLE stg.orders (
    order_id                    NVARCHAR(100),
    customer_id                 NVARCHAR(100),
    order_status                NVARCHAR(100),
    order_purchase_timestamp    NVARCHAR(100),
    order_approved_at           NVARCHAR(100),
    order_delivered_carrier_date NVARCHAR(100),
    order_delivered_customer_date NVARCHAR(100),
    order_estimated_delivery_date NVARCHAR(100)
);
GO

BULK INSERT stg.orders
FROM 'C:\Olist\olist_orders_dataset.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a'
);
GO

DROP TABLE IF EXISTS stg.order_items;
GO

CREATE TABLE stg.order_items (
    order_id                    NVARCHAR(100),
    order_item_id               NVARCHAR(100),
    product_id                  NVARCHAR(100),
    seller_id                   NVARCHAR(100),
    shipping_limit_date         NVARCHAR(100),
    price                       NVARCHAR(100),
    freight_value               NVARCHAR(100)
);
GO

BULK INSERT stg.order_items
FROM 'C:\Olist\olist_order_items_dataset.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a'
);
GO

DROP TABLE IF EXISTS stg.products;
GO

CREATE TABLE stg.products (
    product_id                  NVARCHAR(100),
    product_category_name       NVARCHAR(100),
    product_name_lenght         NVARCHAR(100),
    product_description_lenght  NVARCHAR(100),
    product_photos_qty          NVARCHAR(100),
    product_weight_g            NVARCHAR(100),
    product_length_cm           NVARCHAR(100),
    product_height_cm           NVARCHAR(100),
    product_width_cm            NVARCHAR(100)
);
GO

BULK INSERT stg.products
FROM 'C:\Olist\olist_products_dataset.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a'
);
GO

DROP TABLE IF EXISTS stg.sellers;
GO

CREATE TABLE stg.sellers (
    seller_id                   NVARCHAR(100),
    seller_zip_code_prefix      NVARCHAR(100),
    seller_city                 NVARCHAR(100),
    seller_state                NVARCHAR(100)
);
GO

BULK INSERT stg.sellers
FROM 'C:\Olist\olist_sellers_dataset.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a'
);
GO

DROP TABLE IF EXISTS stg.payments;
GO

CREATE TABLE stg.payments (
    order_id                    NVARCHAR(100),
    payment_sequential          NVARCHAR(100),
    payment_type                NVARCHAR(100),
    payment_installments        NVARCHAR(100),
    payment_value               NVARCHAR(100)
);
GO

BULK INSERT stg.payments
FROM 'C:\Olist\olist_order_payments_dataset.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a'
);
GO

DROP TABLE IF EXISTS stg.order_reviews;
GO

CREATE TABLE stg.order_reviews (
    review_id                   NVARCHAR(100),
    order_id                    NVARCHAR(100),
    review_score                NVARCHAR(100),
    review_comment_title        NVARCHAR(MAX),
    review_comment_message      NVARCHAR(MAX),
    review_creation_date        NVARCHAR(100),
    review_answer_timestamp     NVARCHAR(100)
);
GO

BULK INSERT stg.order_reviews
FROM 'C:\Olist\olist_order_reviews_dataset.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    FIELDQUOTE = '"',
    FORMAT = 'CSV'
);
GO

DROP TABLE IF EXISTS stg.geolocation;
GO

CREATE TABLE stg.geolocation (
    geolocation_zip_code_prefix NVARCHAR(100),
    geolocation_lat             NVARCHAR(100),
    geolocation_lng             NVARCHAR(100),
    geolocation_city            NVARCHAR(100),
    geolocation_state           NVARCHAR(100)
);
GO

BULK INSERT stg.geolocation
FROM 'C:\Olist\olist_geolocation_dataset.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a'
);
GO

DROP TABLE IF EXISTS stg.product_category_name_translation;
GO

CREATE TABLE stg.product_category_name_translation (
    product_category_name       NVARCHAR(100),
    product_category_name_english NVARCHAR(100)
);
GO

BULK INSERT stg.product_category_name_translation
FROM 'C:\Olist\product_category_name_translation.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a'
);
GO

