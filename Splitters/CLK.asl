// Secret of the Old Clock Autosplitter
// Written by toburr
// DM me at twitch.tv/toburr or on discord for questions/feedback

state("Game", "Steam")
{
	string15 vidname : 0x1AB520;
}

state("Game", "Disc")
{
	string15 vidname : 0x1AA520;
}

init
{
	if (modules.First().ModuleMemorySize == 2420736) {
		version = "Steam";
	} else {
		version = "Disc";
	}
}

//update
//{
//  if (current.vidname != old.vidname) {
//    vars.DebugOutput("Sceneval changed: "+current.vidname);
//		vars.DebugOutput("Memory size is: "+modules.First().ModuleMemorySize);
//  }
//}

startup
{
	// Initialize printer for debug statements
	Action<string> DebugOutput = (text) => {
		print("[CLK Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;

	// Autosplitter settings
	settings.Add("receipt",false,"Get receipt from Waddell's");
	settings.Add("getriddles",true,"Get riddles from Topham");
	settings.Add("memclockstart",false,"Start Josiah's house clock puzzle");
	settings.Add("memclockmirror",true,"Get mirror from Josiah's house clock");
	settings.Add("rushhourstart",false,"Start Lilac Inn clock puzzle");
	settings.Add("rushhourmirror",true,"Get mirror from Lilac Inn clock");
	settings.Add("trivetstart",false,"Visit Twin Elms for the first time");
	settings.Add("gearclockstart",false,"Start bank clock puzzle");
	settings.Add("gearclockmirror",true,"Get mirror from bank clock");
	settings.Add("fish",false,"Catch nineteen-inch bass");
	settings.Add("lasershow",true,"Release the ladder in the shed for the first time");
	settings.Add("cardsstart",false,"Start psychic card game");
	settings.Add("quartz",true,"Get quartz from Topham");
	settings.Add("marcel",false,"Get Marcel's key");
	settings.Add("getdress",false,"Get dress from Jim");
	settings.Add("trivetfinish",false,"Visit Twin Elms a second time");
	settings.Add("piestart",false,"Start pie sorting puzzle");
	settings.Add("oldphoto",false,"See photo under Jane's podium");
	settings.Add("creepystart",false,"Start Creepy's Corner tile puzzle");
	settings.Add("creepyend",true,"Finish Creepy's Corner tile puzzle");
	settings.Add("sewing",false,"Start sewing the dress");
	settings.Add("journal",true,"Get Josiah's journal from the bank box");
	settings.Add("shakespeare",false,"Read A Midsummer Night's Dream");
	settings.Add("boardgamestart",false,"Start board game in the shed");
	settings.Add("boardgamefinish",false,"Win board game in the shed");
	settings.Add("golf",false,"Get second safe deposit box key");
	settings.Add("will",false,"Find photo of Gloria and Jane");
	// settings end
	vars.DebugOutput("Startup success");
}
start
{
	if (current.vidname == "CLK_OpeningCine") {
		vars.receipt = !settings["receipt"];
		vars.getriddles = !settings["getriddles"];
		vars.memclockstart = !settings["memclockstart"];
		vars.memclockmirror = !settings["memclockmirror"];
		vars.rushhourstart = !settings["rushhourstart"];
		vars.rushhourmirror = !settings["rushhourmirror"];
		vars.trivetstart = !settings["trivetstart"];
		vars.gearclockstart = !settings["gearclockstart"];
		vars.gearclockmirror = !settings["gearclockmirror"];
		vars.fish = !settings["fish"];
		vars.lasershow = !settings["lasershow"];
		vars.cardsstart = !settings["cardsstart"];
		vars.quartz = !settings["quartz"];
		vars.marcel = !settings["marcel"];
		vars.getdress = !settings["getdress"];
		vars.trivetfinish = !settings["trivetfinish"];
		vars.piestart = !settings["piestart"];
		vars.oldphoto = !settings["oldphoto"];
		vars.creepystart = !settings["creepystart"];
		vars.creepyend = !settings["creepyend"];
		vars.sewing = !settings["sewing"];
		vars.journal = !settings["journal"];
		vars.shakespeare = !settings["shakespeare"];
		vars.boardgamestart = !settings["boardgamestart"];
		vars.boardgamefinish = !settings["boardgamefinish"];
		vars.golf = !settings["golf"];
		vars.will = !settings["will"];
		vars.elmvisits = 0;
		return true;
	}
}

split
{
	string s = current.vidname;
	if (s != old.vidname) {
		switch (s) {
			case "LET_CloseA": // win
				return true;
			case "BAN_ClockPUZ": // start gear puzzle
				if (!vars.gearclockstart) { vars.gearclockstart = true; return true; }
				break;
			case "BAN_ClockTopOpn": // got jim's mirror
				if (!vars.gearclockmirror) { vars.gearclockmirror = true; return true; }
				break;
			case "BAN_JAM51_CU": // get dress from Jim
				if (!vars.getdress) { vars.getdress = true; return true; }
				break;
			case "BAN_PhtoGlJnCU": // find photo of Gloria and Jane
				if (!vars.will) { vars.will = true; return true; }
				break;
			case "BAN_RadioJourna": // Get Josiah's GOODFELLOW journal
				if (!vars.journal) { vars.journal = true; return true; }
				break;
			case "BED_SewingBGANI": // Start sewing dress
				if (!vars.sewing) { vars.sewing = true; return true; }
				break;
			case "BED_KeyCU": // get Marcel's key
				if (!vars.marcel) { vars.marcel = true; return true; }
				break;
			case "CAR_Bertha_Anim": // win board game in laser shed
				if (!vars.boardgamefinish) { vars.boardgamefinish = true; return true; }
				break;
			case "CAR_LowerE": //unleash the ladder in the laser shed
				if (!vars.lasershow) { vars.lasershow = true; return true; }
				break;
			case "CAR_MotherClock": // begin laser shed board game
				if (!vars.boardgamestart) { vars.boardgamestart = true; return true; }
				break;
			case "CRO_ClockMirror": // Get Josiah's house clock mirror
				if (!vars.memclockmirror) { vars.memclockmirror = true; return true; }
				break;
			case "CRO_ClockPuz": // Start memory clock puzzle
				if (!vars.memclockstart) { vars.memclockstart = true; return true; }
				break;
			case "CRO_Intelligenc": // Get Topham's brainteaser test
				if (!vars.getriddles) { vars.getriddles = true; return true; }
				break;
			case "CRO_MainDeskCU": // start psychic card game
				if (!vars.cardsstart) { vars.cardsstart = true; return true; }
				break;
			case "CRO_QuartzHando": // win psychic card game
				if (!vars.quartz) { vars.quartz = true; return true; }
				break;
			case "CRO_Shakespeare": // Read Topham's Shakespeare book
				if (!vars.shakespeare) { vars.shakespeare = true; return true; }
				break;
			case "EXT_JewelersNot": // Catch flying receipt from Waddell's
				if (!vars.receipt) { vars.receipt = true; return true; }
				break;
			case "EXT_PieSorting_": // start pie sorting
				if (!vars.piestart) { vars.piestart = true; return true; }
				break;
			case "GOL_HoleB06KeyC": // get second safe deposit box key
				if (!vars.golf) { vars.golf = true; return true; }
				break;
			case "MAP_FishLrgMout": // catch nineteen inch bass
				if (!vars.fish) { vars.fish = true; return true; }
				break;
			case "MAP_Mansion": // Visit Twin Elms
				vars.elmvisits += 1;
				if (vars.elmvisits == 1 && !vars.trivetstart) { vars.trivetstart = true; return true; }
				if (vars.elmvisits == 2 && !vars.trivetfinish) { vars.trivetfinish = true; return true; }
				break;
			case "PAR_CivilWarPho": // get old tunnel photo
				if (!vars.oldphoto) { vars.oldphoto = true; return true; }
				break;
			case "PAR_Clock_PUZ": // start lilac inn clock rush hour puzzle
				if (!vars.rushhourstart) { vars.rushhourstart = true; return true; }
				break;
			case "PAR_NoMirror": // got mirror from lilac inn
				if (!vars.rushhourmirror) { vars.rushhourmirror = true; return true; }
				break;
			case "SUB_CreepPuzOpn": // finish tunnel tile puzzle
				if (!vars.creepyend) { vars.creepyend = true; return true; }
				break;
			case "SUB_Creepy_PUZ": // start tunnel tile puzzle
				if (!vars.creepystart) { vars.creepystart = true; return true; }
				break;
		}
	}
}
