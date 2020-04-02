// Danger on Deception Island Autosplitter
// Written by toburr
// DM me at twitch.tv/toburr or on discord for questions/feedback

state("Game")
{
	uint sceneval : 0x16A444;
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
	//	print("[DDI Autosplitter] "+text);
	//};
	//vars.DebugOutput = DebugOutput;

	// Autosplitter settings
	settings.Add("pipesstart",false,"Begin Katie's sink puzzle");
	settings.Add("andycard",false,"Find Andy's business card");
	settings.Add("katiegps",false,"Tell Katie about her broken GPS");
	settings.Add("holtgps",false,"Get Holt's seamanship quiz");
	settings.Add("stonebottle",false,"Read note in bottle near lighthouse");
	settings.Add("holtyell",true,"Get yelled at by Holt at the lighthouse");
	settings.Add("gps",false,"Get GPS from Holt");
	settings.Add("rosebud",false,"Open the \"Rosebud\" clamshell");
	settings.Add("onebum",false,"See Hilda's gift to Holt");
	settings.Add("bucket",false,"Get clamming bucket from Jenna");
	settings.Add("whalegames",false,"Start playing the games at Whale World");
	settings.Add("caddy",false,"Start the Caddy puzzle at Whale World");
	settings.Add("tour",true,"Go on whale watching tour");
	settings.Add("tube",false,"Get clamming tube and permit from Andy");
	settings.Add("memstart",false,"Begin memory puzzle");
	settings.Add("eleph",true,"Look at necklace with \"Eleph\" written on it");
	settings.Add("tunnel",true,"Watch the awesome cutscene of walking through tunnels");
	settings.Add("morse",false,"Send morse code to Hilda");
	settings.Add("bookstart",false,"Start book sorting puzzle");
	settings.Add("drphone",false,"Get wood doctor's phone number");
	settings.Add("gift",false,"Find Hilda's remote");
	settings.Add("maze",false,"Find GPS coordinates in tunnel maze");
	settings.Add("binoculars",false,"Find Hilda's binoculars");
	settings.Add("boop",false,"Open up the secret orca cove");
	settings.Add("wow",true,"Meet the orca");
	settings.Add("endgame",false,"Go out to the mystery boat with Andy");
	// settings end

	//vars.DebugOutput("Startup success");
}

start
{
	if (current.sceneval == 5900) {
		vars.pipesstart = !settings["pipesstart"];
		vars.andycard = !settings["andycard"];
		vars.katiegps = !settings["katiegps"];
		vars.holtgps = !settings["holtgps"];
		vars.stonebottle = !settings["stonebottle"];
		vars.holtyell = !settings["holtyell"];
		vars.gps = !settings["gps"];
		vars.rosebud = !settings["rosebud"];
		vars.onebum = !settings["onebum"];
		vars.bucket = !settings["bucket"];
		vars.whalegames = !settings["whalegames"];
		vars.caddy = !settings["caddy"];
		vars.tour = !settings["tour"];
		vars.tube = !settings["tube"];
		vars.memstart = !settings["memstart"];
		vars.eleph = !settings["eleph"];
		vars.bookstart = !settings["bookstart"];
		vars.drphone = !settings["drphone"];
		vars.tunnel = !settings["tunnel"];
		vars.morse = !settings["morse"];
		vars.gift = !settings["gift"];
		vars.maze = !settings["maze"];
		vars.binoculars = !settings["binoculars"];
		vars.boop = !settings["boop"];
		vars.wow = !settings["wow"];
		vars.endgame = !settings["endgame"];
		return true;
	}
}

split
{
	uint s = current.sceneval;
	switch (s) {
		case 5920: // End
			return true;
		case 1060: // Tell Katie about broken GPS
			if (!vars.katiegps) { vars.katiegps = true; return true; }
			break;
		case 1189: // Get bucket from Jenna
			if (!vars.bucket) { vars.bucket = true; return true; }
			break;
		case 1229: // Acquire seamanship quiz
			if (!vars.holtgps) { vars.holtgps = true; return true; }
			break;
		case 1239: // Acquire GPS
			if (!vars.gps) { vars.gps = true; return true; }
			break;
		case 1280: // One (1) bum
			if (!vars.onebum) { vars.onebum = true; return true; }
			break;
		case 1385: // Go out to mystery boat with Andy
			if (!vars.endgame) { vars.endgame = true; return true; }
			break;
		case 1388: // Get clamming tube and permit
			if (!vars.tube) { vars.tube = true; return true; }
			break;
		case 1389: // Watch whale
			if (!vars.tour) { vars.tour = true; return true; }
			break;
		case 2043: // Open Rosebud shell
			if (!vars.rosebud) { vars.rosebud = true; return true; }
			break;
		case 2397: // Get wood doctor's phone number
			if (!vars.drphone) { vars.drphone = true; return true; }
			break;
		case 2585: // Start book puzzle (2585 = junior)
			if (!vars.bookstart) { vars.bookstart = true; return true; }
			break;
		case 2656: // Open secret orca cove
			if (!vars.boop) { vars.boop = true; return true; }
			break;
		case 2720: // WOW!!!
			if (!vars.wow) { vars.wow = true; return true; }
			break;
		case 2916: // Begin caddy puzzle
			if (!vars.caddy) { vars.caddy = true; return true; }
			break;
		case 2934: // Begin whale games
			if (!vars.whalegames) { vars.whalegames = true; return true; }
			break;
		case 3171: // Find coordinates in tunnel maze
			if (!vars.maze) { vars.maze = true; return true; }
			break;
		case 3275: // Find Hilda's "gift"
			if (!vars.gift) { vars.gift = true; return true; }
			break;
		case 3311: // Get neat binoculars
			if (!vars.binoculars) { vars.binoculars = true; return true; }
			break;
		case 3857: // Look at Eleph necklace
			if (!vars.eleph) { vars.eleph = true; return true; }
			break;
		case 3875: // Begin memory puzzle
			if (!vars.memstart) { vars.memstart = true; return true; }
			break;
		case 4139: // send phone number in morse code
			if (!vars.morse) { vars.morse = true; return true; }
			break;
		case 4199: // get yelled at by Holt at the lighthouse
			if (!vars.holtyell) { vars.holtyell = true; return true; }
			break;
		case 4860: // watch epic tunnel cutscene
			if (!vars.tunnel) { vars.tunnel = true; return true; }
			break;
		case 5673: // get bottle from stone skipping
			if (!vars.stonebottle) { vars.stonebottle = true; return true; }
			break;
		case 6519: // start pipes
			if (!vars.pipesstart) { vars.pipesstart = true; return true; }
			break;
		case 6522: // find Andy's businesscard
			if (!vars.andycard) { vars.andycard = true; return true; }
			break;
	}
}
