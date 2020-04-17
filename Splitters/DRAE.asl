state("game")
{
	bool isLoading : "game.exe", 0x7ECAC8;
}

isLoading
{
	return current.isLoading;
}