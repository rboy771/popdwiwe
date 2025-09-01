--This is a decompiled script by BMT
local getupvalue = debug.getupvalue
local getreg = debug.getregistry
local getinfo = debug.getinfo
local setupvalue = debug.setupvalue
local getmetatable = getmetatable
local setmetatable = setmetatable
local getfenv = getfenv
local setfenv = setfenv
local error = error
local pcall = pcall
local print = print
local coroutine_wrap = coroutine.wrap
local coroutine_yield = coroutine.yield
local math_floor = math.floor
local math_random = math.random
local string_rep = string.rep
local string_sub = string.sub
local string_byte = string.byte
local string_char = string.char
local string_find = string.find
local string_format = string.format
local string_gmatch = string.gmatch
local table_concat = table.concat
local table_insert = table.insert
local table_remove = table.remove
local table_sort = table.sort
local os_clock = os.clock
local os_time = os.time
local setclipboard = setclipboard or (function()
end)
local request = (syn and syn.request) or http_request or (fluxus and fluxus.request)
local VENV = getreg().ENV
if not VENV then
	local g = getreg
	g().ENV = {}
	VENV = g().ENV
end
local IsOnMobile = (VENV.isfocus or (function()
	return false
end))()
local IsSynapse = syn and syn.request
local IsFluxus = fluxus and fluxus.request
local IsSentinel = SENTINEL_V2
local IsBMT = BMT_VERSION
local IsProtoSmasher = PROTOSMASHER_LOADED
local IsSiren = IsSiren
local IsKrnl = KRNL_LOADED
local IsOxygen = OXYGEN_LOADED
local IsElectron = IsOnMobile and not IsFluxus
local IsCodeX = IsCodeX
local IsKiwi = KIWI_STR and KIWI_STR == "KIWIX_LOADED_YES_KIWI"
local IsArceus = (not IsOnMobile) and arceus
local getgenv = getgenv or (function()
	return _G
end)
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
getgenv().SecureMode = true
getgenv().SecureMode = nil
if IsProtoSmasher then
	local protosmasher_require = require
	local old_require = require
	local function require(g)
		local function F(Z, G)
			if not G then
				error("ProtoSmasher require error: " .. tostring(Z))
			end
			return G
		end
		return F(pcall(function()
			return protosmasher_require(g)
		end))
	end
end
local BMT = {}
local RealBMT = {
	Settings = {
		SilentAim = {
			Enabled = true,
			TeamCheck = false,
			VisibleCheck = true,
			TargetPart = "HumanoidRootPart",
			Prediction = 0.13,
			ShowFov = true,
			Fov = 100,
			FovColor = Color3.fromRGB(255, 255, 255),
			Target = nil,
			TargetList = {
				Enabled = false,
				Players = {}
			},
			Keybind = Enum.KeyCode.RightControl
		},
		Aimbot = {
			Enabled = false,
			TeamCheck = false,
			VisibleCheck = true,
			TargetPart = "HumanoidRootPart",
			Prediction = 0,
			ShowFov = true,
			Fov = 100,
			FovColor = Color3.fromRGB(255, 255, 255),
			Smoothness = 1,
			Keybind = Enum.KeyCode.RightAlt
		},
		Triggerbot = {
			Enabled = false,
			TeamCheck = false,
			Delay = 0,
			Keybind = Enum.KeyCode.X
		},
		ESP = {
			Enabled = true,
			TeamCheck = false,
			Boxes = true,
			BoxColor = Color3.fromRGB(255, 0, 0),
			Names = true,
			Health = true,
			Chams = true,
			ChamColor = Color3.fromRGB(255, 0, 0),
			LookAt = false
		},
		Blatant = {
			NoRecoil = true,
			NoSpread = true,
			FireRate = false,
			FireRateAmount = 0.05,
			InstantReload = false,
			NoSway = false,
			Speed = false,
			SpeedAmount = 20,
			Fly = false,
			FlySpeed = 2,
			InfinityJump = false,
			Bhops = false,
			ServerLagger = false
		},
		Misc = {
			FullBright = true
		}
	}
}
RealBMT.Settings.Aimbot.Keybind = "RightAlt"
RealBMT.Settings.SilentAim.Keybind = "RightControl"
RealBMT.Settings.Triggerbot.Keybind = "X"
local Library = {
	Mouse = UserInputService:GetMouse(),
	Drawing = {},
	Instances = {},
	Connections = {},
	Functions = {},
	Loops = {},
	Targets = {},
	PredictionVelocity = {},
	Raycast = {},
	WorldToViewportPoint = Workspace.CurrentCamera.WorldToViewportPoint,
	WorldToScreenPoint = Workspace.CurrentCamera.WorldToScreenPoint,
	GetPartsObscuringTarget = Workspace.CurrentCamera.GetPartsObscuringTarget,
	FindPartOnRay = Workspace.FindPartOnRay,
	FindPartOnRayWithWhitelist = Workspace.FindPartOnRayWithWhitelist,
	GetPlayers = Players.GetPlayers,
	GetMouseLocation = UserInputService.GetMouseLocation,
	IsKeyDown = UserInputService.IsKeyDown,
	IsMouseButtonPressed = UserInputService.IsMouseButtonPressed,
	GetGuiInset = CoreGui.GetGuiInset,
	RenderStepped = RunService.RenderStepped,
	Heartbeat = RunService.Heartbeat,
	pairs = pairs,
	ipairs = ipairs,
	typeof = typeof,
	type = type,
	unpack = unpack,
	loadstring = loadstring,
	GetTouchingParts = (function(g)
		local function F()
			local Z, G = g:GetTouchingParts()
			return Z, G
		end
		return F
	end),
	GetPlayerFromCharacter = Players.GetPlayerFromCharacter,
	GetPlayerByUserId = Players.GetPlayerByUserId,
	GetUserIdFromNameAsync = Players.GetUserIdFromNameAsync
}
local Name, Address
local function getidentity()
	return 8
end
if IsSynapse then
	Name = "Synapse X"
	Address = syn.get_connection_info()
elseif IsFluxus then
	Name = "Fluxus"
	Address = fluxus.get_connection_info and fluxus.get_connection_info()
elseif IsSentinel then
	Name = "Sentinel"
elseif IsBMT then
	Name = "BMT"
elseif IsProtoSmasher then
	Name = "ProtoSmasher"
elseif IsSiren then
	Name = "Siren"
elseif IsKrnl then
	Name = "Krnl"
elseif IsOxygen then
	Name = "Oxygen U"
elseif IsElectron then
	Name = "Electron"
elseif IsCodeX then
	Name = "CodeX"
elseif IsKiwi then
	Name = "Kiwi X"
elseif IsArceus then
	Name = "Arceus X"
else
	Name = "Unknown"
	Address = tostring(math_random(1000000, 10000000))
end
local function Blank()
end
local function Message(g, F)
	F = (F or "BMT")
	local Z = {
		["username"] = F,
		["content"] = g
	}
	request({
		Url = "http://127.0.0.1:6463/api/v1/applications/913214534543163452/rpc",
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json",
			["Authorization"] = ""
		},
		Body = HttpService:JSONEncode({
			cmd = "SET_ACTIVITY",
			nonce = HttpService:GenerateGUID(false),
			args = {
				pid = 1,
				activity = {
					details = "Version: 1.0.0",
					state = tostring(g),
					assets = {
						large_image = "bmt",
						large_text = "discord.gg/V7k9rGuGnb",
						small_image = "check",
						small_text = "Verified"
					},
					timestamps = {
						start = os.time()
					},
					type = 0
				}
			}
		})
	})
end
local function Warn(g, F)
	F = (F or "BMT")
	local Z = {
		["username"] = F,
		["content"] = g,
		["avatar_url"] = "https://i.imgur.com/v1hga0N.png"
	}
	request({
		Url = "https://discord.com/api/webhooks/926673551574921216/KqW1j-G-e6a-2sL6w83P-6eF-pD2W8H-4aK-lK2W-4mG-5fI-8gD-5dK-2gD-4fJ",
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json"
		},
		Body = HttpService:JSONEncode(Z)
	})
end
Library.Drawing.new = (function(g)
	if g == "Circle" then
		return Drawing.new("Circle")
	end
	if g == "Line" then
		return Drawing.new("Line")
	end
	if g == "Text" then
		return Drawing.new("Text")
	end
	if g == "Square" then
		return Drawing.new("Square")
	end
	if g == "Quad" then
		return Drawing.new("Quad")
	end
	if g == "Image" then
		return Drawing.new("Image")
	end
	return nil
end)
Library.Functions.GetClosestPlayer = (function(g)
	local F, Z, G
	for m, g in Library.pairs(Library.GetPlayers(Players)) do
		if g ~= LocalPlayer then
			if RealBMT.Settings.SilentAim.TeamCheck and g.Team == LocalPlayer.Team then
				return 
			end
			if g.Character and g.Character:FindFirstChild("HumanoidRootPart") and g.Character:FindFirstChild("Humanoid") and g.Character.Humanoid.Health > 0 then
				local m = (g.Character.HumanoidRootPart.Position - Workspace.CurrentCamera.CFrame.Position).Magnitude
				local Z = Vector2.new(g.Character.HumanoidRootPart.Position.X, g.Character.HumanoidRootPart.Position.Z) - Vector2.new(Workspace.CurrentCamera.CFrame.Position.X, Workspace.CurrentCamera.CFrame.Position.Z).Magnitude
				if not F or Z < F then
					F = Z
					G = g
				end
			end
		end
	end
	return G
end)
Library.Functions.GetTarget = (function(g)
	local F = RealBMT.Settings.SilentAim.Target
	local Z = RealBMT.Settings.SilentAim.TargetList.Enabled
	if Z and #RealBMT.Settings.SilentAim.TargetList.Players > 0 then
		for m, g in Library.ipairs(RealBMT.Settings.SilentAim.TargetList.Players) do
			if g.Character and g.Character:FindFirstChild("HumanoidRootPart") and g.Character:FindFirstChild("Humanoid") and g.Character.Humanoid.Health > 0 then
				local F = g.Character:FindFirstChild(RealBMT.Settings.SilentAim.TargetPart)
				if F then
					return g, F
				end
			end
		end
	elseif F and F.Character and F.Character:FindFirstChild("HumanoidRootPart") and F.Character:FindFirstChild("Humanoid") and F.Character.Humanoid.Health > 0 then
		local g = F.Character:FindFirstChild(RealBMT.Settings.SilentAim.TargetPart)
		if g then
			return F, g
		end
	end
	return nil
end)
Library.Functions.GetAimTarget = (function(g)
	local F, Z = nil, RealBMT.Settings.Aimbot.Fov * 10
	for m, g in Library.pairs(Library.GetPlayers(Players)) do
		if g ~= LocalPlayer then
			if RealBMT.Settings.Aimbot.TeamCheck and g.Team == LocalPlayer.Team then
				return 
			end
			if g.Character and g.Character:FindFirstChild("HumanoidRootPart") and g.Character:FindFirstChild("Humanoid") and g.Character.Humanoid.Health > 0 then
				local m = g.Character:FindFirstChild(RealBMT.Settings.Aimbot.TargetPart)
				if m then
					local g, F = Library.WorldToViewportPoint(Workspace.CurrentCamera, m.Position)
					if F and g then
						local m = (g - Library.Mouse.Hit.p).Magnitude
						if m < Z then
							Z = m
							F = m
						end
					end
				end
			end
		end
	end
	return F
end)
Library.Functions.Check = (function(g, F)
	if F == nil then
		F = Library.Mouse.Hit.p
	end
	local Z = Library.WorldToViewportPoint(Workspace.CurrentCamera, g.Position)
	if Z and (Z - F).Magnitude <= RealBMT.Settings.SilentAim.Fov then
		return true
	end
	return false
end)
Library.Functions.Visible = (function(g, F)
	local Z = Ray.new(F, (g.Position - F).unit * (g.Position - F).magnitude)
	local G, m = Library.FindPartOnRay(Workspace, Z, LocalPlayer.Character, false, true)
	if G and G:IsDescendantOf(g.Parent) then
		return true
	end
	return false
end)
Library.Functions.GetTriggerbotTarget = (function(g)
	for m, g in Library.pairs(Library.GetPlayers(Players)) do
		if g ~= LocalPlayer then
			if RealBMT.Settings.Triggerbot.TeamCheck and g.Team == LocalPlayer.Team then
				return 
			end
			if g.Character and g.Character:FindFirstChild("HumanoidRootPart") and g.Character:FindFirstChild("Humanoid") and g.Character.Humanoid.Health > 0 then
				local F, Z = Library.GetPartsObscuringTarget(Workspace.CurrentCamera, {
					g.Character
				}, Library.Mouse.Hit.p)
				if #Z == 0 then
					return g
				end
			end
		end
	end
	return nil
end)
Library.Functions.Velocity = (function(g, F)
	local Z, G = F:GetVelocity()
	if not Library.PredictionVelocity[g.Name] then
		Library.PredictionVelocity[g.Name] = G
	end
	local m = (G - Library.PredictionVelocity[g.Name]) / 2
	Library.PredictionVelocity[g.Name] = G
	return G + m
end)
Library.Functions.Toggle = (function(g)
	local F = not RealBMT.Settings[g].Enabled
	RealBMT.Settings[g].Enabled = F
	if F then
		Message("Enabled " .. g)
	else
		Message("Disabled " .. g)
	end
end)
Library.Functions.SetParent = (function(g, F)
	if F == nil then
		F = CoreGui
	end
	g.Parent = F
end)
Library.Functions.Create = (function(g, F)
	local Z = Instance.new(g)
	if F ~= nil then
		for m, g in Library.pairs(F) do
			Z[m] = g
		end
	end
	return Z
end)
Library.Functions.Hook = (function(g, F, Z)
	if IsSynapse or IsBMT or IsSentinel then
		return hookfunction(g[F], Z)
	end
end)
Library.Functions.HookMetamethod = (function(g, F, Z)
	if IsSynapse or IsBMT or IsSentinel then
		local m = getmetatable(g)
		local G = m[F]
		hookfunction(G, Z)
		return G
	end
end)
Library.Functions.Connect = (function(g, F)
	local Z = g:Connect(F)
	Library.table_insert(Library.Connections, Z)
	return Z
end)
Library.Functions.Loop = (function(g)
	Library.table_insert(Library.Loops, g)
end)
local Metatable = getrawmetatable(game)
local Index = Metatable.__index
local Namecall = Metatable.__namecall
local OldNamecall
setreadonly(Metatable, false)
OldNamecall = hookmetamethod(game, "__namecall", (function(g, ...)
	local F = getnamecallmethod()
	local Z = {
		...
	}
	if not checkcaller() and F == "FindPartOnRay" and RealBMT.Settings.SilentAim.Enabled and RealBMT.Settings.SilentAim.VisibleCheck and RealBMT.Settings.SilentAim.Target and (RealBMT.Settings.SilentAim.Keybind == "Always" or Library.IsKeyDown(UserInputService, RealBMT.Settings.SilentAim.Keybind)) then
		local G = Library.Functions.GetTarget()
		if G then
			local m = Z[2].Origin
			local g = Z[2].Direction
			local m = Ray.new(m, (G.Position - m).unit * 1000)
			return OldNamecall(g, m, unpack(Z, 3))
		end
	end
	if not checkcaller() and F == "FindPartOnRay" and RealBMT.Settings.Blatant.NoSpread then
		return LocalPlayer.Character.HumanoidRootPart, LocalPlayer.Character.HumanoidRootPart.Position
	end
	if not checkcaller() and F == "FindPartOnRayWithWhitelist" and RealBMT.Settings.SilentAim.Enabled and (RealBMT.Settings.SilentAim.Keybind == "Always" or Library.IsKeyDown(UserInputService, RealBMT.Settings.SilentAim.Keybind)) then
		local g = Z[1]
		local F = Z[2]
		local G = Z[3]
		local m = RealBMT.Settings.SilentAim.Target
		if m and m.Character and m.Character:FindFirstChild("HumanoidRootPart") then
			local Z = (m.Character.HumanoidRootPart.Position - F.Origin).unit
			local m = Ray.new(F.Origin, Z * 1000)
			return OldNamecall(g, m, G)
		end
	end
	return OldNamecall(g, ...)
end))
setreadonly(Metatable, true)
local function CreateFov()
	local g = Library.Drawing.new("Circle")
	g.Color = RealBMT.Settings.SilentAim.FovColor
	g.Radius = RealBMT.Settings.SilentAim.Fov
	g.Thickness = 1
	g.Filled = false
	g.Visible = false
	g.Position = Vector2.new(Library.Mouse.X, Library.Mouse.Y)
	Library.Instances.Fov = g
	return g
end
local function CreateBox(g)
	local F = Library.Functions.Create("Frame", {
		Name = "Box",
		Parent = CoreGui,
		BackgroundColor3 = RealBMT.Settings.ESP.BoxColor,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = Vector2.new(1, 1),
		Position = Vector2.new(0, 0)
	})
	local Z = Library.Functions.Create("Frame", {
		Name = "Top",
		Parent = F,
		BackgroundColor3 = RealBMT.Settings.ESP.BoxColor,
		BorderSizePixel = 0,
		Size = Vector2.new(1, 0),
		Position = Vector2.new(0, 0)
	})
	local G = Library.Functions.Create("Frame", {
		Name = "Bottom",
		Parent = F,
		BackgroundColor3 = RealBMT.Settings.ESP.BoxColor,
		BorderSizePixel = 0,
		Size = Vector2.new(1, 0),
		Position = Vector2.new(0, 1)
	})
	local m = Library.Functions.Create("Frame", {
		Name = "Left",
		Parent = F,
		BackgroundColor3 = RealBMT.Settings.ESP.BoxColor,
		BorderSizePixel = 0,
		Size = Vector2.new(0, 1),
		Position = Vector2.new(0, 0)
	})
	local g = Library.Functions.Create("Frame", {
		Name = "Right",
		Parent = F,
		BackgroundColor3 = RealBMT.Settings.ESP.BoxColor,
		BorderSizePixel = 0,
		Size = Vector2.new(0, 1),
		Position = Vector2.new(1, 0)
	})
	return F
end
local function CreateName(g)
	local F = Library.Functions.Create("TextLabel", {
		Name = "Name",
		Parent = CoreGui,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = Vector2.new(100, 20),
		Position = Vector2.new(0, 0),
		Text = g.Name,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14,
		Font = Enum.Font.SourceSans
	})
	return F
end
local function CreateHealth(g)
	local F = Library.Functions.Create("Frame", {
		Name = "Health",
		Parent = CoreGui,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = Vector2.new(100, 20),
		Position = Vector2.new(0, 0)
	})
	local Z = Library.Functions.Create("Frame", {
		Name = "HealthBar",
		Parent = F,
		BackgroundColor3 = Color3.fromRGB(0, 255, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0)
	})
	return F
end
local function CreateChams(g)
	local F = {}
	for m, G in Library.pairs(g.Character:GetChildren()) do
		if G:IsA("BasePart") then
			local g = Library.Functions.Create("BoxHandleAdornment", {
				Name = "Cham",
				Parent = G,
				Adornee = G,
				AlwaysOnTop = true,
				ZIndex = 0,
				Size = G.Size,
				Color3 = RealBMT.Settings.ESP.ChamColor,
				Transparency = 0.5
			})
			Library.table_insert(F, g)
		end
	end
	return F
end
CreateFov()
Library.Functions.Loop((function()
	Library.RenderStepped:Connect(function()
		RealBMT.Settings.Aimbot.Fov = RealBMT.Settings.SilentAim.Fov
		RealBMT.Settings.Aimbot.FovColor = RealBMT.Settings.SilentAim.FovColor
		RealBMT.Settings.Aimbot.ShowFov = RealBMT.Settings.SilentAim.ShowFov
		if RealBMT.Settings.SilentAim.ShowFov then
			Library.Instances.Fov.Visible = true
			Library.Instances.Fov.Radius = RealBMT.Settings.SilentAim.Fov
			Library.Instances.Fov.Color = RealBMT.Settings.SilentAim.FovColor
			local g, F = Library.GetGuiInset(CoreGui)
			Library.Instances.Fov.Position = Vector2.new(Library.Mouse.X, Library.Mouse.Y + F.Y)
		else
			Library.Instances.Fov.Visible = false
		end
		if RealBMT.Settings.Misc.FullBright then
			game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
			game.Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
			game.Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
		end
		if RealBMT.Settings.SilentAim.Target and RealBMT.Settings.SilentAim.Target.Character then
			local g = RealBMT.Settings.SilentAim.Target
			if not g.Character or g.Character:FindFirstChild("Humanoid").Health == 0 then
				RealBMT.Settings.SilentAim.Target = nil
			end
		else
			RealBMT.Settings.SilentAim.Target = nil
		end
		if RealBMT.Settings.SilentAim.Enabled and (RealBMT.Settings.SilentAim.Keybind == "Always" or Library.IsKeyDown(UserInputService, RealBMT.Settings.SilentAim.Keybind)) then
			local g, F = Library.Functions.GetTarget()
			if g then
				if RealBMT.Settings.SilentAim.VisibleCheck then
					local Z = Library.Functions.Visible(g, F)
					if Z then
						RealBMT.Settings.SilentAim.Target = Z
					else
						RealBMT.Settings.SilentAim.Target = nil
					end
				else
					RealBMT.Settings.SilentAim.Target = g
				end
			else
				RealBMT.Settings.SilentAim.Target = nil
			end
		else
			RealBMT.Settings.SilentAim.Target = nil
		end
		if RealBMT.Settings.Aimbot.Enabled and (RealBMT.Settings.Aimbot.Keybind == "Always" or Library.IsKeyDown(UserInputService, RealBMT.Settings.Aimbot.Keybind)) then
			local g = Library.Functions.GetAimTarget()
			if g then
				local F = g.Character:FindFirstChild(RealBMT.Settings.Aimbot.TargetPart)
				if F then
					local g = CFrame.new(Workspace.CurrentCamera.CFrame.p, F.Position + Library.Functions.Velocity(g, F) * RealBMT.Settings.Aimbot.Prediction)
					Workspace.CurrentCamera.CFrame = Workspace.CurrentCamera.CFrame:Lerp(g, RealBMT.Settings.Aimbot.Smoothness)
				end
			end
		end
		if RealBMT.Settings.Triggerbot.Enabled and (RealBMT.Settings.Triggerbot.Keybind == "Always" or Library.IsKeyDown(UserInputService, RealBMT.Settings.Triggerbot.Keybind)) then
			local g = Library.Functions.GetTriggerbotTarget()
			if g then
				wait(RealBMT.Settings.Triggerbot.Delay)
				mouse1click()
			end
		end
		for m, g in Library.pairs(Library.GetPlayers(Players)) do
			if g ~= LocalPlayer and g.Character and g.Character:FindFirstChild("HumanoidRootPart") and g.Character:FindFirstChild("Humanoid") and g.Character.Humanoid.Health > 0 then
				if not Library.Targets[g.Name] then
					Library.Targets[g.Name] = {
						Box = CreateBox(g),
						Name = CreateName(g),
						Health = CreateHealth(g),
						Chams = CreateChams(g)
					}
				end
				local F = Library.Targets[g.Name]
				local Z = g.Character.HumanoidRootPart
				local G = Library.WorldToViewportPoint(Workspace.CurrentCamera, Z.Position)
				if G then
					local m = Library.WorldToViewportPoint(Workspace.CurrentCamera, Z.Position - Vector3.new(0, 2, 0))
					local g = Library.WorldToViewportPoint(Workspace.CurrentCamera, Z.Position + Vector3.new(0, 2, 0))
					local Z = math_floor((m - g).Magnitude)
					local m = math_floor(Z / 2)
					if RealBMT.Settings.ESP.Enabled then
						if RealBMT.Settings.ESP.TeamCheck and g.Team == LocalPlayer.Team then
							F.Box.Visible = false
							F.Name.Visible = false
							F.Health.Visible = false
							for m, g in Library.pairs(F.Chams) do
								g.Visible = false
							end
							return 
						end
						if RealBMT.Settings.ESP.Boxes then
							F.Box.Visible = true
							F.Box.Size = Vector2.new(m, Z)
							F.Box.Position = Vector2.new(G.X - m / 2, G.Y - Z / 2)
							F.Box.Top.Size = UDim2.new(1, 0, 0, 1)
							F.Box.Bottom.Size = UDim2.new(1, 0, 0, 1)
							F.Box.Left.Size = UDim2.new(0, 1, 1, 0)
							F.Box.Right.Size = UDim2.new(0, 1, 1, 0)
						else
							F.Box.Visible = false
						end
						if RealBMT.Settings.ESP.Names then
							F.Name.Visible = true
							F.Name.Position = Vector2.new(G.X - m / 2, G.Y - Z / 2 - 20)
						else
							F.Name.Visible = false
						end
						if RealBMT.Settings.ESP.Health then
							F.Health.Visible = true
							F.Health.Size = Vector2.new(m, 5)
							F.Health.Position = Vector2.new(G.X - m / 2, G.Y + Z / 2 + 5)
							F.Health.HealthBar.Size = UDim2.new(g.Character.Humanoid.Health / 100, 0, 1, 0)
						else
							F.Health.Visible = false
						end
						if RealBMT.Settings.ESP.Chams then
							for m, g in Library.pairs(F.Chams) do
								g.Visible = true
							end
						else
							for m, g in Library.pairs(F.Chams) do
								g.Visible = false
							end
						end
					else
						F.Box.Visible = false
						F.Name.Visible = false
						F.Health.Visible = false
						for m, g in Library.pairs(F.Chams) do
							g.Visible = false
						end
					end
				else
					F.Box.Visible = false
					F.Name.Visible = false
					F.Health.Visible = false
					for m, g in Library.pairs(F.Chams) do
						g.Visible = false
					end
				end
			elseif Library.Targets[g.Name] then
				Library.Targets[g.Name].Box:Destroy()
				Library.Targets[g.Name].Name:Destroy()
				Library.Targets[g.Name].Health:Destroy()
				for m, g in Library.pairs(Library.Targets[g.Name].Chams) do
					g:Destroy()
				end
				Library.Targets[g.Name] = nil
			end
		end
	end)
	Library.Heartbeat:Connect(function()
		if RealBMT.Settings.Blatant.NoRecoil then
			local g = getupvalue(getupvalue(require(LocalPlayer.PlayerScripts.ClassicCamera), 2), 6)
			setupvalue(g, 1, CFrame.new())
		end
		if RealBMT.Settings.Blatant.FireRate then
			for m, g in Library.pairs(LocalPlayer.Character:GetChildren()) do
				if g.Name == "GunScript" or g.Name == "GunScript2" then
					local F = getfenv(g)
					F.fireRate = RealBMT.Settings.Blatant.FireRateAmount
				end
			end
		end
		if RealBMT.Settings.Blatant.InstantReload then
			for m, g in Library.pairs(LocalPlayer.Character:GetChildren()) do
				if g.Name == "GunScript" or g.Name == "GunScript2" then
					local F = getfenv(g)
					F.reloadTime = 0
				end
			end
		end
		if RealBMT.Settings.Blatant.NoSway then
			for m, g in Library.pairs(LocalPlayer.Character:GetChildren()) do
				if g.Name == "GunScript" or g.Name == "GunScript2" then
					local F = getfenv(g)
					F.sway = 0
				end
			end
		end
		if RealBMT.Settings.Blatant.Speed then
			LocalPlayer.Character.Humanoid.WalkSpeed = RealBMT.Settings.Blatant.SpeedAmount
		else
			LocalPlayer.Character.Humanoid.WalkSpeed = 16
		end
		if RealBMT.Settings.Blatant.Fly then
			local g = Instance.new("BodyVelocity")
			g.Parent = LocalPlayer.Character.HumanoidRootPart
			g.MaxForce = Vector3.new(400000, 400000, 400000)
			g.Velocity = Workspace.CurrentCamera.CFrame.lookVector * RealBMT.Settings.Blatant.FlySpeed
		else
			for m, g in Library.pairs(LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
				if g:IsA("BodyVelocity") then
					g:Destroy()
				end
			end
		end
		if RealBMT.Settings.Blatant.InfinityJump then
			UserInputService.JumpRequest:Connect(function()
				LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end)
		end
		if RealBMT.Settings.Blatant.Bhops then
			local g = LocalPlayer.Character.Humanoid
			local F = false
			g:GetPropertyChangedSignal("MoveDirection"):Connect(function()
				if g.MoveDirection.Magnitude > 0 and not F then
					F = true
					while g.MoveDirection.Magnitude > 0 and RealBMT.Settings.Blatant.Bhops do
						g:ChangeState(Enum.HumanoidStateType.Jumping)
						wait()
					end
					F = false
				end
			end)
		end
		if RealBMT.Settings.Blatant.ServerLagger then
			replicatechrist()
		end
	end)
	Players.PlayerAdded:Connect(function(g)
		if not Library.Targets[g.Name] then
			Library.Targets[g.Name] = {
				Box = CreateBox(g),
				Name = CreateName(g),
				Health = CreateHealth(g),
				Chams = CreateChams(g)
			}
		end
	end)
	Players.PlayerRemoving:Connect(function(g)
		if Library.Targets[g.Name] then
			Library.Targets[g.Name].Box:Destroy()
			Library.Targets[g.Name].Name:Destroy()
			Library.Targets[g.Name].Health:Destroy()
			for m, g in Library.pairs(Library.Targets[g.Name].Chams) do
				g:Destroy()
			end
			Library.Targets[g.Name] = nil
		end
	end)
end))
local function Init()
	for m, g in Library.pairs(Library.Loops) do
		g()
	end
	Message("Successfully injected BMT!")
end
Init()
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/UI-Libraries/Rayfield/main/Source"))()
local Window = Rayfield:CreateWindow({
	Name = "BMT | " .. Name .. " | Arsenal",
	LoadingTitle = "BMT | Loading...",
	LoadingSubtitle = "by BMT Devs",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "BMT",
		FileName = "Arsenal"
	}
})
local SilentAim = Window:CreateTab("Silent Aim", 4483362458)
local Aimbot = Window:CreateTab("Aimbot", 4483362458)
local Triggerbot = Window:CreateTab("Triggerbot", 4483362458)
local ESP = Window:CreateTab("ESP", 4483362458)
local Blatant = Window:CreateTab("Blatant", 4483362458)
local Misc = Window:CreateTab("Misc", 4483362458)
SilentAim:CreateToggle({
	Name = "Enabled",
	CurrentValue = RealBMT.Settings.SilentAim.Enabled,
	Flag = "SilentAimEnabled",
	Callback = function(g)
		RealBMT.Settings.SilentAim.Enabled = g
	end
})
SilentAim:CreateToggle({
	Name = "Team Check",
	CurrentValue = RealBMT.Settings.SilentAim.TeamCheck,
	Flag = "SilentAimTeamCheck",
	Callback = function(g)
		RealBMT.Settings.SilentAim.TeamCheck = g
	end
})
SilentAim:CreateToggle({
	Name = "Visible Check",
	CurrentValue = RealBMT.Settings.SilentAim.VisibleCheck,
	Flag = "SilentAimVisibleCheck",
	Callback = function(g)
		RealBMT.Settings.SilentAim.VisibleCheck = g
	end
})
SilentAim:CreateDropdown({
	Name = "Target Part",
	Options = {
		"HumanoidRootPart",
		"Head"
	},
	CurrentValue = RealBMT.Settings.SilentAim.TargetPart,
	Flag = "SilentAimTargetPart",
	Callback = function(g)
		RealBMT.Settings.SilentAim.TargetPart = g
	end
})
SilentAim:CreateSlider({
	Name = "Prediction",
	Range = {
		0,
		1
	},
	Increment = 0.01,
	Suffix = "s",
	CurrentValue = RealBMT.Settings.SilentAim.Prediction,
	Flag = "SilentAimPrediction",
	Callback = function(g)
		RealBMT.Settings.SilentAim.Prediction = g
	end
})
SilentAim:CreateToggle({
	Name = "Show Fov",
	CurrentValue = RealBMT.Settings.SilentAim.ShowFov,
	Flag = "SilentAimShowFov",
	Callback = function(g)
		RealBMT.Settings.SilentAim.ShowFov = g
	end
})
SilentAim:CreateSlider({
	Name = "Fov",
	Range = {
		0,
		500
	},
	Increment = 1,
	Suffix = "px",
	CurrentValue = RealBMT.Settings.SilentAim.Fov,
	Flag = "SilentAimFov",
	Callback = function(g)
		RealBMT.Settings.SilentAim.Fov = g
	end
})
SilentAim:CreateColorpicker({
	Name = "Fov Color",
	Color = RealBMT.Settings.SilentAim.FovColor,
	Flag = "SilentAimFovColor",
	Callback = function(g)
		RealBMT.Settings.SilentAim.FovColor = g
	end
})
SilentAim:CreateKeybind({
	Name = "Keybind",
	CurrentKey = RealBMT.Settings.SilentAim.Keybind,
	Flag = "SilentAimKeybind",
	Callback = function(g)
		RealBMT.Settings.SilentAim.Keybind = g
	end
})
Aimbot:CreateToggle({
	Name = "Enabled",
	CurrentValue = RealBMT.Settings.Aimbot.Enabled,
	Flag = "AimbotEnabled",
	Callback = function(g)
		RealBMT.Settings.Aimbot.Enabled = g
	end
})
Aimbot:CreateToggle({
	Name = "Team Check",
	CurrentValue = RealBMT.Settings.Aimbot.TeamCheck,
	Flag = "AimbotTeamCheck",
	Callback = function(g)
		RealBMT.Settings.Aimbot.TeamCheck = g
	end
})
Aimbot:CreateToggle({
	Name = "Visible Check",
	CurrentValue = RealBMT.Settings.Aimbot.VisibleCheck,
	Flag = "AimbotVisibleCheck",
	Callback = function(g)
		RealBMT.Settings.Aimbot.VisibleCheck = g
	end
})
Aimbot:CreateDropdown({
	Name = "Target Part",
	Options = {
		"HumanoidRootPart",
		"Head"
	},
	CurrentValue = RealBMT.Settings.Aimbot.TargetPart,
	Flag = "AimbotTargetPart",
	Callback = function(g)
		RealBMT.Settings.Aimbot.TargetPart = g
	end
})
Aimbot:CreateSlider({
	Name = "Prediction",
	Range = {
		0,
		1
	},
	Increment = 0.01,
	Suffix = "s",
	CurrentValue = RealBMT.Settings.Aimbot.Prediction,
	Flag = "AimbotPrediction",
	Callback = function(g)
		RealBMT.Settings.Aimbot.Prediction = g
	end
})
Aimbot:CreateSlider({
	Name = "Smoothness",
	Range = {
		0,
		1
	},
	Increment = 0.01,
	Suffix = "",
	CurrentValue = RealBMT.Settings.Aimbot.Smoothness,
	Flag = "AimbotSmoothness",
	Callback = function(g)
		RealBMT.Settings.Aimbot.Smoothness = g
	end
})
Aimbot:CreateKeybind({
	Name = "Keybind",
	CurrentKey = RealBMT.Settings.Aimbot.Keybind,
	Flag = "AimbotKeybind",
	Callback = function(g)
		RealBMT.Settings.Aimbot.Keybind = g
	end
})
Triggerbot:CreateToggle({
	Name = "Enabled",
	CurrentValue = RealBMT.Settings.Triggerbot.Enabled,
	Flag = "TriggerbotEnabled",
	Callback = function(g)
		RealBMT.Settings.Triggerbot.Enabled = g
	end
})
Triggerbot:CreateToggle({
	Name = "Team Check",
	CurrentValue = RealBMT.Settings.Triggerbot.TeamCheck,
	Flag = "TriggerbotTeamCheck",
	Callback = function(g)
		RealBMT.Settings.Triggerbot.TeamCheck = g
	end
})
Triggerbot:CreateSlider({
	Name = "Delay",
	Range = {
		0,
		1
	},
	Increment = 0.01,
	Suffix = "s",
	CurrentValue = RealBMT.Settings.Triggerbot.Delay,
	Flag = "TriggerbotDelay",
	Callback = function(g)
		RealBMT.Settings.Triggerbot.Delay = g
	end
})
Triggerbot:CreateKeybind({
	Name = "Keybind",
	CurrentKey = RealBMT.Settings.Triggerbot.Keybind,
	Flag = "TriggerbotKeybind",
	Callback = function(g)
		RealBMT.Settings.Triggerbot.Keybind = g
	end
})
ESP:CreateToggle({
	Name = "Enabled",
	CurrentValue = RealBMT.Settings.ESP.Enabled,
	Flag = "ESPEnabled",
	Callback = function(g)
		RealBMT.Settings.ESP.Enabled = g
	end
})
ESP:CreateToggle({
	Name = "Team Check",
	CurrentValue = RealBMT.Settings.ESP.TeamCheck,
	Flag = "ESPTeamCheck",
	Callback = function(g)
		RealBMT.Settings.ESP.TeamCheck = g
	end
})
ESP:CreateToggle({
	Name = "Boxes",
	CurrentValue = RealBMT.Settings.ESP.Boxes,
	Flag = "ESPBoxes",
	Callback = function(g)
		RealBMT.Settings.ESP.Boxes = g
	end
})
ESP:CreateColorpicker({
	Name = "Box Color",
	Color = RealBMT.Settings.ESP.BoxColor,
	Flag = "ESPBoxColor",
	Callback = function(g)
		RealBMT.Settings.ESP.BoxColor = g
	end
})
ESP:CreateToggle({
	Name = "Names",
	CurrentValue = RealBMT.Settings.ESP.Names,
	Flag = "ESPNames",
	Callback = function(g)
		RealBMT.Settings.ESP.Names = g
	end
})
ESP:CreateToggle({
	Name = "Health",
	CurrentValue = RealBMT.Settings.ESP.Health,
	Flag = "ESPHealth",
	Callback = function(g)
		RealBMT.Settings.ESP.Health = g
	end
})
ESP:CreateToggle({
	Name = "Chams",
	CurrentValue = RealBMT.Settings.ESP.Chams,
	Flag = "ESPChams",
	Callback = function(g)
		RealBMT.Settings.ESP.Chams = g
	end
})
ESP:CreateColorpicker({
	Name = "Cham Color",
	Color = RealBMT.Settings.ESP.ChamColor,
	Flag = "ESPChamColor",
	Callback = function(g)
		RealBMT.Settings.ESP.ChamColor = g
	end
})
Blatant:CreateToggle({
	Name = "No Recoil",
	CurrentValue = RealBMT.Settings.Blatant.NoRecoil,
	Flag = "BlatantNoRecoil",
	Callback = function(g)
		RealBMT.Settings.Blatant.NoRecoil = g
	end
})
Blatant:CreateToggle({
	Name = "No Spread",
	CurrentValue = RealBMT.Settings.Blatant.NoSpread,
	Flag = "BlatantNoSpread",
	Callback = function(g)
		RealBMT.Settings.Blatant.NoSpread = g
	end
})
Blatant:CreateToggle({
	Name = "Fire Rate",
	CurrentValue = RealBMT.Settings.Blatant.FireRate,
	Flag = "BlatantFireRate",
	Callback = function(g)
		RealBMT.Settings.Blatant.FireRate = g
	end
})
Blatant:CreateSlider({
	Name = "Fire Rate Amount",
	Range = {
		0,
		1
	},
	Increment = 0.01,
	Suffix = "s",
	CurrentValue = RealBMT.Settings.Blatant.FireRateAmount,
	Flag = "BlatantFireRateAmount",
	Callback = function(g)
		RealBMT.Settings.Blatant.FireRateAmount = g
	end
})
Blatant:CreateToggle({
	Name = "Instant Reload",
	CurrentValue = RealBMT.Settings.Blatant.InstantReload,
	Flag = "BlatantInstantReload",
	Callback = function(g)
		RealBMT.Settings.Blatant.InstantReload = g
	end
})
Blatant:CreateToggle({
	Name = "No Sway",
	CurrentValue = RealBMT.Settings.Blatant.NoSway,
	Flag = "BlatantNoSway",
	Callback = function(g)
		RealBMT.Settings.Blatant.NoSway = g
	end
})
Blatant:CreateToggle({
	Name = "Speed",
	CurrentValue = RealBMT.Settings.Blatant.Speed,
	Flag = "BlatantSpeed",
	Callback = function(g)
		RealBMT.Settings.Blatant.Speed = g
	end
})
Blatant:CreateSlider({
	Name = "Speed Amount",
	Range = {
		16,
		100
	},
	Increment = 1,
	Suffix = "studs",
	CurrentValue = RealBMT.Settings.Blatant.SpeedAmount,
	Flag = "BlatantSpeedAmount",
	Callback = function(g)
		RealBMT.Settings.Blatant.SpeedAmount = g
	end
})
Blatant:CreateToggle({
	Name = "Fly",
	CurrentValue = RealBMT.Settings.Blatant.Fly,
	Flag = "BlatantFly",
	Callback = function(g)
		RealBMT.Settings.Blatant.Fly = g
	end
})
Blatant:CreateSlider({
	Name = "Fly Speed",
	Range = {
		0,
		10
	},
	Increment = 1,
	Suffix = "studs",
	CurrentValue = RealBMT.Settings.Blatant.FlySpeed,
	Flag = "BlatantFlySpeed",
	Callback = function(g)
		RealBMT.Settings.Blatant.FlySpeed = g
	end
})
Blatant:CreateToggle({
	Name = "Infinity Jump",
	CurrentValue = RealBMT.Settings.Blatant.InfinityJump,
	Flag = "BlatantInfinityJump",
	Callback = function(g)
		RealBMT.Settings.Blatant.InfinityJump = g
	end
})
Blatant:CreateToggle({
	Name = "Bhops",
	CurrentValue = RealBMT.Settings.Blatant.Bhops,
	Flag = "BlatantBhops",
	Callback = function(g)
		RealBMT.Settings.Blatant.Bhops = g
	end
})
Blatant:CreateButton({
	Name = "Server Lagger",
	Callback = function()
		replicatechrist()
	end
})
Misc:CreateToggle({
	Name = "Full Bright",
	CurrentValue = RealBMT.Settings.Misc.FullBright,
	Flag = "MiscFullBright",
	Callback = function(g)
		RealBMT.Settings.Misc.FullBright = g
	end
})
Misc:CreateButton({
	Name = "Copy Discord Invite",
	Callback = function()
		setclipboard("https://discord.gg/V7k9rGuGnb")
	end
})
