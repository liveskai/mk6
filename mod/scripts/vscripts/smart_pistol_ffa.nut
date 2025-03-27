global function SmartPistolFFA_Init

void function SmartPistolFFA_Init()
{
	AddCallback_OnPlayerRespawned( OnPlayerRespawned )
	AddCallback_OnPlayerGetsNewPilotLoadout( OnPlayerChangeLoadout)
}
void function OnPlayerRespawned( entity player )
{
	ResetPlayerCooldowns( player )
	thread AllSonar(player)
}

void function OnPlayerChangeLoadout( entity player , PilotLoadoutDef p)
{
	TakeWeaponsForArray( player, player.GetMainWeapons() )
	player.GiveWeapon( "mp_weapon_smart_pistol",["extended_ammo","pas_fast_reload","tactical_cdr_on_kill"])
	player.TakeWeapon("mp_ability_cloak")
}
void function AllSonar(entity player)
{
	player.EndSignal( "OnDestroy" )
	player.EndSignal( "OnDeath" )
	while(true)
	{
		if (!Hightlight_HasEnemyHighlight(player, "enemy_boss_bounty"))
			Highlight_SetEnemyHighlight( player, "enemy_boss_bounty" )

		wait 0.5
	}
}
