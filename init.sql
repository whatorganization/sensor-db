USE environmental_ops_db;

CREATE TABLE sensor_hardware_status (
    id INT PRIMARY KEY AUTO_INCREMENT,
    location_id VARCHAR(50) NOT NULL,
    sensor_type VARCHAR(50) NOT NULL,
    battery_level_pct INT NOT NULL,
    status VARCHAR(20) NOT NULL
);

INSERT INTO sensor_hardware_status
    (location_id, sensor_type, battery_level_pct, status)
VALUES
    ('LK-11', 'Rain Gauge', 92, 'Online'),
    ('LK-12', 'AQI Monitor', 81, 'Online'),
    ('LK-13', 'Anemometer', 74, 'Online'),
    ('LK-21', 'Anemometer', 78, 'Online'),
    ('LK-23', 'Rain Gauge', 57, 'Maintenance'),
    ('LK-81', 'AQI Monitor', 64, 'Maintenance'),
    ('LK-31', 'Rain Gauge', 18, 'Offline'),
    ('LK-32', 'AQI Monitor', 88, 'Online'),
    ('LK-33', 'Anemometer', 69, 'Online'),
    ('LK-61', 'Anemometer', 87, 'Online'),
    ('LK-71', 'Rain Gauge', 76, 'Online'),
    ('LK-72', 'AQI Monitor', 52, 'Maintenance'),
    ('LK-51', 'AQI Monitor', 45, 'Maintenance'),
    ('LK-52', 'Rain Gauge', 83, 'Online'),
    ('LK-41', 'Anemometer', 38, 'Maintenance'),
    ('LK-42', 'AQI Monitor', 11, 'Offline'),
    ('LK-62', 'Rain Gauge', 91, 'Online'),
    ('LK-82', 'Anemometer', 6, 'Offline'),
    ('LK-91', 'AQI Monitor', 72, 'Online'),
    ('LK-92', 'Rain Gauge', 9, 'Offline');