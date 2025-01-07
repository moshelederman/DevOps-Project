CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;
CREATE TABLE IF NOT EXISTS images (
    id_images INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS visitors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    visit_count INT NOT NULL DEFAULT 0
);


INSERT INTO images (image_url) VALUES ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQpArEoEZ1VHxhyDql-WVesjhL7fvjTHu51g&s");
INSERT INTO images (image_url) VALUES ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFvu6HM8akCU-hEUkKwKyKkHwSKlle4sFBng&s");
INSERT INTO images (image_url) VALUES ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYI-PhTZDz-MQDRy1-og36KLCmUPxYC1VYZQ&s");
INSERT INTO images (image_url) VALUES ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXe5cneDUCl4Q2zyo0GzSSLZt3RrsQjFF_jg&s");
INSERT INTO images (image_url) VALUES ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfdzIu068pNBUDj3ko7Gkn228JhWoyEP3oNg&s");
INSERT INTO images (image_url) VALUES ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTzHrtew1BUXh7F8GnCMcC3WorcDEFbGmC0w&s");
INSERT INTO images (image_url) VALUES ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRitHhHKJ9l_Il9DS-XT4V_gPcUV6woMU1VfA&s");
INSERT INTO images (image_url) VALUES ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0w5CoquU-vjC3hHLbHqqzpCUjajmnQ3njyA&s");
INSERT INTO images (image_url) VALUES ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTunuv7Ntr7YxZKE8_mZFgV2-lsVnJZ4-Cb8g&s");
INSERT INTO images (image_url) VALUES ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLogIQHovcRhTiSzwbmMD9a3rfbi60UOf52A&s");

INSERT INTO visitors (visit_count) VALUES (0);

CREATE USER 'user'@'%' IDENTIFIED BY 'example';

GRANT ALL PRIVILEGES ON testdb.* TO 'user'@'%';
FLUSH PRIVILEGES;