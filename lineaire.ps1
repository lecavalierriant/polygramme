function lister() {
	Write-Host "Liste en cours..."
	$lignes = @()
	$lignes += '<!doctype html>
<html lang = "fr">
<head>
	<link rel = "stylesheet" href = "../lecavalierriant/lecavalierriant.css">
	<link rel = "stylesheet" href = "lineaire.css">
	<link rel = "icon" href = "lineaire/A.svg">
	<script src = "lineaire.js"></script>
	<title>Linéaire</title>
</head>
<body>

<a href = "polygramme.html"><h1 class = "lineaire">Polygramme</h1></a>
<h1 class = "lineaire">Linéaire</h1>

<p class = "lineaire">'
	$fichiers = Get-ChildItem -Path $PSScriptRoot\lineaire\ -File -Recurse -Include *.svg
	$lignes += $fichiers | ForEach-Object {"	" + $_.BaseName}
	$lignes += '</p>

</body>
</html>'
	$lignes | Out-File -FilePath "$PSScriptRoot\lineaire.html" -Encoding utf8
	Write-Host "Liste terminée !"
}

lister
