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
        Rare = { Multiplier = 1.25 },
        Epic = { Multiplier = 1.75 },
        Heroic = { Multiplier = 2.0 },
    },

    OnSelfDamagedFunction = {
        Name = "ZeusRetaliate",
        FunctionArgs =
        {
            ProjectileName = "ZeusRetaliateStrike",
            Cooldown = 0.15,
            ConsecutiveStrikeChance = 0.00015,
            MaxStrikes = {
                BaseValue = 1,
                MinValue = 1,
                IdenticalMultiplier =
                {
                    Value = -0.5,
                },
            },
            ReportValues =
            {
                ReportedMaxStrikes = "MaxStrikes",
                ReportedStrikeChance = "ConsecutiveStrikeChance"
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
            ExtractAs = "Damage",
            External = true,
            BaseType = "ProjectileBase",
            BaseName = "ZeusRetaliateStrike",
            BaseProperty = "Damage",
            SkipAutoExtract = true,
        },

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
}

-- This is the SJSON edit for the damage ~~ zannc
local PlayerProjectilesFile = rom.path.combine(rom.paths.Content, 'Game/Text/en/PlayerProjectiles.sjson')

function sjson_EditZeusDamage(data)
    for _, v in ipairs(data.Projectiles) do
        if v.Name == 'ZeusRetaliateStrike' then
            v.Damage = 300 -- Change to whatever you want, but beware that it will alter the original boon
            break
        end
    end
end

sjson.hook(PlayerProjectilesFile, function(data)
    return sjson_EditZeusDamage(data)
end)
