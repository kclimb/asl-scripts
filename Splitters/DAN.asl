// Danger by Design Autosplitter
// Written by toburr
// DM me at twitch.tv/toburr or on discord for questions/feedback

state("Game")
{
	uint sceneval : 0x1A25A8;
}

update
{
  if (current.sceneval != old.sceneval) {
    vars.DebugOutput("Sceneval changed: "+current.sceneval);
  }
}

startup
{
	//Initialize printer for debug statements
	Action<string> DebugOutput = (text) => {
		print("[DAN Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;

	// Autosplitter settings
	settings.Add("pipesstart",false,"Begin Katie's sink puzzle");
	// settings end

	vars.DebugOutput("Startup success");
}

start
{
	return current.sceneval == 1437;
	//return current.sceneval == 1881 || current.sceneval == 1004;
	if (current.sceneval == 6456) {
		vars.pipesstart = !settings["pipesstart"];
		return true;
	}
}

split
{
	return current.sceneval == 4718;
	//return current.sceneval == 1031 || current.sceneval == 1011;
	uint s = current.sceneval;
	switch (s) {
		case 5920: // End
			return true;
		case 6519: // start pipes
			if (!vars.pipesstart) { vars.pipesstart = true; return true; }
			break;
	}
}
