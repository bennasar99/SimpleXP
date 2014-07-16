function Initialize(Plugin)
	Plugin:SetName("SimpleXP");
	Plugin:SetVersion(1);
	
	PluginManager = cRoot:Get():GetPluginManager();
	PluginManager:AddHook(cPluginManager.HOOK_PLAYER_BROKEN_BLOCK, OnPlayerBrokenBlock)
	PluginManager:AddHook(cPluginManager.HOOK_BLOCK_TO_PICKUPS, OnBlockToPickups)

	LOG("Initialized " .. Plugin:GetName() .. " v" .. Plugin:GetVersion())
	return true;
end

function OnPlayerBrokenBlock(Player, BlockX, BlockY, BlockZ, BlockFace, BlockType, BlockMeta)
	HeldItem = Player:GetEquippedItem();
	HeldItemType = HeldItem.m_ItemType;
	World = Player:GetWorld()
	if (Player:GetGameMode() == 0) then
		if (BlockType == E_BLOCK_COAL_ORE) then
			if (HeldItemType == E_ITEM_WOODEN_PICKAXE) or (HeldItemType == E_ITEM_STONE_PICKAXE) or (HeldItemType == E_ITEM_IRON_PICKAXE) or (HeldItemType == E_ITEM_DIAMOND_PICKAXE) then
			    World:SpawnExperienceOrb(BlockX, BlockY, BlockZ, math.random(0,2))
			end
		elseif (BlockType == E_BLOCK_DIAMOND_ORE) or (BlockType == E_BLOCK_ESMERALD_ORE) then
			if (HeldItemType == E_ITEM_IRON_PICKAXE) or (HeldItemType == E_ITEM_DIAMOND_PICKAXE) then
				World:SpawnExperienceOrb(BlockX, BlockY, BlockZ, math.random(3,7))
			end
		elseif (BlockType == E_BLOCK_LAPIS_ORE) then
			if (HeldItemType == E_ITEM_STONE_PICKAXE) or (HeldItemType == E_ITEM_IRON_PICKAXE) or (HeldItemType == E_ITEM_DIAMOND_PICKAXE) then
				World:SpawnExperienceOrb(BlockX, BlockY, BlockZ, math.random(2,5))
			end
		elseif (BlockType == E_BLOCK_NETHER_QUARTZ_ORE) then
			if (HeldItemType == E_ITEM_WOODEN_PICKAXE) or (HeldItemType == E_ITEM_STONE_PICKAXE) or (HeldItemType == E_ITEM_IRON_PICKAXE) or (HeldItemType == E_ITEM_DIAMOND_PICKAXE) then
				World:SpawnExperienceOrb(BlockX, BlockY, BlockZ, math.random(2,5))
			end
		elseif (BlockType == E_BLOCK_REDSTONE_ORE) or (BlockType == E_BLOCK_REDSTONE_ORE_GLOWING) then
			if (HeldItemType == E_ITEM_IRON_PICKAXE) or (HeldItemType == E_ITEM_DIAMOND_PICKAXE) then
				PWorld:SpawnExperienceOrb(BlockX, BlockY, BlockZ, math.random(1,5))
			end
		elseif (BlockType == E_BLOCK_MOSTER_SPAWNER) then
			World:SpawnExperienceOrb(BlockX, BlockY, BlockZ, math.random(15,43))
		end
	end
end

function OnBlockToPickups(World, Digger, BlockX, BlockY, BlockZ, BlockType, BlockMeta, Pickups)
	if (Digger == nil) then
		return false
	end
	
	if (BlockType == E_BLOCK_NETHER_QUARTZ_ORE) then
	    Pickups:Clear();
	    Pickups:Add(cItem(E_ITEM_NETHER_QUARTZ));	
	end
