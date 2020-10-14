-- | Services |

local ReplicatedStorage = game:GetService("ReplicatedStorage");

-- | Variables |

local Module = {};

-- | Main Code |

function Module.main()
	--| Run after GlobalMembers are loaded. Runs once.
	
	local ClientReplicator = Module.Communication:registerRemote("ClientReplicator");
	ClientReplicator.OnServerEvent:Connect(function(Player: Player, ModuleName: string, ...)
		assert(typeof(ModuleName) == "string", "FenixFramework | ModuleName parameter of 'ClientReplicator:FireServer' is not a valid string.");

		local EffectModule = Module.SharedFolders.SharedModules.Utilities.ClientEffects:FindFirstChild(ModuleName, true);
		assert(EffectModule ~= nil, "FenixFramework | EffectModule was not found!");

		local EffectTable = require(EffectModule);
		assert(EffectTable ~= nil, "FenixFramework | EffectModule did not return a valid table!");

		if (EffectTable:checkRequirements(Player)) then
			ClientReplicator:FireAllClients(Player, EffectModule, ...);
		end;
	end);
end;

return Module;