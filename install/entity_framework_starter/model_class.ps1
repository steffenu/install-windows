# Vorab Setzen der Ausführungsrichtlinie (erforderlich, um Skripte auszuführen)
# Set-ExecutionPolicy Bypass -Scope Process -Force ( nur für diese Ausführung setzen )
# Set-ExecutionPolicy RemoteSigned ( Alternativ systemweit setzen )

# https://learn.microsoft.com/de-de/ef/core/get-started/overview/first-app?tabs=netcore-cli#create-the-database

# Erstellen eines neuen Projekts
dotnet new console -o EFGetStarted
cd EFGetStarted