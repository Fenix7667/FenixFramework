--  Services |

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Players = game:GetService("Players");

--| Variables |

local Player = Players.LocalPlayer;

local Core = require(ReplicatedStorage.FenixFramework.SharedModules.Core.Core);
local ClientModules = Player.PlayerScripts.FenixFramework.ClientModules;
local MemberList = require(script.LocalGlobalMembers);

--| Main Code |

for _, ModuleInstance in pairs(ClientModules:GetDescendants()) do
	if (ModuleInstance.Name ~= "ClientModuleBase" and ModuleInstance:IsA("ModuleScript")) then
		Core:load(ModuleInstance, MemberList);
	end;
end;