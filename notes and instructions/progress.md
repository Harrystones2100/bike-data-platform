## 04/10/2026
Project started. Olist downloaded, starting on the dataset.md file, nothing loaded yet so far. Added notes to dataset.md and pushed everything to my repository on github and loaded the md files to my project in Claude.

## 11/10/2026
Step 1 (Foundation) done. Wrote 01_create_database_and_schemas.sql: creates OlistDW and stg/dw/rpt schemas, rerunnable. Verified 3 schemas in sys.schemas.
Solid: IF ... IS NULL pattern, DB_ID/SCHEMA_ID, USE + GO.
Missed: why EXEC is needed for CREATE SCHEMA (batch rule, not "schemas aren't objects").
Next: Step 2, create stg tables (all NVARCHAR) and load the CSVs.