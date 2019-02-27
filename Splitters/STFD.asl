// Stay Tuned for Danger Autosplitter WIP
// Written by toburr
// DM me at twitch.tv/toburr or on discord for questions/feedback

state("Game")
{
	uint sceneval : 0x114DAC;
}

update
{
  if (current.sceneval != old.sceneval) {
    vars.DebugOutput("Sceneval changed: "+current.sceneval);
  }
}

startup
{
	// Initialize printer for debug statements
	Action<string> DebugOutput = (text) => {
		print("[STFD Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;

	// Autosplitter settings
	//settings.Add("startedBul",false,"Started Bul");
	//settings.Add("finishedBul",true,"Finished Bul");
	//settings.Add("bing",false,"Met Sinclair");
	//settings.Add("metHenrik",false,"Met Henrik");
	//settings.Add("oaxaca",false,"Talked to Sinclair at Office");
	//settings.Add("robbed",true,"Robbery");
	//settings.Add("crazyMack",false,"Finished calling Mack");
	//settings.Add("henrikFell",true,"Henrik Fell Down Stairs");
	//settings.Add("birthday",false,"Henrik Says Birthday");
	//settings.Add("pressure",false,"Finished first Henrik Hospital Convo");
	//settings.Add("pacalPhoto",false,"Received Pacal Photo");
	//settings.Add("cantRemember",false,"\"I Can't Remember!\"");
	//settings.Add("deliveredProvDocs",true,"Delivered Provenance Documents");
	//settings.Add("joannaVoicemail",false,"Joanna's Voicemail");
	//settings.Add("callFranklin",false,"Call Franklin for First Time");
	//settings.Add("chaco",false,"Call CCCC for First Time");
	//settings.Add("tadow",false,"Poppy Answered Phone");
	//settings.Add("west",true,"Poppy's Carving");
	//settings.Add("rapscallions",false,"Prudence Answered Phone");
	//settings.Add("soundThrashing",false,"End of Prudence Convo");
	//settings.Add("fool",true,"Copan Fool Carving");
	//settings.Add("tempLvl1",true,"Finished Temple Level 1");
	//settings.Add("maze",false,"Finished Temple Maze");
	//settings.Add("tempLvl2",true,"Finished Temple Level 2");
	//settings.Add("pacal",true,"Pacal Carving");
	//settings.Add("south",false,"Prudence's Carving");
	//settings.Add("east",false,"Bishop Landa's Carving");
	//settings.Add("north",false,"Chaco Canyon Carving");
	//settings.Add("key",true,"Assembled Key");
	//settings.Add("boo",false,"Confront Culprit");
	// settings end

	vars.DebugOutput("Startup success");
}

start
{
	if (current.sceneval == 1280) {
		// Initialize split flags before starting
		//vars.finalCall = !settings["bing"];
    //vars.wheelStart = !settings["bing"];

		vars.DebugOutput("Timer started.");
		return true;
	}
}

split
{
	uint s = current.sceneval;
	switch (s) {
		//case 153344: // Endgame phone call
		//	if (!vars.finalCall) {vars.finalCall = true; return true;}
		//	break;
    //case 186880: // Watch Rick's tape
    //  if (!vars.rickTape) {vars.rickTape = true; return true;}
    //  break;
    //case 400128: // End puzzle start
    //  if (!vars.wheelStart) {vars.wheelStart = true; return true;}
    //  break;
    //case 448256: // Kleig light cutscene start
    //  if (!vars.starcrash) {vars.starcrash = true; return true;}
		//	break;
		case 1280000: // END OF GAME
			return true; // will split all remaining splits if multiple are left
	}
}
