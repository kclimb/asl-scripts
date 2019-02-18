// Secret of the Scarlet Hand Autosplitter
// Written by toburr
// DM me at twitch.tv/toburr or on discord for questions/feedback

state("Game")
{
	uint sceneval : 0x66C8, 0x0;
}

startup
{
	// Initialize printer for debug statements
	//Action<string> DebugOutput = (text) => {
	//	print("[SSH Autosplitter] "+text);
	//};
	//vars.DebugOutput = DebugOutput;

	// Autosplitter settings
	settings.Add("startedBul",false,"Started Bul");
	settings.Add("finishedBul",true,"Finished Bul");
	settings.Add("bing",false,"Met Sinclair");
	settings.Add("metHenrik",false,"Met Henrik");
	settings.Add("oaxaca",false,"Talked to Sinclair at Office");
	settings.Add("robbed",true,"Robbery");
	settings.Add("crazyMack",false,"Finished calling Mack");
	settings.Add("henrikFell",true,"Henrik Fell Down Stairs");
	settings.Add("birthday",false,"Henrik Says Birthday");
	settings.Add("pressure",false,"Finished first Henrik Hospital Convo");
	settings.Add("pacalPhoto",false,"Received Pacal Photo");
	settings.Add("cantRemember",false,"\"I Can't Remember!\"");
	settings.Add("deliveredProvDocs",true,"Delivered Provenance Documents");
	settings.Add("joannaVoicemail",false,"Joanna's Voicemail");
	settings.Add("callFranklin",false,"Call Franklin for First Time");
	settings.Add("chaco",false,"Call CCCC for First Time");
	settings.Add("tadow",false,"Poppy Answered Phone");
	settings.Add("west",true,"Poppy's Carving");
	settings.Add("rapscallions",false,"Prudence Answered Phone");
	settings.Add("soundThrashing",false,"End of Prudence Convo");
	settings.Add("fool",true,"Copan Fool Carving");
	settings.Add("tempLvl1",true,"Finished Temple Level 1");
	settings.Add("maze",false,"Finished Temple Maze");
	settings.Add("tempLvl2",true,"Finished Temple Level 2");
	settings.Add("pacal",true,"Pacal Carving");
	settings.Add("south",false,"Prudence's Carving");
	settings.Add("east",false,"Bishop Landa's Carving");
	settings.Add("north",false,"Chaco Canyon Carving");
	settings.Add("key",true,"Assembled Key");
	settings.Add("boo",false,"Confront Culprit");
	// settings end

	//vars.DebugOutput("Startup success");
}

start
{
	if (current.sceneval == 6000) {
		// Initialize split flags before starting
		vars.bing = !settings["bing"];
		vars.birthday = !settings["birthday"];
		vars.boo = !settings["boo"];
		vars.callFranklin = !settings["callFranklin"];
		vars.cantRemember = !settings["cantRemember"];
		vars.chaco = !settings["chaco"];
		vars.crazyMack = !settings["crazyMack"];
		vars.deliveredProvDocs = !settings["deliveredProvDocs"];
		vars.east = !settings["east"];
		vars.finishedBul = !settings["finishedBul"];
		vars.fool = !settings["fool"];
		vars.henrikFell = !settings["henrikFell"];
		vars.joannaVoicemail = !settings["joannaVoicemail"];
		vars.key = !settings["key"];
		vars.maze = !settings["maze"];
		vars.metHenrik = !settings["metHenrik"];
		vars.north = !settings["north"];
		vars.oaxaca = !settings["oaxaca"];
		vars.pacal = !settings["pacal"];
		vars.pacalPhoto = !settings["pacalPhoto"];
		vars.pressure = !settings["pressure"];
		vars.rapscallions = !settings["rapscallions"];
		vars.robbed = !settings["robbed"];
		vars.soundThrashing = !settings["soundThrashing"];
		vars.south = !settings["south"];
		vars.startedBul = !settings["startedBul"];
		vars.tadow = !settings["tadow"];
		vars.tempLvl1 = !settings["tempLvl1"];
		vars.tempLvl2 = !settings["tempLvl2"];
		vars.west = !settings["west"];
		//vars.DebugOutput("Timer started.");
		return true;
	}
}

split
{
	uint s = current.sceneval;
	switch (s) {
		case 1089: // Joanna's voicemail AKA beginning of the long phone section
			if (!vars.joannaVoicemail) {vars.joannaVoicemail = true; return true;}
			break;
		case 1110: // Sinclair says address
			if (!vars.bing) {vars.bing = true; return true;}
			break;
		case 1115: // "Boo!"
			if (!vars.boo) {vars.boo = true; return true;}
			break;
		case 1155: // Successfully call Poppy
			if (!vars.tadow) {vars.tadow = true; return true;}
			break;
		case 1200: // Meeting Sinclair at his office
			if (!vars.oaxaca) {vars.oaxaca = true; return true;}
			break;
		case 1316: // Delivered provenance docs to Alejandro
			if (!vars.deliveredProvDocs) {vars.deliveredProvDocs = true; return true;}
			break;
		case 1400: // Meeting Henrik for the first time
			if (!vars.metHenrik) {vars.metHenrik = true; return true;}
			break;
		case 1504: // "I don't even remember my own birthday"
			if (!vars.birthday) {vars.birthday = true; return true;}
			break;
		case 1512: // "The pressure!"
			if (!vars.pressure) {vars.pressure = true; return true;}
			break;
		case 1516: // "I can't remember!"
			if (!vars.cantRemember) {vars.cantRemember = true; return true;}
			break;
		case 1840: // First call to Franklin
			if (!vars.callFranklin) {vars.callFranklin = true; return true;}
			break;
		case 1901: // "Rapscallions"
			if (!vars.rapscallions) {vars.rapscallions = true; return true;}
			break;
		case 1921: // "And give them a sound thrashing!"
			if (!vars.soundThrashing) {vars.soundThrashing = true; return true;}
			break;
		case 1953: // Call CCCC for first time
			if (!vars.chaco) {vars.chaco = true; return true;}
			break;
		case 2844: // "Now I have the key!"
			if (!vars.key) {vars.key = true; return true;}
			break;
		case 2914: // Recreated Chocolate carving (NORTH)
			if (!vars.north) {vars.north = true; return true;}
			break;
		case 3611: // Get Pacal photo
			if (!vars.pacalPhoto) {vars.pacalPhoto = true; return true;}
			break;
		case 3612: // Get Poppy's carving (WEST)
			if (!vars.west) {vars.west = true; return true;}
			break;
		case 3857: // Get Prudence's carving (SOUTH)
			if (!vars.south) {vars.south = true; return true;}
			break;
		case 3858: // Get Copan Fool carving (FOOL)
			if (!vars.fool) {vars.fool = true; return true;}
			break;
		case 3861: // Get the east carving (EAST)
			if (!vars.east) {vars.east = true; return true;}
			break;
		case 4011: // Finished Temple level 1
			if (!vars.tempLvl1) {vars.tempLvl1 = true; return true;}
			break;
		case 4026: // Starting Bul for the first time
			if (!vars.startedBul) {vars.startedBul = true; return true;}
			break;
		case 4029: // Finished Bul
			if (!vars.finishedBul) {vars.finishedBul = true; return true;}
			break;
		case 4154: // Finished Temple level 2
			if (!vars.tempLvl2) {vars.tempLvl2 = true; return true;}
			break;
		case 4157: // Solved maze
			if (!vars.maze) {vars.maze = true; return true;}
			break;
		case 4397: // Get Pacal carving (PACAL)
			if (!vars.pacal) {vars.pacal = true; return true;}
			break;
		case 6013: // Joanna announces robbery
			if (!vars.robbed) {vars.robbed = true; return true;}
			break;
		case 6020: // Henrik falls
		case 6021: // Henrik falls but from the other side
			if (!vars.henrikFell) {vars.henrikFell = true; return true;}
			break;
		case 6100: // END OF GAME
			return true; // will split all remaining splits if multiple are left
		case 6550: // Mack says "makes you craaaazy" (technically 6551 but 6550 is closer temporally)
			if (!vars.crazyMack) {vars.crazyMack = true; return true;}
			break;
	}
}
