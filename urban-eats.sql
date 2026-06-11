-- creating tables
CREATE TABLE restaurant (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL
);

CREATE TABLE menu_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    price DECIMAL(6,2) NOT NULL
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(100) UNIQUE NOT NULL,
    loyalty_points INT DEFAULT 0
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);

-- using a select join to show customer full name, restaurant name, and order id
SELECT
    CONCAT(customers.first_name, ' ',  customers.last_name) AS customer_full_name,
    restaurant.restaurant_name,
    orders.order_id
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id
JOIN restaurant
    ON orders.restaurant_id = restaurant.restaurant_id;

