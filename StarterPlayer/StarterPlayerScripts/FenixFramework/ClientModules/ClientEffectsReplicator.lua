-- | Services |

local ReplicatedStorage = game:GetService("ReplicatedStorage");

-- | Variables |

local Module = {};

-- | Main Code |

function Module.main()
	--| Run after GlobalMembers are loaded. Runs once.
	
	local ClientReplicatorRemote = Module.Communication:getRemote("ClientReplicator");
	ClientReplicatorRemote.OnClientEvent:Connect(function(Player: Player, EffectModule: ModuleScript, ...)
		assert(EffectModule ~= nil, "FenixFramework | Something bad happened at ClientReplicatorRemote (OnClientEvent). EffectModule is nil.");
		assert(Player ~= nil, "FenixFramework | Something bad happened at ClientReplicatorRemote (OnClientEvent). Player is nil.");

		coroutine.wrap(function(...)
			require(EffectModule).main(Player, ...);
		end)(...);
	end);
end;

return Module;