-- | Services |

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local ServerStorage = game:GetService("ServerStorage");

-- | Variables |

local MemberList = {
	-- | Add here your custom members.

	SharedFolders = {
		["Configurations"] = ReplicatedStorage.FenixFramework.SharedModules.Utilities.Configurations;
		["SharedModules"] = ReplicatedStorage.FenixFramework.SharedModules;
	};

	Communication = {
		["getRemote"] = function(ModuleSelf: table, RemoteName: string)
			assert(typeof(RemoteName) == "string", "FenixFramework | RemoteName parameter of getRemote is not valid.");

			return ReplicatedStorage.FenixFramework.Remotes:FindFirstChild(RemoteName);
		end;
	};
};

-- | Main Code |

return MemberList;