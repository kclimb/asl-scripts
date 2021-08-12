// Danger by Design Autosplitter
// Written by toburr
// DM me at twitch.tv/toburr or on discord for questions/feedback

state("Game")
{
	uint sceneval : 0x1A25A8;
}

update
{
  if (current.sceneval != old.sceneval) {
    vars.DebugOutput("Sceneval changed: "+current.sceneval);
  }
}

startup
{
	//Initialize printer for debug statements
	Action<string> DebugOutput = (text) => {
		print("[DAN Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;

	// Autosplitter settings
	settings.Add("fixPlotter",false,"Fix the plotter");
	settings.Add("teaDone",false,"Minette enjoys her tea");
	settings.Add("meetDieter",false,"Meet Dieter");
	settings.Add("getCamera",false,"Get camera from Dieter");
	settings.Add("enterDarkroom",false,"Enter Dieter's darkroom");
	settings.Add("developPhotos",false,"Finish developing Dieter's photos");
	settings.Add("meetJJ",false,"Meet JJ");
	settings.Add("jjEnvelope",false,"Get envelope from JJ");
	settings.Add("meetJean",false,"Meet Jean Michel");
	settings.Add("prudence",false,"Get called by Prudence");
	settings.Add("outfitsStart",false,"Start designing Prudence's outfits");
	settings.Add("outfitsEnd",false,"Finish designing Prudence's outfits");
	settings.Add("wantJJ",false,"Minette demands JJ come to the studio");
	settings.Add("cookiesStart",false,"Start cookie making");
	settings.Add("cookiesEnd",false,"JJ tells you the cookies were made right");
	settings.Add("germans",false,"German guy calls the studio");
	settings.Add("dieterBench",false,"See cutscene of Dieter fleeing the park bench");
	settings.Add("cuckoosStart",false,"Start cuckoo puzzle");
	settings.Add("cuckoosEnd",false,"Find secret passage behind Dieter's bookshelf");
	settings.Add("diary",false,"Get Noisette's diary");
	settings.Add("roachesStart",false,"Get cockroach box");
	settings.Add("roachesEnd",false,"Tell Minette you found all the cockroaches");
	settings.Add("jjNote",false,"Get message for Zu from JJ");
	settings.Add("enterCatacombs",false,"Enter secret catacomb tunnels");
	settings.Add("windmillKey",false,"Get windmill key from flooded tunnels");
	settings.Add("stockPhotos",false,"Give Dieter his stock photos");
	settings.Add("parfaitsStart",false,"Begin the parfait-making minigame");
	settings.Add("parfaitsEnd",false,"See uncropped Minette photo from GlamGlam");
	settings.Add("st",false,"Walk through the tunnels beneath the park fountain");
	settings.Add("vaultKey",false,"Get art vault key from beneath park fountain");
	settings.Add("stReverse",false,"Walk through the tunnels beneath the park fountain in reverse!");
	settings.Add("bombStart",false,"Begin defusal of the bomb on Minette's door");
	settings.Add("bombEnd",false,"Finish bomb defusal");
	settings.Add("windmillBasement",false,"Watch sick cutscene of windmill basement opening");
	settings.Add("noisetteLetter",false,"Read Noisette's letter");
	settings.Add("boss",false,"Begin final boss fight");
	// settings end

	vars.DebugOutput("Startup success");
}

start
{
	//return current.sceneval == 1881 || current.sceneval == 1004;
	if (current.sceneval == 6456) {
		vars.fixPlotter = !settings["fixPlotter"];
		vars.teaDone = !settings["teaDone"];
		vars.meetDieter = !settings["meetDieter"];
		vars.getCamera = !settings["getCamera"];
		vars.enterDarkroom = !settings["enterDarkroom"];
		vars.developPhotos = !settings["developPhotos"];
		vars.meetJJ = !settings["meetJJ"];
		vars.jjEnvelope = !settings["jjEnvelope"];
		vars.meetJean = !settings["meetJean"];
		vars.prudence = !settings["prudence"];
		vars.outfitsStart = !settings["outfitsStart"];
		vars.outfitsEnd = !settings["outfitsEnd"];
		vars.wantJJ = !settings["wantJJ"];
		vars.cookiesStart = !settings["cookiesStart"];
		vars.cookiesEnd = !settings["cookiesEnd"];
		vars.germans = !settings["germans"];
		vars.dieterBench = !settings["dieterBench"];
		vars.cuckoosStart = !settings["cuckoosStart"];
		vars.cuckoosEnd = !settings["cuckoosEnd"];
		vars.diary = !settings["diary"];
		vars.roachesStart = !settings["roachesStart"];
		vars.roachesEnd = !settings["roachesEnd"];
		vars.jjNote = !settings["jjNote"];
		vars.enterCatacombs = !settings["enterCatacombs"];
		vars.windmillKey = !settings["windmillKey"];
		vars.stockPhotos = !settings["stockPhotos"];
		vars.parfaitsStart = !settings["parfaitsStart"];
		vars.parfaitsEnd = !settings["parfaitsEnd"];
		vars.st = !settings["st"];
		vars.vaultKey = !settings["vaultKey"];
		vars.stReverse = !settings["stReverse"];
		vars.bombStart = !settings["bombStart"];
		vars.bombEnd = !settings["bombEnd"];
		vars.windmillBasement = !settings["windmillBasement"];
		vars.noisetteLetter = !settings["noisetteLetter"];
		vars.boss = !settings["boss"];
		vars.done = false;
		return true;
	}
}

split
{
	//return current.sceneval == 4718;
	//return current.sceneval == 1031 || current.sceneval == 1011;
	uint s = current.sceneval;
	switch (s) {
		case 6500: // End
			if (!vars.done) {vars.done = true; return true; }
			break;
		case 1201:
			if (!vars.meetJJ) { vars.meetJJ = true; return true; }
			break;
		case 1251:
			if (!vars.jjNote) { vars.jjNote = true; return true; }
			break;
		case 1262:
			if (!vars.jjEnvelope) { vars.jjEnvelope = true; return true; }
			break;
		case 1273:
			if (!vars.cookiesEnd) { vars.cookiesEnd = true; return true; }
			break;
		case 1300:
			if (!vars.meetDieter) { vars.meetDieter = true; return true; }
			break;
		case 1367:
			if (!vars.stockPhotos) { vars.stockPhotos = true; return true; }
			break;
		case 1381:
			if (!vars.getCamera) { vars.getCamera = true; return true; }
			break;
		case 1407:
			if (!vars.teaDone) { vars.teaDone = true; return true; }
			break;
		case 1800:
			if (!vars.germans) { vars.germans = true; return true; }
			break;
		case 1850:
			if (!vars.prudence) { vars.prudence = true; return true; }
			break;
		case 1912:
			if (!vars.parfaitsEnd) { vars.parfaitsEnd = true; return true; }
			break;
		case 2020:
			if (!vars.noisetteLetter) { vars.noisetteLetter = true; return true; }
			break;
		case 2430:
			if (!vars.parfaitsStart) { vars.parfaitsStart = true; return true; }
			break;
		case 2801:
			if (!vars.enterCatacombs) { vars.enterCatacombs = true; return true; }
			break;
		case 3663:
			if (!vars.cookiesStart) { vars.cookiesStart = true; return true; }
			break;
		case 3825:
			if (!vars.wantJJ) { vars.wantJJ = true; return true; }
			break;
		case 3973:
			if (!vars.bombStart) { vars.bombStart = true; return true; }
			break;
		case 3975:
			if (!vars.bombEnd) { vars.bombEnd = true; return true; }
			break;
		case 3981:
			if (!vars.outfitsStart) { vars.outfitsStart = true; return true; }
			break;
		case 3992:
			if (!vars.outfitsEnd) { vars.outfitsEnd = true; return true; }
			break;
		case 3997:
			if (!vars.fixPlotter) { vars.fixPlotter = true; return true; }
			break;
		case 4267:
			if (!vars.dieterBench) { vars.dieterBench = true; return true; }
			break;
		case 4412:
			if (!vars.enterDarkroom) { vars.enterDarkroom = true; return true; }
			break;
		case 4437:
			if (!vars.developPhotos) { vars.developPhotos = true; return true; }
			break;
		case 4500:
			if (!vars.cuckoosStart) { vars.cuckoosStart = true; return true; }
			break;
		case 4507:
			if (!vars.cuckoosEnd) { vars.cuckoosEnd = true; return true; }
			break;
		case 4756:
			if (!vars.windmillBasement) { vars.windmillBasement = true; return true; }
			break;
		case 4790:
			if (!vars.roachesStart) { vars.roachesStart = true; return true; }
			break;
		case 4840:
			if (!vars.roachesEnd) { vars.roachesEnd = true; return true; }
			break;
		case 4990:
			if (!vars.boss) { vars.boss = true; return true; }
			break;
		case 5592:
			if (!vars.st) { vars.st = true; return true; }
			break;
		case 5596:
			if (!vars.vaultKey) { vars.vaultKey = true; return true; }
			break;
		case 5600:
			if (!vars.stReverse) { vars.stReverse = true; return true; }
			break;
		case 5612:
			if (!vars.diary) { vars.diary = true; return true; }
			break;
		case 5613:
			if (!vars.windmillKey) { vars.windmillKey = true; return true; }
			break;
	}
}
