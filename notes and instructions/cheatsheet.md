## Rerunnable object creation
IF DB_ID(N'Name') IS NULL BEGIN CREATE DATABASE Name; END
IF SCHEMA_ID(N'name') IS NULL BEGIN EXEC(N'CREATE SCHEMA name'); END

## Rules and mistakes
- NULL: use IS NULL, never = NULL (NULL means unknown).
- GO is an SSMS batch separator, not T-SQL. Put it after USE.
- CREATE SCHEMA (also PROCEDURE, VIEW) must be alone in its batch -> wrap in EXEC('...') inside IF.
- SCHEMA_ID/DB_ID check the CURRENT database. Always confirm USE first.
- Never DROP DATABASE to make a script rerunnable: it destroys data.