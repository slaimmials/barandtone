-- Gui to Lua
-- Version: 3.2

-- Instances:

local Baritone = Instance.new("ScreenGui")

--Properties:

Baritone.Name = "Baritone"
Baritone.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Baritone.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Scripts:

local function DMYGL_fake_script() -- Baritone.LocalScript 
	local script = Instance.new('LocalScript', Baritone)

	local function round(n)
		return math.floor(n + 0.5)
	end
	local function chat(message)
		game.StarterGui:SetCore("ChatMakeSystemMessage", {Text = message, Colour = Color3.fromRGB(255, 255, 255), Font = Enum.Font.SourceSansBold})
	end
	local xget
	local yget
	local zget
	local asd
	local aas = "off"
	local plr = game.Players.LocalPlayer
	plr.Chatted:Connect(function(msg)
		if msg:find(".goto") then
			local str = msg
			local newStr, replaced = string.gsub(str, ".goto ", "")
			plr.Character:MoveTo(newStr)
			wait(0.1)
			chat("[Baritone] Goto successful")
		end
		if msg:find(".kick") then
			local str = msg
			local newStr, replaced = string.gsub(str, ".kick ", "")
			game.Players[newStr]:Remove()
			wait(0.1)
			chat("[Baritone] Kick successful")
		end
		if msg:find(".getpos") then
			local str = msg
			local newStr, replaced = string.gsub(str, ".getpos ", "")
			wait(0.1)
			xget = round(game.Players[newStr].Character.HumanoidRootPart.CFrame.Position.X)
			yget = round(game.Players[newStr].Character.HumanoidRootPart.CFrame.Position.Y)
			zget = round(game.Players[newStr].Character.HumanoidRootPart.CFrame.Position.Z)
			chat("[Baritone] " .. tostring("X: "..xget.."      Y: "..yget.."      Z: "..zget))
		end
		--[[if msg:find(".delpart") then
			local str = msg
			local newStr, replaced = string.gsub(str, ".delpart ", "")
			if newStr ~= game.Players.LocalPlayer.Name and newStr ~= "Baseplate" and newStr ~= "Terrain" and newStr ~= "Camera" then
				--asd = tostring(newStr)
				newStr:Remove()
				wait(0.1)
				chat("[Baritone] Delete successful")
			else
				wait(0.1)
				chat("[Baritone] You can't delete it")
			end
		end]]
		if msg:find(".aa") then
			if aas == "off" then
				aas = "on"
			elseif aas == "on" then
				aas = "off"
			end
			wait(0.1)
			chat("[Baritone] Anti afk "..aas)
		end
	end)
	local virtualUser = game:GetService('VirtualUser')
	virtualUser:CaptureController()
	while wait(3) do
		if aas == "on" then
			virtualUser:SetKeyDown('0x1f')
			wait(1.5)
			virtualUser:SetKeyUp('0x1f')
		end
	end
end
coroutine.wrap(DMYGL_fake_script)()
