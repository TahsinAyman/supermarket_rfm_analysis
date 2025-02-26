CREATE DATABASE IF NOT EXISTS super_market;
USE super_market;
CREATE TABLE IF NOT EXISTS sales (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_priority VARCHAR(255) NOT NULL,
    discount int NOT NULL,
    unit_price double NOT NULL,
    shipping_cost double NOT NULL,
    customer_id int NOT NULL,
    customer_name VARCHAR(255) NOT NULL,
    ship_mode VARCHAR(255) NOT NULL,
    customer_segment VARCHAR(255) NOT NULL,
    product_category VARCHAR(255) NOT NULL,
    product_sub_category VARCHAR(255) NOT NULL,
    product_container VARCHAR(255) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    product_base_margin double,
    region VARCHAR(255) NOT NULL,
    manager VARCHAR(255) NOT NULL,
    state_or_province VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    postal_code int NOT NULL,
    order_date int NOT NULL,
    ship_date int NOT NULL,
    profit double NOT NULL,
    quantity_ordered_new int NOT NULL,
    sales double NOT NULL,
    order_id int NOT NULL,
    return_status VARCHAR(255) NOT NULL
);

# Do bulk insertion data.csv file

