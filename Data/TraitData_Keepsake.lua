if not ErisKeepsake.Config.Enabled then return end

TraitData.ErisKeepsake =

EscalatingKeepsake = 
	{
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

		AddOutgoingDamageModifiers =
		{
			UseTraitValue = "EscalatingKeepsakeValue",
			IsMultiplier = true,
		},
		AddIncomingDamageModifiers = 
		{
		
			UseTraitValue = "EscalatingKeepsakeValue",
			IsMultiplier = true,
		},
		EscalatingKeepsakeGrowthPerRoom = { BaseValue = 0.005, DecimalPlaces = 3 },
		EscalatingKeepsakeValue = 1.0,

		ExtractValues = 
		{
			{
				Key = "EscalatingKeepsakeGrowthPerRoom",
				ExtractAs = "IncreasePerRoom",
				Format = "Percent",
				DecimalPlaces = 1,
			},
			{
				SkipAutoExtract = true,
				Key = "EscalatingKeepsakeValue",
				ExtractAs = "CurrentBonus",
				Format = "PercentDelta",
				DecimalPlaces = 1,
			},
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
	},
	