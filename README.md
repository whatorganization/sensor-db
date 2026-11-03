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

The seed data contains 43 sensor records across 26 sample locations:

| Location ID | District |
|---|---|
| `colombo_01` | Colombo |
| `gampaha_01` | Gampaha |
| `kalutara_01` | Kalutara |
| `kandy_01` | Kandy |
| `matale_01` | Matale |
| `nuwara_eliya_01` | Nuwara Eliya |
| `galle_01` | Galle |
| `matara_01` | Matara |
| `hambantota_01` | Hambantota |
| `jaffna_01` | Jaffna |
| `kilinochchi_01` | Kilinochchi |
| `mannar_01` | Mannar |
| `vavuniya_01` | Vavuniya |
| `mullaitivu_01` | Mullaitivu |
| `batticaloa_01` | Batticaloa |
| `ampara_01` | Ampara |
| `trincomalee_01` | Trincomalee |
| `kurunegala_01` | Kurunegala |
| `puttalam_01` | Puttalam |
| `anuradhapura_01` | Anuradhapura |
| `polonnaruwa_01` | Polonnaruwa |
| `badulla_01` | Badulla |
| `monaragala_01` | Monaragala |
| `ratnapura_01` | Ratnapura |
| `kegalle_01` | Kegalle |
| `embilipitiya_01` | Embilipitiya |

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
