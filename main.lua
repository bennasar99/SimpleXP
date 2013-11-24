function Initialize(Plugin)
	Plugin:SetName("SimpleXP");
	Plugin:SetVersion(1);
	
	PluginManager = cRoot:Get():GetPluginManager();
	PluginManager:AddHook(cPluginManager.HOOK_PLAYER_BROKEN_BLOCK, OnPlayerBrokenBlock)

	LOG("Initialized " .. Plugin:GetName() .. " v" .. PLUGIN:GetVersion())
	return true;
end

function OnPlayerBrokenBlock(Player, BlockX, BlockY, BlockZ, BlockFace, BlockType, BlockMeta)
	local HeldItem = Player:GetEquippedItem();
	local HeldItemType = HeldItem.m_ItemType;
	if (Player:GetGameMode() == 0) then
		if (BlockType == E_BLOCK_COAL_ORE) and (HeldItemType == E_ITEM_WOODEN_PICKAXE) or (HeldItemType == E_ITEM_STONE_PICKAXE) or (HeldItemType == E_ITEM_IRON_PICKAXE) or (HeldItemType == E_ITEM_DIAMOND_PICKAXE) then
			Player:DeltaExperience(math.random(0,2))
		elseif (BlockType == E_BLOCK_DIAMOND_ORE) or (BlockType == E_BLOCK_ESMERALD_ORE) and (HeldItemType == E_ITEM_IRON_PICKAXE) or (HeldItemType == E_ITEM_DIAMOND_PICKAXE) then
			Player:DeltaExperience(math.random(3,7))
		elseif (BlockType == E_BLOCK_LAPIS_ORE) and (HeldItemType == E_ITEM_STONE_PICKAXE) or (HeldItemType == E_ITEM_IRON_PICKAXE) or (HeldItemType == E_ITEM_DIAMOND_PICKAXE) then
			Player:DeltaExperience(math.random(2,5))
		elseif (BlockType == E_BLOCK_NETHER_QUARTZ_ORE) and (HeldItemType == E_ITEM_WOODEN_PICKAXE) or (HeldItemType == E_ITEM_STONE_PICKAXE) or (HeldItemType == E_ITEM_IRON_PICKAXE) or (HeldItemType == E_ITEM_DIAMOND_PICKAXE) then
			Player:DeltaExperience(math.random(2,5))
		elseif (BlockType == E_BLOCK_REDSTONE_ORE) or (BlockType == E_BLOCK_REDSTONE_ORE_GLOWING) and (HeldItemType == E_ITEM_IRON_PICKAXE) or (HeldItemType == E_ITEM_DIAMOND_PICKAXE) then
			Player:DeltaExperience(math.random(1,5))
		elseif (BlockType == E_BLOCK_MOSTER_SPAWNER) then
			Player:DeltaExperience(math.random(15,43))
		end
	end
end

function OnKilling(Victim, Killer)
	if Killer == nil then
		return false
	end
	if Killer:IsPlayer() then
		Player = tolua.cast(Killer,"cPlayer")
		if Victim:IsMob() then
			if (Victim:IsA("cChicken")) or (Victim:IsA("cCow")) or (Victim:IsA("cHorse")) or (Victim:IsA("cMooshroom")) or (Victim:IsA("cCow")) or (Victim:IsA("cOcelot")) or (Victim:IsA("cPig")) or (Victim:IsA("cSheep")) or (Victim:IsA("cSquid")) or (Victim:IsA("cWolf")) then
				Player:DeltaExperience(math.random(1,3))
			elseif (Victim:IsA("cSlime")) or (Victim:IsA("cMagmaCube")) then
				Player:DeltaExperience(math.random(2,3))
			elseif (Victim:IsA("cBlaze")) then
				Player:DeltaExperience(10)
			elseif (Victim:IsA("cEnderDragon")) then
				Player:DeltaExperience(12000)
			elseif (Victim:IsA("cWither")) then
				Player:DeltaExperience(50)
			else
				Player:DeltaExperience(math.random(5,8))
			end
		end
		return false
	end
end
