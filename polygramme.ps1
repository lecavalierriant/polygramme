$correspondances = @(
	@{original = "speciaux/apos"; copies = @("speciaux/DiacriticalAcute")},
	@{original = "speciaux/DiacriticalTilde"; copies = @("speciaux/0x1FC0")},
	@{original = "A"; copies = @("Α", "А")},
		@{original = "Á"; copies = @("Ά", "Ά")},
		@{original = "À"; copies = @("Ὰ")},
		@{original = "Ä"; copies = @(<#"", #>"Ӓ")},
		@{original = "Ă"; copies = @("Ᾰ", "Ӑ")},
		@{original = "Ā"; copies = @("Ᾱ")},
	@{original = "Æ"; copies = @(<#"", #>"Ӕ")},
	@{original = "B"; copies = @("Β", "В")},
	@{original = "C"; copies = @("Ϲ", "С", "speciaux/lpar")},
	@{original = "E"; copies = @("Ε", "Е")},
		@{original = "É"; copies = @("Έ","Έ")},
		@{original = "È"; copies = @("Ὲ", "Ѐ")},
		@{original = "Ë"; copies = @(<#"", #>"Ё")},
		@{original = "Ĕ"; copies = @(<#"", #>"Ӗ")},
	@{original = "F"; copies = @("Ϝ")},
	@{original = "H"; copies = @("Η", "Н")},
	@{original = "I"; copies = @("Ι", "І", "1")},
		@{original = "Í"; copies = @("Ί")},
		@{original = "Ï"; copies = @("Ϊ", "Ї")},
	@{original = "K"; copies = @("Κ", "К")},
		@{original = "Ḱ"; copies = @(<#"", #>"Ќ")},
	@{original = "M"; copies = @("Μ", "М")},
	@{original = "N"; copies = @("Ν")},
	@{original = "O"; copies = @("Ο", "О", "0")},
		@{original = "Ó"; copies = @("Ό")},
		@{original = "Ö"; copies = @("Ӧ")},
	@{original = "P"; copies = @("Ρ", "Р")},
	@{original = "T"; copies = @("Τ", "Т")},
	@{original = "Þ"; copies = @("Ϸ")},
	@{original = "X"; copies = @("Χ", "Х")},
	@{original = "Y"; copies = @("Υ", "У")},
		@{original = "Ý"; copies = @("Ύ")},
		@{original = "Ÿ"; copies = @("Ϋ", "Ӱ")},
		@{original = "Ȳ"; copies = @(<#"", #>"Ӯ")},
	@{original = "Z"; copies = @("Ζ")},
	@{original = "Γ"; copies = @("Г")},
	@{original = "Δ"; copies = @("Д")},
	@{original = "Θ"; copies = @("Ѳ")},
	@{original = "Λ"; copies = @("Л")},
	@{original = "Π"; copies = @("П")},
	@{original = "Φ"; copies = @("Ф")},
	@{original = "З"; copies = @("3")},
	@{original = "Ч"; copies = @("4")}
)

function copier() {
	$données = [System.Collections.Generic.List[PSCustomObject]]::new()
	foreach ($lettre in $correspondances) {
		$données.Add(
			[PSCustomObject]@{
				"Original" = $lettre.original
				"Copies" = $lettre.copies -join " "
			}
		)
		$source = $PSScriptRoot + "\" + $lettre.original + ".png"
		if (Test-Path -Path $source) {
			foreach ($copie in $lettre.copies) {
				$copie = $PSScriptRoot + "\" + $copie + ".png"
				try {Copy-Item -Path $source -Destination $copie -Force}
				catch {Write-Error "$copie. Erreur : $_"}
			}
		}
	}
	$données | Export-Csv -Path "$PSScriptRoot\polygramme.csv" -NoTypeInformation -Encoding UTF8
}

function lister() {
	$lignes = @()
	$fichiers = Get-ChildItem -Path $PSScriptRoot -File -Recurse -Include *.png
	$lignes += $fichiers | ForEach-Object {"	" + $_.BaseName}
	$lignes | Out-File -FilePath "$PSScriptRoot\polygramme.html" -Encoding utf8
	Write-Host "Liste terminée !"
}

copier
lister
