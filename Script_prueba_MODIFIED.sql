/***************************************************************************************************
Author:             Datamine Software 
Description:        Script to distribute trigger to local databases (using common_sql_statements)
***************************************************************************************************/

DECLARE @@new_statement_id decimal(12);
DECLARE @@new_batch        decimal(12);
DECLARE @@new_sequence     decimal(12);
DECLARE @@sql1		   varchar(max);
DECLARE @@sql2		   varchar(max);
DECLARE @@sql3		   varchar(max);
DECLARE @@sql4		   varchar(max);
DECLARE @@sql5		   varchar(max);
DECLARE @@sql6		   varchar(max);
DECLARE @@sql7		   varchar(max);
DECLARE @@sql8		   varchar(max);
DECLARE @@sql9		   varchar(max);
DECLARE @@sql10		   varchar(max);

SELECT @@new_statement_id = (SELECT MAX(sql_statement_id) FROM common_sql_statements);
SELECT @@new_batch        = (SELECT MAX(batch)            FROM common_sql_statements);
SELECT @@new_sequence     = (SELECT MAX(sequence_number)  FROM common_sql_statements);


IF (select COUNT(COLUMN_NAME) FROM INFORMATION_SCHEMA.COLUMNS AS c1
where c1.column_name IN ('Depth_To','Depth_From')
and  c1.table_name = 'UDEF_ESTRUCTURAL_PTOS' ) > '0'
BEGIN
EXEC (
'
DELETE FROM user_defined_table_columns WHERE table_id = 179 AND column_id = 1761
DELETE FROM table_column_assignments WHERE table_id = 179 AND column_id = 1761
ALTER TABLE dhl_import_UDEF_ESTRUCTURAL_PTOS DROP COLUMN DEPTH_FROM
DELETE FROM dhl_import_rules_table WHERE destination_table = ''UDEF_ESTRUCTURAL_PTOS'' AND data_column = ''DEPTH_FROM''

DELETE FROM user_defined_table_columns WHERE table_id = 179 AND column_id = 1762
DELETE FROM table_column_assignments WHERE table_id = 179 AND column_id = 1762
ALTER TABLE dhl_import_UDEF_ESTRUCTURAL_PTOS DROP COLUMN DEPTH_TO
DELETE FROM dhl_import_rules_table WHERE destination_table = ''UDEF_ESTRUCTURAL_PTOS'' AND data_column = ''DEPTH_TO''

ALTER TABLE UDEF_ESTRUCTURAL_PTOS DROP COLUMN DEPTH_from,DEPTH_to

')
END

SET @@sql1 = 'DELETE FROM user_defined_table_columns WHERE table_id = 179 AND column_id = 1761'
SET @@sql2 = 'DELETE FROM table_column_assignments WHERE table_id = 179 AND column_id = 1761'
SET @@sql3 = 'IF EXISTS(SELECT 1 FROM sys.columns WHERE name= ''DEPTH_FROM'' AND OBJECT_ID = OBJECT_ID(''[dbo].[dhl_import_UDEF_ESTRUCTURAL_PTOS]'')) ALTER TABLE [dbo].[dhl_import_UDEF_ESTRUCTURAL_PTOS] DROP COLUMN [DEPTH_FROM];';
SET @@sql4 = 'DELETE FROM dhl_import_rules_table WHERE destination_table = ''UDEF_ESTRUCTURAL_PTOS'' AND data_column = ''DEPTH_FROM'''
SET @@sql5 = 'DELETE FROM user_defined_table_columns WHERE table_id = 179 AND column_id = 1762'
SET @@sql6 = 'DELETE FROM table_column_assignments WHERE table_id = 179 AND column_id = 1762'
SET @@sql7 = 'IF EXISTS(SELECT 1 FROM sys.columns WHERE name= ''DEPTH_TO'' AND OBJECT_ID = OBJECT_ID(''[dbo].[dhl_import_UDEF_ESTRUCTURAL_PTOS]'')) ALTER TABLE [dbo].[dhl_import_UDEF_ESTRUCTURAL_PTOS] DROP COLUMN [DEPTH_TO];';
SET @@sql8 = 'DELETE FROM dhl_import_rules_table WHERE destination_table = ''UDEF_ESTRUCTURAL_PTOS'' AND data_column = ''DEPTH_TO'''
SET @@sql9 = 'IF EXISTS(SELECT 1 FROM sys.columns WHERE name= ''DEPTH_FROM'' AND OBJECT_ID = OBJECT_ID(''[dbo].[UDEF_ESTRUCTURAL_PTOS]'')) ALTER TABLE [dbo].[UDEF_ESTRUCTURAL_PTOS] DROP COLUMN [DEPTH_FROM];';
SET @@sql10 = 'IF EXISTS(SELECT 1 FROM sys.columns WHERE name= ''DEPTH_TO'' AND OBJECT_ID = OBJECT_ID(''[dbo].[UDEF_ESTRUCTURAL_PTOS]'')) ALTER TABLE [dbo].[UDEF_ESTRUCTURAL_PTOS] DROP COLUMN [DEPTH_TO];';

INSERT INTO common_sql_statements (batch,sequence_number,sql_text,user_id,application_id,target_dbms,status,sql_statement_id,app_version,db_version,server_execution_timestamp,sql_syntax2,target_dbms2)    
VALUES(@@new_batch + 1,@@new_sequence + 1,@@sql1,'Datamine',1,'ASA 9','NEW',@@new_statement_id + 1,'Fusion10.4.0','10.0.4',getdate(),@@sql1,'Microsoft SQL Server');

INSERT INTO common_sql_statements (batch,sequence_number,sql_text,user_id,application_id,target_dbms,status,sql_statement_id,app_version,db_version,server_execution_timestamp,sql_syntax2,target_dbms2)    
VALUES(@@new_batch + 2,@@new_sequence + 2,@@sql2,'Datamine',1,'ASA 9','NEW',@@new_statement_id + 2,'Fusion10.4.0','10.0.4',getdate(),@@sql2,'Microsoft SQL Server');

INSERT INTO common_sql_statements (batch,sequence_number,sql_text,user_id,application_id,target_dbms,status,sql_statement_id,app_version,db_version,server_execution_timestamp,sql_syntax2,target_dbms2)    
VALUES(@@new_batch + 3,@@new_sequence + 3,@@sql3,'Datamine',1,'ASA 9','NEW',@@new_statement_id + 3,'Fusion10.4.0','10.0.4',getdate(),@@sql3,'Microsoft SQL Server');

INSERT INTO common_sql_statements (batch,sequence_number,sql_text,user_id,application_id,target_dbms,status,sql_statement_id,app_version,db_version,server_execution_timestamp,sql_syntax2,target_dbms2)    
VALUES(@@new_batch + 4,@@new_sequence + 4,@@sql4,'Datamine',1,'ASA 9','NEW',@@new_statement_id + 4,'Fusion10.4.0','10.0.4',getdate(),@@sql4,'Microsoft SQL Server');

INSERT INTO common_sql_statements (batch,sequence_number,sql_text,user_id,application_id,target_dbms,status,sql_statement_id,app_version,db_version,server_execution_timestamp,sql_syntax2,target_dbms2)    
VALUES(@@new_batch + 5,@@new_sequence + 5,@@sql5,'Datamine',1,'ASA 9','NEW',@@new_statement_id + 5,'Fusion10.4.0','10.0.4',getdate(),@@sql5,'Microsoft SQL Server');

INSERT INTO common_sql_statements (batch,sequence_number,sql_text,user_id,application_id,target_dbms,status,sql_statement_id,app_version,db_version,server_execution_timestamp,sql_syntax2,target_dbms2)    
VALUES(@@new_batch + 6,@@new_sequence + 6,@@sql6,'Datamine',1,'ASA 9','NEW',@@new_statement_id + 6,'Fusion10.4.0','10.0.4',getdate(),@@sql6,'Microsoft SQL Server');

INSERT INTO common_sql_statements (batch,sequence_number,sql_text,user_id,application_id,target_dbms,status,sql_statement_id,app_version,db_version,server_execution_timestamp,sql_syntax2,target_dbms2)    
VALUES(@@new_batch + 7,@@new_sequence + 7,@@sql7,'Datamine',1,'ASA 9','NEW',@@new_statement_id + 7,'Fusion10.4.0','10.0.4',getdate(),@@sql7,'Microsoft SQL Server');

INSERT INTO common_sql_statements (batch,sequence_number,sql_text,user_id,application_id,target_dbms,status,sql_statement_id,app_version,db_version,server_execution_timestamp,sql_syntax2,target_dbms2)    
VALUES(@@new_batch + 8,@@new_sequence + 8,@@sql8,'Datamine',1,'ASA 9','NEW',@@new_statement_id + 8,'Fusion10.4.0','10.0.4',getdate(),@@sql8,'Microsoft SQL Server');

INSERT INTO common_sql_statements (batch,sequence_number,sql_text,user_id,application_id,target_dbms,status,sql_statement_id,app_version,db_version,server_execution_timestamp,sql_syntax2,target_dbms2)    
VALUES(@@new_batch + 9,@@new_sequence + 9,@@sql9,'Datamine',1,'ASA 9','NEW',@@new_statement_id + 9,'Fusion10.4.0','10.0.4',getdate(),@@sql9,'Microsoft SQL Server');

INSERT INTO common_sql_statements (batch,sequence_number,sql_text,user_id,application_id,target_dbms,status,sql_statement_id,app_version,db_version,server_execution_timestamp,sql_syntax2,target_dbms2)    
VALUES(@@new_batch + 10,@@new_sequence + 10,@@sql10,'Datamine',1,'ASA 9','NEW',@@new_statement_id + 10,'Fusion10.4.0','10.0.4',getdate(),@@sql10,'Microsoft SQL Server');

GO
