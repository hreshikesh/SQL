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


CREATE TABLE keyboard_info(
    id INT,
    keyboard_company VARCHAR(15),
    keyboard_type VARCHAR(20),
    key_count INT,
    connection VARCHAR(10),
    manufacture_country VARCHAR(25),
    manufacture_year YEAR,
    salesman_name VARCHAR(20),
    total_noof_keyboard INT,
    switch_type VARCHAR(15),
    backlight CHAR
);
CREATE TABLE ai_info(
    id INT,
    ai_name VARCHAR(30),
    ai_domain VARCHAR(25),
    model_type VARCHAR(20),
    parameter_count BIGINT,
    training_dataset VARCHAR(40),
    developer_company VARCHAR(25),
    release_year YEAR,
    license_type VARCHAR(15),
    version VARCHAR(10)
);
CREATE TABLE woodentable(
    id INT,
    wood_name VARCHAR(30),
    material_type VARCHAR(25),
    design_style VARCHAR(20),
    weight DOUBLE,
    dimensions VARCHAR(40),
    manufacturer_company VARCHAR(25),
    production_year YEAR,
    price DECIMAL(10, 2),
    warranty_period INT
);

CREATE TABLE mirror(
    id INT,
    mirror_name VARCHAR(30),
    material_type VARCHAR(25),
    shape VARCHAR(20),
    dimensions VARCHAR(40),
    manufacturer_company VARCHAR(25),
    production_year YEAR,
    price DECIMAL(10, 2),
    warranty_period INT,
    frame_type VARCHAR(15)
);
CREATE TABLE website(
    website_id INT,
    website_name VARCHAR(50),
    domain_name VARCHAR(50),
    category VARCHAR(30),
    launch_date DATE,
    owner_company VARCHAR(50),
    traffic_per_month INT,
    hosting_provider VARCHAR(30),
    license_type VARCHAR(15),
    technology_used VARCHAR(50)
);

CREATE TABLE ball(
    ball_id INT,
    ball_name VARCHAR(30),
    material_type VARCHAR(25),
    size VARCHAR(10),
    weight DOUBLE,
    color VARCHAR(20),
    manufacturer_company VARCHAR(25),
    production_year YEAR,
    usage_type VARCHAR(20),
    price DECIMAL(10, 2)
    );
ALTER TABLE movie_info
  ADD COLUMN duration_minutes INT,
  ADD COLUMN genre VARCHAR(20),
  ADD COLUMN release_date DATE,
  ADD COLUMN country VARCHAR(20);
ALTER TABLE movie_info
  DROP COLUMN movie_villian;
ALTER TABLE movie_info
  RENAME COLUMN movie_actoe TO lead_actor,
  RENAME COLUMN movie_actress TO lead_actress,
  RENAME COLUMN movie_lang  TO language,
  RENAME COLUMN movie_collection TO worldwide_gross;
ALTER TABLE movie_info
  MODIFY COLUMN movie_name VARCHAR(50),
  MODIFY COLUMN movie_ratings DECIMAL(3,1),
  MODIFY COLUMN worldwide_gross BIGINT UNSIGNED,
  MODIFY COLUMN producer VARCHAR(30);
  
  
  ALTER TABLE Payments
  ADD COLUMN tax_amount DECIMAL(10,2),
  ADD COLUMN refund_amount DECIMAL(10,2),
  ADD COLUMN processed_by VARCHAR(50),
  ADD COLUMN payment_gateway VARCHAR(50);

ALTER TABLE Payments
  DROP COLUMN billing_address;

ALTER TABLE Payments
  RENAME COLUMN payment_method  TO method,
  RENAME COLUMN amount_paid     TO amount,
  RENAME COLUMN payment_status  TO status,
  RENAME COLUMN transaction_id  TO gateway_txn_id;

ALTER TABLE Payments
  MODIFY COLUMN amount DECIMAL(12,2) UNSIGNED,
  MODIFY COLUMN status VARCHAR(20),
  MODIFY COLUMN currency CHAR(5),
  MODIFY COLUMN method VARCHAR(30);
  
  
  ALTER TABLE BankAccounts
  ADD COLUMN minimum_balance DECIMAL(15,2),
  ADD COLUMN last_transaction_date DATE,
  ADD COLUMN account_nickname VARCHAR(50),
  ADD COLUMN overdraft_limit DECIMAL(15,2);

ALTER TABLE BankAccounts
  DROP COLUMN status;

ALTER TABLE BankAccounts
  RENAME COLUMN balance TO current_balance,
  RENAME COLUMN opened_date TO date_opened,
  RENAME COLUMN branch_name TO branch,
  RENAME COLUMN account_holder_name TO holder_name;

ALTER TABLE BankAccounts
  MODIFY COLUMN current_balance DECIMAL(18,2) ,
  MODIFY COLUMN branch VARCHAR(80),
  MODIFY COLUMN ifsc_code CHAR(11),
  MODIFY COLUMN account_number VARCHAR(30);
  
  
  ALTER TABLE InstaUsers
  ADD COLUMN gender VARCHAR(10),
  ADD COLUMN date_of_birth DATE,
  ADD COLUMN follower_count INT,
  ADD COLUMN account_status VARCHAR(20);

ALTER TABLE InstaUsers
  DROP COLUMN password_hash;

ALTER TABLE InstaUsers
  RENAME COLUMN is_verified TO verified,
  RENAME COLUMN join_date  TO joined_on,
  RENAME COLUMN phone_number TO phone,
  RENAME COLUMN profile_pic_url TO avatar_url;

ALTER TABLE InstaUsers
  MODIFY COLUMN email VARCHAR(150),
  MODIFY COLUMN bio VARCHAR(500),
  MODIFY COLUMN verified CHAR(1),
  MODIFY COLUMN username VARCHAR(80);
  
  
  
ALTER TABLE FanDevices
  ADD COLUMN power_consumption_watts INT,
  ADD COLUMN rpm INT,
  ADD COLUMN energy_rating VARCHAR(5),
  ADD COLUMN country_of_origin VARCHAR(30);

ALTER TABLE FanDevices
  DROP COLUMN status;

ALTER TABLE FanDevices
  RENAME COLUMN model_name  TO model,
  RENAME COLUMN blade_size_inches TO blade_size,
  RENAME COLUMN manufacturing_date TO mfg_date,
  RENAME COLUMN warranty_years TO warranty;

ALTER TABLE FanDevices
  MODIFY COLUMN has_remote_control CHAR(1),
  MODIFY COLUMN color VARCHAR(30),
  MODIFY COLUMN speed_levels TINYINT,
  MODIFY COLUMN warranty INT;
  
  
  ALTER TABLE keyboard_info
  ADD COLUMN interface_type VARCHAR(20),
  ADD COLUMN key_material VARCHAR(20),
  ADD COLUMN is_mechanical CHAR(1),
  ADD COLUMN retail_price int;

ALTER TABLE keyboard_info
  DROP COLUMN backlight;

ALTER TABLE keyboard_info
  RENAME COLUMN connection TO connectivity,
  RENAME COLUMN manufacture_country TO country_of_origin,
  RENAME COLUMN manufacture_year TO year_made,
  RENAME COLUMN salesman_name TO distributor;

ALTER TABLE keyboard_info
  MODIFY COLUMN keyboard_company VARCHAR(30),
  MODIFY COLUMN switch_type VARCHAR(25),
  MODIFY COLUMN connectivity VARCHAR(15),
  MODIFY COLUMN year_made YEAR ;
  
  
  ALTER TABLE ai_info
  ADD COLUMN training_hours INT,
  ADD COLUMN application_area VARCHAR(40),
  ADD COLUMN accuracy int,
  ADD COLUMN last_update DATE;

ALTER TABLE ai_info
  DROP COLUMN version;

ALTER TABLE ai_info
  RENAME COLUMN parameter_count TO parameters,
  RENAME COLUMN model_type  TO architecture,
  RENAME COLUMN release_year TO year_released,
  RENAME COLUMN training_dataset TO dataset;

ALTER TABLE ai_info
  MODIFY COLUMN ai_name VARCHAR(60),
  MODIFY COLUMN parameters INT,
  MODIFY COLUMN license_type VARCHAR(20),
  MODIFY COLUMN developer_company VARCHAR(35);
  
  
  ALTER TABLE woodentable
  ADD COLUMN length_cm INT,
  ADD COLUMN width_cm INT,
  ADD COLUMN height_cm INT,
  ADD COLUMN finish_type VARCHAR(20);

ALTER TABLE woodentable
  DROP COLUMN warranty_period;

ALTER TABLE woodentable
  RENAME COLUMN wood_name TO table_model,
  RENAME COLUMN weight TO weight_kg,
  RENAME COLUMN dimensions TO size,
  RENAME COLUMN price TO cost;

ALTER TABLE woodentable
  MODIFY COLUMN weight_kg INT,
  MODIFY COLUMN cost INT,
  MODIFY COLUMN table_model VARCHAR(40),
  MODIFY COLUMN material_type VARCHAR(30);
  
  
  ALTER TABLE mirror
  ADD COLUMN thickness INT,
  ADD COLUMN anti_fog CHAR(1),
  ADD COLUMN reflective_coating VARCHAR(25),
  ADD COLUMN mount_type VARCHAR(20);

ALTER TABLE mirror
  DROP COLUMN warranty_period;

ALTER TABLE mirror
  RENAME COLUMN mirror_name TO model_name,
  RENAME COLUMN frame_type TO frame_material,
  RENAME COLUMN price TO cost,
  RENAME COLUMN shape TO mirror_shape;

ALTER TABLE mirror
  MODIFY COLUMN cost INT,
  MODIFY COLUMN dimensions VARCHAR(60),
  MODIFY COLUMN model_name VARCHAR(40),
  MODIFY COLUMN mirror_shape VARCHAR(25);
  
  
  ALTER TABLE website
  ADD COLUMN ssl_enabled CHAR(1),
  ADD COLUMN monthly_revenue INT,
  ADD COLUMN active_users INT,
  ADD COLUMN server_location VARCHAR(30);

ALTER TABLE website
  DROP COLUMN license_type;

ALTER TABLE website
  RENAME COLUMN traffic_per_month TO monthly_visits,
  RENAME COLUMN owner_company  TO owner,
  RENAME COLUMN hosting_provider TO host,
  RENAME COLUMN technology_used TO tech_stack;

ALTER TABLE website
  MODIFY COLUMN monthly_visits INT,
  MODIFY COLUMN category VARCHAR(40),
  MODIFY COLUMN tech_stack VARCHAR(80),
  MODIFY COLUMN domain_name VARCHAR(75);
  
  
ALTER TABLE ball
  ADD COLUMN circumference INT,
  ADD COLUMN bounce_height INT,
  ADD COLUMN sport VARCHAR(20),
  ADD COLUMN surface_texture VARCHAR(20);

ALTER TABLE ball
  DROP COLUMN usage_type;

ALTER TABLE ball
  RENAME COLUMN ball_name  TO model_name,
  RENAME COLUMN material_type TO cover_material,
  RENAME COLUMN size TO size_code,
  RENAME COLUMN price TO cost;

ALTER TABLE ball
  MODIFY COLUMN weight INT,
  MODIFY COLUMN cost INT,
  MODIFY COLUMN model_name VARCHAR(35),
  MODIFY COLUMN cover_material VARCHAR(30);
















