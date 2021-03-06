---------------------------------FULL BACKUP----------------------------------------------------

BACKUP DATABASE [AdventureWorks] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.DEV01\MSSQL\Backup\AdventureWorks_Jan_05_2017_6_19_pm.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10, CHECKSUM
GO

-------------------------------DELETE RECORD-----------------------------------------------------
DELETE FROM MyProducts 
WHERE ProductID = 1

-------------------------------DIFFERENTIAL BACKUP 1-----------------------------------------------
BACKUP DATABASE [AdventureWorks] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.DEV01\MSSQL\Backup\AdventureWorks_Diff_Jan_05_2017_6_19_pm.bak' 
WITH  DIFFERENTIAL , NOFORMAT, INIT,  NAME = N'AdventureWorks-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10, CHECKSUM
GO

-------------------------------DELETE MORE RECORDS-------------------------------------------------
DELETE FROM MyProducts 
WHERE ProductID BETWEEN 300 and 400

-------------------------------DIFFERENTIAL BACKUP 2------------------------------------------------
BACKUP DATABASE [AdventureWorks] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.DEV01\MSSQL\Backup\AdventureWorks_Diff_2_Jan_05_2017_6_19_pm.bak' 
WITH  DIFFERENTIAL , NOFORMAT, INIT,  NAME = N'AdventureWorks-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10, CHECKSUM
GO

-------------------------------DELETE MORE RECORDS-------------------------------------------------
DELETE FROM MyProducts 
WHERE ProductID > 0 AND ProductID < 400
GO

-------------------------------TRANSACTION LOG BACKUP 1---------------------------------------------------
BACKUP LOG [AdventureWorks] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.DEV01\MSSQL\Backup\AdventureWorks_Trans_Jan_02_2017_6_19_pm.trn'
WITH NOFORMAT, INIT,  NAME = N'AdventureWorks-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10, CHECKSUM
GO

-------------------------------DELETE MORE RECORDS-------------------------------------------------
DELETE FROM MyProducts 
WHERE ProductID BETWEEN 400 and 500
GO

-------------------------------TRANSACTION LOG BACKUP 2---------------------------------------------------
BACKUP LOG [AdventureWorks] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.DEV01\MSSQL\Backup\AdventureWorks_Trans_2_Jan_02_2017_6_19_pm.trn' 
WITH NOFORMAT, INIT,  NAME = N'AdventureWorks-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10, CHECKSUM
GO

-------------------------------DELETE MORE RECORDS-------------------------------------------------
DELETE FROM MyProducts 
WHERE ProductID BETWEEN 400 and 600
GO


--------------------------------TAIL LOG BACKUP-------------------------------------------------------------
BACKUP LOG [AdventureWorks] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.DEV01\MSSQL\Backup\AdventureWorks_Tail_Log_Jan_02_2017_6_19_pm.trn'
WITH  NO_TRUNCATE , NOFORMAT, INIT,  NAME = N'AdventureWorks-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 10, CHECKSUM
GO
