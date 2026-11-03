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
    -- Western Province
    ('colombo_01', 'Rain Gauge', 92, 'Online'),
    ('colombo_01', 'AQI Monitor', 81, 'Online'),
    ('colombo_01', 'Anemometer', 74, 'Online'),
    ('gampaha_01', 'Anemometer', 78, 'Online'),
    ('gampaha_01', 'AQI Monitor', 21, 'Offline'),
    ('kalutara_01', 'Rain Gauge', 57, 'Maintenance'),
    ('kalutara_01', 'Anemometer', 88, 'Online'),
    
    -- Central Province
    ('kandy_01', 'AQI Monitor', 64, 'Maintenance'),
    ('kandy_01', 'Rain Gauge', 18, 'Offline'),
    ('matale_01', 'AQI Monitor', 88, 'Online'),
    ('matale_01', 'Anemometer', 69, 'Online'),
    ('nuwara_eliya_01', 'Rain Gauge', 87, 'Online'),
    ('nuwara_eliya_01', 'Anemometer', 14, 'Offline'),
    
    -- Southern Province
    ('galle_01', 'Rain Gauge', 76, 'Online'),
    ('galle_01', 'AQI Monitor', 52, 'Maintenance'),
    ('matara_01', 'AQI Monitor', 45, 'Maintenance'),
    ('matara_01', 'Anemometer', 83, 'Online'),
    ('hambantota_01', 'Rain Gauge', 91, 'Online'),
    ('hambantota_01', 'Anemometer', 38, 'Maintenance'),
    
    -- Northern Province
    ('jaffna_01', 'AQI Monitor', 11, 'Offline'),
    ('jaffna_01', 'Rain Gauge', 91, 'Online'),
    ('kilinochchi_01', 'Anemometer', 6, 'Offline'),
    ('mannar_01', 'AQI Monitor', 72, 'Online'),
    ('vavuniya_01', 'Rain Gauge', 9, 'Offline'),
    ('mullaitivu_01', 'Anemometer', 82, 'Online'),
    
    -- Eastern Province
    ('batticaloa_01', 'AQI Monitor', 94, 'Online'),
    ('batticaloa_01', 'Rain Gauge', 22, 'Offline'),
    ('ampara_01', 'Anemometer', 67, 'Online'),
    ('trincomalee_01', 'Rain Gauge', 100, 'Online'),
    ('trincomalee_01', 'AQI Monitor', 19, 'Maintenance'),
    
    -- North Western Province
    ('kurunegala_01', 'Anemometer', 55, 'Online'),
    ('puttalam_01', 'Rain Gauge', 7, 'Offline'),
    ('puttalam_01', 'AQI Monitor', 88, 'Online'),
    
    -- North Central Province
    ('anuradhapura_01', 'Rain Gauge', 77, 'Online'),
    ('anuradhapura_01', 'Anemometer', 42, 'Maintenance'),
    ('polonnaruwa_01', 'AQI Monitor', 96, 'Online'),
    
    -- Uva Province
    ('badulla_01', 'Rain Gauge', 15, 'Offline'),
    ('badulla_01', 'Anemometer', 89, 'Online'),
    ('monaragala_01', 'AQI Monitor', 33, 'Maintenance'),
    
    -- Sabaragamuwa Province
    ('ratnapura_01', 'Rain Gauge', 99, 'Online'),
    ('ratnapura_01', 'AQI Monitor', 5, 'Offline'),
    ('kegalle_01', 'Anemometer', 71, 'Online'),
    ('embilipitiya_01', 'Rain Gauge', 62, 'Online');
