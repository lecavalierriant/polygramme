$polices = @{
	"heraldix" = @("Héraldix", "H", ".png", "")
	"karolvs" = @("Karolvs", "0x4B", ".svg", ' class = "parchemin"')
	"lineaire" = @("Linéaire", "0x4C", ".svg", "")
}

function lister($police) {
	Write-Host "Liste en cours..."
	$lignes = @()
	$lignes += '<!doctype html>
<html>
<head>
	<link rel = "stylesheet" href = "../lecavalierriant/lecavalierriant.css">
	<link rel = "stylesheet" href = "' + $police + '.css">
	<link rel = "icon" href = "' + $police + '/' + $polices[$police][1] + $polices[$police][2] + '">
	<script src = "' + $police + '.js"></script>
	<title>' + $polices[$police][0] + '</title>
</head>
<body' + $polices[$police][3] + '>

<a href = "polygramme.html"><h1 class = "' + $police + '">Polygramme</h1></a>
<h1 class = "' + $police + '">' + $polices[$police][0] + '</h1>

<p class = "' + $police + '">'
	$fichiers = Get-ChildItem -Path $PSScriptRoot\$police\ -File -Recurse -Include "*$($polices[$police][2])"
	$lignes += $fichiers | ForEach-Object {"	" + [char][int]$_.BaseName}
	$lignes += '</p>

</body>
</html>'
	$lignes | Out-File -FilePath "$PSScriptRoot\$police.html" -Encoding utf8
	Write-Host "Liste terminée !"
}

lister("heraldix")
lister("karolvs")
lister("lineaire")
