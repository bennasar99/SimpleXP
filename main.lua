function Initialize(Plugin)
	Plugin:SetName("SimpleXP");
	Plugin:SetVersion(1);
	
	PluginManager = cRoot:Get():GetPluginManager();
	PluginManager:AddHook(cPluginManager.HOOK_PLAYER_BROKEN_BLOCK, OnPlayerBrokenBlock)

	LOG("Initialized " .. Plugin:GetName() .. " v" .. PLUGIN:GetVersion())
	return true;
end

function OnPlayerBrokenBlock(Player, BlockX, BlockY, BlockZ, BlockFace, BlockType, BlockMeta)
	if Player:GetGameMode() == 0 then
		if (BlockType == 16) then
			Player:DeltaExperience(math.random(0,2))
		end
		if (BlockType == 56) or (BlockType == 129) then
			Player:DeltaExperience(math.random(3,7))
		end
		if (BlockType == 73) or (BlockType == 74) then
			Player:DeltaExperience(math.random(2,5))
		end
		if (BlockType == 52) then
			Player:DeltaExperience(math.random(15,43))
		end
	end
end
