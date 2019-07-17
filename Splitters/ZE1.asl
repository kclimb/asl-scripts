// Autosplitter for The Nonary Games:
//  - Nine Hours, Nine Persons, Nine Doors
//  - Virtue's Last Reward
//
// Written by toburr
// DM me at twitch.tv/toburr or on discord for questions/feedback
//
// Currently only 999 any% is supported, but I plan to get around to other categories and VLR if I can.

state("ze1")
{
	// a bunch of memory addresses which may or may not be useful for autosplitting
	uint credits : 0x245B98; // FPS-tracker-looking thing??
  uint exitdoor : 0x199220; // Seems to always be 4220284815 whenever you A) finish a room (good!) or B) briefly when you move towards the escape room door (not good!). So a necessary but not sufficient condition.
  uint escape_state : 0x244DC8; // IDK what this does but it seems to reuse values very rarely, which is useful
  //uint gamestart : 0x188F74;
  //uint gamestart : 0x18B2F4; // Gets set to 4903937
  uint gamestart : 0x18B52C; // Goes from 16777472-> 16777216
	uint foundit : 0x2448D0; // UPDATE: this var might go x -> 808530015 (x=1769497951 for casino, lab, engine, and cargo; x=811562089 for 3rd class cabin and 2nd class cabin) for every escape? (original comment: 1970631775 -> 1769497951 when exiting engine room (addresses 0x2448D4 and 0x2448D8 look usable too))
}

startup
{
	// Initialize printer for debug statements
	Action<string> DebugOutput = (text) => {
		print("[999 Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;
	vars.safe = false;

  // Autosplitter settings
  // settings end

  vars.DebugOutput("Startup success");
}

update
{
  if (current.credits != old.credits) {
		if (current.credits > 60) {
    	vars.DebugOutput("Current fps ish: "+current.credits);
		}
    if (current.credits == 210) {
      vars.DebugOutput("REACHED CREDITS SCENE");
    }
  }
  if (current.exitdoor != old.exitdoor) {
    vars.DebugOutput("Current exitdoor: "+current.exitdoor);
    if (current.exitdoor == 4220284815) {
      vars.DebugOutput("At the Exit Door");
    }
  }
  if (current.escape_state != old.escape_state) {
    vars.DebugOutput("Current escape_state: "+current.escape_state);
  }
  if (current.gamestart != old.gamestart) {
    vars.DebugOutput("Current gamestart: "+current.gamestart);
    if (old.gamestart == 23 && current.gamestart == 1) {
      vars.DebugOutput("Start timer trigger");
    }
  }
	if (current.foundit == 808530015 && current.foundit != old.foundit) {
		vars.DebugOutput("You found it! From "+old.foundit);
	}
}

start // Goes from 16777472-> 16777216
{
  if (current.gamestart == 16777216 && old.gamestart == 16777472) {
		vars.safe = false;
		return true;
	}
}

split
{
  if (current.credits == 210) {return true;}
	if (current.credits == 180 && !vars.safe) {
		vars.safe = true;
		return true;
	}
	return current.foundit == 808530015 && current.foundit != old.foundit;

	// Old code I'm keeping in case the above doesn't end up working
	//uint s = current.escape_state;
	//switch (s) {
  //  case 1130692608:
  //    if (current.escape_state != old.escape_state && current.exitdoor == 4220284815) {
  //      vars.DebugOutput("3rd class cabin escape");
  //    }
  //    break;
  //  case 1134723072:
  //    if (current.escape_state != old.escape_state && current.exitdoor == 4220284815) {
  //      vars.DebugOutput("1st class cabin escape");
  //    }
  //    break;
  //  case 1125449728:
  //    if (current.escape_state != old.escape_state && current.exitdoor == 4220284815) {
  //      vars.DebugOutput("Casino escape");
  //    }
  //    break;
  //  case 1128595456:
  //    if (current.escape_state != old.escape_state && current.exitdoor == 4220284815) {
  //      vars.DebugOutput("Laboratory escape");
  //    }
  //    break;
	//	case 1143029760: // Engine room's a little weird in that we don't exit this room by clicking on the door, so we get hacky
	//		if (current.exitdoor == 3449289875) {
	//			if (current.exitdoor != old.exitdoor || current.escape_state != old.escape_state) {
	//				vars.DebugOutput("Engine room door/state combo");
	//			}
	//			if (current.foundit == 1769497951 && current.foundit != old.foundit) {
	//				vars.DebugOutput ("Engine Room escape");
	//			}
	//		}
	//		break;
  //}
}
