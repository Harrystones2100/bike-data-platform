-- 01_create_database_and_schemas.sql
-- Creates OlistDW and the stg / dw / rpt schemas. Safe to rerun.

IF DB_ID(N'OlistDW') IS NULL
BEGIN
    CREATE DATABASE OlistDW;
END
GO

USE OlistDW;
GO

IF SCHEMA_ID(N'stg') IS NULL
BEGIN
    EXEC(N'CREATE SCHEMA stg');
END
GO

IF SCHEMA_ID(N'dw') IS NULL
BEGIN
    EXEC(N'CREATE SCHEMA dw');
END
GO

IF SCHEMA_ID(N'rpt') IS NULL
BEGIN
    EXEC(N'CREATE SCHEMA rpt');
END
GO