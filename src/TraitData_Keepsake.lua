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
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 3.0,
			},
			Heroic =
			{
				Multiplier = 4.0,
			}
		},
		Icon = "Keepsake_33",
		EquipSound = "/SFX/Menu Sounds/KeepsakeThanatosButterflyBell",
		InRackTitle = "EscalatingKeepsake_Rack",
		CustomTrayNameWhileDead = "EscalatingKeepsake",
		CustomTrayText = "EscalatingKeepsake_Tray",

		OnSelfDamagedFunction = 
		{
			Name = "ApolloRetaliate",
			FunctionArgs = 
			{
				ProjectileName = "ApolloRetaliateStrike",
				Cooldown = 0.15,
				DamageMultiplier =
				{
					BaseValue = 1,
					MinMultiplier = 0.1,
					IdenticalMultiplier =
					{
						Value = -0.5,
					},
				},
				ReportValues = { ReportedMultiplier = "DamageMultiplier"},
			}
		},
		StatLines =
		{
			"RevengeDamageStatDisplay1",
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