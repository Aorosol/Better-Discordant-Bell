game.TraitData.EscalatingKeepsake = {        
	Name = "EscalatingKeepsake",
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
	Epic = { Multiplier = 3.0 },
	Heroic = { Multiplier = 4.0 },
},

OnSelfDamagedFunction = {
	Name = "ZeusRetaliate",
	FunctionArgs =
	{
		ProjectileName = "ZeusRetaliateStrike",
		Cooldown = 0.15,
		ConsecutiveStrikeChance = 0.00015,
		MaxStrikes = {
			BaseValue = 2,
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
function sjson_EditZeusDamage(data)
for _, v in ipairs(data.Projectiles) do
	if v.Name == 'ZeusRetaliateStrike' then
		v.Damage = 50 -- Change to whatever you want, but beware that it will alter the original boon
		break
	end
end
end