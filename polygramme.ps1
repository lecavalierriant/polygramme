$polices = @{
	"heraldix" = @("Héraldix", "0x48", ".png", "")
	"karolvs" = @("Karolvs", "0x4B", ".svg", ' class = "parchemin"')
	"lineaire" = @("Linéaire", "0x4C", ".svg", "")
}

$correspondances = @(

	# ..
	@{original = "0x27"; copies = @("0xB4")},
	@{original = "0x2DC"; copies = @("0x1FC0")},
	@{original = "0x2DA"; copies = @("0xB0")},
	
	# lt
	@{original = "A"; copies = @("0x391", "0x410")},
		@{original = "Á"; copies = @("0x1FBB", "0x386")},
		@{original = "À"; copies = @("0x1FBA")},
		@{original = "Ä"; copies = @("0x4D2")},
		@{original = "Ă"; copies = @("0x1FB8", "0x4D0")},
		@{original = "Ā"; copies = @("0x1FB9")},
	@{original = "Æ"; copies = @("0x4D4")},
	@{original = "B"; copies = @("0x392", "0x412")},
	@{original = "C"; copies = @("0x3F9", "0x421", "0x28")},
		@{original = "Đ"; copies = @("0xD0")},
	@{original = "E"; copies = @("0x395", "0x415")},
		@{original = "É"; copies = @("0x388","0x1FC9")},
		@{original = "È"; copies = @("0x1FC8", "0x400")},
		@{original = "Ë"; copies = @("0x401")},
		@{original = "Ĕ"; copies = @("0x4D6")},
	@{original = "F"; copies = @("0x3DC")},
	@{original = "0x48"; copies = @("0x397", "0x41D")},
	@{original = "I"; copies = @("0x399", "0x406", "0x31")},
		@{original = "Í"; copies = @("0x38A")},
		@{original = "Ï"; copies = @("0x3AA", "0x407")},
	@{original = "K"; copies = @("0x39A", "0x41A")},
		@{original = "Ḱ"; copies = @("0x40C")},
	@{original = "M"; copies = @("0x39C", "0x41C")},
	@{original = "N"; copies = @("0x39D")},
	@{original = "O"; copies = @("0x39F", "0x41E", "0x30")},
		@{original = "Ó"; copies = @("0x38C")},
		@{original = "Ö"; copies = @("0x4E6")},
	@{original = "P"; copies = @("0x3A1", "0x420")},
	@{original = "T"; copies = @("0x3A4", "0x422")},
	@{original = "Þ"; copies = @("0x3F7")},
	@{original = "X"; copies = @("0x3A7", "0x425")},
	@{original = "Y"; copies = @("0x3A5", "0x423")},
		@{original = "Ý"; copies = @("0x38E")},
		@{original = "Ÿ"; copies = @("0x3AB", "0x4F0")},
		@{original = "Ȳ"; copies = @("0x4EE")},
	@{original = "Z"; copies = @("0x396")},

	# gr
	@{original = "Γ"; copies = @("0x413")},
	@{original = "Δ"; copies = @("0x414")},
	@{original = "Θ"; copies = @("0x472")},
	@{original = "Λ"; copies = @("0x41B")},
	@{original = "Π"; copies = @("0x41F")},
	@{original = "Φ"; copies = @("0x424")},

	# ru
	@{original = "З"; copies = @("0x33")},
	@{original = "Ч"; copies = @("0x34")}

	# 00
)

function copier($police) {
	$données = [System.Collections.Generic.List[PSCustomObject]]::new()
	foreach ($caractère in $correspondances) {
		$données.Add(
			[PSCustomObject]@{
				"Original" = $caractère.original
				"Copies" = $caractère.copies -join " "
			}
		)
		$source = $PSScriptRoot + "\" + $police + "\" + $caractère.original + ".png"
		if (Test-Path -Path $source) {
			foreach ($copie in $caractère.copies) {
				$copie = $PSScriptRoot + "\" + $police + "\" + $copie + ".png"
				try {Copy-Item -Path $source -Destination $copie -Force}
				catch {Write-Error "$copie. Erreur : $_"}
			}
		}
	}
	$données | Export-Csv -Path "$PSScriptRoot\polygramme.csv" -NoTypeInformation -Encoding UTF8
}

function lister($police) {
	$lignes = @()
	$lignes += '<!doctype html>
<html>
<head>
	<meta charset = "utf-8">
	<link rel = "stylesheet" href = "../lecavalierriant/lecavalierriant.css">
	<link rel = "stylesheet" href = "' + $police + '.css">
	<link rel = "icon" href = "' + $police + '/' + $polices[$police][1] + $polices[$police][2] + '">
	<script src = "' + $police + '.js"></script>
	<title>' + $polices[$police][0] + '</title>
</head>
<body' + $polices[$police][3] + '>
<header><a href = "polygramme.html"><h1 class = "' + $police + '">Menu</h1></a></header>
<iframe src = "polygramme.html"></iframe>

<h1 class = "' + $police + '">' + $polices[$police][0] + '</h1>

<p class = "' + $police + '">'
	$fichiers = Get-ChildItem -Path $PSScriptRoot\$police\ -File -Recurse -Include "*$($polices[$police][2])"
	$lignes += $fichiers | ForEach-Object {"	" + [char][int]$_.BaseName}
	$lignes += '</p>

</body>
</html>'
	$lignes | Out-File -FilePath "$PSScriptRoot\$police.html" -Encoding utf8
}

lister("heraldix")
copier("heraldix")
lister("karolvs")
lister("lineaire")
