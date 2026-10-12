## Rerunnable object creation
IF DB_ID(N'Name') IS NULL BEGIN CREATE DATABASE Name; END
IF SCHEMA_ID(N'name') IS NULL BEGIN EXEC(N'CREATE SCHEMA name'); END

## Rules and mistakes
- NULL: use IS NULL, never = NULL (NULL means unknown).
- GO is an SSMS batch separator, not T-SQL. Put it after USE.
- CREATE SCHEMA (also PROCEDURE, VIEW) must be alone in its batch -> wrap in EXEC('...') inside IF.
- SCHEMA_ID/DB_ID check the CURRENT database. Always confirm USE first.
- Never DROP DATABASE to make a script rerunnable: it destroys data.

## Loading CSVs
- BULK INSERT ... WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');
- FORMAT = 'CSV' gave error 7301 (IID_IColumnsInfo) on my setup; dropped it and handled quotes in cleaning.
- Error 4861 / OS code 3 = path not found or no permission. Keep CSVs in C:\Olist\, not in the user profile.
- String literals use single quotes.
- Check encoding and line ending per file (VS Code status bar). ROWTERMINATOR: LF = '0x0a', CRLF = '0x0d0a'.
- Msg 4863 on a short column (like a date) = rows are misaligned, not a too-short column.
- A failed BULK INSERT rolls back completely; the table stays empty.
- Quoted multi-line text in CSV -> BULK INSERT ... WITH (FIRSTROW = 2, FORMAT = 'CSV', FIELDQUOTE = '"');