Website in Azure
http://nautilusqa-website.azurewebsites.net

EPI Server Site Login
username: epiadmin
password: P@ssword


For stage and production the password will be
VyyY4SyRyZFJJXsvbQsrcF3r


SQL Server Connection for Azure
Server=tcp:nautilusqa-sqlserver.database.windows.net,1433;Database=nautilusdb;User Id=Captain;Password=eRH6yfn2wXemhvUF;Trusted_Connection=False;Encrypt=True;MultipleActiveResultSets=True;TrustServerCertificate=False;Connection Timeout=30



POST Deployment

On the Application Settings Blade,  ensure rmeote debugging is enabled and targeting VS2017

On the Diagnostics Logs Blade, ensure Application Logging is enabled and configured for blob storage. Select the storage account that was created as part
of the arm template,and create a new container called websitelogs.

Also ensure that the Web server logging is also enabled and logging to the same storage container.