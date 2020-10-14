-- | Services |

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local ServerStorage = game:GetService("ServerStorage");

-- | Variables |

local ManualClientModules = ServerStorage.FenixFramework.ManualServerModules;
local Core = require(ReplicatedStorage.FenixFramework.SharedModules.Core.Core);
local ServerModules = ServerStorage.FenixFramework.ServerModules;
local MemberList = require(script.ServerGlobalMembers);

-- | Main Code |

for _, ModuleInstance in pairs(ManualClientModules:GetDescendants()) do
	if (ModuleInstance.Name ~= "ServerModuleBase" and ModuleInstance:IsA("ModuleScript")) then
		Core:load(ModuleInstance, MemberList);
	end;
end;

for _, ModuleInstance in pairs(ServerModules:GetDescendants()) do
	if (ModuleInstance.Name ~= "ServerModuleBase" and ModuleInstance:IsA("ModuleScript")) then
		Core:load(ModuleInstance, MemberList);
	end;
end;