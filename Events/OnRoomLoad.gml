
#define OnRoomLoad

switch (room)
{
    case rmSkillGrid:
        //SkillStandWorkshop();
    break;
    case rmGame:
        //SpawnPucci(room_width/2, room_height/2);
    break;
}

if (room != rmGame)
{
    if (instance_exists(player))
    {
        InitPlayerVariables();
        init_player_traits();
        //var _map = ModSaveDataFetch();
        //LoadStand(_map);
        LoadData();
    }
}


