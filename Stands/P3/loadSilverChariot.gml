// wip

global.jjbamDiscSc = ItemCreate(
    undefined,
    Localize("standDiscName") + "SC",
    Localize("standDiscDescription") + "Silver Chariot",
    global.sprDisc,
    ItemType.Consumable,
    ItemSubType.Potion,
    416,
    0,
    0,
    [],
    ScriptWrap(DiscScUse),
    5 * 10,
    true
);

#define DiscScUse

if (instance_exists(STAND) or room != rmGame)
{
    GainItem(global.jjbamDiscSc);
    exit;
}
GiveSilverChariot(player);

#define ScLunge(m, s)

var _dir = point_direction(player.x, player.y, mouse_x, mouse_y);
xTo = player.x + lengthdir_x(GetStandReach(self), _dir);
yTo = player.y + lengthdir_y(GetStandReach(self), _dir);

switch (attackState)
{
    case 0:
        player.h += lengthdir_x(3, _dir);
        player.v += lengthdir_y(3, _dir);
        attackState++;
    break;
    case 1:
        if (attackStateTimer >= 0.3)
        {
            attackState++;
        }
    break;
    case 2:
        jj_play_audio(global.sndKnifeThrow, 0, false);
        repeat (5)
        {
            var _e = EffectArmChopCreate(x, y);
            _e.image_blend = c_white;
            _e.direction = _dir + random_range(-5, 5);
        }
        var _p = PunchCreate(x, y, _dir, GetDmg(s), 4);
        with (_p)
        {
            sprite_index = global.sprScAttack;
            despawnTime = 0.15;
            onHitSound = global.sndScLunge;
        }
        EndAtk(s);
    break;
}
attackStateTimer += DT * (1 + (isFtl * 2)) * GetStandSpeed(self);

#define ScSweep(m, s)

var _dir = point_direction(owner.x, owner.y, mouse_x, mouse_y);
xTo = owner.x + lengthdir_x(GetStandReach(self) * 2, _dir);
yTo = owner.y + lengthdir_y(GetStandReach(self) * 2, _dir);

switch (attackState)
{
    case 0:
        if (attackStateTimer >= 0.3)
        {
            attackState++;
        }
    break;
    case 1:
        jj_play_audio(global.sndScSweep, 5, false);
        var _dmg = GetDmg(s);
        var o = ProjectileCreate(owner.x, owner.y);
        with (o)
        {
            damage = _dmg;
            sprite_index = global.sprScalpelSwing;
            mask_index = global.sprHitbox32x32;
            direction = _dir;
            stationary = true;
            distance = 16;
            destroyOnImpact = false;
            
            InstanceAssignMethod(self, "step", ScriptWrap(ScalpelSlashStep));
        }
        attackState++;
    break;
    case 2:
        if (attackStateTimer >= 0.8)
        {
            EndAtk(s);
        }
    break;
}
attackStateTimer += DT * (1 + (isFtl * 2)) * GetStandSpeed(self);

#define ScFTL(m, skill)

sprite_index = sprArmorless;
ExplosionEffect(x, y);
jj_play_audio(global.sndScArmorOff, 0, false);
isFtl = true;
CDMultiplier = 2;
repeat (5)
{
    EffectGeParticleCreate(x, y, color);
}
FtlCD = 20;
EndAtk(skill);

#define GiveSilverChariot(_owner) //stand

var _skills = StandSkillInit();

var sk;
sk = StandState.SkillA;
_skills[sk, StandSkill.Skill] = StandBarrage;
_skills[sk, StandSkill.Damage] = 1;
_skills[sk, StandSkill.DamageScale] = 0.02;
_skills[sk, StandSkill.Icon] = global.sprSkillScBarrage;
_skills[sk, StandSkill.MaxCooldown] = 5;
_skills[sk, StandSkill.MaxExecutionTime] = 4;
_skills[sk, StandSkill.Desc] = Localize("scBarrageDesc");

sk = StandState.SkillB;
_skills[sk, StandSkill.Skill] = ScLunge;
_skills[sk, StandSkill.Damage] = 3;
_skills[sk, StandSkill.DamageScale] = 0.2;
_skills[sk, StandSkill.Icon] = global.sprSkillScLunge;
_skills[sk, StandSkill.MaxCooldown] = 3;
_skills[sk, StandSkill.MaxExecutionTime] = 1;
_skills[sk, StandSkill.Desc] = Localize("scLungeDesc");

sk = StandState.SkillC;
_skills[sk, StandSkill.Skill] = ScSweep;
_skills[sk, StandSkill.Damage] = 5;
_skills[sk, StandSkill.DamageScale] = 0.1;
_skills[sk, StandSkill.Icon] = global.sprSkillScSweep;
_skills[sk, StandSkill.MaxCooldown] = 4;
_skills[sk, StandSkill.Desc] = Localize("scSweepDesc");

sk = StandState.SkillD;
_skills[sk, StandSkill.Skill] = ScFTL;
_skills[sk, StandSkill.Icon] = global.sprSkillScFtl;
_skills[sk, StandSkill.MaxCooldown] = 60;
_skills[sk, StandSkill.MaxExecutionTime] = 1;
_skills[sk, StandSkill.Desc] = Localize("ftlDesc");

var _s = StandBuilder(_owner, _skills);
with (_s)
{
    name = "Silver Chariot";
    sprite_index = global.sprSilverChariot;
    sprArmored = sprite_index;
    sprArmorless = global.sprSCarmorless;
    color = 0x877e84;
    summonSound = global.sndScSummon;
    saveKey = "jjbamSc";
    discType = global.jjbamDiscSc;
    
    isFtl = false;
    FtlCD = 0;
    barrageData.sound = global.sndScBarrage;
    
    InstanceAssignMethod(self, "step", ScriptWrap(SilverChariotStep));
    InstanceAssignMethod(self, "draw", ScriptWrap(SilverChariotDraw), false);
}
return _s;

#define SilverChariotStep

if (isFtl)
{
    FtlCD -= DT;
    if (FtlCD <= 0)
    {
        CDMultiplier = 1;
        sprite_index = sprArmored;
        ShrinkingCircleEffect(x, y);
        isFtl = false;
    }
}

#define SilverChariotDraw

if (isFtl)
{
    var xx = x + random_range(-0.2, 0.2) + (sin(current_time / 1000));
    var yy = (y - height) + random_range(-0.2, 0.2);
    draw_sprite_ext(sprite_index, image_index, xx - 16, yy, image_xscale, image_yscale, image_angle, image_blend, 0.25);
    draw_sprite_ext(sprite_index, image_index, xx - 8, yy, image_xscale, image_yscale, image_angle, image_blend, 0.5);
    draw_sprite_ext(sprite_index, image_index, xx + 8, yy, image_xscale, image_yscale, image_angle, image_blend, 0.5);
    draw_sprite_ext(sprite_index, image_index, xx + 16, yy, image_xscale, image_yscale, image_angle, image_blend, 0.25);
}
