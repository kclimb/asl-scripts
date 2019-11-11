// The Haunted Carousel Autosplitter
// Written by toburr
// DM me at twitch.tv/toburr or on discord for questions/feedback

state("Game")
{
	uint sceneval : 0x155F70;
}

//update
//{
//  if (current.sceneval != old.sceneval) {
//    vars.DebugOutput("Sceneval changed: "+current.sceneval);
//  }
//}

startup
{
	// Initialize printer for debug statements
	//Action<string> DebugOutput = (text) => {
	//	print("[MHM Autosplitter] "+text);
	//};
	//vars.DebugOutput = DebugOutput;

	// Autosplitter settings
	settings.Add("funcard",false,"Get Fun Card from Harlan");
	settings.Add("paint",true,"Spill Elliot's paint cutscene");
	settings.Add("joynote",false,"Left note for Joy");
	settings.Add("anchor",false,"Win anchor token (Squid Toss)");
	settings.Add("seahorse",false,"Win seahorse token (Swimmer's Itch)");
	settings.Add("yoyo",false,"Buy Chinese yoyo");
	settings.Add("ingrid1",true,"Get Engineering Handbook from Ingrid");
	settings.Add("gun",false,"Get soldering gun from Elliot");
	settings.Add("solderingDone",false,"Fix the rollercoaster's card reader");
	settings.Add("coaster",true,"Escape the rollercoaster trap");
	settings.Add("riddle1",false,"Hear Miles' first riddle");
	settings.Add("fundae",false,"Get the fundae spoon");
	settings.Add("riddle2",true,"Hear Miles' second riddle");
	settings.Add("hint",false,"Hear Miles' hint");
	settings.Add("tink",false,"Call Tink");
	settings.Add("remote",false,"Find the remote under the carousel");
	settings.Add("bbStart",false,"Begin Barnacle Blast");
	settings.Add("bbDone",false,"Get Barnacle Blast tokens");
	settings.Add("harmonica",true,"Buy harmonica");
	settings.Add("tape",false,"Watch Harlan's tape");
	settings.Add("lathe",true,"Carve new dowel rod");
	settings.Add("riddle3",true,"Hear Miles' third riddle");
	settings.Add("anton",false,"Sukov says Spatzi");
	settings.Add("glory",true,"Found Glory");
	// settings end

	//vars.DebugOutput("Startup success");
}

start
{
	if (current.sceneval == 5900) {
		vars.funcard = !settings["funcard"];
		vars.paint = !settings["paint"];
		vars.joynote = !settings["joynote"];
		vars.anchor = !settings["anchor"];
		vars.seahorse = !settings["seahorse"];
		vars.yoyo = !settings["yoyo"];
		vars.ingrid1 = !settings["ingrid1"];
		vars.gun = !settings["gun"];
		vars.solderingDone = !settings["solderingDone"];
		vars.coaster = !settings["coaster"];
		vars.riddle1 = !settings["riddle1"];
		vars.fundae = !settings["fundae"];
		vars.riddle2 = !settings["riddle2"];
		vars.hint = !settings["hint"];
		vars.tink = !settings["tink"];
		vars.remote = !settings["remote"];
		vars.bbStart = !settings["bbStart"];
		vars.bbDone = !settings["bbDone"];
		vars.harmonica = !settings["harmonica"];
		vars.tape = !settings["tape"];
		vars.lathe = !settings["lathe"];
		vars.riddle3 = !settings["riddle3"];
		vars.anton = !settings["anton"];
		vars.glory = !settings["glory"];
		return true;
	}
}

split
{
	uint s = current.sceneval;
	switch (s) {
		case 6100: // End
			return true;
		case 1422: // Get funcard from Harlan
			if (!vars.funcard) { vars.funcard = true; return true; }
			break;
		//case 7523: // Met Paula
		//	if (!vars.paula1) { vars.paula1 = true; return true; }
		//	break;
		//case 1216: // Joy gives you access card
		//	if (!vars.tilesEnd && vars.tilesStart) { vars.tilesEnd = true; return true; }
		//	break;
		case 4000: // Spill Elliot's paint
			if (!vars.paint) { vars.paint = true; return true; }
			break;
		case 3524: // Leave note for Joy
			if (!vars.joynote) { vars.joynote = true; return true; }
			break;
		//case 1519: // Paula calls about heist
		//	if (!vars.paula2) { vars.paula2 = true; return true; }
		//	break;
		case 4466: // Anchor token
			if (!vars.anchor) { vars.anchor = true; return true; }
			break;
		case 4588: // Seahorse token
			if (!vars.seahorse) { vars.seahorse = true; return true; }
			break;
		case 4524: // Get Chinese yoyo
			if (!vars.yoyo) { vars.yoyo = true; return true; }
			break;
		//case 7510: // Meet KJ
		//	if (!vars.perris1) { vars.perris1 = true; return true; }
		//	break;
		case 1020: // Get engineering handbook from Ingrid
			if (!vars.ingrid1) { vars.ingrid1 = true; return true; }
			break;
		case 1138: // Get soldering gun
			if (!vars.gun) { vars.gun = true; return true; }
			break;
		case 5216: // Fix roller coaster soldering
			if (!vars.solderingDone) { vars.solderingDone = true; return true; }
			break;
		case 2651: // Escape roller coaster trap
			if (!vars.coaster) { vars.coaster = true; return true; }
			break;
		case 1344: // Hear first riddle
		  if (!vars.riddle1) { vars.riddle1 = true; return true; }
			break;
		case 4164: // Get fundae spoon
			if (!vars.fundae) { vars.fundae = true; return true; }
			break;
		case 1278: // Get second riddle
			if (!vars.riddle2) { vars.riddle2 = true; return true; }
			break;
		case 1387: // Miles gives hint for second riddle
			if (!vars.hint) { vars.hint = true; return true; }
			break;
		case 1941: // Called Tink
			if (!vars.tink) { vars.tink = true; return true; }
			break;
		case 2333: // Get remote under carousel
			if (!vars.remote) { vars.remote = true; return true; }
			break;
		//case 1894: // KJ part 2
		//	if (!vars.perris2) { vars.perris2 = true; return true; }
		//	break;
		case 4449: // BB Done
			if (!vars.bbDone) { vars.bbDone = true; return true; }
			break;
		case 4436: // BB start
			if (!vars.bbStart) { vars.bbStart = true; return true; }
			break;
		case 4551: // Harmonica
			if (!vars.harmonica) { vars.harmonica = true; return true; }
			break;
		case 3225: // Harlan's tape
			if (!vars.tape) { vars.tape = true; return true; }
			break;
		//case 7099: // Paula 3
		//	if (!vars.paula3) { vars.paula3 = true; return true; }
		//	break;
		case 3854: // Carve new rod
			if (!vars.lathe) { vars.lathe = true; return true; }
			break;
		case 1258: // Hear final riddle
			if (!vars.riddle3) { vars.riddle3 = true; return true; }
			break;
		case 1909: // Anton says Spatzi
			if (!vars.anton) { vars.anton = true; return true; }
			break;
		case 5304: // Find the horse
			if (!vars.glory) { vars.glory = true; return true; }
			break;
	}
}
