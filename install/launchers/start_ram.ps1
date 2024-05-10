# Check if the environment variable is set
if (-not [string]::IsNullOrEmpty($env:MSSQL_DB_STRING)) {
    Write-Output "Environment variable MSSQL_DB_STRING is set to: $($env:MSSQL_DB_STRING)"
} else {
    Write-Output "Environment variable MSSQL_DB_STRING is not set."
}

# Run the .NET Core project
Start-Process powershell -ArgumentList "-NoExit", "-Command", "dotnet run --project 'C:\Users\sunger\Source\Repos\con-innendienst-ram\TbRam.API\TbRam.API.csproj' --configuration Debug"


# Start the Next.js development server
Start-Process PowerShell -ArgumentList "-NoExit", "-Command cd 'C:\Users\sunger\source\repos\con-innendienst-ram\TbRam.ClientApp'; npm run dev"

# Open the specified URL in Chrome
Start-Process "chrome.exe" -ArgumentList "https://localhost:44123"