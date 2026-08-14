hauts = [
	"'", "!", "?",
	          "´", "`", "˙", "^", "¨", "ˇ", "˘", "¯", "˜", "˝",
	// lt
	          "Á", "À", "Ȧ", "Â", "Ä", "Ǎ", "Ă", "Ā", "Ã",      "Ȁ", "Ȃ",
	          "Ǽ",                               "Ǣ",
	                    "Ḃ",
	          "Ć",      "Ċ", "Ĉ",      "Č",
	                    "Ḋ",           "Ď",
	          "É", "È", "Ė", "Ê", "Ë", "Ě", "Ĕ", "Ē", "Ẽ",      "Ȅ",
	                    "Ḟ",
	          "Ǵ",      "Ġ", "Ĝ",      "Ǧ", "Ğ", "Ḡ",
	                    "Ḣ", "Ĥ", "Ḧ", "Ȟ",
	          "Í", "Ì", "İ", "Î", "Ï", "Ǐ", "Ĭ", "Ī", "Ĩ",      "Ȉ",
	                         "Ĵ",
	          "Ḱ",                          "Ǩ",
	          "Ĺ",                     "Ľ",
	          "Ḿ",      "Ṁ",
	          "Ń", "Ǹ", "Ṅ",           "Ň",           "Ñ",
	          "Ó", "Ò", "Ȯ", "Ô", "Ö", "Ǒ", "Ŏ", "Ō", "Õ", "Ő", "Ȍ",
	                    "Ṗ",
	          "Ŕ",      "Ṙ",           "Ř",                     "Ȑ",
	          "Ś",      "Ṡ", "Ŝ",      "Š",
	                    "Ṫ",           "Ť",
	          "Ú", "Ù",      "Û", "Ü", "Ǔ", "Ŭ", "Ū", "Ũ", "Ű", "Ȕ",
	                                                  "Ṽ",
	          "Ẃ", "Ẁ", "Ẇ", "Ŵ", "Ẅ", 
	          "Ý", "Ỳ",      "Ŷ", "Ÿ",                "Ỹ",
	          "Ź",      "Ż", "Ẑ",      "Ž",
	// gr
	     "Ή",
	     "Ί",
         "Ά", "Ά", "Ὰ",                     "Ᾰ", "Ᾱ",
         "Έ", "Έ", "Ὲ",
	                         "Ϊ",
	     "Ό",
	     "Ύ",
	                         "Ϋ",
	     "Ώ",
	// ru
	                              "Ӓ",      "Ӑ",
	          "Ѓ",
	               "Ѐ",           "Ё",      "Ӗ",
	                              "Ӝ",      "Ӂ",
	                              "Ӟ",
	               "Ѝ",           "Ӥ",      "Й", "Ӣ",
	                              "Ї",
	          "Ќ",
	                              "Ӧ",
	                              "Ӱ",      "Ў", "Ӯ",      "Ӳ",
	                              "Ӵ",
	                              "Ӹ",
	                              "Ӭ",
];

bas = [
	",", ";",
	          "ꞈ", "ˍ", "¸",
	// lt
	     "Ạ",
	     "Ḅ",      "Ḇ",
	                    "Ç",
	     "Ḍ", "Ḓ", "Ḏ", "Ḑ",
	     "Ẹ", "Ḙ",      "Ȩ",
	                    "Ģ",
	     "Ḥ",
	     "Ị",
	     "Ḳ",      "Ḵ",
	     "Ḷ", "Ḽ", "Ḻ", "Ļ",
	     "Ṇ", "Ṋ", "Ṉ",
	     "Ọ",
	"Q",
	     "Ṛ",      "Ṟ",
	     "Ṣ",           "Ş",
	     "Ṭ", "Ṱ", "Ṯ", "Ţ",
	     "Ụ",
	     "Ẉ",
	     "Ỵ",
	     "Ẓ",      "Ẕ",
	// gr
	// ru
	"Ҵ",
	"Ц",
	"Щ",
];

spéciaux = {
	"῀": "0x1FC0",
	"ˍ": "0x2CD",
	"-": "0x2D",
	"~": "0x7E",
	"ꞈ": "0xA788",
	"&": "amp",
	"'": "apos",
	"˘": "breve",
	"¸": "cedil",
	"·": "centerdot",
	":": "colon",
	",": "comma",
	"´": "DiacriticalAcute",
	"˙": "DiacriticalDot",
	"˝": "DiacriticalDoubleAcute",
	"`": "DiacriticalGrave",
	"˜": "DiacriticalTilde",
	"!": "excl",
	"ˇ": "Hacek",
	"^": "Hat",
	"(": "lpar",
	"—": "mdash",
	"…": "mldr",
	"%": "percnt",
	".": "period",
	"?": "quest",
	")": "rpar",
	";": "semi",
	"/": "sol",
	"¯": "strns",
	"¨": "uml",
}

basDroite = [
	"7",
	// lt
	"F",
	"P",
	"T",
	"V",
	"W",
	"Y", "Ỳ", "Ý", "Ŷ", "Ÿ",
	// gr
	"Γ",
	"Ύ",
	"Ψ",
	// ru
	"У",
];

rondBasDroite = [
	"0",
	"9",
	// lt
	"D", "Ð",
	"O", "Ò", "Ó", "Ô", "Ö", "Ø",
	"Q",
	// gr
	"Ό",
	"Θ",
	"Φ",
	// ru
	"Э",
	"Ю",
];

quartBasDroite = [
	"5",
	"6",
	"8",
	// lt
	"B",
	"J",
	"S",
	"U",
	// gr
	// ru
	"3",
	"Б",
	"З",
	"ъ",
	"Ь",
];

basGauche = [
	"4",
	// lt
	"T",
	"V",
	"W",
	"Y", "Ỳ", "Ý", "Ŷ", "Ÿ",
	// gr
	"Ψ",
	"Ύ",
	// ru
	"Ч",
	"ъ",
	"У",
];

rondBasGauche = [
	"0",
	// lt
	"C", "Ç",
	"Ð",
	"G",
	"O", "Ò", "Ó", "Ô", "Ö", "Œ",
	"Q",
	// gr
	"Ό",
	"C",
	"Θ",
	"Φ",
	// ru
	"Є",
];

quartBasGauche = [
	"&",
	"U",
	"6",
	"8",
];

hautDroite = [
	// lt
	"A", "À", "Á", "Â", "Ä",
	"L",
	"M",
	// gr
	"Ά",
	"Δ",
	"Λ",
	"Μ",
	// ru
	"Д",
	"ъ",
	"Ь",
];

rondHautDroite = [
	"0",
	// lt
	"D", "Ð",
	"O", "Ò", "Ó", "Ô", "Ö",
	"Q",
	// gr
	"Ό",
	"Θ",
	"Φ",
	"Ω",
	// ru
	"Э",
	"Ю",
];

quartHautDroite = [
	"2",
	"3",
	"8",
	"9",
	// lt
	"B",
	"P",
	"R",
	// gr
	// ru
	"З",
];

hautGauche = [
	// lt
	"A", "À", "Á", "Â", "Ä", "Æ",
	"J",
	"M",
	// gr
	"Ά",
	"Δ",
	"Λ",
	"Μ",
	// ru
];

rondHautGauche = [
	"0",
	"6",
	// lt
	"C", "Ç",
	"Ð",
	"G",
	"O", "Ò", "Ó", "Ô", "Ö", "Ø", "Œ",
	"Q",
	// gr
	"C",
	"Ό",
	"Θ",
	"Φ",
	"Ω",
	// ru
	"Є",
];

quartHautGauche = [
	"&",
	"8",
	"9",
	// lt
	"S",
	// gr
	// ru
	"Я",
];

function caractères() {
	for (titre of document.querySelectorAll(".polygramme")) {
		texte = titre.innerText.toUpperCase();
		titre.innerHTML = "";
		compte = 0;
		libreBasDroite = false;
		libreHautDroite = false;
		libreRondBasDroite = false;
		libreRondHautDroite = false;
		for (caractère of texte) {
			compte++;
			if (caractère == " ") {
				if (compte > 14) {
					titre.innerHTML += "<br>";
					compte = 0;
				} else {titre.innerHTML += "<span class = espace> </span>";}
				continue;
			}
			classes = ["caractère"];
			if (hauts.includes(caractère)) classes.push("haut");
			else if (bas.includes(caractère)) classes.push("bas");
			if ((libreBasDroite && hautGauche.includes(caractère)) || (libreHautDroite && basGauche.includes(caractère))) {classes.push("décalage");}
			if ((libreBasDroite && rondHautGauche.includes(caractère)) || (libreHautDroite && rondBasGauche.includes(caractère))) {classes.push("petit-décalage");}
			if ((libreRondBasDroite && hautGauche.includes(caractère)) || (libreRondHautDroite && basGauche.includes(caractère))) {classes.push("petit-décalage");}
			libreHautDroite = hautDroite.includes(caractère);
			libreBasDroite = basDroite.includes(caractère);
			libreRondHautDroite = rondHautDroite.includes(caractère);
			libreRondBasDroite = rondBasDroite.includes(caractère);
			spécial = spéciaux[caractère];
			chemin = "../polygramme/";
			alt = caractère;
			if (spécial) {
				if (spécial.startsWith("0x")) {alt = `&${spécial.replace("0x", "#x")};`;}
				else {alt = `&${spécial};`;}
			}
			titre.innerHTML += `<img src = "${chemin}${spécial ? `speciaux/${spécial}` : `${caractère}`}.png" alt = "${alt}" class = "${classes.join(' ')}">`;
		}
	}
}
