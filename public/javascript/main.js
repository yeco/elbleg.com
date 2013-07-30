var bleg = bleg || {};

bleg = {
	navBtns: function(argument) {
		var nav_items = document.querySelectorAll('nav li');


		for (i in nav_items) {
			try {
				nav_items[i].addEventListener("click", function() {
					var goto = this.getElementsByTagName('a')[0].href;
					window.location.href = goto;

				}, false);

			} catch (err) {}
		}


	},
	init: function() {
		this.navBtns();
	}
}


bleg.init();