local itemTierClassifications = {
	-- Upgrade classification 1
	[1] = {
		-- Update tier 0
		[1] = {price = 2500000, core = 1}
	},
	-- Upgrade classification 2
	[2] = {
		-- Update tier 0
		[1] = {price = 75000000, core = 1},
		-- Update tier 1
		[2] = {price = 500000000, core = 1}
	},
	-- Upgrade classification 3
	[3] = {
		[1] = {price = 400000000, core = 1},
		[2] = {price = 1000000000, core = 1},
		[3] = {price = 2000000000, core = 2}
	},
	-- Upgrade classification 4
	[4] = {
		[1] = {price = 80000000, core = 1},
		[2] = {price = 200000000, core = 1},
		[3] = {price = 400000000, core = 2},
		[4] = {price = 650000000, core = 5},
		[5] = {price = 1000000000, core = 10},
		[6] = {price = 2500000000, core = 15},
		[7] = {price = 7500000000, core = 25},
		[8] = {price = 25000000000, core = 35},
		[9] = {price = 80000000000, core = 50},
		[10] = {price = 150000000000, core = 65}
	}
}

-- Item tier with gold price for uprading it
for classificationId, classificationTable in ipairs(itemTierClassifications) do
	local itemClassification = Game.createItemClassification(classificationId)
	local classification = {}

	-- Registers table for register_item_tier.lua interface
	classification.Upgrades = {}
	for tierId, tierTable in ipairs(classificationTable) do
		if tierId and tierTable.price and tierTable.core ~= nil then
			table.insert(classification.Upgrades, {TierId = tierId - 1, Price = tierTable.price, Core = tierTable.core})
		end
	end
	-- Create item classification and register classification table
	itemClassification:register(classification)
end
