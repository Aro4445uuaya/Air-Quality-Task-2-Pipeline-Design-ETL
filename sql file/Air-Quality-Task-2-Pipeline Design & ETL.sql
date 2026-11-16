CREATE DATABASE air_quality_warehouse;

USE air_quality_warehouse;

USE air_quality_warehouse;

CREATE TABLE air_quality_readings (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    `Date` VARCHAR(20),
    `Time` VARCHAR(20),
    `CO(GT)` DECIMAL(10,3),
    `PT08.S1(CO)` DECIMAL(10,3),
    `NMHC(GT)` DECIMAL(10,3),
    `C6H6(GT)` DECIMAL(10,3),
    `PT08.S2(NMHC)` DECIMAL(10,3),
    `NOx(GT)` DECIMAL(10,3),
    `PT08.S3(NOx)` DECIMAL(10,3),
    `NO2(GT)` DECIMAL(10,3),
    `PT08.S4(NO2)` DECIMAL(10,3),
    `PT08.S5(O3)` DECIMAL(10,3),
    T DECIMAL(10,3),
    RH DECIMAL(10,3),
    AH DECIMAL(10,3),
    Timestamp DATETIME NOT NULL UNIQUE
);

DESCRIBE air_quality_readings;

USE air_quality_warehouse;

SELECT COUNT(*) AS total_records
FROM air_quality_readings;

SELECT *
FROM air_quality_readings
LIMIT 10;