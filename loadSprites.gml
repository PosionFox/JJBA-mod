

#region Items

global.sprArrow = sprite_add("Resources/Sprites/Arrow.png", 1, false, false, 8, 8);
global.sprDisc = sprite_add("Resources/Sprites/Disc.png", 1, false, false, 8, 8);
global.sprArrowBeetle = sprite_add("Resources/Sprites/ArrowBeetle.png", 1, false, false, 8, 8);

#endregion

#region Projectiles

// generic
global.sprKnife = sprite_add("Resources/Sprites/Knife.png", 1, false, false, 8, 8);
global.sprBullet = sprite_add("Resources/Sprites/Bullet.png", 1, false, false, 1, 1);

// shadow dio's the world
global.sprKnifeStw = sprite_add("Resources/Sprites/KnifeStw.png", 1, false, false, 8, 8);
global.sprStwPunch = sprite_add("Resources/Sprites/StwPunch.png", 1, false, false, 16, 16);

// anubis
global.sprHorizontalSlash = sprite_add("Resources/Sprites/HorizontalSlash.png", 1, false, false, 16, 16);

// the world
global.sprTheWorldPunch = sprite_add("Resources/Sprites/TheWorldPunch.png", 1, false, false, 16, 16);

// star platinum
global.sprStarPlatinumPunch = sprite_add("Resources/Sprites/StarPlatinumPunch.png", 1, false, false, 16, 16);
global.sprStarPlatinumFinger = sprite_add("Resources/Sprites/StarPlatinumFinger.png", 1, false, false, 1, 1);

// dirty deeds done dirt cheap
global.sprD4CPunch = sprite_add("Resources/Sprites/D4CPunch.png", 1, false, false, 16, 16);

// killer queen
global.sprCoin = sprite_add("Resources/Sprites/Coin.png", 1, false, false, 16, 16);

// killer queen: bites the dust
global.sprScBubble = sprite_add("Resources/Sprites/Bubble.png", 1, false, false, 16, 16);

#endregion

#region Effects

// generic
global.sprPunchEffect = sprite_add("Resources/Sprites/PunchEffect.png", 6, false, false, 8, 8);

// killer queen
global.sprKqPunch = sprite_add("Resources/Sprites/KillerQueenPunch.png", 1, false, false, 16, 16);
global.sprBombEffect = sprite_add("Resources/Sprites/BombEffect.png", 1, false, false, 16, 16);
global.sprSHA = sprite_add("Resources/Sprites/SHA.png", 1, false, false, 16, 16);

// killer queen: bites the dust
global.sprBtdStare = sprite_add("Resources/Sprites/BtDStare.png", 1, false, false, 16, 16);
global.sprBtdVoidTrace = sprite_add("Resources/Sprites/BtDVoidTrace.png", 1, false, false, 16, 1);

#endregion

#region Skills

// generic
global.sprSkillTemplate = sprite_add("Resources/Sprites/SkillTemplate.png", 1, false, false, 16, 16);
global.sprSkillSkip = sprite_add("Resources/Sprites/SkillSkip.png", 1, false, false, 16, 16);
global.sprSkillHoldTemplate = sprite_add("Resources/Sprites/SkillHoldTemplate.png", 1, false, false, 16, 16);
global.sprSkillCooldown = sprite_add("Resources/Sprites/SkillCooldown.png", 1, false, false, 16, 16);

global.sprSkillBarrage = sprite_add("Resources/Sprites/SkillBarrage.png", 1, false, false, 16, 16);
global.sprSkillStrongPunch = sprite_add("Resources/Sprites/SkillStrongPunch.png", 1, false, false, 16, 16);

// the world
global.sprSkillTripleKnifeThrow = sprite_add("Resources/Sprites/SkillTripleKnifeThrow.png", 1, false, false, 16, 16);
global.sprSkillTimestop = sprite_add("Resources/Sprites/SkillTimestop.png", 1, false, false, 16, 16);

// the world alternate universe
global.sprSkillKnifeBarrage = sprite_add("Resources/Sprites/SkillKnifeBarrage.png", 1, false, false, 16, 16);
global.sprSkillGunShot = sprite_add("Resources/Sprites/SkillGunShot.png", 1, false, false, 16, 16);

// star platinum
global.sprSkillBarrageSp = sprite_add("Resources/Sprites/SkillBarrageSp.png", 1, false, false, 16, 16);
global.sprSkillStrongPunchSp = sprite_add("Resources/Sprites/SkillStrongPunchSp.png", 1, false, false, 16, 16);
global.sprSkillStarFinger = sprite_add("Resources/Sprites/SkillStarFinger.png", 1, false, false, 16, 16);
global.sprSkillTimestopSp = sprite_add("Resources/Sprites/SkillTimestopSp.png", 1, false, false, 16, 16);

// dirty deeds done dirt cheap: love train
global.sprSkillBarrageD4C = sprite_add("Resources/Sprites/SkillBarrageD4C.png", 1, false, false, 16, 16);
global.sprSkillBulletVolley = sprite_add("Resources/Sprites/SkillVolleyShot.png", 1, false, false, 16, 16);
global.sprSkillCloneSummon = sprite_add("Resources/Sprites/SkillCloneSummon.png", 1, false, false, 16, 16);
global.sprSkillLoveTrain = sprite_add("Resources/Sprites/SkillLoveTrain.png", 1, false, false, 16, 16);

// shadow dio's the world
global.sprSkillKnifeCoffin = sprite_add("Resources/Sprites/SkillKnifeCoffin.png", 1, false, false, 16, 16);
global.sprSkillBackDashKnife = sprite_add("Resources/Sprites/SkillBackDashKnife.png", 1, false, false, 16, 16);
global.sprSkillRadialKnife = sprite_add("Resources/Sprites/SkillRadialKnife.png", 1, false, false, 16, 16);
global.sprSkillTripleCombo = sprite_add("Resources/Sprites/SkillTripleCombo.png", 1, false, false, 16, 16);
global.sprSkillTimestopStw = sprite_add("Resources/Sprites/SkillTimestopStw.png", 1, false, false, 16, 16);

// killer queen
global.sprSkillBarrageKq = sprite_add("Resources/Sprites/SkillBarrageKq.png", 1, false, false, 16, 16);
global.sprSkillFirstBomb = sprite_add("Resources/Sprites/SkillFirstBomb.png", 1, false, false, 16, 16);
global.sprSkillDetonate = sprite_add("Resources/Sprites/SkillDetonate.png", 1, false, false, 16, 16);
global.sprSkillCoinBomb = sprite_add("Resources/Sprites/SkillCoinBomb.png", 1, false, false, 16, 16);
global.sprSkillSHA = sprite_add("Resources/Sprites/SkillSHA.png", 1, false, false, 16, 16);

// killer queen: bites the dust
global.sprSkillStrayCat = sprite_add("Resources/Sprites/SkillStrayCat.png", 1, false, false, 16, 16);
global.sprSkillThirdBomb = sprite_add("Resources/Sprites/SkillThirdBomb.png", 1, false, false, 16, 16);
global.sprSkillBtD = sprite_add("Resources/Sprites/SkillBtD.png", 1, false, false, 16, 16);

#endregion

#region Stands

global.sprStarPlatinum = sprite_add("Resources/Sprites/StarPlatinum.png", 1, false, false, 16, 16);
global.sprTheWorld = sprite_add("Resources/Sprites/TheWorld.png", 1, false, false, 16, 16);
global.sprTheWorldAU = sprite_add("Resources/Sprites/TheWorldAU.png", 1, false, false, 16, 16);
global.sprAnubis = sprite_add("Resources/Sprites/Anubis.png", 1, false, false, 16, 16)
global.sprD4C = sprite_add("Resources/Sprites/D4C.png", 1, false, false, 16, 16);
global.sprShadowTheWorld = sprite_add("Resources/Sprites/ShadowTheWorld.png", 1, false, false, 16, 16);
global.sprKillerQueen = sprite_add("Resources/Sprites/KillerQueen.png", 1, false, false, 16, 16);
global.sprKillerQueenBtD = sprite_add("Resources/Sprites/KillerQueenBtD.png", 1, false, false, 16, 16);

#endregion

