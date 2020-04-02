// Last Train to Blue Moon Canyon Autosplitter
// Written by toburr
// DM me at twitch.tv/toburr or on discord for questions/feedback

state("Game", "Steam")
{
	string20 vidname : 0x18C9C2;
}

//state("Game", "Disc")
//{
//	string20 vidname : 0x1AA520;
//}

//init
//{
//	if (modules.First().ModuleMemorySize == 2420736) {
//		version = "Steam";
//	} else {
//		version = "Disc";
//	}
//}

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
	// Meeting people
	settings.Add("Meeting People");
	settings.Add("metcharleena",false,"Meet Charleena","Meeting People");
	settings.Add("hardys",false,"Meet the Hardy Boys","Meeting People");
	settings.Add("metjohn",false,"Meet John","Meeting People");
	settings.Add("mettino",false,"Meet Tino","Meeting People");
	settings.Add("metlori",true,"Find Lori","Meeting People");
	settings.Add("metfatima",false,"Meet Fatima","Meeting People");

	// Slugs
	settings.Add("Slugs",false);
	settings.Add("slug12",false,"Find slugs 1 and 2","Slugs");
	settings.Add("slug3",false,"Find slug number 3","Slugs");
	settings.Add("slug6",false,"Find slug number 6","Slugs");
	settings.Add("slug7",false,"Find slug number 7","Slugs");
	settings.Add("slug8",false,"Find slug number 8","Slugs");
	settings.Add("slug10",false,"Find slug number 10","Slugs");

	// Gems
	settings.Add("Gems",false);
	settings.Add("tigereye",false,"Find tiger's eye","Gems");
	settings.Add("peridot",false,"Look at side of Ibex head with Peridot","Gems");
	settings.Add("tourmaline",false,"Find tourmaline","Gems");
	settings.Add("citrine",false,"Find citrine","Gems");
	settings.Add("amethyst",false,"Find amethyst","Gems");
	settings.Add("zircon",false,"Find zircon","Gems");

	// Copper Gorge things
	settings.Add("Copper Gorge");
	settings.Add("cg",true,"Copper Gorge map cutscene","Copper Gorge");
	settings.Add("horses",false,"Win token from horse betting","Copper Gorge");
	settings.Add("pachinko",false,"Win token from Gold Rush","Copper Gorge");
	settings.Add("taffy",false,"Get taffy from vending machine","Copper Gorge");
	settings.Add("llstart",false,"Begin playing Leaping Lizards","Copper Gorge");
	settings.Add("pen",false,"Tino gives you his pen","Copper Gorge");
	settings.Add("autograph",false,"Charleena signs her autograph","Copper Gorge");
	settings.Add("cryptkey",false,"Acquire the key to Camille's crypt","Copper Gorge");
	settings.Add("paper",false,"Get wax paper","Copper Gorge");
	settings.Add("frank",true,"Switch to playing as Frank","Copper Gorge");
	settings.Add("doneburgers",false,"Ring the bell at the diner 5 times (if you don't make mistakes, this is the last burger)","Copper Gorge");

	// Jake's machine parts
	settings.Add("Jake's Machine Parts",false);
	settings.Add("map",false,"Solve the map fetcher puzzle","Jake's Machine Parts");
	settings.Add("pickaxe",false,"Get pickaxe","Jake's Machine Parts");
	settings.Add("carbide",false,"Open up the carbide tin","Jake's Machine Parts");
	settings.Add("spyglass",false,"Acquire spyglass","Jake's Machine Parts");
	settings.Add("box",false,"Attempt John's puzzle box","Jake's Machine Parts");
	settings.Add("tape",false,"Acquire duct tape","Jake's Machine Parts");

	// Train puzzles
	settings.Add("Train Puzzles",false);
	settings.Add("tiledrawer",false,"Read note from tile puzzle in drawer","Train Puzzles");
	settings.Add("thurston",false,"Find Jake's engineer's name","Train Puzzles");
	settings.Add("jakepipes",false,"Look at pipes in Tino's car","Train Puzzles");
	settings.Add("quietpipes",false,"Look at pipes in quiet car","Train Puzzles");
	settings.Add("camillepipes",false,"Unscrew bolts covering pipe puzzle in John's car","Train Puzzles");
	settings.Add("eaglepipes",false,"Look at pipes behind eagle painting","Train Puzzles");

	// Endgame
	settings.Add("Endgame");
	settings.Add("lasers",true,"Activate laser light show","Endgame");
	settings.Add("bc", false, "Brimstone Canyon map cutscene","Endgame");
	settings.Add("bca", false, "Arrive at Brimstone Canyon","Endgame");
	settings.Add("cannon", false, "Start cannon ring puzzle","Endgame");
	settings.Add("boom", false, "Fire the cannon","Endgame");
	settings.Add("abe",true, "Find the \"treasure\"","Endgame");
	// settings end
	vars.DebugOutput("Startup success");
}
start
{
	//return current.vidname == "DIN_ToKitchen_D";
	if (current.vidname == "LET_Open_A") {
		vars.metcharleena = !settings["metcharleena"];
		vars.hardys = !settings["hardys"];
		vars.metjohn = !settings["metjohn"];
		vars.mettino = !settings["mettino"];
		vars.metlori = !settings["metlori"];
		vars.metfatima = !settings["metfatima"];
		vars.map = !settings["map"];
		vars.cg = !settings["cg"];
		vars.horses = !settings["horses"];
		vars.pachinko = !settings["pachinko"];
		vars.taffy = !settings["taffy"];
		vars.llstart = !settings["llstart"];
		vars.pen = !settings["pen"];
		vars.autograph = !settings["autograph"];
		vars.cryptkey = !settings["cryptkey"];
		vars.paper = !settings["paper"];
		vars.pickaxe = !settings["pickaxe"];
		vars.frank = !settings["frank"];
		vars.doneburgers = !settings["doneburgers"];
		vars.carbide = !settings["carbide"];
		vars.box = !settings["box"];
		vars.tape = !settings["tape"];
		vars.spyglass = !settings["spyglass"];
		vars.tigereye = !settings["tigereye"];
		vars.peridot = !settings["peridot"];
		vars.tourmaline = !settings["tourmaline"];
		vars.citrine = !settings["citrine"];
		vars.amethyst = !settings["amethyst"];
		vars.zircon = !settings["zircon"];
		vars.slug12 = !settings["slug12"];
		vars.slug3 = !settings["slug3"];
		vars.slug6 = !settings["slug6"];
		vars.slug7 = !settings["slug7"];
		vars.slug8 = !settings["slug8"];
		vars.slug10 = !settings["slug10"];
		vars.tiledrawer = !settings["tiledrawer"];
		vars.thurston = !settings["thurston"];
		vars.jakepipes = !settings["jakepipes"];
		vars.quietpipes = !settings["quietpipes"];
		vars.camillepipes = !settings["camillepipes"];
		vars.eaglepipes = !settings["eaglepipes"];
		vars.lasers = !settings["lasers"];
		vars.bc = !settings["bc"];
		vars.bca = !settings["bca"];
		vars.cannon = !settings["cannon"];
		vars.boom = !settings["boom"];
		vars.abe = !settings["abe"];
		vars.bell = 0;
		return true;
	}
}

split
{
	//return current.vidname == "DIN_ToBar_D";
	string s = current.vidname;
	if (s != old.vidname) {
		switch (s) {
			case "LET_Close_A": // win
				return true;
			case "BRI_CanyonA": // arrive at Brimstone Canyon
				if (!vars.bca) { vars.bca = true; return true; }
				break;
			case "BRI_CannonFuse_PUZ": // start cannon RNG
				if (!vars.cannon) { vars.cannon = true; return true; }
				break;
			case "BRI_CannonFire_ANIM_": // boom
				if (!vars.boom) { vars.boom = true; return true; }
				break;
			case "CAB_CabCoinsCU": // get slugs 1 and 2
				if (!vars.slug12) { vars.slug12 = true; return true; }
				break;
			case "CAB_Lori_CAL": // find lori
				if (!vars.metlori) { vars.metlori = true; return true; }
				break;
			case "CAB_TourmalineCU": // find tourmaline
				if (!vars.tourmaline) { vars.tourmaline = true; return true; }
				break;
			case "CAM_CoinXCU": // get slug 7
				if (!vars.slug7) { vars.slug7 = true; return true; }
				break;
			case "CAM_DuctTapeXCU": // get duct tape
				if (!vars.tape) { vars.tape = true; return true; }
				break;
			case "CAM_GrmRprBox_PUZ": // start puzzle box
			  if (!vars.box) { vars.box = true; return true; }
				break;
			case "CAM_John_CAL": // meet john
				if (!vars.metjohn) { vars.metjohn = true; return true; }
				break;
			case "CAM_PianoOpenSpyglas": // get spyglass
				if (!vars.spyglass) { vars.spyglass = true; return true; }
				break;
			case "CAM_Pipes_PUZ": // open grate in Camille's car
				if (!vars.camillepipes) { vars.camillepipes = true; return true; }
				break;
			case "CRY_Citrine_CU": // get citrine
				if (!vars.citrine) { vars.citrine = true; return true; }
				break;
			case "CRY_Coin06_CU": // get 6 slug
				if (!vars.slug6) { vars.slug6 = true; return true; }
				break;
			case "CRY_Key_CU": // get crypt key
				if (!vars.cryptkey) { vars.cryptkey = true; return true; }
				break;
			case "DIN_Autograph_Anim_F": // Charleena signs her photo
				if (!vars.autograph) { vars.autograph = true; return true; }
				break;
			case "DIN_ChandelierZircon": // Get zircon
				if (!vars.zircon) { vars.zircon = true; return true; }
				break;
			case "DIN_Charleena_CAL": // meet Charleena
				if (!vars.metcharleena) { vars.metcharleena = true; return true; }
				break;
			case "DIN_Pipes_PUZ": // look at eagle pipes
				if (!vars.eaglepipes) { vars.eaglepipes = true; return true; }
				break;
			case "DIN_Hardy_CAL": // meet Hardy boys
				if (!vars.hardys) { vars.hardys = true; return true; }
				break;
			case "DIN_ThurstonLetterOp": // find Thurston letter in engine car stove
				if (!vars.thurston) { vars.thurston = true; return true; }
				break;
			case "JAK_CarbideOpn": // open up the carbide
				if (!vars.carbide) { vars.carbide = true; return true; }
				break;
			case "JAK_CougarAmethystCU": // get amethyst
				if (!vars.amethyst) { vars.amethyst = true; return true; }
				break;
			case "JAK_LeapingLiz_PUZ": // start leaping lizards
				if (!vars.llstart) { vars.llstart = true; return true; }
				break;
			case "JAK_Pipes_PUZ": // look at pipes puzzle in jake's car
				if (!vars.jakepipes) { vars.jakepipes = true; return true; }
				break;
			case "JAK_TigersEye": // get tiger's eye
				if (!vars.tigereye) { vars.tigereye = true; return true; }
				break;
			case "JAK_Tino_CAL": // meet Tino
				if (!vars.mettino) { vars.mettino = true; return true; }
				break;
			case "JAK_Tino_HandOff_Pen": // get pen from Tino
				if (!vars.pen) { vars.pen = true; return true; }
				break;
			case "JAK_Tino_HandOff_Tok": // get slug 3 from Tino
				if (!vars.slug3) { vars.slug3 = true; return true; }
				break;
			case "LET_Map01ANIM_FIRST": // copper gorge map cutscene
				if (!vars.cg) { vars.cg = true; return true; }
				break;
			case "LET_Map02ANIM_FIRST": // brimstone canyon map cutscene
				if (!vars.bc) { vars.bc = true; return true; }
				break;
			case "MIN_LincolnLetter01_": // find letter from lincoln
				if (!vars.abe) { vars.abe = true; return true; }
				break;
			case "MUS_ChestCoinCU": // get slug 10
				if (!vars.slug10) { vars.slug10 = true; return true; }
				break;
			case "MUS_Counter": // acquire pickaxe
				if (!vars.pickaxe) { vars.pickaxe = true; return true; }
				break;
			case "MUS_HorseRacingToken": // win horse betting game
				if (!vars.horses) { vars.horses = true; return true; }
				break;
			case "MUS_Miner_Bgd": // meet fatima
				if (!vars.metfatima) { vars.metfatima = true; return true; }
				break;
			case "MUS_PachinkoTokenCU": // win mountain climber pachinko
				if (!vars.pachinko) { vars.pachinko = true; return true; }
				break;
			case "MUS_VendingTaffyCU": // get taffy on a stick
				if (!vars.taffy) { vars.taffy = true; return true; }
				break;
			case "MUS_WaxPaperCU": // get wax paper
				if (!vars.paper) { vars.paper = true; return true; }
				break;
			case "PRO_GemMachine_FIRST": // activate laser show
				if (!vars.lasers) { vars.lasers = true; return true; }
				break;
			case "PRO_MapGetter_First": // solve map puzzle
				if (!vars.map) { vars.map = true; return true; }
				break;
			case "PRO_MpCoinXCU": // get slug 8
				if (!vars.slug8) { vars.slug8 = true; return true; }
				break;
			case "RES_CounterA": // ring the diner bell
				vars.bell += 1;
				if (!vars.doneburgers && vars.bell >= 5) { vars.doneburgers = true; return true; }
				break;
			case "RES_CounterA_PUZ": // switch to Frank
				if (!vars.frank) { vars.frank = true; return true; }
				break;
			case "SLE_BuelleNoteNight_": // Read Buell note from tile puzzle
				if (!vars.tiledrawer) { vars.tiledrawer = true; return true; }
				break;
			case "SLE_IbexHeadPeridot": // look at Ibex head with peridot eye
				if (!vars.peridot) { vars.peridot = true; return true; }
				break;
			case "SLE_Pipes_PUZ": // unlock quiet car pipe puzzle
				if (!vars.quietpipes) { vars.quietpipes = true; return true; }
				break;
		}
	}
}


// 1-1-1 "Joe: You better." 1:16.13
// 1-2-1 "Frank: Sounds good." 1:16.20, 1:16.10, 1:16.22
// 1-1-1 "Joe: You know where to find us." 1:16.45, 1:16.45
// 1-2-1 "Joe: You know where to find us." 1:16.40, 1:16.41, 1:16.53
// 1-1-1 "Frank: If you need anything, just let us know." 1:17.34
// 1-2-1 "Frank: If you need anything, just let us know." 1:17.26, 1:17.31, 1:17.26

// 1-2-1-2 "Anything for a fellow detective" 1:17.61
// 1-2-2-1 "Anything for a fellow detecitve" 1:16.94 (45 you heard wrong)

// 1 "you better" 37.48
// 1 "if you need anything just let us know" 38.74
// 2 "if you need anything just let us know" 38.93
