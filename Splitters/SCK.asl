// Secrets Can Kill Autosplitter
// Written by toburr
// DM me at twitch.tv/toburr or on discord for questions/feedback

state("Game")
{
	uint sceneval : 0xD2114;
}

update
{

}

startup
{
	// Initialize printer for debug statements
	Action<string> DebugOutput = (text) => {
		print("[SCK Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;

	// Autosplitter settings
	settings.Add("halTape",false,"See Hal on the Blackmail Tape");
	settings.Add("accuseConnie",false,"Connie says \"I didn't kill Jake\"");
	settings.Add("darrylMitch",false,"Darryl agrees to help you get Mitch");
	settings.Add("connieMitch",false,"Connie says she won't help get Mitch");
	// settings end

	vars.DebugOutput("Startup success");
}

start
{
	if (current.sceneval == 60) {
		vars.halTape = !settings["halTape"];
		vars.accuseConnie = !settings["accuseConnie"];
		vars.darrylMitch = !settings["darrylMitch"];
		vars.connieMitch = !settings["connieMitch"];
		return true;
	}
}

split
{
  uint s = current.sceneval;
  switch (s) {
		case 2070: // End Letter
			return true;
		case 243: // I *clap* Didn't *clap* Kill *clap* Jake
			if (!vars.accuseConnie) {vars.accuseConnie = true; return true;}
			break;
		case 250: // Connie refuses to get Mitch
			if (!vars.connieMitch) {vars.connieMitch = true; return true;}
			break;
    case 653: // Hal on Tape
			if (!vars.halTape) {vars.halTape = true; return true;}
      break;
		case 3216: // Darryl agrees to help catch Mitch
			if (!vars.darrylMitch) {vars.darrylMitch = true; return true;}
			break;
  }
}
