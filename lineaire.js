window.addEventListener("load", () => {lineaire();});

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
			contenu += `<img src = "${chemin}${caractère}.svg" alt = "${caractère}" class = "${classes.join(' ')}">`;
		}
		texte.innerHTML = contenu;
	}
}
