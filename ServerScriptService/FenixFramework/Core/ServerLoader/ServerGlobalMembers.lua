-- | Services |

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local ServerStorage = game:GetService("ServerStorage");

-- | Variables |

local MemberList = {
	-- | Add here your custom members.

	Communication = {
		["registerRemote"] = function(ModuleSelf: table, RemoteName: string)
			assert(typeof(RemoteName) == "string", "FenixFramework | RemoteName parameter of registerRemote is not valid.");

			local RemoteEvent = Instance.new("RemoteEvent");
			RemoteEvent.Name = RemoteName;

			RemoteEvent.Parent = ReplicatedStorage.FenixFramework.Remotes;

			return RemoteEvent;
		end;
	};

	ServerFolders = {
		ManualServerModules = ServerStorage.FenixFramework.ManualServerModules;
	};
};

-- | Main Code |

return MemberList;
