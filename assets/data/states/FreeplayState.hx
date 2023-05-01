import funkin.backend.assets.ModsFolder;
function postCreate() {
	if (ModsFolder.currentModFolder == null) {
		for (i in songs) {
			i.difficulties = ["EASY","NORMAL","HARD"];
		}
	}
}