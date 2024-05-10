# Vorab Setzen der Ausführungsrichtlinie (erforderlich, um Skripte auszuführen)
# Set-ExecutionPolicy Bypass -Scope Process -Force ( nur für diese Ausführung setzen )
# Set-ExecutionPolicy RemoteSigned ( Alternativ systemweit setzen )
# https://learn.microsoft.com/de-de/ef/core/get-started/overview/first-app?tabs=netcore-cli#create-the-database

# Erstellen eines neuen Projekts
dotnet new console -o EFGetStarted
cd EFGetStarted

# Installieren von Entity Framework Core
dotnet add package Microsoft.EntityFrameworkCore.Sqlite

# Erstellen der Model.cs (ruft seperates skript auf )
Start-Process powershell -ArgumentList "-File `"\model.ps1`"" -Verb RunAs

# Erstellen der Datenbank
# dotnet-ef enables commands for migration / database handling
# database update erstellt die Datenbank und wendet die neue Migration auf sie an
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet tool install --global dotnet-ef
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet ef migrations add InitialCreate
dotnet ef database update

# Erstellen der Program.cs (ruft seperates skript auf )
Start-Process powershell -ArgumentList "-File `"\program.ps1`"" -Verb RunAs

# Ausführen der App
dotnet run