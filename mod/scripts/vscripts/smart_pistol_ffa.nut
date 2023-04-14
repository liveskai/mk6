global function SmartPistolFFA_Init

void function SmartPistolFFA_Init()
{
	AddCallback_OnPlayerRespawned( OnPlayerRespawned )
	AddCallback_OnPlayerGetsNewPilotLoadout( OnPlayerChangeLoadout)
}
void function OnPlayerRespawned( entity player )
{
	foreach ( entity weapon in player.GetMainWeapons() )
		player.TakeWeaponNow( weapon.GetWeaponClassName() )

	player.GiveWeapon( "mp_weapon_smart_pistol")
}

void function OnPlayerChangeLoadout( entity player , PilotLoadoutDef p)
{
	foreach ( entity weapon in player.GetMainWeapons() )
		player.TakeWeaponNow( weapon.GetWeaponClassName() )

	player.GiveWeapon( "mp_weapon_smart_pistol")
}
