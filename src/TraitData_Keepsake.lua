local textfile = rom.path.combine(rom.paths.Content, 'Game/Text/en/TraitText.en.sjson')

local ids_to_descriptions = {
	EscalatingKeepsake = "Upon taking Damage, deal some back.",
	EscalatingKeepsake_Tray = "Upon taking Damage, deal some back.",

    BoltRetaliate_CombatText = "{#CombatTextHighlightFormat}{$TraitData.BoltRetaliateBoon.Name}"
}

sjson.hook(textfile, function(sjsonData)
	for _, v in ipairs(sjsonData.Texts) do
		local description = ids_to_descriptions[v.Id]
		if description then v.Description = description end
	end
end)

game.TraitData.EscalatingKeepsake = {
    Name = "EscalatingKeepsake",
    Icon = "Keepsake_33",
    EquipSound = "/SFX/Menu Sounds/KeepsakeThanatosButterflyBell",

    -- This is what is description wise ~~ zannc
    CustomTrayNameWhileDead = "EscalatingKeepsake",
    CustomTrayText = "EscalatingKeepsake_Tray",

    -- Always add these, so it SHUTS UP
    ShowInHUD = true,
    Ordered = true,
    HUDScale = 0.435,
    PriorityDisplay = true,
    ChamberThresholds = { 25, 50 },
    HideInRunHistory = true,
    Slot = "Keepsake",
    InfoBackingAnimation = "KeepsakeSlotBase",
    RecordCacheOnEquip = true,
    TraitOrderingValueCache = -1,
    ActiveSlotOffsetIndex = 0,

    FrameRarities = {
        Common = "Frame_Keepsake_Rank1",
        Rare = "Frame_Keepsake_Rank2",
        Epic = "Frame_Keepsake_Rank3",
        -- There is no rank 4 unless you steal it from pony, magic talked about how to do it ~~ zannc
    },

    CustomRarityLevels = {
        "TraitLevel_Keepsake1",
        "TraitLevel_Keepsake2",
        "TraitLevel_Keepsake3",
        "TraitLevel_Keepsake4",
    },

    InheritFrom = { "GiftTrait" },
    RarityLevels = {
        Common = { Multiplier = 1.0 },
        Rare = { Multiplier = 2.0 },
        Epic = { Multiplier = 4.0 },
        Heroic = { Multiplier = 8.0 },
    },

    OnSelfDamagedFunction = {
        Name = "ZeusRetaliate",
        FunctionArgs =
        {
            ProjectileName = "ZeusRetaliateStrike",
            DamageMultiplier = { BaseValue = 1.0 }, -- Added this, this is the multiplier of 100, it takes in the multiplier above ~~ zannc
            Cooldown = 0.15,
            ConsecutiveStrikeChance = 0.0015,
            MaxStrikes = {
                BaseValue = 1,
                MinValue = 1,
                IdenticalMultiplier =
                {
                    Value = -0.5,
                },
            },
            ReportValues = {
                ReportedMaxStrikes = "MaxStrikes",
                ReportedStrikeChance = "ConsecutiveStrikeChance",
                RetaliateDamage =
                "DamageMultiplier" -- Added this, its used as the key to know what the multiplier is ~~ zannc
            },
        }
    },

    -- This is what is also what is displayed description wise, you're using boon description so thats why its there ~~ zannc
    StatLines = {
        "BoltMultiCastStatDisplay",
    },

    ExtractValues = {
        {
            Key = "ReportedMaxStrikes",
            ExtractAs = "MaxStrikes",
        },
        {
            Key = "ReportedStrikeChance",
            ExtractAs = "StrikeChance",
            SkipAutoExtract = true,
            Format = "Percent",
        },
        {
            Key = "RetaliateDamage",   -- This is said key, just grabs the value ~~ zannc
            ExtractAs = "Damage",
            Format = "MultiplyByBase", -- This is to make the gmae know to multiply the base value (100) by whatever ~~ zannc
            BaseType = "Projectile",   -- Changed form ProjectileBase to Projectile, dunno the difference but it crashes otherewise ~~ zannc
            BaseName = "ZeusRetaliateStrike",
            BaseProperty = "Damage",
            -- Removed these two ~~ zannc
            -- External = true,
            -- SkipAutoExtract = true,
        },
    },

    -- Moved this outside of ExtractValues, idk why it was there but it shouldn't be. ~~ zannc
    EquipVoiceLines =
    {
        {
            PreLineWait = 0.3,
            BreakIfPlayed = true,
            SuccessiveChanceToPlay = 0.2,
            Cooldowns =
            {
                { Name = "MelinoeAnyQuipSpeech" },
            },

            { Cue = "/VO/Melinoe_3200", Text = "The Bell." },
        },
        [2] = GlobalVoiceLines.AwardSelectedVoiceLines,
    },

    SignOffData =
    {
        {
            Text = "SignoffEris",
        },
    },
}

-- This is the SJSON edit for the damage ~~ zannc
local PlayerProjectilesFile = rom.path.combine(rom.paths.Content, 'Game/Projectiles/PlayerProjectiles.sjson')

function sjson_EditZeusDamage(data)
     for _, v in ipairs(data.Projectiles) do
         if v.Name == 'ZeusRetaliateStrike' then
             v.Damage = 100 -- Change to whatever you want, but beware that it will alter the original boon
             break
         end
     end
 end