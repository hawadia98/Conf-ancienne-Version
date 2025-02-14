
$server = "WD204SQL10044.devops.iaas.cagip.gca,60101"
$database = "fusioniam"
$username="U204T6_OWNER"
$password="1_QcolRw1SqsY6KK"
$table = "zz_Directory_UserType"
$outputFile = "D:\UsercubeCAA\ExportDirectory\Directory_UserType.csv"

# Connexion à SQL Server et récupération des données
$query = "SELECT TOP 0 * FROM $table"       # Sélectionner uniquement l'en-tête               
$connectionString = "Server=$server;Database=$database;User ID=$username;Password=$password"

$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString
$connection.Open()

$command = $connection.CreateCommand()
$command.CommandText = $query

$adapter = New-Object System.Data.SqlClient.SqlDataAdapter $command
$table = New-Object System.Data.DataTable
$adapter.Fill($table)


# Exporter vers csv avec uniquement l'en-tête sans guillemets
$headers = $table.Columns | ForEach-Object { $_.ColumnName }  # Extraire les noms des colonnes
$headers -join ";" | Out-File -FilePath $outputFile -Encoding UTF8
$connection.Close()
