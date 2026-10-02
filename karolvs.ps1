function lister() {
	Write-Host "Liste en cours..."
	$lignes = @()
	$lignes += '<!doctype html>
<html>
<head>
	<link rel = "stylesheet" href = "../lecavalierriant/lecavalierriant.css">
	<link rel = "stylesheet" href = "karolvs.css">
	<link rel = "icon" href = "karolvs/0x4B.svg">
	<script src = "karolvs.js"></script>
	<title>Karolvs</title>
</head>
<body class = "parchemin">

<a href = "polygramme.html"><h1 class = "karolvs">Polygramme</h1></a>
<h1 class = "karolvs">Karolvs</h1>

<p class = "karolvs">'
	$fichiers = Get-ChildItem -Path $PSScriptRoot\karolvs\ -File -Recurse -Include *.svg
	$lignes += $fichiers | ForEach-Object {"	" + [char][int]$_.BaseName}
	$lignes += '</p>

</body>
</html>'
	$lignes | Out-File -FilePath "$PSScriptRoot\karolvs.html" -Encoding utf8
	Write-Host "Liste terminée !"
}

lister
