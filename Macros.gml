
#macro DT (1 / room_speed)
#macro ENTITY parEntity
#macro player objPlayer
#macro MOBJ objModEmpty
#macro MNPC objModNPC
#macro CAM WorldControl
#macro ENEMY parEnemy

try
{
    #macro STAND objPlayer.myStand
}
catch (e)
{
    // a
}

#macro DIR_PLAYER_TO_MOUSE point_direction(player.x, player.y, mouse_x, mouse_y)
#macro DIR_STAND_TO_MOUSE point_direction(STAND.x, STAND.y, mouse_x, mouse_y)
#macro DMG string(_skills[sk, StandSkill.Damage])
