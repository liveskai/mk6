global function SmartPistolFFA_Init

void function SmartPistolFFA_Init()
{
	AddCallback_OnPlayerRespawned( OnPlayerRespawned )
	AddCallback_OnPlayerGetsNewPilotLoadout( OnPlayerChangeLoadout)
}
void function OnPlayerRespawned( entity player )
{
	thread AllSonar(player)
	ResetPlayerCooldowns( player )
}

void function OnPlayerChangeLoadout( entity player , PilotLoadoutDef pilot )
{
	player.TakeWeapon("mp_ability_cloak")
	TakeWeaponsForArray( player, player.GetMainWeapons() )
	player.GiveWeapon( "mp_weapon_smart_pistol",["extended_ammo","pas_fast_reload","tactical_cdr_on_kill"])
}
void function AllSonar(entity player)
{
	while(IsAlive(player))
	{
		if (!Hightlight_HasEnemyHighlight(player, "enemy_boss_bounty"))
			Highlight_SetEnemyHighlight( player, "enemy_boss_bounty" )

		wait 0.5
	}
}
