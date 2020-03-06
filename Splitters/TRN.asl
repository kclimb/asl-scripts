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
	settings.Add("metcharleena",false,"Meet Charleena");
	settings.Add("hardys",false,"Meet Hardy Boys");
	settings.Add("metjohn",false,"Meet John");
	settings.Add("mettino",false,"Meet Tino");
	settings.Add("metlori",true,"Find Lori");
	// settings end
	vars.DebugOutput("Startup success");
}
start
{
	//return (current.vidname == "DIN_ToKitchen_A" || current.vidname == "DIN_Bar_Exit");
	//return current.vidname == "CAB_Lori_CAL";
	if (current.vidname == "LET_Open_A") {
		vars.metcharleena = !settings["metcharleena"];
		vars.hardys = !settings["hardys"];
		vars.metjohn = !settings["metjohn"];
		vars.mettino = !settings["mettino"];
		vars.metlori = !settings["metlori"];
		vars.metfatima = true;
		vars.cg = true;
		vars.horses = true;
		vars.pachinko = true;
		vars.taffy = true;
		vars.llstart = true;
		vars.pen = true;
		vars.autograph = true;
		vars.cryptkey = true;
		vars.paper = true;
		vars.pickaxe = true;
		vars.frank = true;
		vars.doneburgers = true;
		vars.box = true;
		vars.tape = true;
		vars.spyglass = true;
		vars.tigereye = true;
		vars.zircon = true;
		vars.amethyst = true;
		vars.citrine = true;
		vars.tourmaline = true;
		vars.peridot = true;
		vars.slug12 = true;
		vars.slug3 = true;
		vars.slug6 = true;
		vars.slug7 = true;
		vars.slug8 = true;
		vars.slug10 = true;
		vars.lasers = true;
		vars.bc = true;
		vars.bca = true;
		vars.cannon = true;
		vars.boom = true;
		vars.bell = 0;
		return true;
	}
}

split
{
	//return old.vidname == "CAB_Lori_CAL" && current.vidname != old.vidname;
	//return current.vidname == "CAM_DuctTapeXCU";
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
			case "CAB_Lori_CAL": // find lori
				if (!vars.metlori) { vars.metlori = true; return true; }
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
			case "JAK_CarbideOpn": // open up the carbide
				if (!vars.carbide) { vars.carbide = true; return true; }
				break;
			case "JAK_CougarAmethystCU": // get amethyst
				if (!vars.amethyst) { vars.amethyst = true; return true; }
				break;
			case "JAK_LeapingLiz_PUZ": // start leaping lizards
				if (!vars.llstart) { vars.llstart = true; return true; }
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
			case "Pro_GemMachine_FIRST": // activate laser show
				if (!vars.lasers) { vars.lasers = true; return true; }
				break;
			case "RES_CounterA": // ring the diner bell
				vars.bell += 1;
				if (!vars.doneburgers && vars.bell >= 5) { vars.doneburgers = true; return true; }
				break;
			case "RES_CounterA_PUZ": // switch to Frank
				if (!vars.frank) { vars.frank = true; return true; }
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
