// Curse of Blackmoor Manor Autosplitter
// Written by toburr
// DM me at twitch.tv/toburr or on discord for questions/feedback

state("Game", "Steam")
{
  // Start/End of run
  uint start : 0x18A944;
	uint end : 0x18ADF4;

  // RNG address. Not used for autosplitting but a useful address to document
  uint rng : 0x167764, 0x34;

  // Item Pickups
  uint corbinCoat : 0x183BDC; // Item 2
  uint cricketBall : 0x183BE0; // Item 3
  uint glowstick : 0x183BE4; // Item 4
  uint deadGlowstick : 0x183BE8; // Item 5
  uint jupiter : 0x183BEC; // Item 6
  uint dragonKey : 0x183BF0; // Item 7
  uint mars : 0x183BF4; // Item 8
  uint mercury : 0x183BF8; // Item 9
  uint moon : 0x183C00; // Item 11
  uint lens : 0x183C04; // Item 12
  uint glowstone : 0x183C08; // Item 13. Use deadGlowstick for splitting on getting the stone!
  uint saturn : 0x183C14; // Item 16
  uint badcadee : 0x183C18; // Item 17
  uint venus : 0x183C20; // Item 19
  uint crank : 0x183C24; // Item 20
  uint butter : 0x183C38; // Item 25

  // Events
  uint jigsawStart : 0x186C78; // Event 310
  uint startBul : 0x186CE4; // Event 337
  uint petroStart : 0x186E00; // Event 408
  uint magicWord : 0x186EEC; // Event 467
  uint meetEthel : 0x187068; // Event 562
  uint bettyStart : 0x1873D4; // Event 781
  uint seeFireLock : 0x187440; // Event 808
  uint sawCorbinPortrait : 0x18751C; // Event 863
  uint ouroboros : 0x187608; // Event 922
  uint ritual : 0x187660; // Event 944
  uint ghostsEnd : 0x187698; // Event 958
  uint windsEnd : 0x18769C; // Event 959
  uint alchemy : 0x1876A0; // Event 960
  uint nigelYelp : 0x1876B4; // Event 965
  uint litForge : 0x1876D4; // Event 973
  uint jigsawEnd : 0x1876F0; // Event 980
  uint pipes : 0x18773C; // Event 999
  uint seedEnd : 0x187748; // Event 1002
  uint elinor : 0x18774C; // Event 1003
  uint waterLock : 0x187784; // Event 1017
  uint wordWall : 0x187788; // Event 1018
  uint windsStart : 0x187810; // Event 1052
  uint ineedakey : 0x187828; // Event 1058
  uint ghostsStart : 0x18783C; // Event 1063
  uint frogStart : 0x187840; // Event 1064
  uint seedStart : 0x187880; // Event 1080
}

state("Game", "Disc")
{
  // Start/End of run
  uint start : 0x189994;
  uint end : 0x189E44;

  // Item Pickups
  uint corbinCoat : 0x182C2C; // Item 2
  uint cricketBall : 0x182C30; // Item 3
  uint glowstick : 0x182C34; // Item 4
  uint deadGlowstick : 0x182C38; // Item 5
  uint jupiter : 0x182C3C; // Item 6
  uint dragonKey : 0x182C40; // Item 7
  uint mars : 0x182C44; // Item 8
  uint mercury : 0x182C48; // Item 9
  uint moon : 0x182C50; // Item 11
  uint lens : 0x182C54; // Item 12
  uint glowstone : 0x182C58; // Item 13. Use deadGlowstick for splitting on getting the stone!
  uint saturn : 0x182C64; // Item 16
  uint badcadee : 0x182C68; // Item 17
  uint venus : 0x182C70; // Item 19
  uint crank : 0x182C74; // Item 20
  uint butter : 0x182C88; // Item 25

  // Events
  uint jigsawStart : 0x185CC8; // Event 310
  uint startBul : 0x185D34; // Event 337
  uint petroStart : 0x185E50; // Event 408
  uint magicWord : 0x185F3C; // Event 467
  uint meetEthel : 0x1860B8; // Event 562
  uint bettyStart : 0x186424; // Event 781
  uint seeFireLock : 0x186490; // Event 808
  uint sawCorbinPortrait : 0x18656C; // Event 863
  uint ouroboros : 0x186658; // Event 922
  uint ritual : 0x1866B0; // Event 944
  uint ghostsEnd : 0x1866E8; // Event 958
  uint windsEnd : 0x1866EC; // Event 959
  uint alchemy : 0x1866F0; // Event 960
  uint nigelYelp : 0x186704; // Event 965
  uint litForge : 0x186724; // Event 973
  uint jigsawEnd : 0x186740; // Event 980
  uint pipes : 0x18678C; // Event 999
  uint seedEnd : 0x186798; // Event 1002
  uint elinor : 0x18679C; // Event 1003
  uint waterLock : 0x1867D4; // Event 1017
  uint wordWall : 0x1867D8; // Event 1018
  uint windsStart : 0x186860; // Event 1052
  uint ineedakey : 0x186878; // Event 1058
  uint ghostsStart : 0x18688C; // Event 1063
  uint frogStart : 0x186890; // Event 1064
  uint seedStart : 0x1868D0; // Event 1080
}

startup
{
	// Initialize printer for debug statements
	Action<string> DebugOutput = (text) => {
		print("[CUR Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;

  // Instantiate list of used flags.
  vars.flagList = new LinkedList<string>();

	// Autosplitter settings
  settings.Add("ghostsStart",false,"Start Ghost Hunt");
  settings.Add("butter",true,"Get Butter");
  settings.Add("lens",false,"Get Telescope Lens");
  settings.Add("meetEthel",false,"Meet Ethel");
  settings.Add("startBul",true,"Start Bul");
  settings.Add("dragonKey",true,"Get East Hall Key");
  settings.Add("jigsawEnd",false,"Finish Jigsaw Puzzle");
  settings.Add("moon",false,"Get Moon Key");
  settings.Add("petroStart",false,"Start Petroglyph Punch");
  settings.Add("glowstick",true,"Get Glowstick");
  settings.Add("jupiter",true,"Get Jupiter Key (Lightning)");
  settings.Add("seedStart",false,"Start Seedling Puzzle");
  settings.Add("seedEnd",true,"Finish Seedling Puzzle");
  settings.Add("magicWord",false,"Ask Loulou About \"Barber\"");
  settings.Add("ritual",true,"See Ritual");
  settings.Add("elinor",false,"Solve Rune Puzzle");
  settings.Add("nigelYelp",false,"Solve Mercury's Hands");
  settings.Add("seeFireLock",false,"Inspect Triangle Door Puzzle");
  settings.Add("wordWall",false,"Solve Magic Word Puzzle");
  settings.Add("deadGlowstick",true,"Get Glowing Stone");
  settings.Add("waterLock",false,"Solve Well Puzzle");
  settings.Add("ouroboros",false,"See Ouroboros");
  settings.Add("cricketBall",false,"Get Cricket Ball");
  settings.Add("mercury",true,"Get Mercury Key (Wand)");
  settings.Add("frogStart",false,"Start Frog Puzzle");
  settings.Add("mars",true,"Get Mars Key (Helmet)");
  settings.Add("crank",false,"Get Betty's Crank");
  settings.Add("bettyStart",true,"Make Betty Wager Venus Key");
  settings.Add("venus",true,"Get Venus Key (Arrowhead)");
  settings.Add("alchemy",false,"Enter Forge");
  settings.Add("windsStart",true,"Start Wind Puzzle");
  settings.Add("windsEnd",true,"Finish Wind Puzzle");
  settings.Add("saturn",true,"Get Saturn Key (Clock)");
  settings.Add("pipes",false,"Align Pipes in Columns");
  settings.Add("litForge",false,"Light the Forge");
	// settings end

	vars.DebugOutput("Startup success");
}

// Comment out this function when not debugging
init
{
  if (modules.First().ModuleMemorySize == 2736128) {
    version = "Steam";
  } else { // if (modules.First().ModuleMemorySize == 2379776)
    version = "Disc";
  }

	vars.DebugOutput("Initialized");
  vars.done = false;
}

start
{
	if (old.start == 0 && current.start != old.start && current.ineedakey == 0) {

		// Initialize flag list before starting
    vars.flagList.Clear();
    if (settings["ghostsStart"]) vars.flagList.AddLast("ghostsStart");
    if (settings["butter"]) vars.flagList.AddLast("butter");
    if (settings["lens"]) vars.flagList.AddLast("lens");
    if (settings["meetEthel"]) vars.flagList.AddLast("meetEthel");
    if (settings["startBul"]) vars.flagList.AddLast("startBul");
    if (settings["dragonKey"]) vars.flagList.AddLast("dragonKey");
    if (settings["jigsawEnd"]) vars.flagList.AddLast("jigsawEnd");
    if (settings["moon"]) vars.flagList.AddLast("moon");
    if (settings["petroStart"]) vars.flagList.AddLast("petroStart");
    if (settings["glowstick"]) vars.flagList.AddLast("glowstick");
    if (settings["jupiter"]) vars.flagList.AddLast("jupiter");
    if (settings["seedStart"]) vars.flagList.AddLast("seedStart");
    if (settings["seedEnd"]) vars.flagList.AddLast("seedEnd");
    if (settings["magicWord"]) vars.flagList.AddLast("magicWord");
    if (settings["ritual"]) vars.flagList.AddLast("ritual");
    if (settings["elinor"]) vars.flagList.AddLast("elinor");
    if (settings["nigelYelp"]) vars.flagList.AddLast("nigelYelp");
    if (settings["seeFireLock"]) vars.flagList.AddLast("seeFireLock");
    if (settings["wordWall"]) vars.flagList.AddLast("wordWall");
    if (settings["deadGlowstick"]) vars.flagList.AddLast("deadGlowstick");
    if (settings["waterLock"]) vars.flagList.AddLast("waterLock");
    if (settings["ouroboros"]) vars.flagList.AddLast("ouroboros");
    if (settings["cricketBall"]) vars.flagList.AddLast("cricketBall");
    if (settings["mercury"]) vars.flagList.AddLast("mercury");
    if (settings["frogStart"]) vars.flagList.AddLast("frogStart");
    if (settings["mars"]) vars.flagList.AddLast("mars");
    if (settings["crank"]) vars.flagList.AddLast("crank");
    if (settings["bettyStart"]) vars.flagList.AddLast("bettyStart");
    if (settings["venus"]) vars.flagList.AddLast("venus");
    if (settings["alchemy"]) vars.flagList.AddLast("alchemy");
    if (settings["windsStart"]) vars.flagList.AddLast("windsStart");
    if (settings["windsEnd"]) vars.flagList.AddLast("windsEnd");
    if (settings["saturn"]) vars.flagList.AddLast("saturn");
    if (settings["pipes"]) vars.flagList.AddLast("pipes");
    if (settings["litForge"]) vars.flagList.AddLast("litForge");
    vars.flagList.AddLast("end");

		vars.DebugOutput("Timer started.");
    vars.DebugOutput("flagList size: "+vars.flagList.Count);
		return true;
	}
}

split
{
  foreach (string flag in vars.flagList) {
    if ((uint)(((IDictionary<string,object>)current)[flag]) == 256) {
      vars.flagList.Remove(flag);
      vars.DebugOutput("splitting: "+flag);
      return true;
    }
  }
}

//reset
//{
//	if (current.start != old.start && current.start == 0) {
//		vars.DebugOutput("Timer reset.");
//		return true;
//	}
//}
