-- | Services |

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Players = game:GetService("Players");

-- | Variables |

local Player = Players.LocalPlayer;

local MemberList = {
	-- | Add here your custom members.

	ClientFolders = {
		ManualClientModules = Player.PlayerScripts.FenixFramework.ManualClientModules;
		Effects = ReplicatedStorage.Effects;
	};
};

-- | Main Code |

return MemberList;