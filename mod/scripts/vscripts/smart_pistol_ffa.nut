global function SmartPistolFFA_Init

void function SmartPistolFFA_Init()
{
	AddCallback_OnClientConnected( OnPlayerConnected )
	AddCallback_OnPlayerGetsNewPilotLoadout( OnPlayerChangeLoadout)
}
void function OnPlayerConnected( entity player )
{
	thread AllSonar(player)
}

void function OnPlayerChangeLoadout( entity player , PilotLoadoutDef pilot )
{
	ResetPlayerCooldowns( player )
	player.TakeWeapon("mp_ability_cloak")
	TakeWeaponsForArray( player, player.GetMainWeapons() )
	player.GiveWeapon( "mp_weapon_smart_pistol",["extended_ammo","pas_fast_reload","tactical_cdr_on_kill"])
}
void function AllSonar(entity player)
{
	player.EndSignal( "OnDestroy" )
	for(;;)
	{
		Highlight_SetEnemyHighlight( player, "enemy_boss_bounty" )
		wait 0.5
	}
}
