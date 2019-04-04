// Message in a Haunted Mansion Autosplitter
// Written by toburr
// DM me at twitch.tv/toburr or on discord for questions/feedback

state("Game")
{
	uint sceneval : 0xF6240;
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
		print("[MHM Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;

	// Autosplitter settings
	settings.Add("meetAbby",true,"Finish Meeting Abby");
	settings.Add("meetRose",false,"Finish Meeting Rose");
	settings.Add("tilesStart",false,"Start Tile Puzzle");
	settings.Add("tilesEnd",false,"Back Away From Tile Puzzle (including if you finish it)");
	settings.Add("roseTiles",true,"Tell Rose Tile Puzzle Is Done");
	settings.Add("meetCharlie",false,"Finish Meeting Charlie");
	settings.Add("meetLouis",true,"Finish Meeting Louis");
	settings.Add("tile1",false,"Find First Fireplace Tile");
	settings.Add("scraperGet",true,"Find Paint Scraper");
	settings.Add("openRegister",false,"Open Cash Register");
	settings.Add("unlockAttic",false,"Unlock Attic");
	settings.Add("crowbarGet",true,"Find Crowbar");
	settings.Add("ironGet",false,"Find Iron");
	settings.Add("tile2",false,"Find Second Fireplace Tile");
	settings.Add("leaveAttic",true,"Pry Open Attic Door (to leave)");
	settings.Add("dumbwaiter",false,"Activate Dumbwaiter (using iron)");
	settings.Add("tile3",true,"Find Third Fireplace tile");
	settings.Add("diego",true,"Solve Diego Puzzle");
	settings.Add("pyramidKey",false,"Get Chinese Symbol Key");
	settings.Add("fireplace",false,"Put Tiles On Fireplace");
	settings.Add("kronk",false,"Pull The Fireplace Lever");
	settings.Add("spy",true,"Spy On Louis");
	settings.Add("gbf",false,"Read About Gum Bo Fu");
	settings.Add("emilyGBF",true,"Ask Emily About Gum Bo Fu");
	settings.Add("mhm",false,"Open The Message In A Haunted Mansion");
	settings.Add("fire",true,"Put Out The Fire");
	settings.Add("sirens",false,"Police Sirens After Fire");
	settings.Add("pfRose",false,"Talk To Rose After Fire");
	settings.Add("charlieGBF",true,"Ask Charlie About Gum Bo Fu");
	settings.Add("louisGBF",false,"Ask Louis About Gum Bo Fu");
	settings.Add("pr0",false,"Start Zodiac Tile Press Puzzle");
	settings.Add("pr1",true,"Start Chinese Safe Puzzle");
	settings.Add("pr2",false,"Start Moon/Sun Tile Flip Puzzle");
	settings.Add("pr3",true,"Start Slider");
	settings.Add("pr4",false,"Get Phoenix Eye");
	settings.Add("gold",true,"\"Gold!\"");
	// settings end

	vars.DebugOutput("Startup success");
}

init
{
	current.sceneval=3;
}

start
{
	if (old.sceneval == 0 && current.sceneval == 104923136) {
		vars.meetAbby = !settings["meetAbby"];
		vars.meetRose = !settings["meetRose"];
		vars.tilesStart = !settings["tilesStart"];
		vars.tilesEnd = !settings["tilesEnd"];
		vars.roseTiles = !settings["roseTiles"];
		vars.meetCharlie = !settings["meetCharlie"];
		vars.meetLouis = !settings["meetLouis"];
		vars.tile1 = !settings["tile1"];
		vars.scraperGet = !settings["scraperGet"];
		vars.openRegister = !settings["openRegister"];
		vars.unlockAttic = !settings["unlockAttic"];
		vars.crowbarGet = !settings["crowbarGet"];
		vars.ironGet = !settings["ironGet"];
		vars.tile2 = !settings["tile2"];
		vars.leaveAttic = !settings["leaveAttic"];
		vars.dumbwaiter = !settings["dumbwaiter"];
		vars.tile3 = !settings["tile3"];
		vars.diego = !settings["diego"];
		vars.pyramidKey = !settings["pyramidKey"];
		vars.fireplace = !settings["fireplace"];
		vars.kronk = !settings["kronk"];
		vars.spy = !settings["spy"];
		vars.gbf = !settings["gbf"];
		vars.emilyGBF = !settings["emilyGBF"];
		vars.mhm = !settings["mhm"];
		vars.fire = !settings["fire"];
		vars.sirens = !settings["sirens"];
		vars.pfRose = !settings["pfRose"];
		vars.charlieGBF = !settings["charlieGBF"];
		vars.louisGBF = !settings["louisGBF"];
		vars.pr0 = !settings["pr0"];
		vars.pr1 = !settings["pr1"];
		vars.pr2 = !settings["pr2"];
		vars.pr3 = !settings["pr3"];
		vars.pr4 = !settings["pr4"];
		vars.gold = !settings["gold"];
		return true;
	}
}

split
{
	uint s = current.sceneval;
	switch (s) {
		case 110755840: // End
			return true;
		case 65863680: // Meet Abby
			if (!vars.meetAbby) { vars.meetAbby = true; return true; }
			break;
		case 111804416: // Meet Rose
			if (!vars.meetRose) { vars.meetRose = true; return true; }
			break;
		case 3407872: // Start tile puzzle
			if (!vars.tilesStart) { vars.tilesStart = true; return true; }
			break;
		case 232718336: // Back away from tile puzzle (including solving it)
			if (!vars.tilesEnd && vars.tilesStart) { vars.tilesEnd = true; return true; }
			break;
		case 111869952: // Tell Rose tile puzzle is done
			if (!vars.roseTiles) { vars.roseTiles = true; return true; }
			break;
		case 78905344: // Meet Charlie
			if (!vars.meetCharlie) { vars.meetCharlie = true; return true; }
			break;
		case 98762752: // Meet Louis
			if (!vars.meetLouis) { vars.meetLouis = true; return true; }
			break;
		case 537395200: // Move books for tile
			if (!vars.tile1) { vars.tile1 = true; return true; }
			break;
		case 263323648: // Uncover paint scraper
			if (!vars.scraperGet) { vars.scraperGet = true; return true; }
			break;
		case 394002432: // Open saloon register
			if (!vars.openRegister) { vars.openRegister = true; return true; }
			break;
		case 301334528: // Unlock attic
			if (!vars.unlockAttic) { vars.unlockAttic = true; return true; }
			break;
		case 190054400: // Get crowbar
			if (!vars.crowbarGet) { vars.crowbarGet = true; return true; }
			break;
		case 169148416: // Get iron
			if (!vars.ironGet) { vars.ironGet = true; return true; }
			break;
		case 166461440: // Get second tile
			if (!vars.tile2) { vars.tile2 = true; return true; }
			break;
		case 164560896: // Leave attic
		  if (!vars.leaveAttic) { vars.leaveAttic = true; return true; }
			break;
		case 331218944: // Use dumbwaiter
			if (!vars.dumbwaiter) { vars.dumbwaiter = true; return true; }
			break;
		case 299630592: // Get third tile
			if (!vars.tile3) { vars.tile3 = true; return true; }
			break;
		case 464322560: // Diego
			if (!vars.diego) { vars.diego = true; return true; }
			break;
		case 464191488: // Get Chinese symbol
			if (!vars.pyramidKey) { vars.pyramidKey = true; return true; }
			break;
		case 556072960: // Put tiles in position
			if (!vars.fireplace) { vars.fireplace = true; return true; }
			break;
		case 524484608: // Pull fireplace lever
			if (!vars.kronk) { vars.kronk = true; return true; }
			break;
		case 527499264: // Spy on Louis
			if (!vars.spy) { vars.spy = true; return true; }
			break;
		case 532217856: // Gum Bo Fu
			if (!vars.gbf) { vars.gbf = true; return true; }
			break;
		case 87818240: // Ask Emily about Gum Bo Fu
			if (!vars.emilyGBF) { vars.emilyGBF = true; return true; }
			break;
		case 216465408: // Receive the Message in a Haunted Mansion
			if (!vars.mhm) { vars.mhm = true; return true; }
			break;
		case 366346240: // Put out fire
			if (!vars.fire) { vars.fire = true; return true; }
			break;
		case 366608384: // Police sirens
			if (!vars.sirens) { vars.sirens = true; return true; }
			break;
		case 112066560: // Post-fire Rose
			if (!vars.pfRose) { vars.pfRose = true; return true; }
			break;
		case 82771968: // Ask Charlie about Gum Bo Fu
			if (!vars.charlieGBF) { vars.charlieGBF = true; return true; }
			break;
		case 101974016: // Ask Louis about Gum Bo Fu
			if (!vars.louisGBF) { vars.louisGBF = true; return true; }
			break;
		case 222822400: // Begin puzzle rush
			if (!vars.pr0) { vars.pr0 = true; return true; }
			break;
		case 218431488: // Finish zodiac press
			if (!vars.pr1) { vars.pr1 = true; return true; }
			break;
		case 227540992: // Finish zodiac safe
			if (!vars.pr2) { vars.pr2 = true; return true; }
			break;
		case 227606528: // Finish sun puzzle
			if (!vars.pr3) { vars.pr3 = true; return true; }
			break;
		case 227475456: // Finish slider
			if (!vars.pr4) { vars.pr4 = true; return true; }
			break;
		case 288555008: // Gold!
			if (!vars.gold) { vars.gold = true; return true; }
			break;
	}
}
