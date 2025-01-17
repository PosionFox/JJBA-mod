
#define OnStep

if (instance_exists(player))
{
    with (player)
    {
        attack_direction = point_direction(x, y, mouse_x, mouse_y);
    }
    
    if (bool("myStand" in player) and instance_exists(player.myStand))
    {
        RunRunesUpdate();
        RunRunesHealing();
    }
}

// destroy spriteless npcs
if (instance_exists(MNPC))
{
    with (MNPC)
    {
        if (npc == noone)
        {
            //sprite_index = sprSmoke;
            instance_destroy(self);
        }
    }
}
