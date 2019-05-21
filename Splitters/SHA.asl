// The Secret of Shadow Ranch Autosplitter
// Written by toburr
// DM me at twitch.tv/toburr or on discord for questions/feedback

state("Game")
{
	uint sceneval : 0x1AE968;
}

startup
{
	// Initialize printer for debug statements
	//Action<string> DebugOutput = (text) => {
	//	print("[SHA Autosplitter] "+text);
	//};
	//vars.DebugOutput = DebugOutput;

	// Autosplitter settings
	settings.Add("getEggBasket",true,"Get Egg Basket on First Day");
	settings.Add("fixEggBasket",false,"Repair Egg Basket");
	settings.Add("horseQuizDone",true,"Pass Tex's Horse Quiz");
	settings.Add("roadrunnerStart",false,"Start Roadrunner Game");
	settings.Add("roadrunnerDone",false,"Win Roadrunner Game");
	settings.Add("endDay1",true,"Day 1 Evening");
	settings.Add("startDay2",false,"Day 2 Morning");
	settings.Add("cakeBakeStart",true,"Start Making Cake");
	settings.Add("cakeIcingStart",false,"Start Icing Puzzle");
	settings.Add("cakeDone",false,"Finish Icing Cake");
	settings.Add("lariat",true,"Get Lariat");
	settings.Add("cougarBendStart",false,"Go to Cougar Bend for the First Time");
	settings.Add("glyphChartDone",false,"Fill Out Glyph Chart");
	settings.Add("trailStopStart",false,"Go to Trail Stop for the First Time");
	settings.Add("dryCreekStart",false,"Go to Dry Creek for the First Time");
	settings.Add("cappysKeysDone",true,"Solve Cappy's Keys Puzzle");
	settings.Add("forks",false,"Get Tuning Forks");
	settings.Add("lampBreak",false,"Break the Lamp in Cappy's");
	settings.Add("nightDay2",true,"Day 2 Evening");
	settings.Add("coopStart",false,"Start Coop Wire Puzzle");
	settings.Add("coopDone",true,"Finish Coop Wire Puzzle");
	settings.Add("startDay3",false,"Day 3 Morning");
	settings.Add("bridleStart",false,"Start Bridle Puzzle");
	settings.Add("bridleDone",false,"Finish Bridle Puzzle");
	settings.Add("ko",true,"Nancy Gets Knocked Out");
	settings.Add("jailKey",false,"Get Jail Cell Key");
	settings.Add("bankNote",false,"Read Note Under Bank Lamp");
	settings.Add("slotsStart",true,"Play Cappy's Slots for the First Time");
	settings.Add("slotsDone",true,"Get Key From Cappy's Slots");
	settings.Add("magnetStart",false,"Start Zebra Rock Magnet Puzzle");
	settings.Add("magnetDone",false,"Finish Zebra Rock Magnet Puzzle");
	settings.Add("flowersDone",false,"Finish Flower Box Puzzle");
	settings.Add("v",false,"Draw V on Glyph Chart");
	settings.Add("dirkRock",true,"Get (Unpolished) Picture Agate");
	settings.Add("niceRock",false,"Mary Polishes the Agate");
	settings.Add("q",false,"Go to ?");
	settings.Add("treasure",true,"Open Dirk's Treasure Chest");
	// settings end

	//vars.DebugOutput("Startup success");
}

start
{
	if (current.sceneval == 5900) {
		// Initialize split flags before starting
		vars.getEggBasket = !settings["getEggBasket"];
		vars.fixEggBasket = !settings["fixEggBasket"];
		vars.horseQuizDone = !settings["horseQuizDone"];
		vars.roadrunnerStart = !settings["roadrunnerStart"];
		vars.roadrunnerDone = !settings["roadrunnerDone"];
		vars.endDay1 = !settings["endDay1"];
		vars.startDay2 = !settings["startDay2"];
		vars.cakeBakeStart = !settings["cakeBakeStart"];
		vars.cakeIcingStart = !settings["cakeIcingStart"];
		vars.cakeDone = !settings["cakeDone"];
		vars.lariat = !settings["lariat"];
		vars.cougarBendStart = !settings["cougarBendStart"];
		vars.glyphChartDone = !settings["glyphChartDone"];
		vars.trailStopStart = !settings["trailStopStart"];
		vars.dryCreekStart = !settings["dryCreekStart"];
		vars.cappysKeysDone = !settings["cappysKeysDone"];
		vars.forks = !settings["forks"];
		vars.lampBreak = !settings["lampBreak"];
		vars.nightDay2 = !settings["nightDay2"];
		vars.coopStart = !settings["coopStart"];
		vars.coopDone = !settings["coopDone"];
		vars.startDay3 = !settings["startDay3"];
		vars.bridleStart = !settings["bridleStart"];
		vars.bridleDone = !settings["bridleDone"];
		vars.ko = !settings["ko"];
		vars.jailKey = !settings["jailKey"];
		vars.bankNote = !settings["bankNote"];
		vars.slotsStart = !settings["slotsStart"];
		vars.slotsDone = !settings["slotsDone"];
		vars.magnetStart = !settings["magnetStart"];
		vars.magnetDone = !settings["magnetDone"];
		vars.flowersDone = !settings["flowersDone"];
		vars.v = !settings["v"];
		vars.dirkRock = !settings["dirkRock"];
		vars.niceRock = !settings["niceRock"];
		vars.q = !settings["q"];
		vars.treasure = !settings["treasure"];
		//Initialization finished

		//vars.DebugOutput("Timer started.");
		return true;
	}
}

split
{
	uint s = current.sceneval;
	switch (s) {
		case 5920: // The end
			return true;
		case 1351: // Get egg basket from Shorty
			if (!vars.getEggBasket) {vars.getEggBasket = true; return true;}
			break;
		case 2501: // Put egg basket pieces back (junior)
		case 2511: // Put egg basket pieces back (senior)
			if (!vars.fixEggBasket) {vars.fixEggBasket = true; return true;}
			break;
		case 4510: // Finished horse quiz
			if (!vars.horseQuizDone) {vars.horseQuizDone = true; return true;}
			break;
		case 2087: // Start roadrunner game
			if (!vars.roadrunnerStart) {vars.roadrunnerStart = true; return true;}
			break;
		case 2085: // Won roadrunner game
			if (!vars.roadrunnerDone) {vars.roadrunnerDone = true; return true;}
			break;
		case 2992: // End day 1
			if (!vars.endDay1) {vars.endDay1 = true; return true;}
			break;
		case 3111: // Start day 2
			if (!vars.startDay2) {vars.startDay2 = true; return true;}
			break;
		case 2450: // Cake baking start
			if (!vars.cakeBakeStart) {vars.cakeBakeStart = true; return true;}
			break;
		case 2465: // Icing puzzle start
			if (!vars.cakeIcingStart) {vars.cakeIcingStart = true; return true;}
			break;
		case 2532: // Cake done
			if (!vars.cakeDone) {vars.cakeDone = true; return true;}
			break;
		case 1289: // Get lariat
			if (!vars.lariat) {vars.lariat = true; return true;}
			break;
		case 3301: // Arrival at Cougar Bend
			if (!vars.cougarBendStart) {vars.cougarBendStart = true; return true;}
			break;
		case 6242: // Solve petroglyph chart
			if (!vars.glyphChartDone) {vars.glyphChartDone = true; return true;}
			break;
		case 3201: // Arrival at Trail Stop
			if (!vars.trailStopStart) {vars.trailStopStart = true; return true;}
			break;
		case 3501: // Arrival at Dry Creek
			if (!vars.dryCreekStart) {vars.dryCreekStart = true; return true;}
			break;
		case 3626: // Read Beady Eyes Ranch note
			if (!vars.cappysKeysDone) {vars.cappysKeysDone = true; return true;}
			break;
		case 2055: // Grab tuning forks
			if (!vars.forks) {vars.forks = true; return true;}
			break;
		case 3670: // Break Cappy's lamp
			if (!vars.lampBreak) {vars.lampBreak = true; return true;}
			break;
		case 2997: // Day 2 Night
			if (!vars.nightDay2) {vars.nightDay2 = true; return true;}
			break;
		case 3010: // Coop puzzle start junior
		case 3017: // Coop puzzle start senior
			if (!vars.coopStart) {vars.coopStart = true; return true;}
			break;
		case 3011: // Coop puzzle done
			if (!vars.coopDone) {vars.coopDone = true; return true;}
			break;
		case 3118: // Day 3 Start
			if (!vars.startDay3) {vars.startDay3 = true; return true;}
			break;
		case 2655: // Bridle puzzle start
			if (!vars.bridleStart) {vars.bridleStart = true; return true;}
			break;
		case 2651: // Bridle puzzle done
			if (!vars.bridleDone) {vars.bridleDone = true; return true;}
			break;
		case 3609: // Get knocked out
			if (!vars.ko) {vars.ko = true; return true;}
			break;
		case 3750: // Get cell key
			if (!vars.jailKey) {vars.jailKey = true; return true;}
			break;
		case 3571: // Note under bank lamp
			if (!vars.bankNote) {vars.bankNote = true; return true;}
			break;
		case 3704: // Slots start
			if (!vars.slotsStart) {vars.slotsStart = true; return true;}
			break;
		case 3710: // Key get
			if (!vars.slotsDone) {vars.slotsDone = true; return true;}
			break;
		case 3280: // Magnet puzzle start
			if (!vars.magnetStart) {vars.magnetStart = true; return true;}
			break;
		case 3249: // Magnet puzzle done
			if (!vars.magnetDone) {vars.magnetDone = true; return true;}
			break;
		case 3251: // Flower puzzle done
			if (!vars.flowersDone) {vars.flowersDone = true; return true;}
			break;
		case 6244: // V for valentine
			if (!vars.v) {vars.v = true; return true;}
			break;
		case 3338: // Dirk's rock
			if (!vars.dirkRock) {vars.dirkRock = true; return true;}
			break;
		case 1468: // It's a picture agate
			if (!vars.niceRock) {vars.niceRock = true; return true;}
			break;
		case 2138: // ?
			if (!vars.q) {vars.q = true; return true;}
			break;
		case 2821: // The treasure
			if (!vars.treasure) {vars.treasure = true; return true;}
			break;
	}
}
