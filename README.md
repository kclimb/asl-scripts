# asl-scripts
Automatic Timer Management Scripts, by toburr

# Current Splitters
These are the Autosplitters currently available in this repo.

Direct all feedback to twitch.tv/toburr or find me on discord

## Zero Escape: The Nonary Games
Co-written with Smileyz

Last Status Update 8/7/2019:  
Not yet available in LiveSplit.

Currently supports autosplitting for 999 Any%, 999 All Endings, and 999 All Escapes, as well as Load Removal for all 999 categories. Support for VLR categories will be added eventually.

Known Issues:
- 999 All Escapes runs currently don't seem to do the final split at all. Cause: the address we currently use to track transitions between the Memories menu and the escape rooms seems to get frozen while doing the Library, and never fixes itself until the game is rebooted. This will likely necessitate an overhaul of how we do All Escapes
- In 999 All Escapes runs, frame-perfectly skipping the You Found It cutscene will prevent the autosplitter from detecting that the room has been completed, resulting in not splitting on that room, and subsequently not splitting at the right time at the end of the run. As mentioned with the former issue, we're reworking All Escapes anyway and will need to fix both these issues together. Full-game runs are not affected by this because the You Found It cutscene is unskippable when solving a room for the first time.
- Deleting a save file from the "Delete save data" option on the main menu of 999 will prevent the timer from automatically starting for 999 full-game runs. To resolve this, load any save file, then go back to the main menu (or just reboot the game). The game has not been friendly to us in our attempts to properly fix this issue, so we hope that these simple workarounds suffice.
- It has been reported that the autosplitter will not split sometimes after the Library or the Torture Room in 999 full game runs. We have attempted to replicate this issue but have not been able to do so successfully.

## Stay Tuned for Danger

Last Status Update 4/8/2019:  
Available in LiveSplit.

Any% and No-Save routes are fully tested, Glitchless isn't, but it's probably fine if No-Save is.

Issues have been reported with the Rick's tape split not working on Master difficulty. Haven't managed to replicate it though, so just be warned.

## Message in a Haunted Mansion

Last Status Update 4/9/2019:  
Available in LiveSplit.

Planned development complete. Message me or write an issue about bugs/requests.

## Treasure in the Royal Tower

Last Status Update 4/25/2019:  
Not available in LiveSplit.

Development in progress, nothing usable at this time.

## The Final Scene

Last Status Update 4/25/2019:  
Not available in LiveSplit.

Development in progress, nothing usable at this time.

## Secret of the Scarlet Hand

Last Status Update 2/26/2019:  
Available in LiveSplit.

Development complete. Message me or write an issue about bugs/requests.

## Secret of Shadow Ranch

Last Status Update 8/2/2019:  
Available in LiveSplit.  

Development complete. Message me or write an issue about bugs/requests.  

## Curse of Blackmoor Manor

Last Status Update 2/26/2019:  
Available in LiveSplit.

Development complete. Message me or write an issue about bugs/requests.

# Planned Splitters
These are the autosplitters I plan to make but have not worked on yet:

Zero Escape: Zero Time Dilemma  
~~Secrets Can Kill (original)~~ evilclownattack has you covered here: https://github.com/evilclownattack/autosplitters/blob/master/SCK.asl  
Ghost Dogs of Moon Lake  
The Haunted Carousel  
Danger on Deception Island  
Secret of the Old Clock  
Last Train to Blue Moon Canyon  
Danger by Design  
Creature of Kapu Cave  
~~White Wolf of Icicle Creek~~ evilclownattack has one for this too: https://github.com/evilclownattack/autosplitters/blob/master/ICE.asl
