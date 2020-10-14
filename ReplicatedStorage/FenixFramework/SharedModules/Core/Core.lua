--| Services |

local RunService = game:GetService("RunService");

--| Variables |

local SharedGlobalMembers = script.Parent.SharedGlobalMembers;
local SharedGlobalMembersModule = require(SharedGlobalMembers);
local SharedModules = script.Parent.Parent;
local Core = {};

--| Main Code |

for _, Module in pairs(SharedModules:GetDescendants()) do
	if (Module:IsA("ModuleScript") and Module.Parent ~= script.Parent) then
		local ModuleTable = require(Module);

		for Index, Member in pairs(SharedGlobalMembersModule) do
			if (Member) then
				ModuleTable[Index] = Member;
			end;
		end;
	end;
end;

function Core:load(ModuleInstance: ModuleScript, MemberList: table)
	local Module = require(ModuleInstance);

	for Index, Member in pairs(SharedGlobalMembersModule) do
		if (Member) then
			Module[Index] = Member;
		end;
	end;

	for Index, Member in pairs(MemberList) do
		if (Member) then
			Module[Index] = Member;
		end;
	end;
	
	if (Module.onHeartbeat) then
		RunService.Heartbeat:Connect(Module.onHeartbeat);
	end;
	
	if (Module.main) then
		Module.main();
	end;
end;

return Core;