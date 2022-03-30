DECLARE @current_year varchar(60)
  SET @current_year = RTRIM(LTRIM(str(DATEPART(yy, CURRENT_TIMESTAMP))));

DECLARE @current_month varchar(60)
  SET @current_month = RTRIM(LTRIM(str(DATEPART(mm, CURRENT_TIMESTAMP))));

DECLARE @current_day varchar(60)
  SET @current_day= RTRIM(LTRIM(str(DATEPART(dd, CURRENT_TIMESTAMP))));

DECLARE @two_days_before varchar(60)
  SET @two_days_before= RTRIM(LTRIM(str(DATEPART(dd, DATEADD(day, -2, CURRENT_TIMESTAMP)))));

DECLARE @current_date varchar(60)
  SET @current_date = @current_day+'_'+@current_month+'_'+@current_year;

DECLARE @two_days_before_date varchar(60)
  SET @two_days_before_date= @two_days_before+'_'+@current_month+'_'+@current_year;

DECLARE @backup_path varchar(60)
  SET @backup_path = 'C:\backups\'+ @current_date +'_backup.bak';

DECLARE @two_days_before_backup_path varchar(60)
  SET @two_days_before_backup_path = 'C:\backups\'+ @two_days_before_date +'_backup.bak';


EXECUTE master.dbo.xp_delete_file 0,@backup_path;
EXECUTE master.dbo.xp_delete_file 0,@two_days_before_backup_path;

BACKUP DATABASE DB_Core
TO DISK = @backup_path;