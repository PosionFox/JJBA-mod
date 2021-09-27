
#define PunchEffectCreate(_x, _y)

var _o = ModObjectSpawn(_x, _y, 0);
with (_o)
{
    depth = -y;
    sprite_index = global.sprPunchEffect;
    image_index = 0;
    InstanceAssignMethod(self, "step", ScriptWrap(PunchEffectStep), false);
}

#define PunchEffectStep

if (image_index >= image_number - 1)
{
    instance_destroy(self);
}

#define BombEffect(_x, _y)

audio_play_sound(global.sndBomb, 0, false);
var _o = ModObjectSpawn(_x, _y, 0);
with (_o)
{
    depth = -y - 2;
    sprite_index = global.sprBombEffect;
    
    InstanceAssignMethod(self, "step", ScriptWrap(BombEffectStep), false);
}

#define BombEffectStep

image_alpha -= 0.1;
if (image_alpha <= 0)
{
    instance_destroy(self);
}

#define ExplosionEffect(_x, _y)

var _o = ModObjectSpawn(_x, _y, 0);
with (_o)
{
    life = 0.2;
    reachTarget = 32;
    reach = 0;
    
    InstanceAssignMethod(self, "step", ScriptWrap(ExplosionEffectStep), false);
    InstanceAssignMethod(self, "draw", ScriptWrap(ExplosionEffectDraw), false);
    
    repeat (8)
    {
        var xx, yy;
        xx = x + random_range(-reachTarget, reachTarget);
        yy = y + random_range(-reachTarget, reachTarget);
        ExplosionSmokeEffect(xx, yy);
    }
}

#define ExplosionEffectStep

reach = lerp(reach, reachTarget, 0.3);
image_alpha -= 0.1;

life -= 1 / room_speed;
if (life <= 0)
{
    instance_destroy(self);
}

#define ExplosionEffectDraw

gpu_set_blendmode(bm_add);
draw_set_alpha(image_alpha);
draw_set_color(c_red);
draw_circle(x, y, reach, false);
draw_set_color(c_yellow);
draw_circle(x, y, reach * 0.5, false);
draw_set_color(c_white);
draw_circle(x, y, reach * 0.25, false);
draw_set_color(image_blend);
gpu_set_blendmode(bm_normal);

#define ExplosionSmokeEffect(_x, _y)

var _o = ModObjectSpawn(_x, _y, -1);
with (_o)
{
    spd = random_range(0.3, 0.6);
    size = random(1);
    
    InstanceAssignMethod(self, "step", ScriptWrap(ExplosionSmokeStep), false);
    InstanceAssignMethod(self, "draw", ScriptWrap(ExplosionSmokeDraw), false);
}

#define ExplosionSmokeStep

depth = -y;
size += 0.2;
y -= spd;
image_alpha -= 0.01;

if (image_alpha <= 0)
{
    instance_destroy(self);
}

#define ExplosionSmokeDraw

gpu_set_blendmode(bm_add);
draw_set_alpha(image_alpha);
draw_set_color(c_dkgray);
draw_circle(x, y, size, false);
draw_set_color(image_blend);
gpu_set_blendmode(bm_normal);

