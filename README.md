# FenixFramework
My personal framework for Roblox development. This framework was designed into flexibility. It allow custom methods to your modules, custom hierarchy and more!
I made this to make my life easier while developing on Roblox.

This framework has 3 categories:

Client
Server
Shared

Client Sided modules has access to methods like:
```lua
Module:getRemote();
```
While server has access to server-sided methods such as:
```lua
Module:registerRemote();
Module:getRemote();
```

Shared has access to it's own methods.

# Difference between ManualModules and Normal FrameworkModules:

ManualModules **DOES NOT** get GlobalMembers. ManualClientModules are intended to support modules that are not intended to work with this Framework.

# Custom methods

To add custom methods you need go to a file called `[InsertCategoryHere]GlobalMethods` example: `SharedGlobalMethods`
default SharedGlobalMethods file:

```lua
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
```
The global methods allow you to do your own global hierarchy, methods and more! Example:

```lua
SharedModule.SharedFolders.Configurations
SharedModule.Communication:getRemote()
```

SharedGlobalMembers will also be present on Server Sided & Client Sided FrameworkModules.

# Example Module:

```lua
-- | Services |

local ReplicatedStorage = game:GetService("ReplicatedStorage");

-- | Variables |

local Module = {};

-- | Main Code |

function Module.main()
	--| Run after GlobalMembers are loaded. Runs once.
	
	
end;

function Module.onHeartbeat()
	--| Run every heartbeat. If you don't wan't use this function you can remove it.
	
	
end;

return Module;
```

# Observations:

```
1 - This Framework will run ALL FrameworkModules when the game initialize. This is done to allow GlobalMembers exist. If you do not wish to run it when the game initializes you should take a look on ManualModules.
2 - It's not recommended you to change the Core files.
```
If you have any question, please dm me at Discord. Fenix#0077.

# Thanks for reading till here.
I hope you find this Framework useful on your Roblox development!
