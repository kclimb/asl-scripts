// Autosplitter for The Nonary Games:
//  - Nine Hours, Nine Persons, Nine Doors
//  - Virtue's Last Reward
//
// Written by Smileyz and toburr
// Feel free to DM toburr at twitch.tv/toburr or on discord for questions/feedback
// Joining the Zero Ronpa discord can point you toward a whole community of folks to answer questions :^)
//
// Currently only 999 is supported, but we plan to get around to other VLR when we can.

state("ze1")
{
	// a bunch of memory addresses which may or may not be useful for autosplitting
	uint AllSkip : 0x183914; // Whether we have All Skip on in text segments
	uint Decision : 0x27AC00; // Whether we're currently in the text decision interface
	uint PuzzleIntro : 0x24B294; // Whether the intro cutscene of a room is playing

	uint all_escapes_start : 0x3BE06C; // Goes from 0 to 2 when you start a memory, back to 0 after
	uint aes_backup : 0x3BE05C; // ^ but 1090848000 -> 1090848001
	uint aes_alt : 0x3BE70C; // One time the value at all_escapes_start was here instead. idk why

	uint axeknife : 0x24A364; // 24 for axe and knife endings
	uint credits : 0x19943C; // Credits tracker. Is non-zero while credits are happening
  uint escape_state : 0x244DC8; // IDK what this does but it seems to reuse values very rarely, which is useful
	uint exitdoor : 0x199220; // Seems to always be 4220284815 whenever you A) finish a room (good!) or B) briefly when you move towards the escape room door (not good!). So a necessary but not sufficient condition.
	uint foundit : 0x2448D0; // UPDATE: this var might go x -> 808530015 (x=1769497951 for casino, lab, engine, and cargo; x=811562089 for 3rd class cabin and 2nd class cabin) for every escape? (original comment: 1970631775 -> 1769497951 when exiting engine room (addresses 0x2448D4 and 0x2448D8 look usable too))
	uint foundit2 : 0x273EB4; // Value that changes during the entirety of you found it screens (1684078848 -> 1684078849), needed to unpause during oproom you found it

	uint gamestart : 0x26B668; // Goes to 5 (create save) or 4 (don't create save) when starting new game. Can ALSO do this when you delete save data from the main menu but just don't do that pls thnx :^)
	uint operating_room : 0x188F7C; // Value that changes after finishing the dialog post operating room escape
	uint postgame_save : 0x24A6A8; // 1330511872 after saving your game
	uint postgame_save_backup : 0x24A6E8; // 1917845504 after saving your game

	uint linecounterquestionmark : 0x18AF54; // It looks like it counts which line of dialog you're on in a given batch of them. Resets at unintuitive moments though
}

isLoading
{
	return current.credits == 0 && ((current.AllSkip == 2 && current.Decision == 1 && current.foundit2 != 1684078848) || (current.AllSkip == 0 && current.PuzzleIntro == 9));
}

startup
{
	// Initialize printer for debug statements
	Action<string> DebugOutput = (text) => {
		print("[999 Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;

  // Autosplitter settings
	// Includes 999 categories and VLR categories
	settings.Add("ze1Full",true,"999 Any%/All Endings");
	settings.Add("ze1AllEscapes", false, "999 All Escapes");
  // settings end

  vars.DebugOutput("Startup success");
}

update
{
	if (current.credits != old.credits) {
		vars.DebugOutput("Current credits value: "+current.credits);
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
	if (current.axeknife == 842030960 && current.axeknife != old.axeknife) {
		vars.DebugOutput("Knifed!!!");
	}
	if (settings["ze1AllEscapes"] && current.all_escapes_start != old.all_escapes_start) {
		vars.DebugOutput("All Escapes start value: "+current.all_escapes_start);
	}
}

start // gamestart goes from something (usually 315-321ish) to 4 if we don't create a new game save, 5 if we do
{
	if (settings["ze1Full"] && (current.gamestart == 4 || current.gamestart == 5) && current.gamestart != old.gamestart) {
		vars.oproom = false;
		vars.numRoomsEscaped = 0;
		vars.category = 1;
		vars.numEndings = 0;
		return true;
	}

	if (settings["ze1AllEscapes"] && ((current.all_escapes_start == 2 && old.all_escapes_start == 0) || (current.aes_alt == 2 && old.aes_alt == 0))) {
		vars.oproom = false;
		vars.numRoomsEscaped = 0;
		vars.numEndings = 0;
		vars.category = 2;
		return true;
	}
}

split
{
	// ----------------
	// Credits handling
	// ----------------

	// True end
  if (current.credits == 8198272 && current.credits != old.credits) {
		vars.numEndings += 1;
		if (vars.numEndings < 5) return true;
	}
	// Safe end
	if (current.credits == 8108064 && current.credits != old.credits) {
		vars.numEndings += 1;
		if (vars.numEndings < 5) return true;
	}
	// Sub end
	if (current.credits == 8142368 && current.credits != old.credits) {
		vars.numEndings += 1;
		if (vars.numEndings < 5) return true;
	}
	// Axe/Knife ending
	if ((current.axeknife == 842030960 && old.axeknife != current.axeknife) ) {
		vars.numEndings += 1;
		vars.DebugOutput("At axe/knife end");
		if (vars.numEndings < 5) return true;
	}
	// If we've seen every ending, don't split til we do the last postgame save
	if (vars.numEndings > 4 && current.postgame_save == 1330511872 && current.postgame_save != old.postgame_save) {
		return true;
	}

  // ------------------------------
	// Special cases for escape rooms
	// ------------------------------

	// Operating Room
	if (current.operating_room == 1819042120 && current.escape_state == 1131741184 && !vars.oproom) {
		vars.oproom = true;
		vars.numRoomsEscaped += 1;
		if (vars.category == 1 || vars.numRoomsEscaped < 16) {
			return true;
		}
	}

	// --------------------------------
	// Most common escape room case
	// --------------------------------
	if (current.foundit == 808530015 && current.foundit != old.foundit) {
		if (current.escape_state == 1131741184) {
			vars.oproom = true;
		}
		vars.numRoomsEscaped += 1;
		if (vars.category == 1 || vars.numRoomsEscaped < 16) {
			return true;
		}
	}

	// If we're doing an all escapes run and we just did the last escape, don't split til we're back on the menu
	if (vars.category == 2 && vars.numRoomsEscaped >= 16 && current.all_escapes_start == 0 && current.all_escapes_start != old.all_escapes_start) {
		return true;
	}

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
