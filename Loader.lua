print("Start")
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.ReplicatedStorage
repeat wait() until game.ReplicatedStorage:FindFirstChild("Remotes");
repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui");
repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");
repeat wait() until game:GetService("Players")
repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Energy")
if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end

if getgenv().Team == nil then
	getgenv().Team = "Pirates"
end

local function SelectTeam()
    local ChooseTeam = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ChooseTeam", true)
    local UIController = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("UIController", true)

    if UIController and ChooseTeam then
        for i, v in pairs(getgc()) do
            if type(v) == "function" and getfenv(v).script == UIController then
                local constant = getconstants(v)
                if constant[1] == getgenv().Team and #constant == 1 then
                    v(getgenv().Team)
                end
            end
        end
    end
end

repeat
    task.wait()
    if not game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
        break
    end

    local success, errorMessage = pcall(SelectTeam)
    if not success then
        warn("Error in SelectTeam function: " .. errorMessage)
    end

    wait(1)
until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()

spawn(function()
    while true do wait()
        getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Kick)
            if not _G.TP_Ser and _G.Rejoin then
                if Kick.Name == 'ErrorPrompt' and Kick:FindFirstChild('MessageArea') and Kick.MessageArea:FindFirstChild("ErrorFrame") then
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                    wait(50)
                end
            end
        end)
    end
end)

local ScreenGUI = Instance.new("ScreenGui")
local CloseUI = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
ScreenGUI.Name = "UI FRAMGMENT"
ScreenGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CloseUI.Name = "Close UI"
CloseUI.Parent = ScreenGUI
CloseUI.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CloseUI.BackgroundTransparency = 0.200
CloseUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseUI.BorderSizePixel = 0
CloseUI.Position = UDim2.new(0.063000001, 0, 0.169, 0)
CloseUI.Size = UDim2.new(0, 50, 0, 50)
CloseUI.Image = "rbxassetid://16384956178"
CloseUI.Draggable = true

UICorner.Parent = CloseUI
CloseUI.MouseButton1Click:Connect(function()
    game:service('VirtualInputManager'):SendKeyEvent(true, "Delete", false, game)
	game:service('VirtualInputManager'):SendKeyEvent(false, "Delete", false, game)
end)

local VirtualUser=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)

spawn(function()
	while wait(3) do
		game:GetService'VirtualUser':CaptureController()
	end
end)

W1 = false
W2 = false
W3 = false
local placeId = game.PlaceId
if placeId == 2753915549 then
    W1 = true
elseif placeId == 4442272183 then
    W2 = true
elseif placeId == 7449423635 then
    W3 = true
end
_G.Color = Color3.fromRGB(68, 202, 186)

_G.Setting_table = {
    Auto_Farm = false,
    FastAttack = false,
	Save_Member = true,
	Melee_A = true,
	SkillZ = true,
	Rejoin = true,
	Anti_AFK = true,
	K_MAX = 50,
	Chest_Lock = 50,
	Delay_C = 15
}

_G.Check_Save_Setting = "CheckSaveSetting"

getgenv()['JsonEncode'] = function(msg)
    return game:GetService("HttpService"):JSONEncode(msg)
end
getgenv()['JsonDecode'] = function(msg)
    return game:GetService("HttpService"):JSONDecode(msg)
end
getgenv()['Check_Setting'] = function(Name)
    if not _G.Dis and not isfolder('Dummy Hub BFv2') then
        makefolder('Dummy Hub BFv2')
    end
    if not _G.Dis and not isfile('Dummy Hub BFv2/'..Name..'.json') then
        writefile('Dummy Hub BFv2/'..Name..'.json',JsonEncode(_G.Setting_table))
    end
end
getgenv()['Get_Setting'] = function(Name)
    if not _G.Dis and isfolder('Dummy Hub BFv2') and isfile('Dummy Hub BFv2/'..Name..'.json') then
        _G.Setting_table = JsonDecode(readfile('Dummy Hub BFv2/'..Name..'.json'))
        return _G.Setting_table
	elseif not _G.Dis then
        Check_Setting(Name)
    end
end
getgenv()['Update_Setting'] = function(Name)
    if not _G.Dis and isfolder('Dummy Hub BFv2') and isfile('Dummy Hub BFv2/'..Name..'.json') then
        writefile('Dummy Hub BFv2/'..Name..'.json',JsonEncode(_G.Setting_table))
	elseif not _G.Dis then
        Check_Setting(Name)
    end
end

Check_Setting(_G.Check_Save_Setting)
Get_Setting(_G.Check_Save_Setting)

if _G.Setting_table.Save_Member then
	getgenv()['MyName'] = game.Players.LocalPlayer.Name
	--print("Save Member")
elseif _G.Setting_table.Save_All_Member then
	getgenv()['MyName'] = "AllMember"
	--print("Save All Member")
else
	getgenv()['MyName'] = "None"
	_G.Dis = true
end

Check_Setting(getgenv()['MyName'])
Get_Setting(getgenv()['MyName'])

_G.Setting_table.Key = _G.wl_key
Update_Setting(getgenv()['MyName'])

function Text(value)
    Fluent:Notify({Title = "Dummy Hub v2",Content = value,Duration = 5})
end
function Com()
    Fluent:Notify({Title = "Dummy Hub v2",Content = "Wait..",Duration = 5})
end
function EquipWeapon(ToolSe)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
		wait()
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
	end
end
function ResetBody(p)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
end
function TP(p)
    task.spawn(function()
        pcall(function()
            if game:GetService("Players").LocalPlayer:DistanceFromCharacter(p.Position) <= 50 then 
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = p
            elseif not game.Players.LocalPlayer.Character:FindFirstChild("Root")then 
                local K = Instance.new("Part",game.Players.LocalPlayer.Character)
                K.Size = Vector3.new(1,0.5,1)
                K.Name = "Root"
                K.Anchored = true
                K.Transparency = 1
                K.CanCollide = false
                K.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
            end
            local U = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude
            local z = game:service("TweenService")
            local B = TweenInfo.new((p.Position-game.Players.LocalPlayer.Character.Root.Position).Magnitude/350,Enum.EasingStyle.Linear)
            local S,g = pcall(function()
            local q = z:Create(game.Players.LocalPlayer.Character.Root,B,{CFrame = p})
            q:Play()
        end)
        if not S then 
            return g
        end
        game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
            if S and game.Players.LocalPlayer.Character:FindFirstChild("Root") then 
                pcall(function()
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 20 then 
                        spawn(function()
                            pcall(function()
                                if (game.Players.LocalPlayer.Character.Root.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then
                                    game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
                                else
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Players.LocalPlayer.Character.Root.CFrame 
                                end
                            end)
                        end)
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 10 and(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 10 then 
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p 
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 10 then 
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p 
                    end
                end)
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, p.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
            if W3 then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(-12476.080078125, 374.9144592285156, -7566.93701171875)-p.Position).Magnitude then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12476.080078125, 374.9144592285156, -7566.93701171875)) --Big Mansion
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(5742.9169921875, 610.7672729492188, -268.2395935058594)-p.Position).Magnitude then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5742.9169921875, 610.7672729492188, -268.2395935058594)) --Hydra Island
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(-5076.99853515625, 314.8587341308594, -3151.824951171875)-p.Position).Magnitude then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5076.99853515625, 314.8587341308594, -3151.824951171875)) --Castle on the Sea
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(-11993.580078125, 331.8077087402344, -8844.1826171875)-p.Position).Magnitude then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-11993.580078125, 331.8077087402344, -8844.1826171875)) --Canvender T
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(5314.58203125, 22.53643226623535, -125.94227600097656)-p.Position).Magnitude then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5314.58203125, 22.53643226623535, -125.94227600097656)) --Canvender H
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, 60, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                elseif (Vector3.new(-1990.672607421875, 4532.998046875, -14973.6748046875)-p.Position).Magnitude < 1500 and (Vector3.new(-1990.672607421875, 4532.998046875, -14973.6748046875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1500 then --Cake Prince
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2149.209228515625, 80.00882720947266, -12402.974609375)
                elseif (Vector3.new(28609.388671875, 14896.8505859375, 105.2657241821289)-p.Position).Magnitude > 1500 and (Vector3.new(28609.388671875, 14896.8505859375, 105.2657241821289)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 then --temple
                    TP(CFrame.new(28609.388671875, 14896.8505859375, 105.2657241821289))
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","Check")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","TeleportBack")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetLastSpawnPoint","GreatTree")
                end
            elseif W2 then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(923.2125244140625, 125.40035247802734, 32852.83203125)-p.Position).Magnitude then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.2125244140625, 125.40035247802734, 32852.83203125)) --Ghost Ship
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(-286.6488037109375, 306.130615234375, 596.5967407226562)-p.Position).Magnitude then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-286.6488037109375, 306.130615234375, 596.5967407226562)) --ManSion
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(2283.7080078125, 15.277364730834961, 905.8712158203125)-p.Position).Magnitude then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2283.7080078125, 15.277364730834961, 905.8712158203125)) --Sawn
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(-6505.7294921875, 83.31233978271484, -130.24234008789062)-p.Position).Magnitude then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6505.7294921875, 83.31233978271484, -130.24234008789062)) --Out Ghost Ship
                end
            elseif W1 then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(3864.6884765625, 5.716391563415527, -1926.214111328125)-p.Position).Magnitude then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.6884765625, 5.716391563415527, -1926.214111328125)) --Gate
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(61163.8515625, 5.650546073913574, 1819.7841796875)-p.Position).Magnitude then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 5.650546073913574, 1819.7841796875)) --Under Water
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(-7894.61767578125, 5545.8349609375, -380.29119873046875)-p.Position).Magnitude then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.61767578125, 5545.8349609375, -380.29119873046875)) --Sky2
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude > (Vector3.new(-4607.82275, 872.54248, -1667.55688)-p.Position).Magnitude then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688)) --Sky1
                end
            end
        end)
    end)
end

spawn(function()
	while wait(2) do
		pcall(function()
			if _G.Setting_table.Auto_Ken then
				game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
				wait(7)
			end
		end)
	end
end)

spawn(function()
    while game:GetService("RunService").Stepped:wait() do
		pcall(function()
        	if _G.Setting_table.NoClip then
				local character = game.Players.LocalPlayer.Character
				for _, v in pairs(character:GetChildren()) do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end
			end
        end)
    end
end)

spawn(function()
    while wait(1) do
		pcall(function()
			if _G.Setting_table.Auto_Buso then
				if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
				else
					task.wait()
				end
			end
		end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Clip or Farm_Lv or Auto_Saber or World2 or Auto_Rengoku or bartilo_quest or EvoRace or AutoGhoul or AutoCB or FarmKata or AutoFarmBone or AutoFarmElite or AutoKillBossBone or FarmDoughBoss or FarmSeaEvent or FindLeviathan or FarmMaterial or EnchantSword or Farm_Mastery or Teleportis then
                _G.Setting_table.Auto_Buso = true
                _G.Setting_table.Auto_Ken = true
                _G.Setting_table.NoClip = true
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
                if not FarmSeaEvent then
                    game:GetService("Players").LocalPlayer.Character.Humanoid.Sit = false
                end
                game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
                else
                if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
                _G.Setting_table.Auto_Buso = false
                _G.Setting_table.Auto_Ken = false
                _G.Setting_table.NoClip = false
            end
        end)
    end
end)

spawn(function()
    game:GetService('RunService').Stepped:Connect(function()
        pcall(function()
            for i, v in pairs(game:GetService("ReplicatedStorage").Effect.Container:GetChildren()) do
                if v.Name == "Death" then
                    v:Destroy() 
                end
            end
        end)
    end)
end)
local C0de = {
    "NEWTROLL",
    "KITT_RESET",
    "Sub2CaptainMaui",
    "SUB2GAMERROBOT_RESET1",
    "kittgaming",
    "Sub2Fer999",
    "Enyu_is_Pro",
    "Magicbus",
    "JCWK",
    "Starcodeheo",
    "Bluxxy",
    "fudd10_v2",
    "FUDD10",
    "BIGNEWS",
    "THEGREATACE",
    "SUB2GAMERROBOT_EXP1",
    "Sub2OfficialNoobie",
    "StrawHatMaine",
    "SUB2NOOBMASTER123",
    "Sub2UncleKizaru",
    "Sub2Daigrock",
    "Axiore",
    "TantaiGaming"
}

local plr = game.Players.LocalPlayer
local CbFw = getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]
function GetCurrentBlade()
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then
        return
    end
    while ret.Parent ~= game.Players.LocalPlayer.Character do
        ret = ret.Parent
    end
    return ret
end
spawn(function()
    while wait() do
        pcall(function()
            if attackm then
                if not Auto_Farm_Bounty and not Auto_Farm_Fruit or Mix_Farm then
                    if game:GetService("Workspace").Characters[game:GetService("Players").LocalPlayer.Name].Stun.Value == 0 then
                        if not Auto_Raid then
                            local AC = CbFw2.activeController
                            for i = 1, 1 do
                                local bladehit =
                                    require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                                    plr.Character,
                                    {plr.Character.HumanoidRootPart},
                                    60
                                )
                                local cac = {}
                                local hash = {}
                                for k, v in pairs(bladehit) do
                                    if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                                        table.insert(cac, v.Parent.HumanoidRootPart)
                                        hash[v.Parent] = true
                                    end
                                end
                                bladehit = cac
                                if #bladehit > 0 then
                                    local u8 = debug.getupvalue(AC.attack, 5)
                                    local u9 = debug.getupvalue(AC.attack, 6)
                                    local u7 = debug.getupvalue(AC.attack, 4)
                                    local u10 = debug.getupvalue(AC.attack, 7)
                                    local u12 = (u8 * 798405 + u7 * 727595) % u9
                                    local u13 = u7 * 798405
                                    (function()
                                        u12 = (u12 * u9 + u13) % 1099511627776
                                        u8 = math.floor(u12 / u9)
                                        u7 = u12 - u8 * u9
                                    end)()
                                    u10 = u10 + 1
                                    debug.setupvalue(AC.attack, 5, u8)
                                    debug.setupvalue(AC.attack, 6, u9)
                                    debug.setupvalue(AC.attack, 4, u7)
                                    debug.setupvalue(AC.attack, 7, u10)
                                    wait(0)
                                    pcall(function()
                                        if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                                            AC.animator.anims.basic[1]:Play()
                                            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                                            game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215),u10)
                                            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit",bladehit,i,"")
                                        end
                                    end)
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)
function GetMaterial(matname)
	for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
		if type(v) == "table" then
			if v.Type == "Material" then
				if v.Name == matname then
					return v.Count
				end
			end
		end
	end
	return 0
end
function TPW1()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end
function TPW2()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")	
end
function TPW3()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end
function GetCFrameMon()
    local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
    if W1 then
        if Lv == 1 and Lv <= 9 then
            CFrameMon1 = CFrame.new(940.2029418945312, 16.6924991607666+40, 1519.2493896484375)
            CFrameMon2 = CFrame.new(951.4797973632812, 16.61683464050293+40, 1620.89306640625)
            CFrameMon3 = CFrame.new(1014.9642333984375, 16.61676597595215+40, 1565.311279296875)
            CFrameMon4 = CFrame.new(1107.12744140625, 16.616853713989258+40, 1588.759033203125)
            CFrameMon5 = CFrame.new(1127.692138671875, 16.616853713989258+40, 1662.8216552734375)
            CFrameMon6 = CFrame.new(1218.59423828125, 16.273571014404297+40, 1681.0216064453125)
            CFrameMon7 = CFrame.new(1283.9200439453125, 16.273571014404297+40, 1625.9461669921875)
            CFrameMon8 = CFrame.new(1232.4404296875, 16.27361488342285+40, 1538.557373046875)
        elseif Lv >= 10 and Lv <= 14 then
            CFrameMon1 = CFrame.new(-1294.4613037109375, 11.852043151855469+40, -2.7732455730438232)
            CFrameMon2 = CFrame.new(-1202.48974609375, 11.852043151855469+40, 281.791259765625)
            CFrameMon3 = CFrame.new(-1580.23388671875, 22.851999282836914+40, 376.2781982421875)
            CFrameMon4 = CFrame.new(-1801.1041259765625, 22.852006912231445+40, 110.28227233886719)
            CFrameMon5 = CFrame.new(-1743.83837890625, 22.852083206176758+40, -95.19615173339844)
            CFrameMon6 = CFrame.new(-1607.284912109375, 22.851211547851562+40, -44.98833084106445)
            CFrameMon7 = CFrame.new(-1487.47216796875, 22.85210418701172+40, 90.52552795410156)
            CFrameMon8 = CFrame.new(-1487.47216796875, 22.85210418701172+40, 90.52552795410156)
        elseif Lv >= 15 and Lv <= 29 then
            CFrameMon1 = CFrame.new(-1364.3902587890625, 18.62142562866211+40, -488.18829345703125)
            CFrameMon2 = CFrame.new(-1246.682861328125, 6.27936315536499+40, -455.3561096191406)
            CFrameMon3 = CFrame.new(-1249.805908203125, 6.27936315536499+40, -552.5149536132812)
            CFrameMon4 = CFrame.new(-1187.705322265625, 11.219206809997559+40, -649.3475952148438)
            CFrameMon5 = CFrame.new(-1364.3902587890625, 18.62142562866211+40, -488.18829345703125)
            CFrameMon6 = CFrame.new(-1246.682861328125, 6.27936315536499+40, -455.3561096191406)
            CFrameMon7 = CFrame.new(-1249.805908203125, 6.27936315536499+40, -552.5149536132812)
            CFrameMon8 = CFrame.new(-1187.705322265625, 11.219206809997559+40, -649.3475952148438)
        elseif Lv >= 30 and Lv <= 39 then
            CFrameMon1 = CFrame.new(-1289.849365234375, 4.752050399780273+40, 3940.74560546875)
            CFrameMon2 = CFrame.new(-1269.7249755859375, 4.752050399780273+40, 3851.7626953125)
            CFrameMon3 = CFrame.new(-1181.4403076171875, 4.752050399780273+40, 3973.49267578125)
            CFrameMon4 = CFrame.new(-1141.906494140625, 4.752050399780273+40, 3895.46875)
            CFrameMon5 = CFrame.new(-967.46435546875, 13.752033233642578+40, 3937.073974609375)
            CFrameMon6 = CFrame.new(-970.0209350585938, 13.752033233642578+40, 4033.638671875)
            CFrameMon7 = CFrame.new(-970.0209350585938, 13.752033233642578+40, 4033.638671875)
            CFrameMon8 = CFrame.new(-970.0209350585938, 13.752033233642578+40, 4033.638671875)
        elseif Lv >= 40 and Lv <= 59 then
            CFrameMon1 = CFrame.new(-862.0116577148438, 14.752033233642578+40, 4281.189453125)
            CFrameMon2 = CFrame.new(-984.6527709960938, 14.819873809814453+40, 4233.53857421875)
            CFrameMon3 = CFrame.new(-1048.275634765625, 14.809873580932617+40, 4405.990234375)
            CFrameMon4 = CFrame.new(-1233.210693359375, 15.08987045288086+40, 4337.54833984375)
            CFrameMon5 = CFrame.new(-1189.86474609375, 14.809873580932617+40, 4232.53515625)
            CFrameMon6 = CFrame.new(-1399.4967041015625, 14.869874954223633+40, 4187.11962890625)
            CFrameMon7 = CFrame.new(-1399.4967041015625, 14.869874954223633+40, 4187.11962890625)
            CFrameMon8 = CFrame.new(-1399.4967041015625, 14.869874954223633+40, 4187.11962890625)
        elseif Lv >= 60 and Lv <= 74 then
            CFrameMon1 = CFrame.new(931.4910888671875, 6.449496269226074+40, 4424.92626953125)
            CFrameMon2 = CFrame.new(1005.9679565429688, 6.4495158195495605+40, 4486.73095703125)
            CFrameMon3 = CFrame.new(931.7928466796875, 6.449478626251221+40, 4537.40966796875)
            CFrameMon4 = CFrame.new(863.7800903320312, 6.44989538192749+40, 4482.638671875)
            CFrameMon5 = CFrame.new(931.4910888671875, 6.449496269226074+40, 4424.92626953125)
            CFrameMon6 = CFrame.new(1005.9679565429688, 6.4495158195495605+40, 4486.73095703125)
            CFrameMon7 = CFrame.new(931.7928466796875, 6.449478626251221+40, 4537.40966796875)
            CFrameMon8 = CFrame.new(863.7800903320312, 6.44989538192749+40, 4482.638671875)
        elseif Lv >= 75 and Lv <= 89 then
            CFrameMon1 = CFrame.new(1579.355712890625, 1.6109551191329956+40, 4299.986328125)
            CFrameMon2 = CFrame.new(1666.529296875, 16.33990478515625+40, 4316.6298828125)
            CFrameMon3 = CFrame.new(1670.3516845703125, 9.899906158447266+40, 4393.64990234375)
            CFrameMon4 = CFrame.new(1610.9713134765625, 1.2109688520431519+40, 4465.6533203125)
            CFrameMon5 = CFrame.new(1579.355712890625, 1.6109551191329956+40, 4299.986328125)
            CFrameMon6 = CFrame.new(1666.529296875, 16.33990478515625+40, 4316.6298828125)
            CFrameMon7 = CFrame.new(1670.3516845703125, 9.899906158447266+40, 4393.64990234375)
            CFrameMon8 = CFrame.new(1610.9713134765625, 1.2109688520431519+40, 4465.6533203125)
        elseif Lv >= 90 and Lv <= 99 then
            CFrameMon1 = CFrame.new(1199.2698974609375, 87.27276611328125+40, -1329.6365966796875)
            CFrameMon2 = CFrame.new(1275.7410888671875, 87.27276611328125+40, -1342.4158935546875)
            CFrameMon3 = CFrame.new(1314.813720703125, 87.27276611328125+40, -1392.2491455078125)
            CFrameMon4 = CFrame.new(1381.942138671875, 87.27276611328125+40, -1469.5084228515625)
            CFrameMon5 = CFrame.new(1455.8544921875, 87.27276611328125+40, -1445.296630859375)
            CFrameMon6 = CFrame.new(1455.8544921875, 87.27276611328125+40, -1445.296630859375)
            CFrameMon7 = CFrame.new(1455.8544921875, 87.27276611328125+40, -1445.296630859375)
            CFrameMon8 = CFrame.new(1455.8544921875, 87.27276611328125+40, -1445.296630859375)
        elseif Lv >= 100 and Lv <= 119 then
            CFrameMon1 = CFrame.new(1189.444091796875, 105.77227783203125+40, -1628.8709716796875)
            CFrameMon2 = CFrame.new(1263.51171875, 105.77810668945312+40, -1484.8223876953125)
            CFrameMon3 = CFrame.new(1148.21923828125, 105.77325439453125+40, -1428.9813232421875)
            CFrameMon4 = CFrame.new(1030.8486328125, 105.76580810546875+40, -1489.3455810546875)
            CFrameMon5 = CFrame.new(1189.444091796875, 105.77227783203125+40, -1628.8709716796875)
            CFrameMon6 = CFrame.new(1263.51171875, 105.77810668945312+40, -1484.8223876953125)
            CFrameMon7 = CFrame.new(1148.21923828125, 105.77325439453125+40, -1428.9813232421875)
            CFrameMon8 = CFrame.new(1030.8486328125, 105.76580810546875+40, -1489.3455810546875)
        elseif Lv >= 120 and Lv <= 149 then
            CFrameMon1 = CFrame.new(-4806.26806640625, 20.65203285217285+40, 3998.07568359375)
            CFrameMon2 = CFrame.new(-4994.1552734375, 20.65203285217285+40, 3948.1748046875)
            CFrameMon3 = CFrame.new(-4921.9423828125, 20.65203285217285+40, 4084.2587890625)
            CFrameMon4 = CFrame.new(-5119.95703125, 20.65203285217285+40, 4059.155517578125)
            CFrameMon5 = CFrame.new(-4614.0009765625, 20.65203285217285+40, 4416.42333984375)
            CFrameMon6 = CFrame.new(-4636.09033203125, 20.65203285217285+40, 4553.8046875)
            CFrameMon7 = CFrame.new(-4810.64599609375, 20.65203285217285+40, 4541.19873046875)
            CFrameMon8 = CFrame.new(-4874.17626953125, 20.65203285217285+40, 4659.4990234375)
        elseif Lv >= 150 and Lv <= 174 then
            CFrameMon1 = CFrame.new(-4861.58837890625, 278.06524658203125+40, -2906.38037109375)
            CFrameMon2 = CFrame.new(-4946.23876953125, 278.06610107421875+40, -2780.7841796875)
            CFrameMon3 = CFrame.new(-5120.37939453125, 278.06842041015625+40, -2810.72607421875)
            CFrameMon4 = CFrame.new(-5081.54345703125, 278.0681457519531+40, -2942.20654296875)
            CFrameMon5 = CFrame.new(-4861.58837890625, 278.06524658203125+40, -2906.38037109375)
            CFrameMon6 = CFrame.new(-4946.23876953125, 278.06610107421875+40, -2780.7841796875)
            CFrameMon7 = CFrame.new(-5120.37939453125, 278.06842041015625+40, -2810.72607421875)
            CFrameMon8 = CFrame.new(-5081.54345703125, 278.0681457519531+40, -2942.20654296875)
        elseif Lv >= 175 and Lv <= 189 then
            CFrameMon1 = CFrame.new(-5232.33349609375, 388.6519470214844+40, -2370.094970703125)
            CFrameMon2 = CFrame.new(-5166.5615234375, 388.6519470214844+40, -2242.56103515625)
            CFrameMon3 = CFrame.new(-5243.41455078125, 388.6519470214844+40, -2156.603515625)
            CFrameMon4 = CFrame.new(-5338.81884765625, 388.6519470214844+40, -2260.91650390625)
            CFrameMon5 = CFrame.new(-5232.33349609375, 388.6519470214844+40, -2370.094970703125)
            CFrameMon6 = CFrame.new(-5166.5615234375, 388.6519470214844+40, -2242.56103515625)
            CFrameMon7 = CFrame.new(-5243.41455078125, 388.6519470214844+40, -2156.603515625)
            CFrameMon8 = CFrame.new(-5338.81884765625, 388.6519470214844+40, -2260.91650390625)
        elseif Lv >= 190 and Lv <= 209 then
            CFrameMon1 = CFrame.new(5350.1787109375, 1.6334410905838013+40, 388.7147216796875)
            CFrameMon2 = CFrame.new(5221.408203125, 1.6341384649276733+40, 448.60833740234375)
            CFrameMon3 = CFrame.new(5088.845703125, 1.6715176105499268+40, 425.63763427734375)
            CFrameMon4 = CFrame.new(5064.70849609375, 1.6325534582138062+40, 546.593505859375)
            CFrameMon5 = CFrame.new(4936.69775390625, 1.632628321647644+40, 650.6769409179688)
            CFrameMon6 = CFrame.new(4936.69775390625, 1.632628321647644+40, 650.6769409179688)
            CFrameMon7 = CFrame.new(4936.69775390625, 1.632628321647644+40, 650.6769409179688)
            CFrameMon8 = CFrame.new(4936.69775390625, 1.632628321647644+40, 650.6769409179688)
        elseif Lv >= 210 and Lv <= 249 then
            CFrameMon1 = CFrame.new(5482.27392578125, 1.6511272192001343+40, 469.4695739746094)
            CFrameMon2 = CFrame.new(5551.83642578125, 1.6520428657531738+40, 586.2621459960938)
            CFrameMon3 = CFrame.new(5650.1103515625, 1.653846263885498+40, 765.012939453125)
            CFrameMon4 = CFrame.new(5558.4833984375, 1.6507247686386108+40, 962.8629150390625)
            CFrameMon5 = CFrame.new(5439.64013671875, 1.6496928930282593+40, 1080.1236572265625)
            CFrameMon6 = CFrame.new(5097.1142578125, 1.6509758234024048+40, 1055.196533203125)
            CFrameMon7 = CFrame.new(4957.169921875, 1.6516176462173462+40, 919.9663696289062)
            CFrameMon8 = CFrame.new(4957.169921875, 1.6516176462173462+40, 919.9663696289062)
        elseif Lv >= 250 and Lv <= 274 then
            CFrameMon1 = CFrame.new(-1675.2734375, 7.286351680755615+40, -2681.58740234375)
            CFrameMon2 = CFrame.new(-1838.6986083984375, 7.289072513580322+40, -2668.1875)
            CFrameMon3 = CFrame.new(-2058.825439453125, 7.289072513580322+40, -2713.903564453125)
            CFrameMon4 = CFrame.new(-2128.888671875, 7.289072513580322+40, -2853.470947265625)
            CFrameMon5 = CFrame.new(-1796.3717041015625, 7.442544937133789+40, -2854.753173828125)
            CFrameMon6 = CFrame.new(-1796.3717041015625, 7.442544937133789+40, -2854.753173828125)
            CFrameMon7 = CFrame.new(-1796.3717041015625, 7.442544937133789+40, -2854.753173828125)
            CFrameMon8 = CFrame.new(-1796.3717041015625, 7.442544937133789+40, -2854.753173828125)
        elseif Lv >= 275 and Lv <= 299 then
            CFrameMon1 = CFrame.new(-1492.459716796875, 7.442545413970947+40, -3193.350830078125)
            CFrameMon2 = CFrame.new(-1371.4588623046875, 7.38933801651001+40, -3379.08154296875)
            CFrameMon3 = CFrame.new(-1352.397216796875, 7.289072513580322+40, -3591.7822265625)
            CFrameMon4 = CFrame.new(-1129.909423828125, 7.289072513580322+40, -3268.37109375)
            CFrameMon5 = CFrame.new(-1236.29052734375, 7.287659168243408+40, -3049.99951171875)
            CFrameMon6 = CFrame.new(-1236.29052734375, 7.287659168243408+40, -3049.99951171875)
            CFrameMon7 = CFrame.new(-1236.29052734375, 7.287659168243408+40, -3049.99951171875)
            CFrameMon8 = CFrame.new(-1236.29052734375, 7.287659168243408+40, -3049.99951171875)
        elseif Lv >= 300 and Lv <= 324 then
            CFrameMon1 = CFrame.new(-5284.8388671875, 8.990673065185547+40, 8661.0390625)
            CFrameMon2 = CFrame.new(-5412.69287109375, 8.590673446655273+40, 8587.8193359375)
            CFrameMon3 = CFrame.new(-5438.95849609375, 8.590673446655273+40, 8346.1171875)
            CFrameMon4 = CFrame.new(-5569.94775390625, 8.590673446655273+40, 8328.775390625)
            CFrameMon5 = CFrame.new(-5667.763671875, 8.590673446655273+40, 8429.0361328125)
            CFrameMon6 = CFrame.new(-5667.763671875, 8.590673446655273+40, 8429.0361328125)
            CFrameMon7 = CFrame.new(-5667.763671875, 8.590673446655273+40, 8429.0361328125)
            CFrameMon8 = CFrame.new(-5667.763671875, 8.590673446655273+40, 8429.0361328125)
        elseif Lv >= 325 and Lv <= 374 then
            CFrameMon1 = CFrame.new(-5784.5888671875, 77.12830352783203, 8649.6328125)
            CFrameMon2 = CFrame.new(-5858.59326171875, 77.23063659667969+40, 8776.634765625)
            CFrameMon3 = CFrame.new(-5917.80078125, 77.23063659667969+40, 8844.744140625)
            CFrameMon4 = CFrame.new(-5808.0576171875, 77.251708984375+40, 8903.1845703125)
            CFrameMon5 = CFrame.new(-5784.5888671875, 77.12830352783203+40, 8649.6328125)
            CFrameMon6 = CFrame.new(-5858.59326171875, 77.23063659667969+40, 8776.634765625)
            CFrameMon7 = CFrame.new(-5917.80078125, 77.23063659667969+40, 8844.744140625)
            CFrameMon8 = CFrame.new(-5808.0576171875, 77.251708984375+40, 8903.1845703125)
        elseif Lv >= 375 and Lv <= 399 then
            CFrameMon1 = CFrame.new(60945.5234375, 18.482818603515625+40, 1739.2591552734375)
            CFrameMon2 = CFrame.new(60845.8671875, 18.482818603515625+40, 1647.6759033203125)
            CFrameMon3 = CFrame.new(60789.96875, 18.471633911132812+40, 1527.054931640625)
            CFrameMon4 = CFrame.new(60912.890625, 18.482818603515625+40, 1472.86181640625)
            CFrameMon5 = CFrame.new(60952.8046875, 18.471633911132812+40, 1372.06591796875)
            CFrameMon6 = CFrame.new(60843.2734375, 18.471633911132812+40, 1304.419921875)
            CFrameMon7 = CFrame.new(60926.53515625, 18.471633911132812+40, 1181.3790283203125)
            CFrameMon8 = CFrame.new(60926.53515625, 18.471633911132812+40, 1181.3790283203125)
        elseif Lv >= 400 and Lv <= 449 then
            CFrameMon1 = CFrame.new(61699.08984375, 18.471633911132812+40, 1518.89208984375)
            CFrameMon2 = CFrame.new(61764.171875, 18.482818603515625+40, 1460.4661865234375)
            CFrameMon3 = CFrame.new(61786.203125, 18.471633911132812+40, 1284.07275390625)
            CFrameMon4 = CFrame.new(62050.64453125, 18.482818603515625+40, 1423.6337890625)
            CFrameMon5 = CFrame.new(61975.34375, 18.471633911132812+40, 1615.074951171875)
            CFrameMon6 = CFrame.new(61859.0078125, 18.471633911132812+40, 1695.760498046875)
            CFrameMon7 = CFrame.new(61859.0078125, 18.471633911132812+40, 1695.760498046875)
            CFrameMon8 = CFrame.new(61859.0078125, 18.471633911132812+40, 1695.760498046875)
        elseif Lv >= 450 and Lv <= 474 then
            CFrameMon1 = CFrame.new(-4701.5185546875, 844.2769775390625+40, -1794.988037109375)
            CFrameMon2 = CFrame.new(-4823.76171875, 843.287109375+40, -1781.209228515625)
            CFrameMon3 = CFrame.new(-4862.9072265625, 843.287109375+40, -1916.7386474609375)
            CFrameMon4 = CFrame.new(-4823.16259765625, 843.287109375+40, -2056.5205078125)
            CFrameMon5 = CFrame.new(-4616.20068359375, 843.287109375+40, -2040.7489013671875)
            CFrameMon6 = CFrame.new(-4582.03515625, 843.287109375+40, -1941.2008056640625)
            CFrameMon7 = CFrame.new(-4582.03515625, 843.287109375+40, -1941.2008056640625)
            CFrameMon8 = CFrame.new(-4582.03515625, 843.287109375+40, -1941.2008056640625)
        elseif Lv >= 475 and Lv >= 524 then
            CFrameMon1 = CFrame.new(-7791.04638671875, 5545.49169921875+40, -488.8955383300781)
            CFrameMon2 = CFrame.new(-7723.7841796875, 5545.49169921875+40, -587.0575561523438)
            CFrameMon3 = CFrame.new(-7594.61279296875, 5545.49169921875+40, -652.351806640625)
            CFrameMon4 = CFrame.new(-7540.0439453125, 5545.49169921875+40, -515.7664184570312)
            CFrameMon5 = CFrame.new(-7566.55517578125, 5545.49169921875+40, -416.1830139160156)
            CFrameMon6 = CFrame.new(-7713.80029296875, 5545.49169921875+40, -338.3591003417969)
            CFrameMon7 = CFrame.new(-7713.80029296875, 5545.49169921875+40, -338.3591003417969)
            CFrameMon8 = CFrame.new(-7713.80029296875, 5545.49169921875+40, -338.3591003417969)
        elseif Lv >= 525 and Lv <= 549 then
            CFrameMon1 = CFrame.new(-7841.76123046875, 5606.876953125+40, -1404.2388916015625)
            CFrameMon2 = CFrame.new(-7721.37451171875, 5606.876953125+40, -1508.4566650390625)
            CFrameMon3 = CFrame.new(-7525.01708984375, 5606.876953125+40, -1544.11279296875)
            CFrameMon4 = CFrame.new(-7511.6396484375, 5606.876953125+40, -1415.096435546875)
            CFrameMon5 = CFrame.new(-7673.81201171875, 5606.876953125+40, -1380.596923828125)
            CFrameMon6 = CFrame.new(-7673.81201171875, 5606.876953125+40, -1380.596923828125)
            CFrameMon7 = CFrame.new(-7673.81201171875, 5606.876953125+40, -1380.596923828125)
            CFrameMon8 = CFrame.new(-7673.81201171875, 5606.876953125+40, -1380.596923828125)
        elseif Lv >= 550 and Lv <= 624 then
            CFrameMon1 = CFrame.new(-7935.39501953125, 5606.876953125+40, -1624.7528076171875)
            CFrameMon2 = CFrame.new(-7917.07275390625, 5606.876953125+40, -1720.010009765625)
            CFrameMon3 = CFrame.new(-7947.041015625, 5606.876953125+40, -1824.520751953125)
            CFrameMon4 = CFrame.new(-7759.86962890625, 5606.876953125+40, -1862.9268798828125)
            CFrameMon5 = CFrame.new(-7764.90966796875, 5606.87744140625+40, -1722.2987060546875)
            CFrameMon6 = CFrame.new(-7764.90966796875, 5606.87744140625+40, -1722.2987060546875)
            CFrameMon7 = CFrame.new(-7764.90966796875, 5606.87744140625+40, -1722.2987060546875)
            CFrameMon8 = CFrame.new(-7764.90966796875, 5606.87744140625+40, -1722.2987060546875)
        elseif Lv >= 625 and Lv <= 649 then
            CFrameMon1 = CFrame.new(5350.0185546875, 38.5008544921875+40, 3956.221923828125)
            CFrameMon2 = CFrame.new(5479.8955078125, 51.69243621826172+40, 4052.640380859375)
            CFrameMon3 = CFrame.new(5518.19677734375, 38.5008544921875+40, 3934.01416015625)
            CFrameMon4 = CFrame.new(5651.70263671875, 38.501129150390625+40, 3914.716796875)
            CFrameMon5 = CFrame.new(5714.89208984375, 53.31098175048828+40, 4032.6318359375)
            CFrameMon6 = CFrame.new(5833.47265625, 38.5008544921875+40, 3913.85107421875)
            CFrameMon7 = CFrame.new(5833.47265625, 38.5008544921875+40, 3913.85107421875)
            CFrameMon8 = CFrame.new(5833.47265625, 38.5008544921875+40, 3913.85107421875)
        elseif Lv >= 650 then
            CFrameMon1 = CFrame.new(5339.81396484375, 38.84409713745117+40, 4925.99609375)
            CFrameMon2 = CFrame.new(5417.36865234375, 58.16657638549805+40, 4786.052734375)
            CFrameMon3 = CFrame.new(5579.6884765625, 52.418670654296875+40, 4862.96728515625)
            CFrameMon4 = CFrame.new(5561.59033203125, 38.8443717956543+40, 5001.048828125)
            CFrameMon5 = CFrame.new(5887.33349609375, 38.84409713745117+40, 4949.6767578125)
            CFrameMon6 = CFrame.new(5806.2607421875, 52.24956130981445+40, 4833.1142578125)
            CFrameMon7 = CFrame.new(5915.357421875, 53.31882858276367+40, 4763.46728515625)
            CFrameMon8 = CFrame.new(5971.5478515625, 38.8443717956543+40, 4869.3935546875)
        end
    elseif W2 then
    elseif W3 then
    end
end
spawn(function()
    while wait() do
        pcall(function()
            GetCFrameMon()
            if CFrameMon == nil then
                CFrameMon = CFrameMon1
            end
            if (CFrameMon1.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                CFrameMon = CFrameMon2
            end
            if (CFrameMon2.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                CFrameMon = CFrameMon3
            end
            if (CFrameMon3.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                CFrameMon = CFrameMon4
            end
            if (CFrameMon4.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                CFrameMon = CFrameMon5
            end
            if (CFrameMon5.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                CFrameMon = CFrameMon6
            end
            if (CFrameMon6.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                CFrameMon = CFrameMon7
            end
            if (CFrameMon7.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                CFrameMon = CFrameMon8
            end
            if (CFrameMon8.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                CFrameMon = CFrameMon1
            end
        end)
    end
end)
if W1 then
    tmap = {
        "Jones Salad",
        "Marine",
        "Marine Fortress",
        "Midle Town",
        "Jungle",
        "Pirate Village",
        "Desert",
        "Frozen Village",
        "Colosseum",
        "Prison",
        "Mob Leader",
        "Magma Village", 
        "UnderWater Gate", 
        "UnderWater City",
        "Fountain City",
        "Sky1",
        "Sky2"
    }
elseif W2 then
    tmap = {
        "Mansion", 
        "Kingdom Of Rose",
        "Cafe",
        "Sunflower Field", 
        "Jeramy Mountain", 
        "Colossuem", 
        "Factory",
        "The Bridge",
        "Green Bit",
        "Graveyard",
        "Dark Area",
        "Snow Mountain",
        "Hot Island", 
        "Cold Island",
        "Usopp's Island", 
        "inscription Island",
        "Forgotten Island", 
        "Ghost Ship"
    }
elseif W3 then
    tmap = {
        "Port Town",
        "Hydra Island", 
        "Gaint Tree", 
        "PineApple Village", 
        "Big Mansion", 
        "Castle on the Sea", 
        "Haunted Castle",
        "Ice Cream Island",
        "Soa of Cake",
        "Cake Loaf",
        "On Tree"
    }
end
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
Fluent:Notify({Title = "Dummy Hub v2",Content = "Wait for script",Duration = 5})
local Window = Fluent:CreateWindow({
    Title = "Dummy Hub v2 - ฺBlox Fruit",
    SubTitle = "by Patpitcha",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 350),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.Delete
})
local General_Tab = Window:AddTab({Title = "General", Icon = "" })
local Item_Tab = Window:AddTab({Title = "Item", Icon = "" })
local Quest_Tab = Window:AddTab({Title = "Quest", Icon = "" })
local Race_Tab = Window:AddTab({Title = "Race", Icon = "" })
local Sea_Tab = Window:AddTab({Title = "Sea Event", Icon = "" })
local LP_Tab = Window:AddTab({Title = "LocalPlayer", Icon = "" })
local Server_Tab = Window:AddTab({Title = "Server", Icon = "" })
local Setting_Tab = Window:AddTab({Title = "Setting", Icon = "" })

local FarmLevel = General_Tab:AddSection("Farm Level")
FarmLevel:AddToggle("Auto Farm Level",{
    Title = "Auto Farm Level",
    Description = "Farm Level Auto Update",
    Default = _G.Setting_table.Farm_Lv,
    Callback = function(vu)
    Farm_Lv = vu
	_G.Setting_table.Farm_Lv = vu
	Update_Setting(getgenv()['MyName'])
end})
FarmLevel:AddToggle("Auto World 2",{
    Title = "Auto World 2",
    Default = _G.Setting_table.World2,
    Callback = function(vu)
    World2 = vu
	_G.Setting_table.World2 = vu
	Update_Setting(getgenv()['MyName'])
end})
FarmLevel:AddToggle("Auto World 3",{
    Title = "Auto World 3",
    Default = _G.Setting_table.World3,
    Callback = function(vu)
    World3 = vu
	_G.Setting_table.World3 = vu
	Update_Setting(getgenv()['MyName'])
end})

local SettingFarm = Setting_Tab:AddSection("Setting Farm")
SettingFarm:AddDropdown("Select Weapon",{
    Title = "Select Weapon",
    Default = _G.Setting_table.Weapona,
    Values = {"Melee","Sword","Gun","Blox Fruit"},
    Callback = function(vu)
    _G.Setting_table.Weapona = vu
	Update_Setting(getgenv()['MyName'])
end})

local Stats = LP_Tab:AddSection("Up Stat")
Stats:AddToggle("Melee",{
    Title = "Melee",
    Default = _G.Setting_table.Melee_A,
    Callback = function(vu)
	Melee_A = vu
	_G.Setting_table.Melee_A = vu
	Update_Setting(getgenv()['MyName'])
end})
Stats:AddToggle("Defense",{
    Title = "Defense",
    Default = _G.Setting_table.Defense_A,
    Callback = function(vu)
	Defense_A = vu
	_G.Setting_table.Defense_A = vu
	Update_Setting(getgenv()['MyName'])
end})
Stats:AddToggle("Sword",{
    Title = "Sword",
    Default = _G.Setting_table.Sword_A,
    Callback = function(vu)
	Sword_A = vu
	_G.Setting_table.Sword_A = vu
	Update_Setting(getgenv()['MyName'])
end})
Stats:AddToggle("Fruit",{
    Title = "Fruit",
    Default = _G.Setting_table.Fruit_A,
    Callback = function(vu)
	Fruit_A = vu
	_G.Setting_table.Fruit_A = vu
	Update_Setting(getgenv()['MyName'])
end})
Stats:AddToggle("Gun",{
    Title = "Gun",
    Default = _G.Setting_table.Gun_A,
    Callback = function(vu)
	Gun_A = vu
	_G.Setting_table.Gun_A = vu
	Update_Setting(getgenv()['MyName'])
end})
Stats:AddSlider("Points Stat",{
    Title = "Ponts Stat", 
    Description = "Points for upgrading each round", 
    Default = 3, 
    Min = 0, 
    Max = 2550, 
    Rounding = 0, 
    Callback = function(vu) 
        Points = vu
end})

local Code = LP_Tab:AddSection("Redeem Code")
Code:AddButton({
    Title = "Redeem All Code",
    Callback = function()
    function RedeemCode(value)
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
    end
    for i,v in pairs(C0de) do
        RedeemCode(v)
    end
end})

local ItemW1 = Item_Tab:AddSection("Item World 1")
ItemW1:AddToggle("Saber",{
    Title = "Auto Saber",
    Description = "Find Fully Saber",
    Default = _G.Setting_table.Auto_Saber,
    Callback = function(vu)
	Auto_Saber = vu
	_G.Setting_table.Auto_Saber = vu
	Update_Setting(getgenv()['MyName'])
end})

local ItemW2 = Item_Tab:AddSection("Item World 2")
ItemW2:AddToggle("Rengoku",{
    Title = "Auto Rengoku",
    Description = "Find Fully Rengoku",
    Default = _G.Setting_table.Auto_Rengoku,
    Callback = function(vu)
	Auto_Rengoku = vu
	_G.Setting_table.Auto_Rengoku = vu
	Update_Setting(getgenv()['MyName'])
end})

local QuestWorld2 = Quest_Tab:AddSection("Quest World 2")
QuestWorld2:AddToggle("Bartilo Quest",{
    Title = "Auto Bartilo Quest",
    Description = "doing bartilo quest",
    Default = _G.Setting_table.bartilo_quest,
    Callback = function(vu)
	bartilo_quest = vu
	_G.Setting_table.bartilo_quest = vu
	Update_Setting(getgenv()['MyName'])
end})

local AutoMelee = Item_Tab:AddSection("Melee")
AutoMelee:AddToggle("Auto Superhuman",{
    Title = "Auto Superhuman",
    Description = "Will Auto Buy Only",
    Default = _G.Setting_table.D_Superhuman,
    Callback = function(vu)
    D_Superhuman = vu
	_G.Setting_table.D_Superhuman = vu
	Update_Setting(getgenv()['MyName'])
end})

local RaceEvo = Race_Tab:AddSection("Auto Evo Rave")
RaceEvo:AddToggle("Auto Evo Rcae",{
    Title = "Auto Evo Your Race",
    Description = "Auto Evo Your Race v1 to v3",
    Default = _G.Setting_table.EvoRace,
    Callback = function(vu)
    EvoRace = vu
	_G.Setting_table.EvoRace = vu
	Update_Setting(getgenv()['MyName'])
end})

local AutoRace = Race_Tab:AddSection("Auto Rave")
AutoRace:AddToggle("Auto Rcae Ghoul",{
    Title = "Auto Race Ghoul",
    Description = "Auto Ghoul Race Fully",
    Default = _G.Setting_table.AutoGhoul,
    Callback = function(vu)
    AutoGhoul = vu
	_G.Setting_table.AutoGhoul = vu
	Update_Setting(getgenv()['MyName'])
end})
AutoRace:AddToggle("Auto Rcae Cyborg",{
    Title = "Auto Race Cyborg",
    Description = "Auto Cyborg Race Fully (Wait Fix)",
    Default = _G.Setting_table.AutoCB,
    Callback = function(vu)
    AutoCB = vu
	_G.Setting_table.AutoCB = vu
	Update_Setting(getgenv()['MyName'])
end})
local Jobid = Server_Tab:AddSection("Job ID")
if type(jobids) == 'string' then
else
	jobids = ""
end
local InputID = Jobid:AddInput("Jobid",{
    Title = "Job ID",
    Default = "",
    Callback = function(jid)
        jobids = jid
end})
Jobid:AddButton({
    Title = "Join Server",
    Callback = function(jid)
        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", jobids)
end})
Jobid:AddButton({
    Title = "Copy ID Server",
    Callback = function()
    	setclipboard(tostring(game.JobId))
end})
Jobid:AddButton({
    Title = "Clear ID Server",
    Callback = function()
        InputID:Set("")
end})
local TeleW = Server_Tab:AddSection("World")
TeleW:AddButton({
    Title = "World 1",
    Callback = function()
    	TPW1()
end})
TeleW:AddButton({
    Title = "World 2",
    Callback = function()
    	TPW2()
end})
TeleW:AddButton({
    Title = "World 3",
    Callback = function()
    	TPW3()
end})
local TeleHop = Server_Tab:AddSection("Hop")
TeleHop:AddButton({
    Title = "Rejoin",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId)
end})

local DoughBossFarm = General_Tab:AddSection("Farm Dough Boss")
local MonkataCheck = DoughBossFarm:AddParagraph({Title = "Kill Cake Monster : 0/500"})
DoughBossFarm:AddToggle("Auto Farm Prince",{
    Title = "Auto Farm Cake Prince",
    Description = "Farm Cake Prince And Dough Kings",
    Default = _G.Setting_table.FarmKata,
    Callback = function(vu)
    FarmKata = vu
	_G.Setting_table.FarmKata = vu
	Update_Setting(getgenv()['MyName'])
end})
DoughBossFarm:AddToggle("Auto Farm Prince",{
    Title = "Auto Farm Fully Dough King",
    Description = "If you need God's Chalice",
    Default = _G.Setting_table.FarmDoughBoss,
    Callback = function(vu)
    FarmDoughBoss = vu
	_G.Setting_table.FarmDoughBoss = vu
	Update_Setting(getgenv()['MyName'])
end})

local BoneFarm = General_Tab:AddSection("Farm Bone")
local BoneCheck = BoneFarm:AddParagraph({Title = "Bone : 0/5000"})
BoneFarm:AddToggle("Auto Farm Bone",{
    Title = "Auto Farm Bone",
    Description = "",
    Default = _G.Setting_table.AutoFarmBone,
    Callback = function(vu)
    AutoFarmBone = vu
	_G.Setting_table.AutoFarmBone = vu
	Update_Setting(getgenv()['MyName'])
end})
BoneFarm:AddToggle("Random Suprise",{
    Title = "Random Suprise",
    Description = "will random suprise and stop if got Hallow Essence",
    Default = _G.Setting_table.RSuprise,
    Callback = function(vu)
    RSuprise = vu
	_G.Setting_table.RSuprise = vu
	Update_Setting(getgenv()['MyName'])
end})
BoneFarm:AddToggle("Auto Farm Bone",{
    Title = "Auto Summon And Kill Hallow Boss",
    Description = "will summon if you have Hallow Essence",
    Default = _G.Setting_table.AutoKillBossBone,
    Callback = function(vu)
    AutoKillBossBone = vu
	_G.Setting_table.AutoKillBossBone = vu
	Update_Setting(getgenv()['MyName'])
end})

local EliteFarm = General_Tab:AddSection("Farm Bone")
local EliteCheck = EliteFarm:AddParagraph({Title = "Elite : 0"})
EliteFarm:AddToggle("Auto Farm Elite",{
    Title = "Auto Farm Elite",
    Description = "You can use stack with other function",
    Default = _G.Setting_table.AutoFarmElite,
    Callback = function(vu)
    AutoFarmElite = vu
	_G.Setting_table.AutoFarmElite = vu
	Update_Setting(getgenv()['MyName'])
end})
EliteFarm:AddToggle("Auto Farm Elite Hop",{ --ยังไม่ได้ทำ
    Title = "Auto Farm Elite Hop",
    Description = "will hop if elite not spawn and stop if have God's Chalice",
    Default = _G.Setting_table.AutoFarmEliteHop,
    Callback = function(vu)
    AutoFarmEliteHop = vu
	_G.Setting_table.AutoFarmEliteHop = vu
	Update_Setting(getgenv()['MyName'])
end})
EliteFarm:AddToggle("Auto Indra",{ --ยังไม่ได้ทำ
    Title = "Auto Indra",
    Description = "If Have God's Chalice Will Summon",
    Default = _G.Setting_table.AutoIndra,
    Callback = function(vu)
    AutoIndra = vu
	_G.Setting_table.AutoIndra = vu
	Update_Setting(getgenv()['MyName'])
end})

local FSE = Sea_Tab:AddSection("Sea Event")
FSE:AddDropdown("Select Zone",{
    Title = "Select Zone",
    Default = _G.Setting_table.ZoneSea,
    Values = {"Zone 1","Zone 2","Zone 3","Zone 4","Zone 5","Zone 6"},
    Callback = function(vu)
    _G.Setting_table.ZoneSea = vu
	Update_Setting(getgenv()['MyName'])
end})
FSE:AddToggle("Auto Sea Event",{
    Title = "Auto Sea Event",
    Description = "Farm Sea Event",
    Default = _G.Setting_table.FarmSeaEvent,
    Callback = function(vu)
    FarmSeaEvent = vu
	_G.Setting_table.FarmSeaEvent = vu
	Update_Setting(getgenv()['MyName'])
end})
FSE:AddToggle("",{
    Title = "Ingnore Shark",
    Description = "",
    Default = _G.Setting_table.IngnoreShark,
    Callback = function(vu)
    IngnoreShark = vu
	_G.Setting_table.IngnoreShark = vu
	Update_Setting(getgenv()['MyName'])
end})
FSE:AddToggle("",{
    Title = "Ingnore Piranha",
    Description = "",
    Default = _G.Setting_table.IngnorePiranha,
    Callback = function(vu)
    IngnorePiranha = vu
	_G.Setting_table.IngnorePiranha = vu
	Update_Setting(getgenv()['MyName'])
end})
FSE:AddToggle("",{
    Title = "Ingnore Terrorshark",
    Description = "",
    Default = _G.Setting_table.IngnoreTerrorshark,
    Callback = function(vu)
    IngnoreTerrorshark = vu
	_G.Setting_table.IngnoreTerrorshark = vu
	Update_Setting(getgenv()['MyName'])
end})
FSE:AddToggle("",{
    Title = "Ingnore Fish Crew Member",
    Description = "",
    Default = _G.Setting_table.IngnoreFishCrew,
    Callback = function(vu)
    IngnoreFishCrew = vu
	_G.Setting_table.IngnoreFishCrew = vu
	Update_Setting(getgenv()['MyName'])
end})
FSE:AddToggle("",{
    Title = "Ingnore Fish Boat",
    Description = "",
    Default = _G.Setting_table.IngnoreFishBoat,
    Callback = function(vu)
    IngnoreFishBoat = vu
	_G.Setting_table.IngnoreFishBoat = vu
	Update_Setting(getgenv()['MyName'])
end})
FSE:AddToggle("Auto Find Leviathan",{
    Title = "Auto Find Leviathan",
    Description = "Find Leviathan Will Stop If Forzen Island Spawn",
    Default = _G.Setting_table.FindLeviathan,
    Callback = function(vu)
    FindLeviathan = vu
	_G.Setting_table.FindLeviathan = vu
	Update_Setting(getgenv()['MyName'])
end})
local MaterialF = Item_Tab:AddSection("Farm Material")
MaterialF:AddDropdown("Select Material",{
    Title = "Select Material",
    Default = _G.Setting_table.SeleMaterial,
    Values = {"Angel Wings","Magma Ore","Yati","Scrap Metal","Leader","Vampire Fang","Gunpowder","Mini Tusk","Radioactive Material","Mystic Droplet","Fish Tail","Ectoplasm","Conjured Cocao","Candy","Dragon Scale","Demonic Wisp","Meteorite","Dark Fragment"},
    Callback = function(vu)
    _G.Setting_table.SeleMaterial = vu
	Update_Setting(getgenv()['MyName'])
end})
local MTRial = MaterialF:AddToggle("Auto Farm Material",{
    Title = "Auto Farm Material",
    Description = "",
    Default = _G.Setting_table.FarmMaterial,
    Callback = function(vu)
    FarmMaterial = vu
	_G.Setting_table.FarmMaterial = vu
	Update_Setting(getgenv()['MyName'])
end})
local EnchantYS = Item_Tab:AddSection("Enchant")
local CheckMS = EnchantYS:AddParagraph({Title = "None",Content = "None"})
EnchantYS:AddToggle("",{
    Title = "Enchant Your Sword",
    Description = "Will Enchant In Slot Only",
    Default = _G.Setting_table.EnchantSword,
    Callback = function(vu)
    EnchantSword = vu
	_G.Setting_table.EnchantSword = vu
	Update_Setting(getgenv()['MyName'])
end})

local FMy = General_Tab:AddSection("Farm Mastery")
FMy:AddDropdown("Mode Mastery",{
    Title = "Select Mode Mastery Farm",
    Description = "Mode Farm Mastery",
    Default = _G.Setting_table.ModeMas,
    Values = {"Devil Fruit","Gun"},
    Callback = function(vu)
    _G.Setting_table.ModeMas = vu
    Update_Setting(getgenv()['MyName'])
end})
FMy:AddToggle("Auto Farm Mastery",{
    Title = "Auto Farm Mastery",
    Description = "Pls selcet mode",
    Default = _G.Setting_table.Farm_Mastery,
    Callback = function(vu)
    Farm_Mastery = vu
	_G.Setting_table.Farm_Mastery = vu
	Update_Setting(getgenv()['MyName'])
end})
FMy:AddSlider("Points Stat",{
    Title = "Health %",
    Default = 30,
    Min = 0, 
    Max = 100, 
    Rounding = 0,
    Callback = function(vu) 
        _G.Setting_table.HPmon = vu
end})
FMy:AddToggle("Skillz",{
    Title = "Skill Z",
    Description = "",
    Default = _G.Setting_table.SkillMasZ,
    Callback = function(vu)
    _G.Setting_table.SkillMasZ = vu
    Update_Setting(getgenv()['MyName'])
end})
FMy:AddToggle("Skillx",{
    Title = "Skill X",
    Description = "",
    Default = _G.Setting_table.SkillMasX,
    Callback = function(vu)
    _G.Setting_table.SkillMasX = vu
    Update_Setting(getgenv()['MyName'])
end})
FMy:AddToggle("Skillc",{
    Title = "Skill C",
    Description = "",
    Default = _G.Setting_table.SkillMasC,
    Callback = function(vu)
    _G.Setting_table.SkillMasC = vu
    Update_Setting(getgenv()['MyName'])
end})
FMy:AddToggle("Skillv",{
    Title = "Skill V",
    Description = "",
    Default = _G.Setting_table.SkillMasV,
    Callback = function(vu)
    _G.Setting_table.SkillMasV = vu
    Update_Setting(getgenv()['MyName'])
end})
FMy:AddToggle("Skillf",{
    Title = "Skill F",
    Description = "",
    Default = _G.Setting_table.SkillMasF,
    Callback = function(vu)
    _G.Setting_table.SkillMasF = vu
    Update_Setting(getgenv()['MyName'])
end})
FMy:AddDropdown("Mode Mastery",{
    Title = "Select Skill",
    Description = "Mode Farm Mastery",
    Default = _G.Setting_table.SkillMas,
    Values = {"Z","X","C","V","F"},
    Opened = true,
    Callback = function(vu)
    _G.Setting_table.SkillMas = vu
    Update_Setting(getgenv()['MyName'])
end})

local m = Server_Tab:AddSection("Island")
m:AddDropdown("SelectIsland",{
    Title = "Select IsLand",
    Default = _G.Setting_table.SelectIs,
    Values = tmap,
    Callback = function(vu)
    SelectIs = vu
	_G.Setting_table.SelectIs = vu
	Update_Setting(getgenv()['MyName'])
end})
m:AddToggle("Teleport to island",{
    Title = "- Teleport to island",
    Default = _G.Setting_table.Teleportis,
    Callback = function(vu)
    Teleportis = vu
    _G.Setting_table.Teleportis = vu
    Update_Setting(getgenv()['MyName'])
end})
m:AddToggle("- Enabled Instant Teleport",{
    Title = "- Enabled Instant Teleport",
    Default = _G.Setting_table.Enabledis,
    Callback = function(vu)
    Enabledis = vu
    _G.Setting_table.Enabledis = vu
    Update_Setting(getgenv()['MyName'])
end})
spawn(function()
    game:GetService('RunService').Stepped:Connect(function()
        if Melee_A then
            if game:GetService("Players").LocalPlayer.Data.Points.Value > 0 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", Points)
            end
        end
    end)
end)
spawn(function()
    game:GetService('RunService').Stepped:Connect(function()
        if Defense_A then
            if game:GetService("Players").LocalPlayer.Data.Points.Value > 0 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", Points)
            end
        end
    end)
end)
spawn(function()
    game:GetService('RunService').Stepped:Connect(function()
        if Sword_A then
            if game:GetService("Players").LocalPlayer.Data.Points.Value > 0 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword", Points)
            end
        end
    end)
end)
spawn(function()
    game:GetService('RunService').Stepped:Connect(function()
        if Gun_A then
            if game:GetService("Players").LocalPlayer.Data.Points.Value > 0 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Gun", Points)
            end
        end
    end)
end)
spawn(function()
    game:GetService('RunService').Stepped:Connect(function()
        if Fruit_A then
            if game:GetService("Players").LocalPlayer.Data.Points.Value > 0 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", Points)
            end
        end
    end)
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Setting_table.Weapona == "Melee" then
                _G.Setting_table.Weapon = "Melee"
            elseif _G.Setting_table.Weapona == "Sword" then
                _G.Setting_table.Weapon = "Sword"
            elseif _G.Setting_table.Weapona == "Gun" then
                _G.Setting_table.Weapon = "Gun"
            elseif _G.Setting_table.Weapona == "Blox Fruit" then
                _G.Setting_table.Weapon = "Blox Fruit"
            else
                _G.Setting_table.Weapona = "Melee"
                _G.Setting_table.Weapon = "Melee"
            end
        end)
    end
end)
spawn(function()
	while task.wait() do
		pcall(function()
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v:IsA("Tool") then
					if v.ToolTip == _G.Setting_table.Weapona then
						_G.Setting_table.Weapon = v.Name
					end
				end
			end
		end)
	end
end)

function NPCPos()
    for i,v in pairs(require(game:GetService("ReplicatedStorage").GuideModule)["Data"]["NPCList"]) do
		if v["NPCName"] == require(game:GetService("ReplicatedStorage").GuideModule)["Data"]["LastClosestNPC"] then
			return i["CFrame"]
		end
	end
end
function CheckQuest()
    local Lvl = game:GetService("Players").LocalPlayer.Data.Level.Value
    local IgnoreQuests = {"BartiloQuest", "Trainees", "MarineQuest", "CitizenQuest"}
    local Quest = {}
    local LevelReq = 0
    for i,v in pairs(require(game:GetService("ReplicatedStorage").Quests)) do
		for a,b in pairs(v) do
		    for j, k in pairs(b["Task"]) do
		    	if b["LevelReq"] <= Lvl and b["LevelReq"] >= LevelReq and not table.find(IgnoreQuests, i) and k > 1 then		            
			    	Quest["QuestName"] = i
			        Quest["ID"] = a
			        Quest["MobName"] = j
                    LevelReq = b["LevelReq"]
		        end
			end	
		end
	end
	if LevelReq >= 700 and W1 then
        Quest["MobName"] = "Galley Captain"
        Quest["QuestName"] = "FountainQuest"
        Quest["ID"] = 2
    elseif LevelReq >= 1450 and W2 then
        Quest["MobName"] = "Water Fighter"
        Quest["QuestName"] = "ForgottenQuest"
        Quest["ID"] = 2
    end
	return Quest
end
function GetQuest()
    local questname = CheckQuest()["QuestName"]
    local id = CheckQuest()["ID"]
    if (NPCPos().Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
        wait(.5)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("StartQuest", questname, id)
    else
        TP(NPCPos())
    end
end
spawn(function()
    while wait() do
        pcall(function()
            if StatrMagnet then
                if AutoGhoul or _G.Setting_table.SeleMaterial == "Ectoplasm" then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v.HumanoidRootPart.Position - _G.PosMon.Position).Magnitude <= 100 then
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            v.Humanoid:ChangeState(11)
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.CFrame = _G.PosMon
                            sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius", math.huge)
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 9e20)
                        end
                    end
                    else
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v.HumanoidRootPart.Position - _G.PosMon.Position).Magnitude <= 350 then
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            v.Humanoid:ChangeState(11)
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.CFrame = _G.PosMon
                            sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius", math.huge)
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 9e20)
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if Farm_Lv then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == CheckQuest()["MobName"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            StatrMagnet = true
                            _G.PosMon = v.HumanoidRootPart.CFrame
                            repeat task.wait()
                                EquipWeapon(_G.Setting_table.Weapon)
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                                attackm = true
                            until not Farm_Lv or v.Humanoid.Health <= 0 or not v:FindFirstChild("HumanoidRootPart") or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                            attackm = false
                            StatrMagnet = false
                        else
                            TP(CFrameMon)
                        end
                    end
                    if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, CheckQuest()["MobName"]) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")    
			        end
                else
                    GetQuest()
                end
            end
        end)
    end
end)
function FindBossWold2Quest()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Ice Admiral"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Ice Admiral"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end

spawn(function()
    while wait() do
        pcall(function()
            if World2 then
                if game:GetService("Players").LocalPlayer.Data.Level.Value >= 700 then
                    if game.Workspace.Map.Ice.Door.CanCollide == true and game.Workspace.Map.Ice.Door.Transparency == 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                        EquipWeapon("Key")
                        repeat task.wait()
                            TP(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                        until game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1
                    else
                        if FindBossWold2Quest() then
                        v = FindBossWold2Quest()
                        	repeat task.wait()
                        		EquipWeapon(_G.Setting_table.Weapon)
                    		    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                        		attackm = true
                        	until not World2 or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
                        	attackm = false
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                        end
                    end
                end
            end
        end)
    end
end)

function FindSaber()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Saber Expert"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Saber Expert"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FindMobLeader()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Mob Leader"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Mob Leader"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FindSwordSaber()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            if v.Name == "Saber" then
                return v
            end
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            if v.Name == "Saber" then
                return v
            end
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
        if v:IsA("Tool") then
            if v.Name == "Saber" then
                return v
            end
        end
    end
end
spawn(function()
    while task.wait() do
        pcall(function()
            if Auto_Saber then
                if game:GetService("Players").LocalPlayer.Data.Level.Value >= 200 then
                    if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
                        if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
                                repeat task.wait()
                                    TP(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                                until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                                wait(.5)
                                repeat task.wait()
                                    TP(game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame)
                                until (game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                                wait(.5)
                                repeat task.wait()
                                    TP(game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame)
                                until (game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                                wait(.5)
                                repeat task.wait()
                                    TP(game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame)
                                until (game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                                wait(.5)
                                repeat task.wait()
                                    TP(game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame)
                                until (game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                                wait(.5)
                                repeat task.wait()
                                    TP(game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame)
                                until (game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                                wait(.5)
                		else 
                			if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
                				if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                					EquipWeapon("Torch")
                					TP(CFrame.new(1115.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
                				else
                					TP(CFrame.new(-1611.1263427734375, 12.177388191223145, 162.85617065429688))                 
                				end
                				else
                				if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
                					--task.wait()
                					EquipWeapon("Cup")
                					--task.wait()
                					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)
                					--task.wait()
                					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") 
                					else
                					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
                						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                					elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
            							if FindMobLeader() then
            							    v = FindMobLeader()
            							    repeat task.wait()
        										EquipWeapon(_G.Setting_table.Weapon)
                                    		    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
        										attackm = true  
        									until v.Humanoid.Health <= 0 or not v.Parent or not Auto_Saber 
        									attackm = false
            							end
                						elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
                						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                						EquipWeapon("Relic")
                						repeat task.wait()
                						    TP(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
                						until (Vector3.new(-1404.91504, 29.9773273, 3.80598116) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                					end
                				end
                			end
                        end
                        else
                        if FindSaber() then
						    v = FindSaber()
						    repeat task.wait()
								EquipWeapon(_G.Setting_table.Weapon)
                    		    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
								attackm = true
							until v.Humanoid.Health <= 0 or not v.Parent or not Auto_Saber 
							attackm = false
                        else
                            TP(CFrame.new(-1458.89502, 29.8870335, -50.633564))
						end
                    end
                end
            end
        end)
    end
end)

function FindMonRen()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Arctic Warrior","Snow Lurker","Awakened Ice Admiral"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Arctic Warrior","Snow Lurker","Awakened Ice Admiral"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
spawn(function()
    while task.wait() do
        pcall(function()
            if Auto_Rengoku then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") then
                    TP(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
                else
                    if FindMonRen() then
                        v = FindMonRen()
                        StatrMagnet = true
                        _G.PosMon = v.HumanoidRootPart.CFrame
                        repeat task.wait()
                            EquipWeapon(_G.Setting_table.Weapon)
                		    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
    						attackm = true
                        until v.Humanoid.Health <= 0 or not v.Parent or not Auto_Rengoku
                        StatrMagnet = false
                        attackm = false
                        else
                            TP(CFrame.new(5667.6582, 50, -6486.08984))
                    end
                end
            end
        end)
    end
end)

function FindMonBartilo1()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Swan Pirate"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Swan Pirate"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FindMonBartilo2()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Jeremy"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Jeremy"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
spawn(function()
    while task.wait() do
        pcall(function()
            if bartilo_quest then
                if game:GetService("Players").LocalPlayer.Data.Level.Value >= 850 then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                        if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            if FindMonBartilo1() then
                                v = FindMonBartilo1()
                                StatrMagnet = true
                                _G.PosMon = v.HumanoidRootPart.CFrame
                                repeat task.wait()
                                    EquipWeapon(_G.Setting_table.Weapon)
                        		    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
            						attackm = true
                                until v.Humanoid.Health <= 0 or not v.Parent or not bartilo_quest
                                StatrMagnet = false
                                attackm = false
                                else
                                    TP(CFrame.new(913.2153930664062, 157.4447021484375, 1253.3961181640625))
                            end
                            else
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                        if FindMonBartilo2() then
                            v = FindMonBartilo2()
                            repeat task.wait()
                                EquipWeapon(_G.Setting_table.Weapon)
                    		    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
        						attackm = true
                            until v.Humanoid.Health <= 0 or not v.Parent or not bartilo_quest
                            attackm = false
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1850.49329, 13.1789551, 1750.89685)
                    	wait()
                    	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.87305, 19.3777466, 1712.01807)
                    	wait()
                    	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1803.94324, 16.5789185, 1750.89685)
                    	wait()
                    	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.55835, 16.8604317, 1724.79541)
                    	wait()
                    	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1869.54224, 15.987854, 1681.00659)
                    	wait()
                    	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1800.0979, 16.4978027, 1684.52368)
                    	wait()
                    	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1819.26343, 14.795166, 1717.90625)
                    	wait()
                    	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1813.51843, 14.8604736, 1724.79541)
                    else
                        Text("Your Already Quest")
                        wait(1)
                    end
                    else
                        Text("Your Level Is Low")
                        wait(1)
                        _G.Setting_table.bartilo_quest = false
                end
            end
        end)
    end
end)
spawn(function()
    while wait(.1) do
        pcall(function()
            if D_Superhuman then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman") == 1 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman") == 2 then
                	else
            		if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
            			if game:GetService("Players").LocalPlayer.Data.Beli.Value > 150000 then
            				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
            			end
            			
            		end
            		if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            		end
            		if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            		end
            		if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            		end
            		if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            		end
            		if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
            		end
            		if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
            		end
            		if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
            		end
            		if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
            		end
            		if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            			local FG = game:GetService("Players").LocalPlayer.Data.Fragments.Value
            			if FG >= 1500 then
            				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
            			end
            		end
            		if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            			local FG = game:GetService("Players").LocalPlayer.Data.Fragments.Value
            			if FG >= 1500 then
            				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
            			end
            		end
            		if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            			local Beli = game:GetService("Players").LocalPlayer.Data.Beli.Value
            			if Beli >= 3000000 then
            				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
            			end
            		end
            		if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            			local Beli = game:GetService("Players").LocalPlayer.Data.Beli.Value
            			if Beli >= 3000000 then
            				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
            			end
            		end
                end
    	    end
        end)
    end
end)

function FindMonEvoRace()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Ship Deckhan","Ship Engineer","Ship Steward","Ship Officer"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Ship Deckhan","Ship Engineer","Ship Steward","Ship Officer"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
spawn(function()
    while wait() do
        pcall(function()
            if EvoRace then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
                    repeat task.wait()
                        TP(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
                    until (Vector3.new(-2779.83521, 72.9661407, -3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
                elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
                    pcall(function()
                        if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                            repeat TP(game:GetService("Workspace").Flower1.CFrame) task.wait()
                            until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") or not EvoRace
                        elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                            repeat TP(game:GetService("Workspace").Flower2.CFrame) task.wait()
                            until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") or not EvoRace
                        elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                            if FindMonEvoRace() then
                                v = FindMonEvoRace()
                                StatrMagnet = true
                                _G.PosMon = v.HumanoidRootPart.CFrame
                                repeat task.wait()
                                    EquipWeapon(_G.Setting_table.Weapon)
                        		    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
            						attackm = true
                                until v.Humanoid.Health <= 0 or not v.Parent or not EvoRace
                                StatrMagnet = false
                                attackm = false
                                else
                                    TP(CFrame.new(923.2125244140625, 125.40035247802734, 32852.83203125))
                            end
                        end
                    end)
                elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
                elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == -2 then
                    Text("Wait Auto V3 Soon")
                    wait(1)
                end
            end
        end)
    end
end)

function FindBossRaceGhoul()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Cursed Captain"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Cursed Captain"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FindMonRaceGhoul()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Ship Deckhan","Ship Engineer","Ship Steward","Ship Officer"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Ship Deckhan","Ship Engineer","Ship Steward","Ship Officer"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
spawn(function()
    while wait() do
        pcall(function()
            if AutoGhoul then
                if not W2 then
                    TPW2()
                else
                    if game.Players.LocalPlayer.Data.Race.Value == 'Ghoul' then
                        Text("Your Already Race Ghoul")
                        wait(1)
                        else
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Hellfire Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Hellfire Torch") then
                            if GetMaterial("Ectoplasm") < 100 then
                                if FindMonRaceGhoul() then
                                    v = FindMonRaceGhoul()
                                    StatrMagnet = true
                                    _G.PosMon = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(_G.Setting_table.Weapon)
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                                        attackm = true
                                    until v.Humanoid.Health <= 0 or not v.Parent or not AutoGhoul
                                    StatrMagnet = false
                                    attackm = false
                                    else
                                        TP(CFrame.new(923.2125244140625, 125.40035247802734, 32852.83203125))
                                end
                            elseif GetMaterial("Ectoplasm") >= 100 then
                                repeat task.wait()
                                TP(CFrame.new(918.615234, 122.202454, 33454.3789, -0.999998808, 0, 0.00172644004, 0, 1, 0, -0.00172644004, 0, -0.999998808))
                                until (Vector3.new(918.615234, 122.202454, 33454.3789, -0.999998808, 0, 0.00172644004, 0, 1, 0, -0.00172644004, 0, -0.999998808)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","BuyCheck",4)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","Change",4)
                            end
                        else
                            if FindBossRaceGhoul() then
                                v = FindBossRaceGhoul()
                                repeat task.wait()
                                    EquipWeapon(_G.Setting_table.Weapon)
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                                    attackm = true
                                until v.Humanoid.Health <= 0 or not v.Parent or not AutoGhoul
                                attackm = false
                                else
                                    TP(CFrame.new(923.2125244140625, 300.40035247802734, 32852.83203125))
                            end
                        end
                    end
                end
            end
        end)
    end
end)

function FindOrder()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Order"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Order"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
ggez = function(suck)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = suck
end

xZcLuvHades = function(mydick)
	for i = 1, 6 do
		ggez(mydick)
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end
end
spawn(function()
    while wait() do
        pcall(function()
            if AutoCB then
                if game.Players.LocalPlayer.Data.Race.Value == 'Cyborg' then
                    Text("Your Already Race Cyborg")
                    wait(1)
                else
                    if game:GetService("Workspace").Map.CircleIsland.BlockPart.Transparency == 1 or game:GetService("Workspace").Map.CircleIsland.BlockPart.CanCollide == false then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Core Brain") or game.Players.LocalPlayer.Character:FindFirstChild("Core Brain") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer","Buy")
                        else
                            if FindOrder() then
                                v = FindOrder()
                                repeat task.wait()
                                    EquipWeapon(_G.Setting_table.Weapon)
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                                    attackm = true
                                until v.Humanoid.Health <= 0 or not v.Parent or not AutoCB
                                attackm = false
                            else
                                if game.Players.LocalPlayer.Character:FindFirstChild("Microchip") or game.Players.LocalPlayer.Backpack:FindFirstChild("Microchip") then
                                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                                else
                                    if game:GetService("Players").LocalPlayer.Data.Fragments.Value < 1000 then
                                        Text("Fragment is low")
                                        wait(1)
                                    else
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","1")
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","2")
                                    end
                                end
                            end
                        end
                    else
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                        else
                            for i, v in ipairs(game:GetService("Workspace"):GetChildren()) do
                                if v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3" then
                                    repeat task.wait()
                                        xZcLuvHades(v.CFrame)
                                    game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
                                    until not v.Parent or not AutoCB or game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness")
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

function FindBossKata()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Dough King","Cake Prince"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Dough King","Cake Prince"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FindMonKata()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Cookie Crafter","Cake Guard","Baking Staff","Head Baker"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Cookie Crafter","Cake Guard","Baking Staff","Head Baker"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
spawn(function()
    while task.wait() do
        pcall(function()
            if FarmKata then
                if FindBossKata() then
                    v = FindBossKata()
                    repeat task.wait()
                        EquipWeapon(_G.Setting_table.Weapon)
                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                        attackm = true
                    until v.Humanoid.Health <= 0 or not v.Parent or not FarmKata
                    attackm = false
                else
                    if FindMonKata() then
                        v = FindMonKata()
                        StatrMagnet = true
                        _G.PosMon = v.HumanoidRootPart.CFrame
                        repeat task.wait()
                            EquipWeapon(_G.Setting_table.Weapon)
                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                            attackm = true
                        until v.Humanoid.Health <= 0 or not v.Parent or not FarmKata
                        attackm = false
                        StatrMagnet = false
                    else
                        TP(CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375))
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            CheckStatMBE()
        end)
    end
end)

function FindMonBone()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
spawn(function()
    while task.wait() do
        if AutoFarmBone then
            if FindMonBone() then
                v = FindMonBone()
                StatrMagnet = true
                _G.PosMon = v.HumanoidRootPart.CFrame
                repeat task.wait()
                    EquipWeapon(_G.Setting_table.Weapon)
                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                    attackm = true
                until v.Humanoid.Health <= 0 or not v.Parent or not AutoFarmBone
                attackm = false
                StatrMagnet = false
            else
                TP(CFrame.new(-9501.54296875, 580.0858154296875, 6032.970703125))
            end
        end
    end
end)
task.spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if RSuprise then
            if game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then
            else
                while task.wait() do
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
                end
            end
        end
    end)
end)

function FindElite()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Urban","Diablo","Deandre"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Urban","Diablo","Deandre"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
spawn(function()
    while wait() do
        pcall(function()
            if AutoFarmElite then
                if FindElite() then
                    v = FindElite()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                    repeat task.wait()
                        EquipWeapon(_G.Setting_table.Weapon)
                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                        attackm = true
                    until v.Humanoid.Health <= 0 or not v.Parent or not AutoFarmElite
                    attackm = false
                end
            end
        end)
    end
end)

function FindBossBone()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Soul Reaper"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Soul Reaper"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
spawn(function()
    while wait() do
        pcall(function()
            if AutoKillBossBone then
                if FindBossBone() then
                    v = FindBossBone()
                    repeat task.wait()
                        EquipWeapon(_G.Setting_table.Weapon)
                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                        attackm = true
                    until v.Humanoid.Health <= 0 or not v.Parent or not AutoKillBossBone
                    attackm = false
                else
                    if game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then
                        repeat task.wait()
                            TP(CFrame.new(-8932.728515625, 146.7965087890625, 6063.1845703125))
                        until FindBossBone() or not AutoKillBossBone
                    end
                end
            end
        end)
    end
end)

function FindMonCocoa()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Cocoa Warrior","Chocolate Bar Battler"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Cocoa Warrior","Chocolate Bar Battler"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
spawn(function()
    while wait() do
        pcall(function()
            if FarmDoughBoss then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
                    if GetMaterial("Conjured Cocoa") >= 10 then
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
                    elseif GetMaterial("Conjured Cocoa") < 10 then
                        if FindMonCocoa() then
                            v = FindMonCocoa()
                            StatrMagnet = true
                            _G.PosMon = v.HumanoidRootPart.CFrame
                            repeat task.wait()
                                EquipWeapon(_G.Setting_table.Weapon)
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                                attackm = true
                            until v.Humanoid.Health <= 0 or not v.Parent or not FarmDoughBoss
                            attackm = false
                            StatrMagnet = false
                        else
                            TP(CFrame.new(616.9508666992188, 82.83536529541016, -12574.2841796875))
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") then
                    if FindBossKata() then
                        v = FindBossKata()
                        repeat task.wait()
                            EquipWeapon(_G.Setting_table.Weapon)
                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                            attackm = true
                        until v.Humanoid.Health <= 0 or not v.Parent or not FarmDoughBoss
                        attackm = false
                    else
                        if FindMonKata() then
                            v = FindMonKata()
                            StatrMagnet = true
                            _G.PosMon = v.HumanoidRootPart.CFrame
                            repeat task.wait()
                                EquipWeapon(_G.Setting_table.Weapon)
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                                attackm = true
                            until v.Humanoid.Health <= 0 or not v.Parent or not FarmDoughBoss
                            attackm = false
                            StatrMagnet = false
                        else
                            TP(CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375))
                        end
                    end
                end
            end
        end)
    end
end)

function TPBoat(TweenCFrame,obj,ts)
    if not ts then ts = 350 end
    local tween_s = game:GetService("TweenService")
    local info = TweenInfo.new((TweenCFrame.Position -obj.Position).Magnitude /ts,Enum.EasingStyle.Linear)
    tween = tween_s:Create(obj,info,{CFrame = TweenCFrame})
    tween:Play() 
end
function MyBoat()
    for i, v in next, game:GetService("Workspace").Boats:GetChildren() do
        if v:IsA("Model") then
            if v:FindFirstChild("Owner") and tostring(v.Owner.Value) == game:GetService("Players").LocalPlayer.Name and v.Humanoid.Value > 0 then
                return v
            end
        end
    end
    return false
end
spawn(function()
    while wait() do
        pcall(function()
            if _G.Setting_table.ZoneSea == "Zone 1" then
                ZoneCFrame = CFrame.new(-21313.607421875, 12.560698509216309, 1330.6165771484375)
            elseif _G.Setting_table.ZoneSea == "Zone 2" then
                ZoneCFrame = CFrame.new(-24815.267578125, 12.560657501220703, 5262.62060546875)
            elseif _G.Setting_table.ZoneSea == "Zone 3" then
                ZoneCFrame = CFrame.new(-28464.876953125, 12.553319931030273, 6896.8076171875)
            elseif _G.Setting_table.ZoneSea == "Zone 4" then
                ZoneCFrame = CFrame.new(-30294.8515625, 12.554117202758789, 10409.8564453125)
            elseif _G.Setting_table.ZoneSea == "Zone 5" then
                ZoneCFrame = CFrame.new(-37704.828125, 12.561018943786621, 6750.69873046875)
            elseif _G.Setting_table.ZoneSea == "Zone 6" then
                ZoneCFrame = CFrame.new(-32704.103515625, 12.557344436645508, 24089.923828125)
            end
        end)
    end
end)
if W2 then
    CFrameBoat = CFrame.new(-13.488054275512695, 10.311711311340332, 2927.69287109375)
    Vector3Boat = Vector3.new(-13.488054275512695, 10.311711311340332, 2927.69287109375)
elseif W3 then
    CFrameBoat = CFrame.new(-16207.501953125, 9.0863618850708, 475.1490783691406)
    Vector3Boat = Vector3.new(-16207.501953125, 9.0863618850708, 475.1490783691406)
end
function CheckSeaBeast()
    for r, v in next, game:GetService("Workspace").SeaBeasts:GetChildren() do
        if v.Name == "SeaBeast1" then
            local s = v.HealthBBG.Frame.TextLabel.Text
            local c5 = s:gsub("/%d+,%d+", "")
            local a = v.HealthBBG.Frame.TextLabel.Text
            local ab
            if string.find(c5, ",") then
                ab = a:gsub("%d+,%d+/", "")
            else
                ab = a:gsub("%d+/", "")
            end
            local c = ab:gsub(",", "")
            if tonumber(c) >= 34500 then
                return v
            end
        end
    end
    return false
end
function CheckPirateBoat()
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"PirateBrigade", "PirateGrandBrigade"}, v.Name) then
            return v
        end
    end
end
function FindShark()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Shark"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Shark"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FindPiranha()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Piranha"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Piranha"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FindTerrorshark()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Terrorshark"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Terrorshark"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FindFish()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Fish Crew Member"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Fish Crew Member"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FindFishBoat()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"FishBoat"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"FishBoat"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
local Nigga = {}
spawn(function()
    while task.wait() do
        pcall(function()
            if FarmSeaEvent then
                if FindShark() and FindPiranha() and FindTerrorshark() and FindFish() and FindFishBoat() and CheckPirateBoat() or CheckSeaBeast() then
                else
                    if MyBoat() then
                        if game:GetService("Players").LocalPlayer.Character.Humanoid.Sit then
                            if (MyBoat().VehicleSeat.Position-ZoneCFrame.Position).Magnitude > 100 then
                                TPBoat(ZoneCFrame,MyBoat().VehicleSeat,350)
                                for i,v in pairs(MyBoat():GetDescendants()) do 
                                    pcall(function() 
                                        v.CanCollide = false
                                        table.insert(Nigga,v) 
                                    end)
                                end
                            end
                        else
                            TP(MyBoat().VehicleSeat.CFrame*CFrame.new(0,1.5,0))
                        end
                    else
                        if (Vector3Boat - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 20 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", "PirateBrigade")
                            else
                                TP(CFrameBoat)
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if FarmSeaEvent and not IngnoreShark then
                if FindShark() then
                    v = FindShark()
                    repeat task.wait()
                        game:GetService("Players").LocalPlayer.Character.Humanoid.Sit = false
                        EquipWeapon(_G.Setting_table.Weapon)
                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                        attackm = true
                    until v.Humanoid.Health <= 0 or not v.Parent or not FarmSeaEvent
                    attackm = false
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if FarmSeaEvent and not IngnorePiranha then
                if FindPiranha() then
                    v = FindPiranha()
                    repeat task.wait()
                        game:GetService("Players").LocalPlayer.Character.Humanoid.Sit = false
                        EquipWeapon(_G.Setting_table.Weapon)
                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                        attackm = true
                    until v.Humanoid.Health <= 0 or not v.Parent or not FarmSeaEvent
                    attackm = false
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if FarmSeaEvent and not IngnoreTerrorshark then
                if FindTerrorshark() then
                    v = FindTerrorshark()
                    repeat task.wait()
                        game:GetService("Players").LocalPlayer.Character.Humanoid.Sit = false
                        EquipWeapon(_G.Setting_table.Weapon)
                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                        attackm = true
                    until v.Humanoid.Health <= 0 or not v.Parent or not FarmSeaEvent
                    attackm = false
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if FarmSeaEvent and not IngnoreFishCrew then
                if FindFish() then
                    v = FindFish()
                    repeat task.wait()
                        game:GetService("Players").LocalPlayer.Character.Humanoid.Sit = false
                        EquipWeapon(_G.Setting_table.Weapon)
                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                        attackm = true
                    until v.Humanoid.Health <= 0 or not v.Parent or not FarmSeaEvent
                    attackm = false
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if FarmSeaEvent and not IngnoreFishBoat then
                if FindFishBoat() then
                    v = FindFishBoat()
                    repeat task.wait()
                        game:GetService("Players").LocalPlayer.Character.Humanoid.Sit = false
                        EquipWeapon(_G.Setting_table.Weapon)
                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                        attackm = true
                    until v.Humanoid.Health <= 0 or not v.Parent or not FarmSeaEvent
                    attackm = false
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if spamskill then
                _G.Setting_table.Weapon = "Melee"
                wait(1)
                _G.Setting_table.Weapon = "Sword"
                wait(1)
                _G.Setting_table.Weapon = "Gun"
                wait(1)
                _G.Setting_table.Weapon = "Blox Fruit"
                wait(1)
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if spamskill then
                game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,118,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,118,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if FarmSeaEvent and not IngnoreSeaBeast then
                for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Sit = false
                            EquipWeapon(_G.Setting_table.Weapon)
                            TP(v.HumanoidRootPart.CFrame.X, 100,v.HumanoidRootPart.CFrame.Z)
                            spamskill = true
                        until v.Humanoid.Health <= 0 or not v.Parent or not FarmSeaEvent
                        spamskill = false
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if FarmSeaEvent and not IngnoreSeaBeast then
                if CheckPirateBoat() then
                    for i,v in pairs(Enemies:GetChildren()) do
                        if v:FindFirstChild("Engine") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                game:GetService("Players").LocalPlayer.Character.Humanoid.Sit = false
                                EquipWeapon(_G.Setting_table.Weapon)
                                TP(v.HumanoidRootPart.CFrame.X, 100,v.HumanoidRootPart.CFrame.Z)
                                spamskill = true
                            until v.Humanoid.Health <= 0 or not v.Parent or not FarmSeaEvent
                            spamskill = false
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        if FindLeviathan then
            if game:GetService("Players").LocalPlayer.Character.Humanoid.Sit and (MyBoat().VehicleSeat.Position - CfLeviFind.Position).Magnitude >= 50 then
                TPBoat(CFrame.new(-118140.65625, 31.783639907836914, 172404.875) * CFrame.new(0,40,0),MyBoat().VehicleSeat,350)
            elseif game:GetService("Workspace").Locations:FindFirstChild("Frozen Dimension") then
                TPBoat(CFrame.new(-118140.65625, 31.783639907836914, 172404.875) * CFrame.new(0,40,0),MyBoat().VehicleSeat,0)
            end
        end
    end
end)

spawn(function()
    while wait(.1) do
        pcall(function()
            if MagmaoreWait == nil then
                MagmaoreWait = CFrame.new(-5458.98583984375, 99.66064453125, -5827.193359375)
            end
            if (Vector3.new(-5458.98583984375, 99.66064453125, -5827.193359375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                MagmaoreWait = CFrame.new(-5250.14990234375, 56.49302291870117, -4786.2060546875)
            elseif (Vector3.new(-5250.14990234375, 56.49302291870117, -4786.2060546875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                MagmaoreWait = CFrame.new(-5458.98583984375, 99.66064453125, -5827.193359375)
            end
            if DragonScaleWait == nil then
                DragonScaleWait = CFrame.new(4161.8388671875, 51.825111389160156+40, -1314.7293701171875)
            end
            if (Vector3.new(4161.8388671875, 51.825111389160156+40, -1314.7293701171875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                DragonScaleWait = CFrame.new(6470.3544921875, 51.83952331542969+40, -1038.59716796875)
            elseif (Vector3.new(6470.3544921875, 51.83952331542969+40, -1038.59716796875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                DragonScaleWait = CFrame.new(6673.94921875, 378.7328186035156+40, 342.2649841308594)
            elseif (Vector3.new(6673.94921875, 378.7328186035156+40, 342.2649841308594)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                DragonScaleWait = CFrame.new(4161.8388671875, 51.825111389160156+40, -1314.7293701171875)
            end
            if WTood == nil then
                WTood = CFrame.new(60888.671875, 96.01477813720703, 1525.4569091796875)
            end
            if (Vector3.new(60888.671875, 96.01477813720703, 1525.4569091796875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                WTood = CFrame.new(61941.4765625, 108.8272933959961, 1559.036376953125)
            elseif (Vector3.new(61941.4765625, 108.8272933959961, 1559.036376953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                WTood = CFrame.new(60888.671875, 96.01477813720703, 1525.4569091796875)
            end
            if bethoda == nil then
                bethoda = CFrame.new(-7631.80078125, 5637.423828125, -1435.3065185546875)
            end
            if (Vector3.new(-7631.80078125, 5637.423828125, -1435.3065185546875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                bethoda = CFrame.new(-4714.62744140625, 880.1715087890625, -1938.22705078125)
            elseif (Vector3.new(-4714.62744140625, 880.1715087890625, -1938.22705078125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                bethoda = CFrame.new(-7687.64501953125, 5601.17236328125, -441.61865234375)
            elseif (Vector3.new(-7687.64501953125, 5601.17236328125, -441.61865234375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                bethoda = CFrame.new(-7631.80078125, 5637.423828125, -1435.3065185546875)
            end
        end)
    end
end)
spawn(function()
    while wait(.1) do
        pcall(function()
            if _G.Setting_table.SeleMaterial == "Dragon Scale" then
                MCheckTerial = {"Dragon Crew Warrior","Dragon Crew Archer"}
                CFrameMat = DragonScaleWait
            elseif _G.Setting_table.SeleMaterial == "Scrap Metal" then
                if W3 then
                    MCheckTerial = {"Pirate Millionaire","Pistol Billionaire"}
                    CFrameMat = CFrame.new(-394.2919616699219, 134.57373046875, 5839.36279296875)
                elseif W2 then
                    MCheckTerial = {"Mercenary"}
                    CFrameMat = CFrame.new(-1014.1416015625, 100.9596939086914, 1429.927001953125)
                elseif W1 then
                    MCheckTerial = {"Pirate","Brute"}
                    CFrameMat = CFrame.new(-1062.05078125, 60.11216735839844, 4031.670166015625)
                end
            elseif  _G.Setting_table.SeleMaterial == "Leader" then
                if W3 then
                    MCheckTerial = {"Pirate Millionaire","Pistol Billionaire"}
                    CFrameMat = CFrame.new(-394.2919616699219, 134.57373046875, 5839.36279296875)
                elseif W2 then
                    MCheckTerial = {"Mercenary"}
                    CFrameMat = CFrame.new(-1014.1416015625, 100.9596939086914, 1429.927001953125)
                elseif W1 then
                    MCheckTerial = {"Pirate","Brute"}
                    CFrameMat = CFrame.new(-1062.05078125, 60.11216735839844, 4031.670166015625)
                end
            elseif  _G.Setting_table.SeleMaterial == "Gunpowder" then
                if W3 then
                    MCheckTerial = {"Pirate Millionaire","Pistol Billionaire"}
                    CFrameMat = CFrame.new(-394.2919616699219, 134.57373046875, 5839.36279296875)
                elseif W1 then
                    MCheckTerial = {"Pirate","Brute"}
                    CFrameMat = CFrame.new(-1062.05078125, 60.11216735839844, 4031.670166015625)
                end
            elseif _G.Setting_table.SeleMaterial == "Mini Tusk" then
                MCheckTerial = {"Mythological Pirate"}
                CFrameMat = CFrame.new(-13512.2646484375, 583.182861328125, -6988.12548828125)
            elseif _G.Setting_table.SeleMaterial == "Fish Tail" then
                if W3 then
                    MCheckTerial = {"Fishman Captain","Fishman Raider"}
                    CFrameMat = CFrame.new(-10668.416015625, 350.76263427734375, -8770.1796875)
                elseif W1 then
                    MCheckTerial = {"Fishman Warrior","Fishman Commando"}
                    CFrameMat = WTood
                end
            elseif _G.Setting_table.SeleMaterial == "Conjured Cocao" then
                MCheckTerial = {"Cocoa Warrior","Chocolate Bar Battler"}
                CFrameMat = CFrame.new(216.38002014160156, 126.59194946289062, -12602.2470703125)
            elseif _G.Setting_table.SeleMaterial == "Demonic Wisp" then
                MCheckTerial = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}
                CFrameMat = CFrame.new(-9501.54296875, 580.0858154296875, 6032.970703125)
            elseif _G.Setting_table.SeleMaterial == "Magma Ore" then
                if W2 then
                    MCheckTerial = {"Lava Pirate","Magma Ninja"}
                    CFrameMat = MagmaoreWait
                elseif W1 then
                    MCheckTerial = {"Military Soldier","Military Spy"}
                    CFrameMat = CFrame.new(-5514.59912109375, 62.79969787597656, 8576.798828125)
                end
            elseif _G.Setting_table.SeleMaterial == "Vampire Fang" then
                MCheckTerial = {"Vampire"}
                CFrameMat = CFrame.new(-6024.29833984375, 26.402699947357178, -1298.791748046875)
            elseif _G.Setting_table.SeleMaterial == "Radioactive Material" then
                MCheckTerial = {"Factory Staff"}
                CFrameMat = CFrame.new(264.457275390625, 123.01873016357422, -266.58636474609375)
            elseif _G.Setting_table.SeleMaterial == "Mystic Droplet" then
                MCheckTerial = {"Water Fighter"}
                CFrameMat = CFrame.new(-3266.053955078125, 299.0077209472656, -10551.6806640625)
            elseif _G.Setting_table.SeleMaterial == "Ectoplasm" then
                MCheckTerial = {"Ship Deckhan","Ship Engineer","Ship Steward","Ship Officer"}
                CFrameMat = CFrame.new(923.2125244140625, 125.40035247802734, 32852.83203125)
            elseif _G.Setting_table.SeleMaterial == "Meteorite" then
                MCheckTerial = {"Fajita"}
                CFrameMat = CFrame.new(-2297.40332, 115.449463, -3946.53833)
            elseif _G.Setting_table.SeleMaterial == "Dark Fragment" then
                MCheckTerial = {"Darkbeard"}
                CFrameMat = CFrame.new(3876.00366, 24.6882591, -3820.21777)
            elseif _G.Setting_table.SeleMaterial == "Angel Wings" then
                MCheckTerial = {"God's Guard","Shanda","Royal Squad","Royal Soldier"}
                CFrameMat = bethoda
            elseif _G.Setting_table.SeleMaterial == "Yeti" then
                MCheckTerial = {"Yeti"}
                CFrameMat = CFrame.new(1220.78466796875, 138.0117950439453, -1488.75732421875)
            end
        end)
    end
end)
if W3 then
    CheckScrap = {"Pirate Millionaire","Pistol Billionaire"}
    CFrameSc = CFrame.new(-394.2919616699219, 134.57373046875, 5839.36279296875)
elseif W2 then
    CheckScrap = {"Mercenary"}
    CFrameSc = CFrame.new(-1014.1416015625, 100.9596939086914, 1429.927001953125)
elseif W1 then
    CheckScrap = {"Pirate","Brute"}
    CFrameSc = CFrame.new(-1062.05078125, 60.11216735839844, 4031.670166015625)
end
function FindMonMaterialFarm()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(MCheckTerial, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(MCheckTerial, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FindMonScrap()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(CheckScrap, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(CheckScrap, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
spawn(function()
    while task.wait() do
        pcall(function()
            if FarmMaterial then
                if FindMonMaterialFarm() then
                    v = FindMonMaterialFarm()
                    StatrMagnet = true
                    _G.PosMon = v.HumanoidRootPart.CFrame
                    repeat task.wait()
                        EquipWeapon(_G.Setting_table.Weapon)
                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                        attackm = true
                    until v.Humanoid.Health <= 0 or not v.Parent or not FarmMaterial 
                    StatrMagnet = false
                    attackm = false
                else
                    TP(CFrameMat)
                end
            end
        end)
    end
end)


if W1 then
    CFrameBS = CFrame.new(-1096.69140625, 13.781801223754883, 4009.337158203125)
elseif W2 then
    CFrameBS = CFrame.new(-137.6239013671875, 19.30649185180664, 2851.3310546875)
elseif W3 then
    CFrameBS = CFrame.new(-358.4629821777344, 43.75970458984375, 5544.90283203125)
end

function FarmScrapMetal()
    if FindMonScrap() then
        v = FindMonScrap()
        StatrMagnet = true
        _G.PosMon = v.HumanoidRootPart.CFrame
        repeat task.wait()
            EquipWeapon(_G.Setting_table.Weapon)
            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
            attackm = true
        until v.Humanoid.Health <= 0 or not v.Parent or not EnchantSword
        attackm = false
        StatrMagnet = false
    else
        repeat TP(CFrameSc) task.wait()
        until FindMonScrap() or not EnchantSword
    end
end
function FarmBoneMat()
    if FindMonBone() then
        v = FindMonBone()
        StatrMagnet = true
        _G.PosMon = v.HumanoidRootPart.CFrame
        repeat task.wait()
            EquipWeapon(_G.Setting_table.Weapon)
            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
            attackm = true
        until v.Humanoid.Health <= 0 or not v.Parent or not EnchantSword
        attackm = false
        StatrMagnet = false
    else
        repeat TP(CFrame.new(-9501.54296875, 580.0858154296875, 6032.970703125)) task.wait()
        until FindMonBone() or not EnchantSword
    end
end
function FindMonVampire()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find({"Vampire"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find({"Vampire"}, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FarmVimpire()
    if FindMonVampire() then
        v = FindMonVampire()
        StatrMagnet = true
            _G.PosMon = v.HumanoidRootPart.CFrame
            repeat task.wait()
                EquipWeapon(_G.Setting_table.Weapon)
                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                attackm = true
            until v.Humanoid.Health <= 0 or not v.Parent or not EnchantSword
            attackm = false
            StatrMagnet = false
        else
            repeat TP(CFrame.new(-6029.40869140625, 46.745943546295166, -1302.347412109375)) task.wait()
            until FindMonVampire() or not EnchantSword
    end
end

function TPToEnchant(Sword)
    repeat task.wait()
        TP(CFrameBS)
    until not EnchantSword or (CFrameBS.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeItem","Check",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Sword))
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeItem","Upgrade",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Sword))
end
spawn(function()
    while task.wait() do
        pcall(function()
            if EnchantSword then
                local DemonicWispC = tostring(GetMaterial("Demonic Wisp"))
                local BonesC = tostring(GetMaterial("Bones"))
                local ScrapMetalC = tostring(GetMaterial("Scrap Metal"))
                local VampireC = tostring(GetMaterial("Vampire Fang"))
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Scythe") or game.Players.LocalPlayer.Character:FindFirstChild("Hallow Scythe") then
                    CheckMS:SetTitle("Hallow Scythe")
                    CheckMS:SetDesc(("Demonic Wisp ["..DemonicWispC.."/8]\nBones ["..BonesC.."/800]\nScrap Metal ["..ScrapMetalC.."/25]"))
                    if GetMaterial("Demonic Wisp") < 8 or GetMaterial("Bones") < 800 then
                        FarmBoneMat()
                    elseif GetMaterial("Scrap Metal") < 25 then
                        FarmScrapMetal()
                    else
                        TPToEnchant("Hallow Scythe")
                    end
                elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Cursed Dual Katana") or game.Players.LocalPlayer.Character:FindFirstChild("Cursed Dual Katana") then
                    CheckMS:SetTitle("Cursed Dual Katana")
                    CheckMS:SetDesc(("Demonic Wisp ["..DemonicWispC.."/10]\nVampire Fang ["..VampireC.."/10]\nScrap Metal ["..ScrapMetalC.."/60]"))
                    if GetMaterial("Demonic Wisp") < 10 then
                        FarmBoneMat()
                    elseif GetMaterial("Vampire Fang") < 10 then
                        FarmVimpire()
                    elseif GetMaterial("Scrap Metal") < 60 then
                        FarmScrapMetal()
                    else
                        TPToEnchant("Cursed Dual Katana")
                    end
                end
            end
        end)
    end
end)

if W3 then
    MasMon = {"Cocoa Warrior","Chocolate Bar Battler","Sweet Thief","Candy Rebel"}
end
function FindMonFarmMastery()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(MasMon, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(MasMon, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
spawn(function()
    while wait() do
        pcall(function()
            if useskillmas then
                if _G.Setting_table.SkillMasZ then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                end
                if _G.Setting_table.SkillMasX then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                end
                if _G.Setting_table.SkillMasC then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                end
                if _G.Setting_table.SkillMasV then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true,118,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false,118,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                end
                if _G.Setting_table.SkillMasF then
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if Farm_Mastery and _G.Setting_table.ModeMas == "Devil Fruit" then
                if FindMonFarmMastery() then
                    v = FindMonFarmMastery()
                    StatrMagnet = true
                    _G.PosMon = v.HumanoidRootPart.CFrame
                    repeat task.wait()
                        if (v.Humanoid.Health/v.Humanoid.MaxHealth)*100 > _G.Setting_table.HPmon then
                            EquipWeapon(_G.Setting_table.Weapon)
                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                            attackm = true
                        else
                            EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,0,10))
                            useskillmas = true
                        end
                    until v.Humanoid.Health <= 0 or not v.Parent or not Farm_Mastery
                    useskillmas = false
                    attackm = false
                    StatrMagnet = false
                else
                    TP(CFrame.new(216.38002014160156, 126.59194946289062, -12602.2470703125))
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if Teleportis then
                if _G.Setting_table.SelectIs == "Jones Salad" then -- World 1
                    TP(CFrame.new(1211.525390625, 16.8725643157959, 1418.1884765625))
                elseif _G.Setting_table.SelectIs == "Marine" then
                    TP(CFrame.new(-2820.882568359375, 41.01356506347656, 1972.0003662109375))
                elseif _G.Setting_table.SelectIs == "Marine Fortress" then
                    TP(CFrame.new(-4697.3232421875, 20.995725631713867, 3975.0712890625))
                elseif _G.Setting_table.SelectIs == "Midle Town" then
                    TP(CFrame.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375))
                elseif _G.Setting_table.SelectIs == "Jungle" then
                    TP(CFrame.new(-1186.300537109375, 12.196389198303223, 235.00930786132812))
                elseif _G.Setting_table.SelectIs == "Pirate Village" then
                    TP(CFrame.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125))
                elseif _G.Setting_table.SelectIs == "Desert" then
                    TP(CFrame.new(974.7073974609375, 6.782181262969971, 4141.796875))
                elseif _G.Setting_table.SelectIs == "Frozen Village" then
                    TP(CFrame.new(1217.4100341796875, 27.317155838012695, -1220.14990234375))
                elseif _G.Setting_table.SelectIs == "Colosseum" then
                    TP(CFrame.new(-1332.9400634765625, 7.6323161125183105, -2896.560546875))
                elseif _G.Setting_table.SelectIs == "Prison" then
                    TP(CFrame.new(4860.4169921875, 5.995266437530518, 725.0440673828125))
                elseif _G.Setting_table.SelectIs == "Mob Leader" then
                    TP(CFrame.new(-2837.343505859375, 7.735490322113037, 5334.42431640625))
                elseif _G.Setting_table.SelectIs == "Magma Village" then
                    TP(CFrame.new(-5193.35498046875, 8.933917045593262, 8569.5634765625))
                elseif _G.Setting_table.SelectIs == "UnderWater Gate" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (CFrame.new(3864.6884765625, 5.716391563415527, -1926.214111328125))
                elseif _G.Setting_table.SelectIs == "UnderWater City" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (CFrame.new(61163.8515625, 5.650546073913574, 1819.7841796875))
                elseif _G.Setting_table.SelectIs == "Fountain City" then
                    TP(CFrame.new(5091.09619140625, 1.8445333242416382, 4033.57080078125))
                elseif _G.Setting_table.SelectIs == "Sky1" then
                    TP(CFrame.new(-4967.8369140625, 718.0152587890625, -2623.84326171875))
                elseif _G.Setting_table.SelectIs == "Sky2" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (CFrame.new(-7894.61767578125, 5545.8349609375, -380.29119873046875))
                end
                if _G.Setting_table.SelectIs == "Mansion" then -- World 2
                    TP(CFrame.new(-391.3624572753906, 332.4037780761719, 723.7368774414062))
                elseif _G.Setting_table.SelectIs == "Kingdom Of Rose" then
                    TP(CFrame.new(-11.261394500732422, 19.619970321655273, 2827.25390625))
                elseif _G.Setting_table.SelectIs == "Cafe" then
                    TP(CFrame.new(-385.25091552734375, 73.40335083007812, 280.3886413574219))
                elseif _G.Setting_table.SelectIs == "Sunflower Field" then
                    TP(CFrame.new(-1757.3251953125, 462.0125427246094, -64.1480941772461))
                elseif _G.Setting_table.SelectIs == "Jeramy Mountain" then
                    TP(CFrame.new(1943.639404296875, 449.2740783691406, 703.3887329101562))
                elseif _G.Setting_table.SelectIs == "Colossuem" then
                    TP(CFrame.new(-1837.3321533203125, 46.07426071166992, 1515.5592041015625))
                elseif _G.Setting_table.SelectIs == "Factory" then
                    TP(CFrame.new(258.4668884277344, 73.37347412109375, -261.2807922363281))
                elseif _G.Setting_table.SelectIs == "Green Bit" then
                    TP(CFrame.new(-2337.989013671875, 73.30936431884766, -2627.916748046875))
                elseif _G.Setting_table.SelectIs == "Graveyard" then
                    TP(CFrame.new(-5382.48583984375, 9.312348365783691, -752.280029296875))
                elseif _G.Setting_table.SelectIs == "Dark Area" then
                    TP(CFrame.new(3944.70947265625, 13.692588806152344, -3476.616943359375))
                elseif _G.Setting_table.SelectIs == "Snow Mountain" then
                    TP(CFrame.new(512.71484375, 401.7651672363281, -5294.701171875))
                elseif _G.Setting_table.SelectIs == "Hot Island" then
                    TP(CFrame.new(-5712.6337890625, 16.295000076293945, -5452.0654296875))
                elseif _G.Setting_table.SelectIs == "Cold Island" then
                    TP(CFrame.new(-6168.20654296875, 16.295000076293945, -5370.98876953125))
                elseif _G.Setting_table.SelectIs == "Usopp's Island" then
                    TP(CFrame.new(4736.837890625, 8.611909866333008, 2841.449462890625))
                elseif _G.Setting_table.SelectIs == "inscription Island" then
                    TP(CFrame.new(-5142.484375, 3.5641064643859863, 2370.093505859375))
                elseif _G.Setting_table.SelectIs == "Forgotten Island" then
                    TP(CFrame.new(-3059.946533203125, 239.18943786621094, -10201.763671875))
                elseif _G.Setting_table.SelectIs == "Ghost Ship" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (CFrame.new(923.2125244140625, 125.40035247802734, 32852.83203125))
                end
                if _G.Setting_table.SelectIs == "Port Town" then -- World 3
                    TP(CFrame.new(-278.2110290527344, 7.073183536529541, 5334.12158203125))
                elseif _G.Setting_table.SelectIs == "Hydra Island" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (CFrame.new(5742.9169921875, 610.7672729492188, -268.2395935058594))
                elseif _G.Setting_table.SelectIs == "Gaint Tree" then
                    TP(CFrame.new(2399.468994140625, 26.230792999267578, -6386.5966796875))
                elseif _G.Setting_table.SelectIs == "PineApple Village" then
                    TP(CFrame.new(-11354.4052734375, 332.0664367675781, -10342.3447265625))
                elseif _G.Setting_table.SelectIs == "Big Mansion" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (CFrame.new(-12550.3642578125, 350.5115051269531, -7468.7021484375))
                elseif _G.Setting_table.SelectIs == "Castle on the Sea" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (CFrame.new(-5076.99853515625, 314.8587341308594, -3151.824951171875))
                elseif _G.Setting_table.SelectIs == "Haunted Castle" then
                    TP(CFrame.new(-9517.255859375, 142.44805908203125, 5537.552734375))
                elseif _G.Setting_table.SelectIs == "Ice Cream Island" then
                    TP(CFrame.new(-851.8325805664062, 66.16278076171875, -11012.126953125))
                elseif _G.Setting_table.SelectIs == "Soa of Cake" then
                    TP(CFrame.new(-1812.581787109375, 38.141422271728516, -11951.1884765625))
                elseif _G.Setting_table.SelectIs == "Cake Loaf" then
                    TP(CFrame.new(-2145.30908203125, 10.01976490020752, -9926.4609375))
                elseif _G.Setting_table.SelectIs == "On Tree" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (CFrame.new(2952.8408203125, 2282.322509765625, -7216.93701171875))
                end
            end
        end)
    end
end)
spawn(function()
    while wait(.5) do
        pcall(function()
            if Teleportis and Enabledis then
                if _G.Setting_table.SelectIs == "Jones Salad" then -- World 1
                        if (Vector3.new(1211.525390625, 16.8725643157959, 1418.1884765625)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1211.525390625, 16.8725643157959, 1418.1884765625)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(1211.525390625, 16.8725643157959, 1418.1884765625)) 
                    end
                elseif _G.Setting_table.SelectIs == "Marine" then
                    if (Vector3.new(-2820.882568359375, 41.01356506347656, 1972.0003662109375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2820.882568359375, 41.01356506347656, 1972.0003662109375)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-2820.882568359375, 41.01356506347656, 1972.0003662109375)) 
                    end
                elseif _G.Setting_table.SelectIs == "Marine Fortress" then
                    if (Vector3.new(-4697.3232421875, 20.995725631713867, 3975.0712890625)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4697.3232421875, 20.995725631713867, 3975.0712890625)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-4697.3232421875, 20.995725631713867, 3975.0712890625)) 
                    end
                elseif _G.Setting_table.SelectIs == "Midle Town" then
                    if (Vector3.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375)) 
                    end
                elseif _G.Setting_table.SelectIs == "Jungle" then
                    if (Vector3.new(-1186.300537109375, 12.196389198303223, 235.00930786132812)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1186.300537109375, 12.196389198303223, 235.00930786132812)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-1186.300537109375, 12.196389198303223, 235.00930786132812)) 
                    end
                elseif _G.Setting_table.SelectIs == "Pirate Village" then
                    if (Vector3.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)) 
                    end
                elseif _G.Setting_table.SelectIs == "Desert" then
                    if (Vector3.new(974.7073974609375, 6.782181262969971, 4141.796875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(974.7073974609375, 6.782181262969971, 4141.796875)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(974.7073974609375, 6.782181262969971, 4141.796875)) 
                    end
                elseif _G.Setting_table.SelectIs == "Frozen Village" then
                    if (Vector3.new(1217.4100341796875, 27.317155838012695, -1220.14990234375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1217.4100341796875, 27.317155838012695, -1220.14990234375)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(1217.4100341796875, 27.317155838012695, -1220.14990234375)) 
                    end
                elseif _G.Setting_table.SelectIs == "Colosseum" then
                    if (Vector3.new(-1332.9400634765625, 7.6323161125183105, -2896.560546875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1332.9400634765625, 7.6323161125183105, -2896.560546875)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-1332.9400634765625, 7.6323161125183105, -2896.560546875)) 
                    end
                elseif _G.Setting_table.SelectIs == "Prison" then
                    if (Vector3.new(4860.4169921875, 5.995266437530518, 725.0440673828125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4860.4169921875, 5.995266437530518, 725.0440673828125)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(4860.4169921875, 5.995266437530518, 725.0440673828125)) 
                    end
                elseif _G.Setting_table.SelectIs == "Magma Village" then
                    if (Vector3.new(-5193.35498046875, 8.933917045593262, 8569.5634765625)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5193.35498046875, 8.933917045593262, 8569.5634765625)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-5193.35498046875, 8.933917045593262, 8569.5634765625)) 
                    end
                elseif _G.Setting_table.SelectIs == "Fountain City" then
                    if (Vector3.new(5091.09619140625, 1.8445333242416382, 4033.57080078125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5091.09619140625, 1.8445333242416382, 4033.57080078125)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(5091.09619140625, 1.8445333242416382, 4033.57080078125)) 
                    end
                elseif _G.Setting_table.SelectIs == "Sky1" then
                    if (Vector3.new(-4967.8369140625, 718.0152587890625, -2623.84326171875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4967.8369140625, 718.0152587890625, -2623.84326171875)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-4967.8369140625, 718.0152587890625, -2623.84326171875)) 
                    end
                elseif _G.Setting_table.SelectIs == "Sky2" then
                    if (Vector3.new(-7894.61767578125, 5545.8349609375, -380.29119873046875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7894.61767578125, 5545.8349609375, -380.29119873046875)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-7894.61767578125, 5545.8349609375, -380.29119873046875)) 
                    end
                    end
                if _G.Setting_table.SelectIs == "Kingdom Of Rose" then -- World 2
                    if (Vector3.new(-11.261394500732422, 19.619970321655273, 2827.25390625)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11.261394500732422, 19.619970321655273, 2827.25390625)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-11.261394500732422, 19.619970321655273, 2827.25390625)) 
                    end
                elseif _G.Setting_table.SelectIs == "Cafe" then
                    if (Vector3.new(-385.25091552734375, 73.40335083007812, 280.3886413574219)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-385.25091552734375, 73.40335083007812, 280.3886413574219)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-385.25091552734375, 73.40335083007812, 280.3886413574219)) 
                    end
                elseif _G.Setting_table.SelectIs == "Green Bit" then
                    if (Vector3.new(-2337.989013671875, 73.30936431884766, -2627.916748046875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2337.989013671875, 73.30936431884766, -2627.916748046875)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-2337.989013671875, 73.30936431884766, -2627.916748046875)) 
                    end
                elseif _G.Setting_table.SelectIs == "Factory" then
                    if (Vector3.new(-385.25091552734375, 73.40335083007812, 280.3886413574219)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-385.25091552734375, 73.40335083007812, 280.3886413574219)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(258.4668884277344, 73.37347412109375, -261.2807922363281)) 
                    end
                elseif _G.Setting_table.SelectIs == "Graveyard" then
                    if (Vector3.new(-5382.48583984375, 9.312348365783691, -752.280029296875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5382.48583984375, 9.312348365783691, -752.280029296875)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-5382.48583984375, 9.312348365783691, -752.280029296875)) 
                    end
                elseif _G.Setting_table.SelectIs == "Snow Mountain" then
                    if (Vector3.new(512.71484375, 401.7651672363281, -5294.701171875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(512.71484375, 401.7651672363281, -5294.701171875)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(512.71484375, 401.7651672363281, -5294.701171875)) 
                    end
                elseif _G.Setting_table.SelectIs == "Hot Island" then
                    if (Vector3.new(-5712.6337890625, 16.295000076293945, -5452.0654296875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5712.6337890625, 16.295000076293945, -5452.0654296875)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-5712.6337890625, 16.295000076293945, -5452.0654296875)) 
                    end
                elseif _G.Setting_table.SelectIs == "Cold Island" then
                    if (Vector3.new(-6168.20654296875, 16.295000076293945, -5370.98876953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6168.20654296875, 16.295000076293945, -5370.98876953125)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-6168.20654296875, 16.295000076293945, -5370.98876953125)) 
                    end
                elseif _G.Setting_table.SelectIs == "Forgotten Island" then
                    if (Vector3.new(-3059.946533203125, 239.18943786621094, -10201.763671875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3059.946533203125, 239.18943786621094, -10201.763671875)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-3059.946533203125, 239.18943786621094, -10201.763671875)) 
                    end
                    end
                if _G.Setting_table.SelectIs == "Port Town" then -- World 3
                    if (Vector3.new(-278.2110290527344, 7.073183536529541, 5334.12158203125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-278.2110290527344, 7.073183536529541, 5334.12158203125)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-278.2110290527344, 7.073183536529541, 5334.12158203125)) 
                    end
                elseif _G.Setting_table.SelectIs == "Gaint Tree" then
                    if (Vector3.new(2399.468994140625, 26.230792999267578, -6386.5966796875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2399.468994140625, 26.230792999267578, -6386.5966796875)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(2399.468994140625, 26.230792999267578, -6386.5966796875)) 
                    end
                elseif _G.Setting_table.SelectIs == "PineApple Village" then
                    if (Vector3.new(-11354.4052734375, 332.0664367675781, -10342.3447265625)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11354.4052734375, 332.0664367675781, -10342.3447265625 )*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-11354.4052734375, 332.0664367675781, -10342.3447265625)) 
                    end
                elseif _G.Setting_table.SelectIs == "Haunted Castle" then
                    if (Vector3.new(-9517.255859375, 142.44805908203125, 5537.552734375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9517.255859375, 142.44805908203125, 5537.552734375)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-9517.255859375, 142.44805908203125, 5537.552734375)) 
                    end
                elseif _G.Setting_table.SelectIs == "Ice Cream Island" then
                    if (Vector3.new(-851.8325805664062, 66.16278076171875, -11012.126953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-851.8325805664062, 66.16278076171875, -11012.126953125)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-851.8325805664062, 66.16278076171875, -11012.126953125)) 
                    end
                elseif _G.Setting_table.SelectIs == "Soa of Cake" then
                    if (Vector3.new(-1812.581787109375, 38.141422271728516, -11951.1884765625)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1812.581787109375, 38.141422271728516, -11951.1884765625)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-1812.581787109375, 38.141422271728516, -11951.1884765625)) 
                    end
                elseif _G.Setting_table.SelectIs == "Cake Loaf" then
                    if (Vector3.new(-2145.30908203125, 10.01976490020752, -9926.4609375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
                            else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2145.30908203125, 10.01976490020752, -9926.4609375)*CFrame.new(0,30,0)
                        end
                        else
                           TP(CFrame.new(-2145.30908203125, 10.01976490020752, -9926.4609375)) 
                    end
                end
        end
        end)
    end
end)
print("End")

function CheckStatMBE()
    if FindBossKata() then
        MonkataCheck:SetTitle("Kill Cake Monster : Spawn")
    else
        MonkataCheck:SetTitle("Kill Cake Monster : "..tostring(tonumber(string.match(tostring(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")), "%d+"))).."/500")
    end
    BoneCheck:SetTitle("Bone : "..tostring(GetMaterial("Bones")).."/5000")
    if FindElite() then
        EliteCheck:SetTitle("Elite : "..tostring(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter","Progress")).." | Spawn")
    else
        EliteCheck:SetTitle("Elite : "..tostring(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter","Progress")).." | Not Spawn")
    end
end
