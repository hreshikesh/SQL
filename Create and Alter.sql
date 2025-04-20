create database Task;

use Task;

create table movie_info(
id int,
movie_name varchar(10),
movie_ratings int(5),
movie_director varchar(20),
movie_lang varchar(10),
movie_producer varchar(10),
movie_collection bigint,
movie_actoe varchar(10),
movie_actress varchar(20),
movie_villian varchar(20)

);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    payment_date DATE,
    amount_paid DECIMAL(10, 2),
    payment_method VARCHAR(50),
    transaction_id VARCHAR(100),
    payment_status VARCHAR(50),
    billing_address VARCHAR(255),
    currency VARCHAR(10)
);

CREATE TABLE BankAccounts (
    account_id INT PRIMARY KEY,
    account_holder_name VARCHAR(100),
    account_type VARCHAR(50),
    account_number VARCHAR(20),
    ifsc_code VARCHAR(20),
    balance DECIMAL(15, 2),
    branch_name VARCHAR(100),
    opened_date DATE,
    status VARCHAR(20),
    currency VARCHAR(10)
);
CREATE TABLE InstaUsers (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    password_hash VARCHAR(255),
    bio TEXT,
    profile_pic_url VARCHAR(255),
    join_date DATE,
    is_verified VARCHAR(5)
);

CREATE TABLE FanDevices (
    fan_id INT PRIMARY KEY,
    model_name VARCHAR(100),
    brand VARCHAR(50),
    blade_size_inches INT,
    color VARCHAR(50),
    speed_levels INT,
    has_remote_control VARCHAR(5),
    manufacturing_date DATE,
    warranty_years INT,
    status VARCHAR(20)
);




