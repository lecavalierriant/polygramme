$titres = @{
	"karolvs" = @("Karolvs", "0x4B.svg", ' class = "parchemin"')
	"lineaire" = @("Linéaire", "0x4C.svg", "")
}

function lister($police) {
	Write-Host "Liste en cours..."
	$lignes = @()
	$lignes += '<!doctype html>
<html>
<head>
	<link rel = "stylesheet" href = "../lecavalierriant/lecavalierriant.css">
	<link rel = "stylesheet" href = "' + $police + '.css">
	<link rel = "icon" href = "' + $police + '/' + $titres[$police][1] + '">
	<script src = "' + $police + '.js"></script>
	<title>' + $titres[$police][0] + '</title>
</head>
<body' + $titres[$police][2] + '>

<a href = "polygramme.html"><h1 class = "' + $police + '">Polygramme</h1></a>
<h1 class = "' + $police + '">' + $titres[$police][0] + '</h1>

<p class = "' + $police + '">'
	$fichiers = Get-ChildItem -Path $PSScriptRoot\$police\ -File -Recurse -Include *.svg
	$lignes += $fichiers | ForEach-Object {"	" + [char][int]$_.BaseName}
	$lignes += '</p>

</body>
</html>'
	$lignes | Out-File -FilePath "$PSScriptRoot\$police.html" -Encoding utf8
	Write-Host "Liste terminée !"
}

lister("karolvs")
lister("lineaire")
