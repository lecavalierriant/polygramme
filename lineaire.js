window.addEventListener("load", lineaire);

function correspondances(caractère) { // prends la copie et done l'oginial
	switch (caractère) {
	// ..
		case "0xB4": return "0x27";
		case "0x1FC0": return "0x2DC";
		case "0xB0": return "0x2DA";
	// lt
		case "0x391":
		case "0x410": return "0x41";
			case "0x386":
			case "0x1FBB": return "0xC1";
			case "0x1FBA": return "0xC0";
			case "0x4D2": return "0xC4";
			case "0x1FB8":
			case "0x4D0": return "0x102";
			case "0x1FB9": return "0x100";
		case "0x4D4": return "0xC6";
		case "0x392":
		case "0x412": return "0x42";
		case "0x28":
		case "0x3F9":
		case "0x421": return "0x43";
			case "0xD0": return "0x110";
		case "0x395":
		case "0x415": return "0x45";
			case "0x388":
			case "0x1FC9": return "0xC9";
			case "0x400":
			case "0x1FC8": return "0xC8";
			case "0x401": return "0xCB";
			case "0x4D6": return "0x114";
		case "0x3DC": "0x46";
		case "0x397":
		case "0x41D": return "0x48";
		case "0x31":
		case "0x399":
		case "0x406": return "0x49";
			case "0x38A": return "0xCD";
			case "0x3AA":
			case "0x407": return "0xCF";
		case "0x39A":
		case "0x41A": return "0x4B";
			case "0x40C": return "0x1E30";
		case "0x39C":
		case "0x41C": return "0x4D";
		case "0x39D": return "0x4E";
		case "0x30":
		case "0x39F":
		case "0x41E": return "0x4F";
			case "0x38C": return "0xD3";
			case "0x4E6": return "0xD6";
		case "0x3A1":
		case "0x420": return "0x50";
		case "0x3A4":
		case "0x422": return "0x54";
		case "0x3F7": return "0xDE";
		case "0x3A7":
		case "0x425": return "0x58";
		case "0x3A5":
		case "0x423": return "0x59";
			case "0x38E": return "0xDD";
			case "0x3AB":
			case "0x4F0": return "0x178";
			case "0x4EE": return "0x232";
		case "0x396": return "0x5A";
	// gr
		case "0x413": return "0x393";
		case "0x414": return "0x394";
		case "0x472": return "0x398";
		case "0x41B": return "0x39B";
		case "0x41F": return "0x3A0";
		case "0x424": return "0x3A6";
	// ru
		case "0x33": return "0x417";
		case "0x34": return "0x427";
	// 00
		default: return caractère;
	}
}

function lineaire() {
	for (texte of document.querySelectorAll(".lineaire")) {
		contenu = "";
		compte = 0;
		for (caractère of texte.innerText.toUpperCase()) {
			compte++;
			if (caractère == " ") {
				if (compte > 14) {
					contenu += "<br>";
					compte = 0;
				} else {contenu += "<span class = espace> </span>";}
				continue;
			}
			classes = ["caractère"];
			chemin = "https://lecavalierriant.github.io/polygramme/lineaire/";
			contenu += `<img src = "${chemin}${correspondances("0x" + caractère.codePointAt().toString(16).toUpperCase())}.svg" alt = "${caractère}" class = "${classes.join(' ')}">`;
		}
		texte.innerHTML = contenu;
	}
}
