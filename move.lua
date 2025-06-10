local HttpService = game:GetService("HttpService")

local url = "Your Flask Site"

local Players = game:GetService("Players")
local Playername = "YourUsername"
moveDistance = 50


local function moveCharacter(command)
	print("Moving", command)
	local player = Players:FindFirstChild(Playername)
	if not player then return end
	
	local character = player.Character
	if not character or not character:FindFirstChild("HumanoidRootPart") then return end
	
	local root = character.HumanoidRootPart
	local direction = Vector3.new(0,0,0)
	
	if command == "forward" then
		direction = root.CFrame.LookVector * moveDistance
	elseif command == "back" then
		direction = -root.CFrame.LookVector * moveDistance
	elseif command == "left" then
		direction = -root.CFrame.RightVector * moveDistance
	elseif command == "right" then
		direction = root.CFrame.RightVector * moveDistance
	elseif command == "jump" then
		local humanoid = character:FindFirstChild("Humanoid")
		humanoid.Jump = true
	end

	root.CFrame = root.CFrame + direction
end

while true do
	local success,response = pcall(function()
		return HttpService:GetAsync(url)
	end)
	
	if success then
			local command = response:match("Last command: (%w+)")
			
			if command and command ~= "none" then
				moveCharacter(command)
				
			pcall(function()
				HttpService:PostAsync(url, "none", Enum.HttpContentType.TextPlain)
			end)
			end
	else
		warn("could not contact server")
	end
		wait(1)
	end
