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
	uint credits2 : 0x19943C; // Another credits tracker
  uint exitdoor : 0x199220; // Seems to always be 4220284815 whenever you A) finish a room (good!) or B) briefly when you move towards the escape room door (not good!). So a necessary but not sufficient condition.
  uint escape_state : 0x244DC8; // IDK what this does but it seems to reuse values very rarely, which is useful
  //uint gamestart : 0x188F74;
  //uint gamestart : 0x18B2F4; // Gets set to 4903937
  //uint gamestart : 0x18B52C; // Goes from 16777472-> 16777216
	uint gamestart : 0x26B668; // Goes to 5 (create save) or 4 (don't create save) when starting new game. Can ALSO do this when you delete save data from the main menu but just don't do that pls thnx :^)
	uint foundit : 0x2448D0; // UPDATE: this var might go x -> 808530015 (x=1769497951 for casino, lab, engine, and cargo; x=811562089 for 3rd class cabin and 2nd class cabin) for every escape? (original comment: 1970631775 -> 1769497951 when exiting engine room (addresses 0x2448D4 and 0x2448D8 look usable too))
	uint linecounterquestionmark : 0x18AF54; // It looks like it counts which line of dialog you're on in a given batch of them. Resets at unintuitive moments though
	uint operating_room : 0x188F7C; // Value that changes after finishing the dialog post operating room escape
	uint all_escapes_start : 0x3BE06C; // Goes from 0 to 2 when you start a memory, back to 0 after
	uint all_escapes_start_backup : 0x3BE05C; // ^ but 1090848000 -> 1090848001
}

startup
{
	// Initialize printer for debug statements
	Action<string> DebugOutput = (text) => {
		print("[999 Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;
	vars.oproom = false;

  // Autosplitter settings
	// TODO: come up with setting structure
	// Checkbox for category (just set the value based on the first checked box)
	// Includes 999 categories and VLR categories
	settings.Add("ze1Full",true,"999 Any%/All Endings");
	settings.Add("ze1AllEscapes", false, "999 All Escapes");

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
	if (current.foundit != old.foundit) {
		if (current.foundit == 808530015) {
			vars.DebugOutput("You found it! From "+old.foundit);
		}
		vars.DebugOutput("Current foundit: "+current.foundit);
	}
}

start // Goes from something (usually 315-321ish) to 4 if we don't create a new game save, 5 if we do
{
  if (settings["ze1Full"] && (current.gamestart == 4 || current.gamestart == 5) && current.gamestart != old.gamestart) {
		vars.oproom = false;
		return true;
	}

	if (settings["ze1AllEscapes"] && current.all_escapes_start == 2 && current.all_escapes_start != old.all_escapes_start) {
		vars.oproom = false;
		return true;
	}
}

split
{
	// ----------------
	// Credits handling
	// ----------------

	// True end
  if (current.credits2 == 8198272 && current.credits2 != old.credits2) {
		return true;
	}
	// Safe end
	if (current.credits2 == 8108064 && current.credits2 != old.credits2) {
		return true;
	}
	// Sub end
	if (current.credits2 == 8142368 && current.credits2 != old.credits2) {
		return true;
	}
	// Axe/Knife ending
	if (old.credits == 120 && current.credits < 120) {
		return true;
	}

  // ------------------------------
	// Special cases for escape rooms
	// ------------------------------

	// Operating Room
	if (current.operating_room == 1819042120 && current.escape_state == 1131741184 && !vars.oproom) {
		vars.oproom = true;
		return true;
	}

	// Otherwise, split if We Found It!
	return current.foundit == 808530015 && current.foundit != old.foundit;

	// For Operating Room: split when current.escape_state == 1131741184?
	// PLUS: 0x188F7C goes from 1919250511 -> 1819042120

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
