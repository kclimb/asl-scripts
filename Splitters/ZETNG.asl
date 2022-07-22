// Autosplitter for The Nonary Games:
//  - Nine Hours, Nine Persons, Nine Doors
//  - Virtue's Last Reward
//
// Written by Smileyz and toburr
// Joining the Zero Ronpa discord can point you toward a whole community of folks to answer questions :^)
// For technical questions about this program, feel free to DM toburr at twitch.tv/toburr or on discord for questions/feedback
//
// Currently only 999 is supported, but we plan to get around to VLR when we can.

state("ze1","ENG")
{
	// a bunch of memory addresses which may or may not be useful for autosplitting
	uint AllSkip : 0x183914; // Whether we have All Skip on in text segments
	uint Decision : 0x27AC00; // Whether we're currently in the text decision interface
	uint PuzzleIntro : 0x24B294; // Whether the intro cutscene of a room is playing

	uint all_escapes_start : 0x3BE06C; // Goes from 0 to 2 when you start a memory, back to 0 after
	uint aes_backup : 0x3BE05C; // ^ but 1090848000 -> 1090848001
	uint aes_alt : 0x3BE70C; // One time the value at all_escapes_start was here instead. idk why
	uint aes_3 : 0x3BD93C; // 0->1
	uint aes_4 : 0x3BD94C; // 0->2

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
	uint in_room : 0x19935C; // Gets set to 65536+ after puzzle intro finishes, goes to 0 when back on memories menu
	uint in_room_alt : 0x3B6188; // Gets set to 67233 after puzzle intro finishes, goes to 65536 when back on memories menu
}

state("ze1","JPN")
{
	uint AllSkip : 0x0;
	//uint Decision : 0x0;
	//uint PuzzleIntro : 0x0;

	uint all_escapes_start : 0xAA19AC;
	uint aes_alt : 0xAA19AC;
	uint aes_3 : 0xAA199C; // Unlike its English counterpart, this one is 4294901760 -> 4294901761
	uint aes_4 : 0xAA19AC;

	uint axeknife : 0x24A364;
	uint credits : 0x19943C;
	uint escape_state : 0x244DC8;
	uint exitdoor : 0x199220;

	uint gamestart : 0x26B668;

	uint foundit : 0x0;
	uint foundit2 : 0x0;
	uint in_room : 0x19935C;
}

state("ze2", "ENG")
{
	uint tufui : 0x5507F4; // changes to 15 at the Tu Fui, Ego Eres text denoting the end of any%/ACE; changes to 440 at disclaimer at game's beginning
	uint foundit : 0x5510A8; // changes to 2 during the cutscene at the start and end of an escape room
	uint charend : 0x57DB30; // changes to 990414985 when ending/game over text appears
}

state("ze2", "JPN")
{

}

isLoading
{
	if (vars.game == 0) {
		return current.credits == 0 && ((current.AllSkip == 2 && current.Decision == 1 && current.foundit2 != 1684078848) || (current.AllSkip == 0 && current.PuzzleIntro == 9));
	}
}

startup
{
	// Initialize printer for debug statements
	Action<string> DebugOutput = (text) => {
		print("[999 Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;
	vars.category = 0;

  // Autosplitter settings
	// Includes 999 categories and VLR categories
	settings.Add("ze1",true,"999 Settings");
	settings.Add("ze1Full",true,"Full Game (any run that achieves an ending)","ze1");
	settings.Add("ze1FullEscape",true,"Split on finishing an escape room","ze1Full");
	settings.Add("ze1AllEscapes", false, "All Escapes","ze1");
	settings.Add("ze2",true,"VLR Settings");
	settings.Add("ze2TuFui",true, "Split on \"Tu fui, ego eris\" in Phi's end","ze2");
	settings.Add("ze2Escape",true, "Split on finishing an escape room","ze2");
	// settings end

  vars.DebugOutput("Startup success");
}

init
{
	// Handy hash code stolen from CptBrian's RotN autosplitter
	byte[] exeMD5HashBytes = new byte[0];
    using (var md5 = System.Security.Cryptography.MD5.Create())
    {
        using (var s = File.Open(modules.First().FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
        {
            exeMD5HashBytes = md5.ComputeHash(s);
        }
    }
  var MD5Hash = exeMD5HashBytes.Select(x => x.ToString("X2")).Aggregate((a, b) => a + b).ToLower();

	switch (MD5Hash) {
		case "ededf843b7268d126b4e3b37e09d59bc": // JPN ze1.exe md5 hash
			version = "JPN";
			vars.game = 0;
			break;
		case "0118c6fd711622cc6be4396ba8ac1c8d": // ENG ze1.exe md5 hash
			version = "JPN";
			vars.game = 0;
			break;
		case "448496fd1e52805b802a5d1160f023fe": // ENG ze2.exe md5 hash
			version = "ENG";
			vars.game = 1;
			vars.cs = 0;
			break;
		default: // Any other hash. This should probably be some error state to disable autosplitting on an invalid game, but we're defaulting to VLR JP cause I'm lazy
			version = "JPN";
			vars.game = 1;
			vars.cs = 0;
			break;
	}
}

update
{
	if (vars.game == 0) {
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
		if (current.in_room != old.in_room) {
			vars.DebugOutput("In-room val: "+current.in_room);
		}
	} else if (vars.game == 1) {
		if (current.tufui == 15 && old.tufui != 15) {
			vars.DebugOutput("Tombstone bois");
		}
		if (current.tufui == 440 && old.tufui != 440) {
			vars.DebugOutput("Timer start");
		}
		if (current.foundit == 2 && old.foundit !=2) {
			vars.DebugOutput("Escape start/end");
		}
		if (current.charend == 990414985 && old.charend != current.charend) {
			vars.DebugOutput("Generic ending");
		}
	}
}

start // gamestart goes from something (usually 315-321ish) to 4 if we don't create a new game save, 5 if we do
{
	if (vars.game == 0) {
		vars.category = 0;
		vars.oproom = false;
		if (settings["ze1Full"] && (current.gamestart == 4 || current.gamestart == 5) && current.gamestart != old.gamestart && old.gamestart > 0) { // last condition prevents starting the timer at game boot
			//vars.numRoomsEscaped = 0;
			//vars.DebugOutput("gamestart: "+current.gamestart+"; "+old.gamestart);
			vars.category = 1;
			vars.numEndings = 0;
			return true;
		}

		if (settings["ze1AllEscapes"] && ((current.all_escapes_start - old.all_escapes_start == 2) || (current.aes_alt - old.aes_alt == 2) || (current.aes_3 - old.aes_3 == 1) || (current.aes_4 - old.aes_4 == 2))) {
			//vars.numRoomsEscaped = 0;
			vars.category = 2;
			return true;
		}
	} else if (vars.game == 1) {
	  if (current.tufui == 440 && current.tufui != old.tufui) {
			vars.cs = 0;
	    return true;
	  }
	}
}

split
{
	// -----------------
	// Fullgame 999 runs
	// -----------------
	if (vars.game == 0) {
		if (vars.category == 1 || (vars.category == 0 && settings["ze1Full"])) {
			// ----------------
			// Credits handling
			// ----------------
			// Instead of the end-specific values (preserved below in case I ever need them again), just check if the credits value is in the right ballpark
			if (current.credits > 8000000 && current.credits != old.credits) {
				vars.numEndings += 1;
				if (vars.numEndings < 5) return true;
			}
			// True end
		  //if (current.credits == 8198272 && current.credits != old.credits) {
			//	vars.numEndings += 1;
			//	vars.DebugOutput("numEndings is "+vars.numEndings);
			//	if (vars.numEndings < 5) return true;
			//}
			// Safe end
			//if (current.credits == 8108064 && current.credits != old.credits) {
			//	vars.numEndings += 1;
			//	vars.DebugOutput("numEndings is "+vars.numEndings);
			//	if (vars.numEndings < 5) return true;
			//}
			// Sub end
			//if (current.credits == 8142368 && current.credits != old.credits) {
			//	vars.numEndings += 1;
			//	vars.DebugOutput("numEndings is "+vars.numEndings);
			//	if (vars.numEndings < 5) return true;
			//}

			// Axe/Knife ending
			if ((current.axeknife == 842030960 && old.axeknife != current.axeknife) ) {
				vars.numEndings += 1;
				//vars.DebugOutput("At axe/knife end");
				//vars.DebugOutput("numEndings is "+vars.numEndings);
				if (vars.numEndings < 5) return true;
			}
			// If we've seen every ending, don't split til we do the last postgame save
			if (vars.numEndings > 4 && current.postgame_save == 1330511872 && current.postgame_save != old.postgame_save) {
				return true;
			}

			if (settings["ze1FullEscape"]) {
			  // ------------------------------
				// Special cases for escape rooms
				// ------------------------------
				// Operating Room
				if (current.operating_room == 1819042120 && current.escape_state == 1131741184 && !vars.oproom) {
					vars.oproom = true;
					//vars.numRoomsEscaped += 1;
					return true;
				}

				// ------------------------------------------------------
				// Most common escape room case: the You Found It! screen
				// ------------------------------------------------------
				if (current.foundit == 808530015 && current.foundit != old.foundit) {
					if (current.escape_state == 1131741184) {
						vars.oproom = true;
					}
					//vars.numRoomsEscaped += 1;
					return true;
				}
			}
		}

		// ----------------
		// All Escapes runs
		// ----------------
		if (vars.category == 2 || (vars.category == 0 && settings["ze1AllEscapes"])) {
			// Split once we're back on the menu
			if ((current.in_room != old.in_room && current.in_room == 0) || (current.in_room_alt != old.in_room_alt && current.in_room_alt == 65536)) {
				return true;
			}
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
		//--------------
		// VLR Splitting
		//--------------
	} else if (vars.game == 1) {
		//-----------------
		// Tu fui, ego eris
		//-----------------
		if (current.tufui == 15 && old.tufui != current.tufui) {
			return true;
		}

		//------------
		// Escape Room
		//------------
		if (current.foundit == 2 && current.foundit != old.foundit) {
			vars.cs += 1;
			if (vars.cs % 2 == 0) return true;
		}

		//------------------
		// Character Endings
		//------------------
		if (current.charend == 990414985 && current.charend != old.charend) {
			return true;
		}
	}
}
