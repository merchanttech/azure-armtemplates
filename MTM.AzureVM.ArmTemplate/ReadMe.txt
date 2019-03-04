

POST Deployment

On the Application Settings Blade,  ensure rmeote debugging is enabled and targeting VS2017

On the Diagnostics Logs Blade, ensure Application Logging is enabled and configured for blob storage. Select the storage account that was created as part
of the arm template,and create a new container called websitelogs.

Also ensure that the Web server logging is also enabled and logging to the same storage container.