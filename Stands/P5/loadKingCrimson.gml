
global.jjbamDiscKc = ItemCreate(
    undefined,
    "DISC:KC",
    "The label says: King Crimson",
    global.sprDisc,
    ItemType.Consumable,
    ItemSubType.Potion,
    416,
    0,
    0,
    [],
    ScriptWrap(DiscKcUse),
    5 * 10,
    true
);

#define DiscKcUse

if (instance_exists(STAND) or room != rmGame)
{
    GainItem(global.jjbamDiscKc);
    exit;
}
GiveKingCrimson(player);

#define ScalpelSlash(m, s)
var _dir = point_direction(owner.x, owner.y, mouse_x, mouse_y);

audio_play_sound(global.sndKnifeThrow, 5, false);
var o = ProjectileCreate(owner.x, owner.y);
with (o)
{
    damage = GetDmg(s);
    sprite_index = global.sprScalpelSwing;
    mask_index = global.sprHitbox32x32;
    direction = _dir;
    stationary = true;
    distance = 16;
    destroyOnImpact = false;
    
    InstanceAssignMethod(self, "step", ScriptWrap(ScalpelSlashStep));
}
EndAtk(s);

#define ScalpelSlashStep

if (image_index >= image_number - 1)
{
    instance_destroy(self);
}

#define ScalpelThrow(m, s)

var _dir = point_direction(owner.x, owner.y, mouse_x, mouse_y);

switch (attackState)
{
    case 0:
        var _snd = audio_play_sound(global.sndKnifeThrow, 5, false);
        audio_sound_pitch(_snd, random_range(0.9, 1.1));
        var _p = ProjectileCreate(owner.x, owner.y);
        with (_p)
        {
            damage = GetDmg(s);
            baseSpd = 7;
            direction = _dir;
            direction += random_range(-4, 4);
            canMoveInTs = false;
            sprite_index = global.sprScalpel;
        }
        attackState++;
    break;
    case 1:
        if (attackStateTimer >= 0.15) attackState++;
    break;
    case 2:
        var _snd = audio_play_sound(global.sndKnifeThrow, 5, false);
        audio_sound_pitch(_snd, random_range(0.9, 1.1));
        var _p = ProjectileCreate(owner.x, owner.y);
        with (_p)
        {
            damage = GetDmg(s);
            baseSpd = 7;
            direction = _dir;
            direction += random_range(-4, 4);
            canMoveInTs = false;
            sprite_index = global.sprScalpel;
        }
        EndAtk(s);
    break;
}
attackStateTimer += DT;

#define TimeSkip(m, s)

if (!WaterCollision(mouse_x, mouse_y))
{
    audio_play_sound(global.sndKcTp, 5, false);
    EffectPlayerAfterimageCreate(owner.x, owner.y);
    EffectTimeSkipCreate();
    player.x = mouse_x;
    player.y = mouse_y;
    EndAtk(s);
}
else
{
    ResetAtk(s);
}

#define KcBarrage(method, s) //attacks

switch (attackState)
{
    case 0:
        if (instance_exists(ENEMY))
        {
            var _n = instance_nearest(mouse_x, mouse_y, ENEMY);
            if (distance_to_object(_n) < 64)
            {
                audio_play_sound(global.sndKcTp, 5, false);
                EffectPlayerAfterimageCreate(owner.x, owner.y);
                EffectTimeSkipCreate();
                player.x = _n.x;
                player.y = _n.y;
                attackState++;
            }
            else
            {
                ResetAtk(s);
            }
        }
        else
        {
            ResetAtk(s);
        }
    break;
    case 1:
        var _target = noone;
        var _dis = point_distance(owner.x, owner.y, mouse_x, mouse_y);
        var _dir = point_direction(owner.x, owner.y, mouse_x, mouse_y);
        if (instance_exists(ENEMY))
        {
            _target = instance_nearest(owner.x, owner.y, ENEMY);
            _dis = point_distance(owner.x, owner.y, _target.x, _target.y);
            _dir = point_direction(owner.x, owner.y, _target.x, _target.y);
        }
        xTo = owner.x + lengthdir_x(8, _dir + random_range(-4, 4));
        yTo = owner.y + lengthdir_y(8, _dir + random_range(-4, 4));
        image_xscale = mouse_x > owner.x ? 1 : -1;
        
        attackStateTimer += DT;
        if (distance_to_point(xTo, yTo) < 2)
        {
            if (attackStateTimer >= 0.12)
            {
                var _snd = audio_play_sound(global.sndPunchAir, 0, false);
                var _sHit = choose(global.sndKcAttack1, global.sndKcAttack2, global.sndKcAttack3, global.sndKcAttack4, global.sndKcAttack5);
                audio_sound_pitch(_snd, random_range(0.9, 1.1));
                var xx = x + random_range(-4, 4);
                var yy = y + random_range(-8, 8);
                var _p = PunchSwingCreate(xx, yy, _dir, 45, GetDmg(s));
                with (_p)
                {
                    onHitSound = _sHit;
                    onHitSoundOverlap = true;
                    knockback = 0;
                }
                attackStateTimer = 0;
            }
            skills[s, StandSkill.ExecutionTime] += DT;
        }
        
        if (keyboard_check_pressed(ord(skills[s, StandSkill.Key])))
        {
            if (skills[s, StandSkill.ExecutionTime] > 0)
            {
                FireCD(s);
            }
            else
            {
                ResetCD(s);
            }
            state = StandState.Idle;
        }
    break;
}

#define KcChop(m, s)

var _dis = point_distance(player.x, player.y, mouse_x, mouse_y);
var _dir = point_direction(player.x, player.y, mouse_x, mouse_y)

var _xx = player.x + lengthdir_x(8, _dir);
var _yy = player.y + lengthdir_y(8, _dir);
xTo = _xx;
yTo = _yy;
image_xscale = mouseXSide;

switch (attackState)
{
    case 0:
        angleTarget = -10 * image_xscale;
        if (attackStateTimer >= 0.4)
        {
            attackState++;
        }
    break;
    case 1:
        var _snd = audio_play_sound(global.sndPunchAir, 0, false);
        audio_sound_pitch(_snd, random_range(0.9, 1.1));
        var _p = PunchSwingCreate(x, y, _dir, 45, GetDmg(s));
        _p.onHitSound = global.sndKcAttack5;
        attackState++;
    break;
    case 2:
        angleTarget = 10 * image_xscale;
        if (attackStateTimer >= 0.6)
        {
            EndAtk(s);
        }
    break;
}
attackStateTimer += DT;

#define KcHeavyChop(m, s)

switch (attackState)
{
    case 0:
        if (instance_exists(ENEMY))
        {
            var _n = instance_nearest(mouse_x, mouse_y, ENEMY);
            if (distance_to_object(_n) < 64)
            {
                x = _n.x;
                y = _n.y;
                audio_play_sound(global.sndKcGrowl, 5, false);
                attackState++;
            }
            else
            {
                ResetAtk(s);
            }
        }
        else
        {
            ResetAtk(s);
        }
    break;
    case 1:
        var _t = owner;
        armChopShow = true;
        if (instance_exists(ENEMY))
        {
            _t = instance_nearest(x, y, ENEMY);
        }
        else
        {
            armChopShow = false;
            EndAtk(s);
        }
        if (distance_to_object(owner) > armChopRange)
        {
            armChopShow = false;
            EndAtk(s);
        }
        xTo = _t.x - 8;
        yTo = _t.y - 8;
        height = attackStateTimer * 3;
        angleTarget = attackStateTimer * 5;
        if (attackStateTimer > 3)
        {
            var _dir = point_direction(x, y, _t.x, _t.y);
            var _p = PunchSwingCreate(x, y, _dir, 45, GetDmgAlt(s) + (_t.hpMax * 0.1));
            with (_p)
            {
                onHitSound = global.sndKcArmChop;
                onHitSoundOverlap = true;
                knockback = 2;
            }
            var _c = EffectCircleCreate(_t.x, _t.y, 32, 4);
            _c.color = c_red;
            _c.lifeMulti = 2;
            repeat (10)
            {
                EffectArmChopCreate(_t.x, _t.y).lifeMulti = 2;
            }
            attackState++;
        }
    break;
    case 2:
        height = 2;
        angleTarget = -45;
        angleTargetSpd = 0.5;
        if (attackStateTimer > 3.2)
        {
            armChopShow = false;
            EndAtk(s);
        }
    break;
}
attackStateTimer += DT;

#define KcPos

var xPos = mouse_x > owner.x ? 1 : -1;
xTo = owner.x - (xPos * 8);
yTo = owner.y - 8;
angleTarget = 25 + (cos(current_time / 1000) * 5);
image_xscale = -xPos;


#define GiveKingCrimson(_owner) //stand

var _skills = StandSkillInit();

var sk;
sk = StandState.SkillAOff;
_skills[sk, StandSkill.Skill] = ScalpelSlash;
_skills[sk, StandSkill.Icon] = global.sprSkillTemplate;
_skills[sk, StandSkill.Damage] = 2;
_skills[sk, StandSkill.DamageScale] = 0.1;
_skills[sk, StandSkill.MaxCooldown] = 1;
_skills[sk, StandSkill.Desc] = "scalpel slash:\nslash.";

sk = StandState.SkillBOff;
_skills[sk, StandSkill.Skill] = ScalpelThrow;
_skills[sk, StandSkill.Icon] = global.sprSkillScalpelThrow;
_skills[sk, StandSkill.Damage] = 1.6;
_skills[sk, StandSkill.DamageScale] = 0.3;
_skills[sk, StandSkill.MaxCooldown] = 1;
_skills[sk, StandSkill.Desc] = "scalpel throw:\nthrow.";

sk = StandState.SkillA;
_skills[sk, StandSkill.Skill] = KcBarrage;
_skills[sk, StandSkill.Damage] = 1.5;
_skills[sk, StandSkill.DamageScale] = 0.01;
_skills[sk, StandSkill.Icon] = global.sprSkillBarrage;
_skills[sk, StandSkill.MaxCooldown] = 1;
_skills[sk, StandSkill.MaxExecutionTime] = 1;
_skills[sk, StandSkill.Desc] = "skip barrage:\nlaunches a barrage of punches.";

sk = StandState.SkillB;
_skills[sk, StandSkill.Skill] = KcChop;
_skills[sk, StandSkill.Damage] = 3;
_skills[sk, StandSkill.DamageScale] = 0.2;
_skills[sk, StandSkill.Icon] = global.sprSkillStrongPunch;
_skills[sk, StandSkill.MaxCooldown] = 1;
_skills[sk, StandSkill.SkillAlt] = KcHeavyChop;
_skills[sk, StandSkill.DamageAlt] = 10;
_skills[sk, StandSkill.DamageScaleAlt] = 0.12;
_skills[sk, StandSkill.IconAlt] = global.sprSkillTemplate;
_skills[sk, StandSkill.MaxCooldownAlt] = 1;
_skills[sk, StandSkill.Desc] = @"chop:
chop.

arm chop:
chops arm";

sk = StandState.SkillC;
_skills[sk, StandSkill.Skill] = TimeSkip;
_skills[sk, StandSkill.Damage] = 1;
_skills[sk, StandSkill.DamageScale] = 0.15;
_skills[sk, StandSkill.DamagePlayerStat] = false;
_skills[sk, StandSkill.Icon] = global.sprSkillTimeSkip;
_skills[sk, StandSkill.MaxCooldown] = 1;
_skills[sk, StandSkill.Desc] = "time skip:\nskip time.";

sk = StandState.SkillD;
_skills[sk, StandSkill.Skill] = TimeSkip;
_skills[sk, StandSkill.MaxCooldown] = 1;
_skills[sk, StandSkill.Icon] = global.sprSkillTimeSkip;
_skills[sk, StandSkill.Desc] = "time erasure:\nerase.";


var _s = StandBuilder(_owner, _skills);
with (_s)
{
    name = "King Crimson";
    sprite_index = global.sprKingCrimson;
    color = 0x3232ac;
    timeSkipCD = 0;
    armChopRange = 72;
    armChopShow = false;
    
    idlePos = KcPos;
    summonSound = global.sndKcSummon;
    discType = global.jjbamDiscKc;
    
    saveKey = "jjbamKc";
    InstanceAssignMethod(self, "step", ScriptWrap(KingCrimsonStep));
    InstanceAssignMethod(self, "draw", ScriptWrap(KingCrimsonDraw), false);
}
return _s;

#define KingCrimsonStep

if (timeSkipCD > 0)
{
    timeSkipCD -= DT / 2;
}

#define KingCrimsonDraw

if (armChopShow == true)
{
    draw_set_color(c_yellow);
    draw_set_alpha(cos(current_time / 100));
    draw_circle_thick(x, y, armChopRange, 2);
    draw_set_alpha(1);
    draw_set_color(c_white);
}
