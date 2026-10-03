$polices = @{
	"heraldix" = @("Héraldix", "0x48", ".png", "")
	"karolvs" = @("Karolvs", "0x4B", ".svg", ' class = "parchemin"')
	"lineaire" = @("Linéaire", "0x4C", ".svg", "")
}

$correspondances = @(

	@{original = "0x27"; copies = @("0xB4")},
	@{original = "0x2DC"; copies = @("0x1FC0")},
	@{original = "0x2DA"; copies = @("0xB0")},
	
	# lt copies = @("")
	@{original = "A"; copies = @("0x391", "0x410")},
		@{original = "Á"; copies = @("0x1fbb", "0x386")},
		@{original = "À"; copies = @("0x1fba")},
		@{original = "Ä"; copies = @("0x4d2")},
		@{original = "Ă"; copies = @("0x1fb8", "0x4d0")},
		@{original = "Ā"; copies = @("0x1fb9")},
	@{original = "Æ"; copies = @("0x4d4")},
	@{original = "B"; copies = @("0x392", "0x412")},
	@{original = "C"; copies = @("0x3f9", "0x421", "0x28")},
		@{original = "Đ"; copies = @("0xd0")},
	@{original = "E"; copies = @("0x395", "0x415")},
		@{original = "É"; copies = @("0x388","0x1fc9")},
		@{original = "È"; copies = @("0x1fc8", "0x400")},
		@{original = "Ë"; copies = @("0x401")},
		@{original = "Ĕ"; copies = @("0x4d6")},
	@{original = "F"; copies = @("0x3dc")},
	@{original = "H"; copies = @("0x397", "0x41d")},
	@{original = "I"; copies = @("0x399", "0x406", "0x31")},
		@{original = "Í"; copies = @("0x38a")},
		@{original = "Ï"; copies = @("0x3aa", "0x407")},
	@{original = "K"; copies = @("0x39a", "0x41a")},
		@{original = "Ḱ"; copies = @("0x40c")},
	@{original = "M"; copies = @("0x39c", "0x41c")},
	@{original = "N"; copies = @("0x39d")},
	@{original = "O"; copies = @("0x39f", "0x41e", "0x30")},
		@{original = "Ó"; copies = @("0x38c")},
		@{original = "Ö"; copies = @("0x4e6")},
	@{original = "P"; copies = @("0x3a1", "0x420")},
	@{original = "T"; copies = @("0x3a4", "0x422")},
	@{original = "Þ"; copies = @("0x3f7")},
	@{original = "X"; copies = @("0x3a7", "0x425")},
	@{original = "Y"; copies = @("0x3a5", "0x423")},
		@{original = "Ý"; copies = @("0x38e")},
		@{original = "Ÿ"; copies = @("0x3ab", "0x4f0")},
		@{original = "Ȳ"; copies = @("0x4ee")},
	@{original = "Z"; copies = @("0x396")},

	# gr copies = @("")
	@{original = "Γ"; copies = @("0x413")},
	@{original = "Δ"; copies = @("0x414")},
	@{original = "Θ"; copies = @("0x472")},
	@{original = "Λ"; copies = @("0x41b")},
	@{original = "Π"; copies = @("0x41f")},
	@{original = "Φ"; copies = @("0x424")},

	# ru copies = @("")
	@{original = "З"; copies = @("0x33")},
	@{original = "Ч"; copies = @("0x34")}

	# 00 copies = @("")
)

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
lister("karolvs")
lister("lineaire")
