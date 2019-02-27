// Treasure in the Royal Tower Autosplitter
// Written by toburr
// DM me at twitch.tv/toburr or on discord for questions/feedback

state("Game")
{
	uint sceneval : 0x46848, 0x4;
}

startup
{
	// Initialize printer for debug statements
	Action<string> DebugOutput = (text) => {
		print("[SSH Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;

	// Autosplitter settings

	// settings end

	vars.DebugOutput("Startup success");
}

// Comment out this function/update function when not debugging
init
{
	vars.DebugOutput("Initialized");
}

update
{
	if (current.sceneval != old.sceneval) {
		vars.DebugOutput("Scene change: "+current.sceneval);
	}
}

start
{
	if (current.sceneval == 187644) {
		// Initialize split flags before starting

		vars.DebugOutput("Timer started.");
		return true;
	}
}

split
{
	uint s = current.sceneval;
	switch (s) {

	}
}

reset
{
	if (current.sceneval == 175955) {
		vars.DebugOutput("Timer reset.");
		return true;
	}
}
