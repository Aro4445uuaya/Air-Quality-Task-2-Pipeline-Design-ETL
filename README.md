# Air Quality Sensor Data Engineering Pipeline – Task 2

## Project Overview

This project implements a batch data engineering pipeline using the UCI Air Quality Dataset.

The pipeline extracts historical air quality sensor data from a CSV file, transforms and validates the records, and loads the processed data into a MySQL database.

The objective is to build a structured, repeatable, and verifiable ETL workflow.

## Dataset

- **Source:** UCI Machine Learning Repository
- **Dataset:** Air Quality
- **File:** `AirQualityUCI.csv`
- **Processing Type:** Batch Processing
- **Original CSV Rows:** 9,471
- **Extracted Records:** 9,357

Dataset link: https://archive.ics.uci.edu/dataset/360/air+quality

## Technologies Used

- Python
- Pandas
- MySQL Server
- MySQL Workbench
- SQLAlchemy
- PyMySQL
- python-dotenv
- VS Code

## Pipeline Architecture

```text
UCI Air Quality Dataset
          |
          v
      EXTRACTION
      extract.py
          |
          v
   extracted_data.csv
          |
          v
    TRANSFORMATION
     transform.py
          |
          v
  transformed_data.csv
          |
          v
      VALIDATION
      validate.py
          |
          v
         LOADING
        load.py
          |
          v
     MySQL Database
  air_quality_warehouse
          |
          v
  air_quality_readings
```

## Project Structure

```text
Air-Quality-Data-Engineering/
│
├── data/
│   ├── raw/
│   │   └── AirQualityUCI.csv
│   │
│   └── processed/
│       ├── extracted_data.csv
│       └── transformed_data.csv
│
├── pipeline/
│   ├── extract.py
│   ├── transform.py
│   ├── validate.py
│   ├── load.py
│   └── run_pipeline.py
│
├── sql/
├── config/
├── logs/
├── requirements.txt
├── .env
└── README.md
```

## Pipeline Implementation

### 1. Data Extraction

- Reads the source CSV file.
- Handles semicolon-separated data and decimal-comma values.
- Removes fully empty rows and columns.
- Saves the extracted dataset.

**Results:**
- Original rows: 9,471
- Empty rows removed: 114
- Extracted records: 9,357
- Extracted columns: 15

### 2. Data Transformation

- Identifies numeric columns.
- Converts `-200` sentinel values into `NaN`.
- Combines Date and Time into a Timestamp column.
- Saves the transformed dataset.

**Results:**
- Input records: 9,357
- Output records: 9,357
- Numeric columns processed: 13
- Missing-value markers converted: 16,701
- Invalid timestamps: 0

### 3. Data Validation

The validation stage checks:

- Required columns
- Invalid timestamps
- Duplicate records
- Duplicate timestamps
- Missing values
- Chronological ordering
- Time intervals greater than one hour

**Validation Results:**

| Validation Check | Result |
|---|---:|
| Total Records | 9,357 |
| Invalid Timestamps | 0 |
| Duplicate Rows | 0 |
| Duplicate Timestamps | 0 |
| Missing Values | 16,701 |
| Chronological Order | True |
| Intervals Greater Than 1 Hour | 0 |
| Validation Status | PASSED |

### 4. Data Loading

- Connects Python to MySQL using SQLAlchemy and PyMySQL.
- Loads transformed records into the destination table.
- Verifies the destination row count.

**Database Details:**

- Database: `air_quality_warehouse`
- Table: `air_quality_readings`

**Loading Results:**

| Metric | Result |
|---|---:|
| Source Records | 9,357 |
| MySQL Records | 9,357 |
| Row Count Difference | 0 |
| Loading Status | SUCCESS |

## Running the Pipeline

### Step 1 – Clone the repository

```bash
git clone YOUR_GITHUB_REPOSITORY_URL
```

### Step 2 – Install dependencies

```bash
pip install -r requirements.txt
```

### Step 3 – Configure database credentials

Create a local `.env` file:

```env
DB_HOST=localhost
DB_PORT=3306
DB_NAME=air_quality_warehouse
DB_USER=root
DB_PASSWORD=your_mysql_password
```

Create the database and destination table using the SQL definitions included in the project.

### Step 4 – Run the complete pipeline

```bash
python pipeline/run_pipeline.py
```

The runner executes extraction, transformation, and validation, then checks the MySQL record count. If matching records already exist, it skips reloading to prevent duplicate insertion.

## Key Data Quality Observations

- The source CSV contained 114 fully empty rows.
- The `-200` value was treated as a missing-value marker.
- Missing sensor readings were retained as `NaN`.
- No invalid timestamps or duplicate records were detected.
- The final MySQL record count matched the transformed dataset.

## Final Outcome

The batch ETL pipeline was successfully implemented and executed.

A total of **9,357 records** were processed and verified in MySQL, with all implemented validation checks passing.

This project demonstrates practical skills in Python-based ETL development, data transformation, data quality validation, relational database integration, and pipeline orchestration.

## Author

Air Quality Sensor Data Engineering – Week 2 Internship Project