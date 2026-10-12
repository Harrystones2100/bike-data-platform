## 04/10/2026
Project started. Olist downloaded, starting on the dataset.md file, nothing loaded yet so far. Added notes to dataset.md and pushed everything to my repository on github and loaded the md files to my project in Claude.

## 11/10/2026
Step 1 (Foundation) done. Wrote 01_create_database_and_schemas.sql: creates OlistDW and stg/dw/rpt schemas, rerunnable. Verified 3 schemas in sys.schemas.
Solid: IF ... IS NULL pattern, DB_ID/SCHEMA_ID, USE + GO.
Missed: why EXEC is needed for CREATE SCHEMA (batch rule, not "schemas aren't objects").
Next: Step 2, create stg tables (all NVARCHAR) and load the CSVs.

## 11/10/2026 (cont.)
Step 2 in progress. Wrote 02_create_stg_tables.sql: stg.customers created and loaded (99,441 rows). BULK INSERT with FORMAT = 'CSV' failed (error 7301), worked without it using ROWTERMINATOR = '0x0a'. Found inconsistent double quotes in the loaded data (62,165 customer_ids start with "), to clean in Step 4. LEN check shows no hidden carriage return.
Solid: DROP TABLE IF EXISTS + CREATE TABLE, BULK INSERT options, LIKE with COUNT(*).
Missed: SCHEMA_ID check pattern (I used "look in sys" instead).
Next: stg.orders, then the remaining files. stg.orders created and loaded (99,441 rows), same BULK INSERT options as customers.
Next: stg.sellers (~3,095 rows), then remaining files one at a time.

## 12/10/2026
Confirmed missing order dates are real NULLs. Explained why staging tables are dropped and recreated each run (avoids duplicate rows from repeated loads).
Next: load sellers, translation, products, payments, reviews, items, geolocation (one at a time).

## 12/10/2026 (cont.)
All 9 stg tables loaded in 02_create_stg_tables.sql. order_reviews failed (4863) because comments contain line breaks inside quotes; 0x0d0a did not help; BULK INSERT with FORMAT = 'CSV' + FIELDQUOTE worked. Customers had failed with FORMAT = 'CSV' earlier (7301), so retest is pending.
Solid: DROP/CREATE/BULK INSERT pattern, reading error messages, checking encoding and line endings, testing real NULL vs text.
Missed: why quote characters can't be trusted in a CSV without FORMAT = 'CSV'.