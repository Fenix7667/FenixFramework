--| Services |

local RunService = game:GetService("RunService");

--| Variables |

local PreloadedAnimations = {};
local Module = {};

--| Main Code |

function Module:preloadAnimation(AnimationInstance: AnimationInstance, HumanoidInstance: Humanoid)
	assert(AnimationInstance ~= nil, "FenixFramework | AnimationInstance is nil!");
	assert(HumanoidInstance ~= nil, "FenixFramework | HumanoidInstance is nil!");

	local AnimationTrack = PreloadedAnimations[AnimationInstance];
	if (not AnimationTrack) then
		AnimationTrack = HumanoidInstance:LoadAnimation(AnimationInstance);
		PreloadedAnimations[AnimationInstance] = AnimationTrack;
	end;

	return AnimationTrack;
end;

function Module:getPreloadedAnimations()
	return PreloadedAnimations;
end;

return Module;