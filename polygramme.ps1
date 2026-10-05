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
	@{original = "0x41"; copies = @("0x391", "0x410")},
		@{original = "0xC1"; copies = @("0x1FBB", "0x386")},
		@{original = "0xC0"; copies = @("0x1FBA")},
		@{original = "0xC4"; copies = @("0x4D2")},
		@{original = "0x102"; copies = @("0x1FB8", "0x4D0")},
		@{original = "0x100"; copies = @("0x1FB9")},
	@{original = "0xC6"; copies = @("0x4D4")},
	@{original = "0x42"; copies = @("0x392", "0x412")},
	@{original = "0x43"; copies = @("0x3F9", "0x421", "0x28")},
		@{original = "0x110"; copies = @("0xD0")},
	@{original = "0x45"; copies = @("0x395", "0x415")},
		@{original = "0xC9"; copies = @("0x388","0x1FC9")},
		@{original = "0xC8"; copies = @("0x1FC8", "0x400")},
		@{original = "0xCB"; copies = @("0x401")},
		@{original = "0x114"; copies = @("0x4D6")},
	@{original = "0x46"; copies = @("0x3DC")},
	@{original = "0x48"; copies = @("0x397", "0x41D")},
	@{original = "0x49"; copies = @("0x399", "0x406", "0x31")},
		@{original = "0xCD"; copies = @("0x38A")},
		@{original = "0xCF"; copies = @("0x3AA", "0x407")},
	@{original = "0x4B"; copies = @("0x39A", "0x41A")},
		@{original = "0x1E30"; copies = @("0x40C")},
	@{original = "0x4D"; copies = @("0x39C", "0x41C")},
	@{original = "0x4E"; copies = @("0x39D")},
	@{original = "0x4F"; copies = @("0x39F", "0x41E", "0x30")},
		@{original = "0xD3"; copies = @("0x38C")},
		@{original = "0xD6"; copies = @("0x4E6")},
	@{original = "0x50"; copies = @("0x3A1", "0x420")},
	@{original = "0x54"; copies = @("0x3A4", "0x422")},
	@{original = "0xDE"; copies = @("0x3F7")},
	@{original = "0x58"; copies = @("0x3A7", "0x425")},
	@{original = "0x59"; copies = @("0x3A5", "0x423")},
		@{original = "0xDD"; copies = @("0x38E")},
		@{original = "0x178"; copies = @("0x3AB", "0x4F0")},
		@{original = "0x232"; copies = @("0x4EE")},
	@{original = "0x5A"; copies = @("0x396")},
	# gr
	@{original = "0x393"; copies = @("0x413")},
	@{original = "0x394"; copies = @("0x414")},
	@{original = "0x398"; copies = @("0x472")},
	@{original = "0x39B"; copies = @("0x41B")},
	@{original = "0x3A0"; copies = @("0x41F")},
	@{original = "0x3A6"; copies = @("0x424")},
	# ru
	@{original = "0x417"; copies = @("0x33")},
	@{original = "0x427"; copies = @("0x34")}
	# 00
)

$correspondancesKarolvs = @(
	@{original = "0x17F"; copies = @("0x73")},
	@{original = "0x131"; copies = @("0x69", "0x6A")}
	@{original = "0x76"; copies = @("0x75")}
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
		$source = $PSScriptRoot + "\" + $police + "\" + $caractère.original + $polices[$police][2]
		if (Test-Path -Path $source) {
			foreach ($copie in $caractère.copies) {
				$copie = $PSScriptRoot + "\" + $police + "\" + $copie + $polices[$police][2]
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
	if ($police -eq "karolvs") {
		$lignes += $fichiers | ForEach-Object {
			$chaine = "	" + [char][int]$_.BaseName
			foreach ($caractère in $correspondancesKarolvs) {
				if ($caractère.original -eq $_.BaseName) {
					foreach ($copie in $caractère.copies) {
						$chaine += "	" + [char][int]$copie
					}
					break 
				}
			}
			$chaine
		}
	} else {$lignes += $fichiers | ForEach-Object {"	" + [char][int]$_.BaseName}}
	$lignes += '</p>

</body>
</html>'
	$lignes | Out-File -FilePath "$PSScriptRoot\$police.html" -Encoding utf8
}

lister("heraldix")
copier("heraldix")
lister("karolvs")
lister("lineaire")
copier("lineaire")
