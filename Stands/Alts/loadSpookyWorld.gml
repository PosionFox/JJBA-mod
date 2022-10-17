
global.jjbamDiscSw = ItemCreate(
    undefined,
    "DISC:SW",
    "The label says: Spooky World",
    global.sprDisc,
    ItemType.Consumable,
    ItemSubType.Potion,
    1248,
    0,
    0,
    [],
    ScriptWrap(DiscSwUse),
    5 * 10,
    true
);

#define DiscSwUse

if (instance_exists(STAND) or room != rmGame)
{
    GainItem(global.jjbamDiscSw);
    exit;
}
GiveSpookyWorld(player);

#define GiveSpookyWorld(_owner) //stand

var _s = GiveTheWorld(_owner);
with (_s)
{
    name = "Spooky World";
    sprite_index = global.sprSpookyWorld;
    color = 0x322022;
    auraParticleSprite = global.sprStandParticle2;
    saveKey = "jjbamSw";
    discType = global.jjbamDiscSw;
}
return _s;
