# Environmental Operations MySQL Database

A local MySQL 8.0 database for testing the Laravel ETL ingestion portal. It simulates hardware status data from Sri Lankan weather stations and environmental sensors.

## Start the Database

From this directory, run:

```bash
docker compose up -d
```

Check the container status:

```bash
docker compose ps
```

Stop the database:

```bash
docker compose down
```

The initialization script runs automatically the first time the MySQL data directory is created.

## Connection Details

| Setting | Value |
|---|---|
| Host | `127.0.0.1` |
| Port | `3306` |
| Database | `environmental_ops_db` |
| Username | `etl_user` |
| Password | `etl_pass` |
| Root password | `root_password` |
| MySQL image | `mysql:8.0` |

### Laravel `.env` Settings

```dotenv
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=environmental_ops_db
DB_USERNAME=etl_user
DB_PASSWORD=etl_pass
```

## Database Contents

The database contains one table: `sensor_hardware_status`.

| Column | Type | Description |
|---|---|---|
| `id` | `INT` | Auto-incrementing primary key |
| `location_id` | `VARCHAR(50)` | Sri Lankan district station identifier |
| `sensor_type` | `VARCHAR(50)` | Type of environmental sensor |
| `battery_level_pct` | `INT` | Battery level as a percentage |
| `status` | `VARCHAR(20)` | `Online`, `Offline`, or `Maintenance` |

The seed data contains 20 sample station records:

| Location ID | District | Sensor Type | Battery | Status |
|---|---|---|---:|---|
| `LK-11` | Colombo | Rain Gauge | 92% | Online |
| `LK-12` | Gampaha | AQI Monitor | 81% | Online |
| `LK-13` | Kalutara | Anemometer | 74% | Online |
| `LK-21` | Kandy | Anemometer | 78% | Online |
| `LK-23` | Nuwara Eliya | Rain Gauge | 57% | Maintenance |
| `LK-31` | Galle | Rain Gauge | 18% | Offline |
| `LK-32` | Matara | AQI Monitor | 88% | Online |
| `LK-33` | Hambantota | Anemometer | 69% | Online |
| `LK-41` | Jaffna | Anemometer | 38% | Maintenance |
| `LK-42` | Kilinochchi | AQI Monitor | 11% | Offline |
| `LK-51` | Batticaloa | AQI Monitor | 45% | Maintenance |
| `LK-52` | Ampara | Rain Gauge | 83% | Online |
| `LK-61` | Kurunegala | Anemometer | 87% | Online |
| `LK-62` | Puttalam | Rain Gauge | 91% | Online |
| `LK-71` | Anuradhapura | Rain Gauge | 76% | Online |
| `LK-72` | Polonnaruwa | AQI Monitor | 52% | Maintenance |
| `LK-81` | Badulla | AQI Monitor | 64% | Maintenance |
| `LK-82` | Monaragala | Anemometer | 6% | Offline |
| `LK-91` | Ratnapura | AQI Monitor | 72% | Online |
| `LK-92` | Kegalle | Rain Gauge | 9% | Offline |

## Useful MySQL Commands

Connect as the ETL user:

```bash
docker compose exec mysql mysql -u etl_user -petl_pass environmental_ops_db
```

Query the seeded data:

```sql
SELECT * FROM sensor_hardware_status;
```

Show station counts by status:

```sql
SELECT status, COUNT(*) AS station_count
FROM sensor_hardware_status
GROUP BY status;
```

Because MySQL initialization scripts run only on a fresh data directory, recreate the container and its data when you need to re-run `init.sql`:

```bash
docker compose down -v
docker compose up -d
```
