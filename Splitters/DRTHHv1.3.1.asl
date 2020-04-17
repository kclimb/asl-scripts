state("DR1_us")
{
	bool isLoading : "DR1_us.exe", 0x34051C;
	uint textSection : "DR1_us.exe", 0x2879EC;
	uint trialMiddle : "DR1_us.exe", 0x2A5D10;
	uint trialNumber : "DR1_us.exe", 0x28D844;
	uint inMenu : "DR1_us.exe", 0x297B44;
	uint inMenu2 : "DR1_us.exe", 0x297B40;
	uint closingText : "DR1_us.exe", 0x340500;
}


isLoading
{
	if (((current.textSection == 0) && (old.textSection != 1)) && ((current.trialMiddle == 4294967295) || (current.trialMiddle == 0)) && (current.inMenu == 16) && (current.trialNumber != 4294967295) && ((current.inMenu2 == 16) && (old.inMenu2 != 0)) && ((current.closingText == 131072) || (current.closingText == 16908288) || (current.closingText == 16908289)))
		return true;
	else
		return current.isLoading;
}
