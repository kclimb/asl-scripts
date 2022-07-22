// Stay Tuned for Danger Autosplitter
// Written by toburr
// DM me at twitch.tv/toburr or on discord for questions/feedback

state("Game")
{
	uint sceneval : 0x114DAC;
	int rng : 0x17FC8, 0x44, 0x30, 0x150, 0x0, 0x18, 0xBFC, 0x2AC, 0x14;
}

update
{
  if (current.sceneval != old.sceneval) {
    vars.DebugOutput("Sceneval changed: "+current.sceneval);
		vars.DebugOutput("Rng: "+current.rng);
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
	settings.Add("enterSet",true,"Enter the Set for the First Time");
	settings.Add("acting",false,"Rick and Mattie Rehearse Scene");
	settings.Add("starcrash",false,"Stage Light Falls");
	settings.Add("briefcase",false,"Open Dwayne's Briefcase");
	settings.Add("dwayne",true,"Finish Dwayne Convo");
	settings.Add("props",false,"Enter Prop Room");
	settings.Add("ringsStart",true,"Start Ring Puzzle");
	settings.Add("ringsEnd",false,"Finish Ring Puzzle");
	settings.Add("getKey",true,"Get Key From Clock");
	settings.Add("powerOn",false,"Flip Power Switch");
	settings.Add("trapdoorOpen",false,"Open Trapdoor");
	settings.Add("spayder",true,"Look at Owen's ID");
	settings.Add("rickTape",false,"Watch Rick's Tape");
	settings.Add("dwayneTape",false,"End of Security Tape");
	settings.Add("bomb",true,"Defuse the Bomb");
	settings.Add("computer",false,"View Printout From Lillian's Computer");
	settings.Add("wheelStart",true,"Start Final Puzzle");
	// settings end

	vars.DebugOutput("Startup success");
}

start
{
	if (current.sceneval == 1280) {
		// Initialize split flags before starting
		vars.props = !settings["props"];
		vars.computer = !settings["computer"];
		vars.rickTape = !settings["rickTape"];
		vars.dwayne = !settings["dwayne"];
		vars.spayder = !settings["spayder"];
		vars.ringsStart = !settings["ringsStart"];
		vars.ringsEnd = !settings["ringsEnd"];
    vars.wheelStart = !settings["wheelStart"];
		vars.trapdoorOpen = !settings["trapdoorOpen"];
		vars.powerOn = !settings["powerOn"];
		vars.getKey = !settings["getKey"];
		vars.enterSet = !settings["enterSet"];
		vars.acting = !settings["acting"];
		vars.starcrash = !settings["starcrash"];
		vars.bomb = !settings["bomb"];
		vars.briefcase = !settings["briefcase"];
		vars.dwayneTape = !settings["dwayneTape"];

		vars.DebugOutput("Timer started.");
		return true;
	}
}

split
{
	uint s = current.sceneval;
	switch (s) {
		case 77056: // Enter prop room
		  if (!vars.props) {vars.props = true; return true;}
			break;
    case 186880: // Watch Rick's tape
      if (!vars.rickTape) {vars.rickTape = true; return true;}
      break;
		case 207616: // Dwayne
		  if (!vars.dwayne) {vars.dwayne = true; return true;}
			break;
		case 308480: // Rings start
			if (!vars.ringsStart) {vars.ringsStart = true; return true;}
			break;
		case 313856: // Rings end
			if (!vars.ringsEnd) {vars.ringsEnd = true; return true;}
			break;
		case 322560: // Saw Owen Spayder's ID
			if (!vars.spayder) {vars.spayder = true; return true;}
			break;
		case 334848: // View printout from Lillian's computer
			if (!vars.computer) {vars.computer = true; return true;}
			break;
    case 400128: // End puzzle start (junior)
		case 400384: // End puzzle start (senior)
		case 400640: // End puzzle start (master)
      if (!vars.wheelStart) {vars.wheelStart = true; return true;}
      break;
		case 401152: // Trapdoor open
			if (!vars.trapdoorOpen) {vars.trapdoorOpen = true; return true;}
			break;
		case 416256: // Turned power on
			if (!vars.powerOn) {vars.powerOn = true; return true;}
			break;
		case 440064: // Key cutscene
			if (!vars.getKey) {vars.getKey = true; return true;}
			break;
    case 448256: // Kleig light cutscene start
      if (!vars.enterSet) {vars.enterSet = true; return true;}
			break;
		case 449280: // Acting start
		  if (!vars.acting) {vars.acting = true; return true;}
			break;
		case 450048: // Kleig light cutscene end
		  if (!vars.starcrash) {vars.starcrash = true; return true;}
			break;
		case 517888: // Defused bomb
			if (!vars.bomb) {vars.bomb = true; return true;}
			break;
		case 578816: // Briefcase open
			if (!vars.briefcase) {vars.briefcase = true; return true;}
			break;
		case 646400: // 4th sequence of Dwayne tape
		  if (!vars.dwayneTape) {vars.dwayneTape = true; return true;}
			break;
		case 1280000: // END OF GAME
			return true; // will split all remaining splits if multiple are left
	}
}
