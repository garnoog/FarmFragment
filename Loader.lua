print("Fully Fragment | By Dummy Hub")
if getgenv().Cup == nil then
    getgenv().Cup = "Dough King"
end
if getgenv().Safe == nil then
    getgenv().Safe = 25
end

pcall(setfpscap, 300)
pcall(set_fps_cap, 300)
function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end
spawn(function()
    while wait() do
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("RaceEnergy") and game:GetService("Players").LocalPlayer.Character.RaceEnergy.Value >= 1 and not game:GetService("Players").LocalPlayer.Character.RaceTransformed.Value then
                local be = game:service("VirtualInputManager")
                be:SendKeyEvent(true, "Y", false, game)
                be:SendKeyEvent(false, "Y", false, game)
            end
        end)
    end
end)
if getgenv().Weapon == "Melee" then
    Weapona = "Melee"
elseif getgenv().Weapon == "Sword" then
    Weapona = "Sword"
end
spawn(function()
    while task.wait() do
        pcall(function()
            if Weapona == "Melee" then
                Weapon = "Melee"
            elseif Weapona == "Sword" then
                Weapon = "Sword"
            else
                Weapona = "Melee"
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    if v.ToolTip == Weapona then
                        Weapon = v.Name
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while game:GetService("RunService").Stepped:wait() do
        pcall(function()
            local character = game.Players.LocalPlayer.Character
            for _, v in pairs(character:GetChildren()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end)
    end
end)
spawn(function()
    while wait(1) do
        pcall(function()
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            else
                task.wait()
            end
        end)
    end
end)
spawn(function()
    while wait(2) do
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
            wait(7)
        end)
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
if not W3 then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end
function ResetBody(p)
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(p)
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(p)
end
function TP(p)
	--Bypass[]
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
                BypassTP(p)
    --Bypass[]
        local Distance = (p.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if Distance < 200 then
    	    Speed = 1500
    	elseif Distance > 200 then
    		Speed = 300
    	end
    	game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),{CFrame = p}):Play()
    	if _G.Stop_Tween then
    		game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),{CFrame = p}):Cancel()
    	end
    	--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, p.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
end
function BypassTP(p)
    if not (game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice")) then
        if W3 then
            if (Vector3.new(-278.2110290527344, 7.073183536529541, 5334.12158203125)-p.Position).Magnitude < 3000 and (Vector3.new(-278.2110290527344, 7.073183536529541, 5334.12158203125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Port town
                wait(1)
                if (Vector3.new(-278.2110290527344, 7.073183536529541, 5334.12158203125)-p.Position).Magnitude < 3000 and (Vector3.new(-278.2110290527344, 7.073183536529541, 5334.12158203125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(-278.2110290527344, 7.073183536529541, 5334.12158203125))
                end
            end
            if (Vector3.new(2399.468994140625, 26.230792999267578, -6386.5966796875)-p.Position).Magnitude < 3000 and (Vector3.new(2399.468994140625, 26.230792999267578, -6386.5966796875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Gaint Tree
                wait(1)
                if (Vector3.new(2399.468994140625, 26.230792999267578, -6386.5966796875)-p.Position).Magnitude < 3000 and (Vector3.new(2399.468994140625, 26.230792999267578, -6386.5966796875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(2399.468994140625, 26.230792999267578, -6386.5966796875))
                end
            end
            if (Vector3.new(-9517.255859375, 142.44805908203125, 5537.552734375)-p.Position).Magnitude < 3000 and (Vector3.new(-9517.255859375, 142.44805908203125, 5537.552734375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Haunted Castle
                wait(1)
                if (Vector3.new(-9517.255859375, 142.44805908203125, 5537.552734375)-p.Position).Magnitude < 3000 and (Vector3.new(-9517.255859375, 142.44805908203125, 5537.552734375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(-9517.255859375, 142.44805908203125, 5537.552734375))
                end
            end
            if (Vector3.new(-851.8325805664062, 66.16278076171875, -11012.126953125)-p.Position).Magnitude < 500 and (Vector3.new(-851.8325805664062, 66.16278076171875, -11012.126953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Ice Cream Island
                wait(1)
                if (Vector3.new(-851.8325805664062, 66.16278076171875, -11012.126953125)-p.Position).Magnitude < 500 and (Vector3.new(-851.8325805664062, 66.16278076171875, -11012.126953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(-851.8325805664062, 66.16278076171875, -11012.126953125))
                end
            end
            if (Vector3.new(-2149.209228515625, 80.00882720947266, -12402.974609375)-p.Position).Magnitude < 1500 and (Vector3.new(-2149.209228515625, 80.00882720947266, -12402.974609375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Soa of Cake
                wait(1)
                if (Vector3.new(-2149.209228515625, 80.00882720947266, -12402.974609375)-p.Position).Magnitude < 500 and (Vector3.new(-2149.209228515625, 80.00882720947266, -12402.974609375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(-1812.581787109375, 38.141422271728516, -11951.1884765625))
                end
            end
            if (Vector3.new(-2145.30908203125, 10.01976490020752, -9926.4609375)-p.Position).Magnitude < 1000 and (Vector3.new(-2145.30908203125, 10.01976490020752, -9926.4609375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Cake Loaf
                wait(1)
                if (Vector3.new(-2145.30908203125, 10.01976490020752, -9926.4609375)-p.Position).Magnitude < 1000 and (Vector3.new(-2145.30908203125, 10.01976490020752, -9926.4609375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(-2145.30908203125, 10.01976490020752, -9926.4609375))
                end
            end
            if (Vector3.new(-16217.7568359375, 9.06508731842041, 480.287109375)-p.Position).Magnitude < 3000 and (Vector3.new(-16217.7568359375, 9.06508731842041, 480.287109375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Tiki Outpost
                wait(1)
                if (Vector3.new(-16217.7568359375, 9.06508731842041, 480.287109375)-p.Position).Magnitude < 3000 and (Vector3.new(-16217.7568359375, 9.06508731842041, 480.287109375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(-16217.7568359375, 9.06508731842041, 480.287109375))
                end
            end
            if (Vector3.new(-1088.00634765625, 9.642712593078613, -14081.6396484375)-p.Position).Magnitude < 500 and (Vector3.new(-1088.00634765625, 9.642712593078613, -14081.6396484375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --snow candy
                wait(1)
                if (Vector3.new(-1088.00634765625, 9.642712593078613, -14081.6396484375)-p.Position).Magnitude < 500 and (Vector3.new(-1088.00634765625, 9.642712593078613, -14081.6396484375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(-1088.00634765625, 9.642712593078613, -14081.6396484375))
                end
            end
            if (Vector3.new(1.4646467145, 25.5464164461, -12147.974313464)-p.Position).Magnitude < 500 and (Vector3.new(147.35205078125, 24.734024047851562, -12030.5498046875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --cocoa
                wait(1)
                if (Vector3.new(1.4646467145, 25.5464164461, -12147.974313464)-p.Position).Magnitude < 500 and (Vector3.new(147.35205078125, 24.734024047851562, -12030.5498046875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(147.35205078125, 24.734024047851562, -12030.5498046875))
                end
            end
elseif W2 then
            if (Vector3.new(-2440.9934082031, 73.04190826416, -3217.7082519531)-p.Position).Magnitude < 1100 and (Vector3.new(-2440.9934082031, 73.04190826416, -3217.7082519531)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2500 then --Green Bit
                wait(1)
                if (Vector3.new(-2440.9934082031, 73.04190826416, -3217.7082519531)-p.Position).Magnitude < 1100 and (Vector3.new(-2440.9934082031, 73.04190826416, -3217.7082519531)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2500 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2337.989013671875, 73.30936431884766, -2627.916748046875)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2337.989013671875, 73.30936431884766, -2627.916748046875)
                end
            end
            if (Vector3.new(512.71484375, 401.7651672363281, -5294.701171875)-p.Position).Magnitude < 1500 and (Vector3.new(512.71484375, 401.7651672363281, -5294.701171875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1500 then --Snow Mountain
                wait(1)
                if (Vector3.new(512.71484375, 401.7651672363281, -5294.701171875)-p.Position).Magnitude < 1500 and (Vector3.new(512.71484375, 401.7651672363281, -5294.701171875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1500 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(512.71484375, 401.7651672363281, -5294.701171875)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(512.71484375, 401.7651672363281, -5294.701171875)
                end
            end
            if (Vector3.new(-6168.20654296875, 16.295000076293945, -5370.98876953125)-p.Position).Magnitude < 3000 and (Vector3.new(-6168.20654296875, 16.295000076293945, -5370.98876953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Hot Island & Cold Island
                wait(1)
                if (Vector3.new(-6168.20654296875, 16.295000076293945, -5370.98876953125)-p.Position).Magnitude < 3000 and (Vector3.new(-6168.20654296875, 16.295000076293945, -5370.98876953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6168.20654296875, 16.295000076293945, -5370.98876953125)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6168.20654296875, 16.295000076293945, -5370.98876953125)
                end
            end
            if (Vector3.new(-3059.946533203125, 239.18943786621094, -10201.763671875)-p.Position).Magnitude < 3000 and (Vector3.new(-3059.946533203125, 239.18943786621094, -10201.763671875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Snow Mountain
                wait(1)
                if (Vector3.new(-3059.946533203125, 239.18943786621094, -10201.763671875)-p.Position).Magnitude < 3000 and (Vector3.new(-3059.946533203125, 239.18943786621094, -10201.763671875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3059.946533203125, 239.18943786621094, -10201.763671875)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3059.946533203125, 239.18943786621094, -10201.763671875)
                end
            end
            if (Vector3.new(5400.40380859375, 28.316499710083008, -6236.9921875)-p.Position).Magnitude < 3000 and (Vector3.new(5400.40380859375, 28.316499710083008, -6236.9921875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --ปราสาทเอลซ่า
                wait(1)
                if (Vector3.new(5400.40380859375, 28.316499710083008, -6236.9921875)-p.Position).Magnitude < 3000 and (Vector3.new(5400.40380859375, 28.316499710083008, -6236.9921875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5400.40380859375, 28.316499710083008, -6236.9921875)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5400.40380859375, 28.316499710083008, -6236.9921875)
                end
            end
elseif W1 then
            if (Vector3.new(-4697.3232421875, 20.995725631713867, 3975.0712890625)-p.Position).Magnitude < 2000 and (Vector3.new(-4697.3232421875, 20.995725631713867, 3975.0712890625)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then --Marine Fortress
                wait(1)
                if (Vector3.new(-4697.3232421875, 20.995725631713867, 3975.0712890625)-p.Position).Magnitude < 2000 and (Vector3.new(-4697.3232421875, 20.995725631713867, 3975.0712890625)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4697.3232421875, 20.995725631713867, 3975.0712890625)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4697.3232421875, 20.995725631713867, 3975.0712890625)
                end
            end
            if (Vector3.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375)-p.Position).Magnitude < 1000 and (Vector3.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then --Midle Town
                wait(1)
                if (Vector3.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375)-p.Position).Magnitude < 1000 and (Vector3.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375)
                end
            end
            if (Vector3.new(-1186.300537109375, 12.196389198303223, 235.00930786132812)-p.Position).Magnitude < 1000 and (Vector3.new(-1186.300537109375, 12.196389198303223, 235.00930786132812)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then --Jungle
                wait(1)
                if (Vector3.new(-1186.300537109375, 12.196389198303223, 235.00930786132812)-p.Position).Magnitude < 1000 and (Vector3.new(-1186.300537109375, 12.196389198303223, 235.00930786132812)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1186.300537109375, 12.196389198303223, 235.00930786132812)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1186.300537109375, 12.196389198303223, 235.00930786132812)
                end
            end
            if (Vector3.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)-p.Position).Magnitude < 1000 and (Vector3.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then --Pirate Village
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)
                wait(1)
                if (Vector3.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)-p.Position).Magnitude < 1000 and (Vector3.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)
                end
            end
            if (Vector3.new(974.7073974609375, 6.782181262969971, 4141.796875)-p.Position).Magnitude < 1000 and (Vector3.new(974.7073974609375, 6.782181262969971, 4141.796875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then --Desert
                wait(1)
                if (Vector3.new(974.7073974609375, 6.782181262969971, 4141.796875)-p.Position).Magnitude < 1000 and (Vector3.new(974.7073974609375, 6.782181262969971, 4141.796875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(974.7073974609375, 6.782181262969971, 4141.796875)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(974.7073974609375, 6.782181262969971, 4141.796875)
                end
            end
            if (Vector3.new(-5193.35498046875, 8.933917045593262, 8569.5634765625)-p.Position).Magnitude < 1000 and (Vector3.new(-5193.35498046875, 8.933917045593262, 8569.5634765625)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then --Magma Village
                wait(1)
                if (Vector3.new(-5193.35498046875, 8.933917045593262, 8569.5634765625)-p.Position).Magnitude < 1000 and (Vector3.new(-5193.35498046875, 8.933917045593262, 8569.5634765625)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5193.35498046875, 8.933917045593262, 8569.5634765625)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5193.35498046875, 8.933917045593262, 8569.5634765625)
                end
            end
            if (Vector3.new(5091.09619140625, 1.8445333242416382, 4033.57080078125)-p.Position).Magnitude < 1000 and (Vector3.new(5091.09619140625, 1.8445333242416382, 4033.57080078125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Fountain City
                wait(1)
                if (Vector3.new(5091.09619140625, 1.8445333242416382, 4033.57080078125)-p.Position).Magnitude < 1000 and (Vector3.new(5091.09619140625, 1.8445333242416382, 4033.57080078125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5091.09619140625, 1.8445333242416382, 4033.57080078125)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5091.09619140625, 1.8445333242416382, 4033.57080078125)
                end
            end
        end
    end
end

function StopTween()print("Fully Fragment | By Dummy Hub")
    TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
end
if getgenv().Cup == nil then
    getgenv().Cup = "Dough King"
end
if getgenv().Safe == nil then
    getgenv().Safe = 25
end

pcall(setfpscap, 300)
pcall(set_fps_cap, 300)
function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end
spawn(function()
    while wait() do
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("RaceEnergy") and game:GetService("Players").LocalPlayer.Character.RaceEnergy.Value >= 1 and not game:GetService("Players").LocalPlayer.Character.RaceTransformed.Value then
                local be = game:service("VirtualInputManager")
                be:SendKeyEvent(true, "Y", false, game)
                be:SendKeyEvent(false, "Y", false, game)
            end
        end)
    end
end)
if getgenv().Weapon == "Melee" then
    Weapona = "Melee"
elseif getgenv().Weapon == "Sword" then
    Weapona = "Sword"
end
spawn(function()
    while task.wait() do
        pcall(function()
            if Weapona == "Melee" then
                Weapon = "Melee"
            elseif Weapona == "Sword" then
                Weapon = "Sword"
            else
                Weapona = "Melee"
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    if v.ToolTip == Weapona then
                        Weapon = v.Name
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while game:GetService("RunService").Stepped:wait() do
        pcall(function()
            local character = game.Players.LocalPlayer.Character
            for _, v in pairs(character:GetChildren()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end)
    end
end)
spawn(function()
    while wait(1) do
        pcall(function()
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            else
                task.wait()
            end
        end)
    end
end)
spawn(function()
    while wait(2) do
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
            wait(7)
        end)
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
if not W3 then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end
function ResetBody(p)
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(p)
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(p)
end
function TP(p)
	--Bypass[]
                if W3 then
                if (Vector3.new(5742.9169921875, 610.7672729492188, -268.2395935058594)-p.Position).Magnitude < 3000 and (Vector3.new(5742.9169921875, 610.7672729492188, -268.2395935058594)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Hydra
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            _G.Stop_Tween = true
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5742.9169921875, 610.7672729492188, -268.2395935058594))
                        end
                end
                if (Vector3.new(-12550.3642578125, 350.5115051269531, -7468.7021484375)-p.Position).Magnitude < 3000 and (Vector3.new(-12550.3642578125, 350.5115051269531, -7468.7021484375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 5000 then --Big Mansion
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            _G.Stop_Tween = true
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12476.080078125, 374.9144592285156, -7566.93701171875))
                        end
                end
                if (Vector3.new(-5076.99853515625, 314.8587341308594, -3151.824951171875)-p.Position).Magnitude < 3000 and (Vector3.new(-5076.99853515625, 314.8587341308594, -3151.824951171875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Castle on the Sea
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            _G.Stop_Tween = true
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5076.99853515625, 314.8587341308594, -3151.824951171875))
                        end
                end
                if (Vector3.new(-1990.672607421875, 4532.998046875, -14973.6748046875)-p.Position).Magnitude < 1500 and (Vector3.new(-1990.672607421875, 4532.998046875, -14973.6748046875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1500 then --Cake Prince
                    _G.Stop_Tween = true
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2149.209228515625, 80.00882720947266, -12402.974609375)
                end
                if (Vector3.new(28609.388671875, 14896.8505859375, 105.2657241821289)-p.Position).Magnitude > 1500 and (Vector3.new(28609.388671875, 14896.8505859375, 105.2657241821289)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 then --temple
                    _G.Stop_Tween = true
                        TP3(CFrame.new(28609.388671875, 14896.8505859375, 105.2657241821289))
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","Check")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress","TeleportBack")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetLastSpawnPoint","GreatTree")

                end
                elseif W1 then
                if (Vector3.new(3864.6884765625, 5.716391563415527, -1926.214111328125)-p.Position).Magnitude < 3500 and (Vector3.new(3864.6884765625, 5.716391563415527, -1926.214111328125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 5000 then --UnderWater Gate
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            _G.Stop_Tween = true
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.6884765625, 5.716391563415527, -1926.214111328125))
                        end
                end
                if (Vector3.new(61163.8515625, 5.650546073913574, 1819.7841796875)-p.Position).Magnitude < 3000 and (Vector3.new(61163.8515625, 5.650546073913574, 1819.7841796875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --UnderWater City
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            _G.Stop_Tween = true
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 5.650546073913574, 1819.7841796875))
                        end
                end
                if (Vector3.new(-7894.61767578125, 5545.8349609375, -380.29119873046875)-p.Position).Magnitude < 3000 and (Vector3.new(-7894.61767578125, 5545.8349609375, -380.29119873046875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Sky2
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            _G.Stop_Tween = true
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.61767578125, 5545.8349609375, -380.29119873046875))
                        end
                end
                if (Vector3.new(-4607.82275, 872.54248, -1667.55688)-p.Position).Magnitude < 3000 and (Vector3.new(-4607.82275, 872.54248, -1667.55688)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Sky2
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            _G.Stop_Tween = true
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
                        end
                end
                elseif W2 then
                    if (Vector3.new(923.2125244140625, 125.40035247802734, 32852.83203125)-p.Position).Magnitude < 3000 and (Vector3.new(923.2125244140625, 125.40035247802734, 32852.83203125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Ghost Ship
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            _G.Stop_Tween = true
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.2125244140625, 125.40035247802734, 32852.83203125))
                        end
                    end
                    if (Vector3.new(-6505.7294921875, 83.31233978271484, -130.24234008789062)-p.Position).Magnitude < 3000 and (Vector3.new(-6505.7294921875, 83.31233978271484, -130.24234008789062)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Out Ghost Ship
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            _G.Stop_Tween = true
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6505.7294921875, 83.31233978271484, -130.24234008789062))
                        end
                    end
                    if (Vector3.new(-6505.7294921875, 83.31233978271484, -130.24234008789062)-p.Position).Magnitude > 3000 and (Vector3.new(-6505.7294921875, 83.31233978271484, -130.24234008789062)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 3000 then --Out Ghost Ship2
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            _G.Stop_Tween = true
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6505.7294921875, 83.31233978271484, -130.24234008789062))
                        end
                    end
                    if (Vector3.new(-286.6488037109375, 306.130615234375, 596.5967407226562)-p.Position).Magnitude < 2700 and (Vector3.new(-286.6488037109375, 306.130615234375, 596.5967407226562)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2700 then --ManSion
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            _G.Stop_Tween = true
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-286.6488037109375, 306.130615234375, 596.5967407226562))
                        end
                    end
                    if (Vector3.new(2283.7080078125, 15.277364730834961, 905.8712158203125)-p.Position).Magnitude < 1500 and (Vector3.new(2283.7080078125, 15.277364730834961, 905.8712158203125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then --swan
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                            _G.Stop_Tween = true
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2283.7080078125, 15.277364730834961, 905.8712158203125))
                        end
                    end
                end
                BypassTP(p)
    --Bypass[]
        local Distance = (p.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if Distance < 200 then
    	    Speed = 1500
    	elseif Distance > 200 then
    		Speed = 300
    	end
    	game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),{CFrame = p}):Play()
    	if _G.Stop_Tween then
    		game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),{CFrame = p}):Cancel()
    	end
    	--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, p.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
end
function BypassTP(p)
    if not (game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice")) then
        if W3 then
            if (Vector3.new(-278.2110290527344, 7.073183536529541, 5334.12158203125)-p.Position).Magnitude < 3000 and (Vector3.new(-278.2110290527344, 7.073183536529541, 5334.12158203125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Port town
                wait(1)
                if (Vector3.new(-278.2110290527344, 7.073183536529541, 5334.12158203125)-p.Position).Magnitude < 3000 and (Vector3.new(-278.2110290527344, 7.073183536529541, 5334.12158203125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(-278.2110290527344, 7.073183536529541, 5334.12158203125))
                end
            end
            if (Vector3.new(2399.468994140625, 26.230792999267578, -6386.5966796875)-p.Position).Magnitude < 3000 and (Vector3.new(2399.468994140625, 26.230792999267578, -6386.5966796875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Gaint Tree
                wait(1)
                if (Vector3.new(2399.468994140625, 26.230792999267578, -6386.5966796875)-p.Position).Magnitude < 3000 and (Vector3.new(2399.468994140625, 26.230792999267578, -6386.5966796875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(2399.468994140625, 26.230792999267578, -6386.5966796875))
                end
            end
            if (Vector3.new(-9517.255859375, 142.44805908203125, 5537.552734375)-p.Position).Magnitude < 3000 and (Vector3.new(-9517.255859375, 142.44805908203125, 5537.552734375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Haunted Castle
                wait(1)
                if (Vector3.new(-9517.255859375, 142.44805908203125, 5537.552734375)-p.Position).Magnitude < 3000 and (Vector3.new(-9517.255859375, 142.44805908203125, 5537.552734375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(-9517.255859375, 142.44805908203125, 5537.552734375))
                end
            end
            if (Vector3.new(-851.8325805664062, 66.16278076171875, -11012.126953125)-p.Position).Magnitude < 500 and (Vector3.new(-851.8325805664062, 66.16278076171875, -11012.126953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Ice Cream Island
                wait(1)
                if (Vector3.new(-851.8325805664062, 66.16278076171875, -11012.126953125)-p.Position).Magnitude < 500 and (Vector3.new(-851.8325805664062, 66.16278076171875, -11012.126953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(-851.8325805664062, 66.16278076171875, -11012.126953125))
                end
            end
            if (Vector3.new(-2149.209228515625, 80.00882720947266, -12402.974609375)-p.Position).Magnitude < 1500 and (Vector3.new(-2149.209228515625, 80.00882720947266, -12402.974609375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Soa of Cake
                wait(1)
                if (Vector3.new(-2149.209228515625, 80.00882720947266, -12402.974609375)-p.Position).Magnitude < 500 and (Vector3.new(-2149.209228515625, 80.00882720947266, -12402.974609375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(-1812.581787109375, 38.141422271728516, -11951.1884765625))
                end
            end
            if (Vector3.new(-2145.30908203125, 10.01976490020752, -9926.4609375)-p.Position).Magnitude < 1000 and (Vector3.new(-2145.30908203125, 10.01976490020752, -9926.4609375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Cake Loaf
                wait(1)
                if (Vector3.new(-2145.30908203125, 10.01976490020752, -9926.4609375)-p.Position).Magnitude < 1000 and (Vector3.new(-2145.30908203125, 10.01976490020752, -9926.4609375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(-2145.30908203125, 10.01976490020752, -9926.4609375))
                end
            end
            if (Vector3.new(-16217.7568359375, 9.06508731842041, 480.287109375)-p.Position).Magnitude < 3000 and (Vector3.new(-16217.7568359375, 9.06508731842041, 480.287109375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Tiki Outpost
                wait(1)
                if (Vector3.new(-16217.7568359375, 9.06508731842041, 480.287109375)-p.Position).Magnitude < 3000 and (Vector3.new(-16217.7568359375, 9.06508731842041, 480.287109375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(-16217.7568359375, 9.06508731842041, 480.287109375))
                end
            end
            if (Vector3.new(-1088.00634765625, 9.642712593078613, -14081.6396484375)-p.Position).Magnitude < 500 and (Vector3.new(-1088.00634765625, 9.642712593078613, -14081.6396484375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --snow candy
                wait(1)
                if (Vector3.new(-1088.00634765625, 9.642712593078613, -14081.6396484375)-p.Position).Magnitude < 500 and (Vector3.new(-1088.00634765625, 9.642712593078613, -14081.6396484375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(-1088.00634765625, 9.642712593078613, -14081.6396484375))
                end
            end
            if (Vector3.new(1.4646467145, 25.5464164461, -12147.974313464)-p.Position).Magnitude < 500 and (Vector3.new(147.35205078125, 24.734024047851562, -12030.5498046875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --cocoa
                wait(1)
                if (Vector3.new(1.4646467145, 25.5464164461, -12147.974313464)-p.Position).Magnitude < 500 and (Vector3.new(147.35205078125, 24.734024047851562, -12030.5498046875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    ResetBody(CFrame.new(147.35205078125, 24.734024047851562, -12030.5498046875))
                end
            end
elseif W2 then
            if (Vector3.new(-2440.9934082031, 73.04190826416, -3217.7082519531)-p.Position).Magnitude < 1100 and (Vector3.new(-2440.9934082031, 73.04190826416, -3217.7082519531)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2500 then --Green Bit
                wait(1)
                if (Vector3.new(-2440.9934082031, 73.04190826416, -3217.7082519531)-p.Position).Magnitude < 1100 and (Vector3.new(-2440.9934082031, 73.04190826416, -3217.7082519531)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2500 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2337.989013671875, 73.30936431884766, -2627.916748046875)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2337.989013671875, 73.30936431884766, -2627.916748046875)
                end
            end
            if (Vector3.new(512.71484375, 401.7651672363281, -5294.701171875)-p.Position).Magnitude < 1500 and (Vector3.new(512.71484375, 401.7651672363281, -5294.701171875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1500 then --Snow Mountain
                wait(1)
                if (Vector3.new(512.71484375, 401.7651672363281, -5294.701171875)-p.Position).Magnitude < 1500 and (Vector3.new(512.71484375, 401.7651672363281, -5294.701171875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1500 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(512.71484375, 401.7651672363281, -5294.701171875)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(512.71484375, 401.7651672363281, -5294.701171875)
                end
            end
            if (Vector3.new(-6168.20654296875, 16.295000076293945, -5370.98876953125)-p.Position).Magnitude < 3000 and (Vector3.new(-6168.20654296875, 16.295000076293945, -5370.98876953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Hot Island & Cold Island
                wait(1)
                if (Vector3.new(-6168.20654296875, 16.295000076293945, -5370.98876953125)-p.Position).Magnitude < 3000 and (Vector3.new(-6168.20654296875, 16.295000076293945, -5370.98876953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6168.20654296875, 16.295000076293945, -5370.98876953125)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6168.20654296875, 16.295000076293945, -5370.98876953125)
                end
            end
            if (Vector3.new(-3059.946533203125, 239.18943786621094, -10201.763671875)-p.Position).Magnitude < 3000 and (Vector3.new(-3059.946533203125, 239.18943786621094, -10201.763671875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Snow Mountain
                wait(1)
                if (Vector3.new(-3059.946533203125, 239.18943786621094, -10201.763671875)-p.Position).Magnitude < 3000 and (Vector3.new(-3059.946533203125, 239.18943786621094, -10201.763671875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3059.946533203125, 239.18943786621094, -10201.763671875)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3059.946533203125, 239.18943786621094, -10201.763671875)
                end
            end
            if (Vector3.new(5400.40380859375, 28.316499710083008, -6236.9921875)-p.Position).Magnitude < 3000 and (Vector3.new(5400.40380859375, 28.316499710083008, -6236.9921875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --ปราสาทเอลซ่า
                wait(1)
                if (Vector3.new(5400.40380859375, 28.316499710083008, -6236.9921875)-p.Position).Magnitude < 3000 and (Vector3.new(5400.40380859375, 28.316499710083008, -6236.9921875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5400.40380859375, 28.316499710083008, -6236.9921875)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5400.40380859375, 28.316499710083008, -6236.9921875)
                end
            end
elseif W1 then
            if (Vector3.new(-4697.3232421875, 20.995725631713867, 3975.0712890625)-p.Position).Magnitude < 2000 and (Vector3.new(-4697.3232421875, 20.995725631713867, 3975.0712890625)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then --Marine Fortress
                wait(1)
                if (Vector3.new(-4697.3232421875, 20.995725631713867, 3975.0712890625)-p.Position).Magnitude < 2000 and (Vector3.new(-4697.3232421875, 20.995725631713867, 3975.0712890625)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4697.3232421875, 20.995725631713867, 3975.0712890625)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4697.3232421875, 20.995725631713867, 3975.0712890625)
                end
            end
            if (Vector3.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375)-p.Position).Magnitude < 1000 and (Vector3.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then --Midle Town
                wait(1)
                if (Vector3.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375)-p.Position).Magnitude < 1000 and (Vector3.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-655.8241577148438, 8.195281982421875, 1436.6790771484375)
                end
            end
            if (Vector3.new(-1186.300537109375, 12.196389198303223, 235.00930786132812)-p.Position).Magnitude < 1000 and (Vector3.new(-1186.300537109375, 12.196389198303223, 235.00930786132812)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then --Jungle
                wait(1)
                if (Vector3.new(-1186.300537109375, 12.196389198303223, 235.00930786132812)-p.Position).Magnitude < 1000 and (Vector3.new(-1186.300537109375, 12.196389198303223, 235.00930786132812)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1186.300537109375, 12.196389198303223, 235.00930786132812)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1186.300537109375, 12.196389198303223, 235.00930786132812)
                end
            end
            if (Vector3.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)-p.Position).Magnitude < 1000 and (Vector3.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then --Pirate Village
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)
                wait(1)
                if (Vector3.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)-p.Position).Magnitude < 1000 and (Vector3.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1120.1485595703125, 5.095293998718262, 3855.317626953125)
                end
            end
            if (Vector3.new(974.7073974609375, 6.782181262969971, 4141.796875)-p.Position).Magnitude < 1000 and (Vector3.new(974.7073974609375, 6.782181262969971, 4141.796875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then --Desert
                wait(1)
                if (Vector3.new(974.7073974609375, 6.782181262969971, 4141.796875)-p.Position).Magnitude < 1000 and (Vector3.new(974.7073974609375, 6.782181262969971, 4141.796875)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(974.7073974609375, 6.782181262969971, 4141.796875)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(974.7073974609375, 6.782181262969971, 4141.796875)
                end
            end
            if (Vector3.new(-5193.35498046875, 8.933917045593262, 8569.5634765625)-p.Position).Magnitude < 1000 and (Vector3.new(-5193.35498046875, 8.933917045593262, 8569.5634765625)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then --Magma Village
                wait(1)
                if (Vector3.new(-5193.35498046875, 8.933917045593262, 8569.5634765625)-p.Position).Magnitude < 1000 and (Vector3.new(-5193.35498046875, 8.933917045593262, 8569.5634765625)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5193.35498046875, 8.933917045593262, 8569.5634765625)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5193.35498046875, 8.933917045593262, 8569.5634765625)
                end
            end
            if (Vector3.new(5091.09619140625, 1.8445333242416382, 4033.57080078125)-p.Position).Magnitude < 1000 and (Vector3.new(5091.09619140625, 1.8445333242416382, 4033.57080078125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then --Fountain City
                wait(1)
                if (Vector3.new(5091.09619140625, 1.8445333242416382, 4033.57080078125)-p.Position).Magnitude < 1000 and (Vector3.new(5091.09619140625, 1.8445333242416382, 4033.57080078125)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5091.09619140625, 1.8445333242416382, 4033.57080078125)
                    ResetBody()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5091.09619140625, 1.8445333242416382, 4033.57080078125)
                end
            end
        end
    end
end

function StopTween()
    TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
end

spawn(function()
    while task.wait() do
        pcall(function()
            if StatrMagnet then
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
        end)
    end
end)

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
                                    task.wait(0.01)
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
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Clip or Auto_Spikey_Trident then
                game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if tostring(game.Players.LocalPlayer.Team) == "Pirates" then
                if (game.Players.LocalPlayer.Character.Humanoid.Health/game.Players.LocalPlayer.Character.Humanoid.MaxHealth)*100 < getgenv().Safe and game.Players.LocalPlayer.Character.Humanoid.Health > 1 then 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
                end
            elseif tostring(game.Players.LocalPlayer.Team) == "Marines" then
                if (game.Players.LocalPlayer.Character.Humanoid.Health/game.Players.LocalPlayer.Character.Humanoid.MaxHealth)*100 < getgenv().Safe and game.Players.LocalPlayer.Character.Humanoid.Health > 1 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
                end
            end
        end)
    end
end)
Auto_Spikey_Trident = true

local BossCheck = {
    "Dough King",
    "Cake Prince"
}
local MobCheck = {
    "Cookie Crafter",
    "Cake Guard",
    "Baking Staff",
    "Head Baker"
}
local EliteCheck = {
    "Urban",
    "Diablo",
    "Deandre"
}
local IndraCheck = {
    "rip_indra True Form"
}
local CocoaCheck = {
    "Cocoa Warrior",
    "Chocolate Bar Battler"
}
function FindBoss()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(BossCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(BossCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FindMon()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(MobCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(MobCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FindElite()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(EliteCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(EliteCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FarmCakePrince()
    if FindBoss() then
        v = FindBoss()
    	repeat task.wait()
    		EquipWeapon(Weapon)
            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
            attackm = true
    	until not Auto_Spikey_Trident or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
    	attackm = false
    end
end
function FarmMonCakePrince()
    if (Vector3.new(-1812.581787109375, 38.141422271728516, -11951.1884765625)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2200 then
        if FindMon() then
            v = FindMon()
            StatrMagnet = true
            _G.PosMon = v.HumanoidRootPart.CFrame
        	repeat task.wait()
        		EquipWeapon(Weapon)
                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                attackm = true
        	until not Auto_Spikey_Trident or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 or FindBoss()
        	attackm = false
        	StatrMagnet = false
        	else
                TP(CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375))
        end
        else
            TP(CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375))
    end
end
function FarmElite()
    if FindElite() then
        v = FindElite()
        
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
    	repeat task.wait()
    		EquipWeapon(Weapon)
            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
            attackm = true
    	until not Auto_Spikey_Trident or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0 
    	attackm = false
    end
end
function ColorHakiIndra()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
    wait()
	repeat TP(CFrame.new(-5420.16602, 1084.9657, -2666.8208)) wait() 
    until _G.StopTween == true or Open_Color_Haki == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5420.16602, 1084.9657, -2666.8208)).Magnitude <= 10
    wait(.5)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
    repeat TP(CFrame.new(-5414.41357, 310.865753, -2212.45776)) wait() 
    until _G.StopTween == true or Open_Color_Haki == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5414.41357, 310.865753, -2212.45776)).Magnitude <= 10
    wait(.5)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
    repeat TP(CFrame.new(-4971.47559, 331.565765, -3720.02954)) wait() 
    until _G.StopTween == true or Open_Color_Haki == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-4971.47559, 331.565765, -3720.02954)).Magnitude <= 10
    wait(.5)
    repeat TP(CFrame.new(-5563.8232421875, 314.87371826171875, -2662.170654296875)) wait()
    until _G.StopTween == true or Open_Color_Haki == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5563.8232421875, 314.87371826171875, -2662.170654296875)).Magnitude <= 10
end
function FindIndra()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(IndraCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(IndraCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FarmIndra()
    if FindIndra() then
        v = FindIndra()
        
    	repeat task.wait()
    		EquipWeapon(Weapon)
            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
            attackm = true
    	until not Auto_Spikey_Trident or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
    	attackm = false
    end
end
function FindFruit()
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if string.find(v.Name, "Fruit") then
            return v
        end
    end
end
function CollectFruit()
    if FindFruit() then
        v = FindFruit()
        repeat task.wait()
        TP(v.Handle.CFrame*CFrame.new(0,1.5,0))
        until not FindFruit()
    end
end
function Buy_Chip()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", "Flame")
end
function StartDungeon()
    fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
    repeat task.wait()
    until game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true or game.Players.LocalPlayer.Character.Humanoid.Health <= 0
end
function FindIsland5()
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
		if v.Name == "Island 5" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2300 then
		    return v
		end
	end
end
function FindIsland4()
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
		if v.Name == "Island 4" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2300 then
		    return v
		end
	end
end
function FindIsland3()
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
		if v.Name == "Island 3" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2300 then
		    return v
		end
	end
end
function FindIsland2()
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
		if v.Name == "Island 2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2300 then
		    return v
		end
	end
end
function FindIsland1()
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
		if v.Name == "Island 1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2300 then
		    return v
		end
	end
end
function Killaura()
    for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
		if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
			repeat task.wait()
				sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
				v.Humanoid.Health = 0
				v.HumanoidRootPart.CanCollide = true
				v.HumanoidRootPart.Transparency = 0.5
			until not Auto_Raid or not v.Parent or v.Humanoid.Health <= 0
		end
	end
end
function NextIsland()
    Killaura()
    if FindIsland5() then
        v = FindIsland5()
        TP(CFrame.new(v.CFrame.X, 100, v.CFrame.Z))
    elseif FindIsland4() then
        v = FindIsland4()
        TP(CFrame.new(v.CFrame.X, 100, v.CFrame.Z))
    elseif FindIsland3() then
        v = FindIsland3()
        TP(CFrame.new(v.CFrame.X, 100, v.CFrame.Z))
    elseif FindIsland2() then
        v = FindIsland2()
        TP(CFrame.new(v.CFrame.X, 100, v.CFrame.Z))
    elseif FindIsland1() then
        v = FindIsland1()
        TP(CFrame.new(v.CFrame.X, 100, v.CFrame.Z))
    end
end
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
function FindCocoa()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if table.find(CocoaCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if table.find(CocoaCheck, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function FarmCocoa()
    if FindCocoa() then
        v = FindCocoa()
        StatrMagnet = true
        _G.PosMon = v.HumanoidRootPart.CFrame
    	repeat task.wait()
    		EquipWeapon(Weapon)
            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
            attackm = true
    	until not Auto_Spikey_Trident or not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
    	attackm = false
        StatrMagnet = false
    	else
    	    TP(CFrame.new(616.9508666992188, 82.83536529541016, -12574.2841796875))
    end
end
function JaTumAreRaiKabMunDe()
    if getgenv().Cup == "Dough King" then
        if GetMaterial("Conjured Cocoa") >= 10 then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
            else
                _G.Doing = "Farm Cocoa "..tostring(GetMaterial("Conjured Cocoa")).."/10"
                FarmCocoa()
        end
    elseif getgenv().Cup == "Rip Indra" then
        _G.Doing = "Tread Color Haki Indra"
        ColorHakiIndra()
    end
end

spawn(function()
    while wait() do 
        pcall(function()
            if Auto_Spikey_Trident and game.Workspace.Characters[game.Players.LocalPlayer.Name].Head then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                    _G.Doing = "Start Raid"
                    StopTween()
                    wait(1)
                    StartDungeon()
                end
                if FindIsland5() or FindIsland4() or FindIsland3() or FindIsland2() or FindIsland1() then
                    _G.Doing = "Farm Raid"
                    repeat NextIsland() wait()
                    until not FindIsland5() and not FindIsland4() and not FindIsland3() and not FindIsland2() and not FindIsland1()
                elseif FindBoss() then
                    _G.Doing = "Farm Cake Prince"
                    FarmCakePrince()
                elseif FindElite() then
                    _G.Doing = "Farm Elite | "..tostring(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter","Progress"))
                    FarmElite()
                elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
                    JaTumAreRaiKabMunDe()
                elseif FindIndra() then
                    _G.Doing = "Farm Indra"
                    FarmIndra()
                elseif FindFruit() then
                    _G.Doing = "Bring Fruit"
                    CollectFruit()
                else
                    _G.Doing = "Farm Mon "..tostring(tonumber(string.match(tostring(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")), "%d+")))
                    FarmMonCakePrince()
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            for i, v in pairs(game:GetService("Players")["LocalPlayer"].PlayerGui:FindFirstChild("Notifications"):GetChildren()) do
                if v.Name == "NotificationTemplate" then
                    v:Destroy()
                end
            end
        end)
    end
end)
function FPSBooster()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    sethiddenproperty(l, "Technology", 2)
    sethiddenproperty(t, "Decoration", false)
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 1
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if
            e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or
                e:IsA("DepthOfFieldEffect")
         then
            e.Enabled = false
        end
    end
    for i, b in pairs(game:GetService("Workspace"):GetChildren()) do
        if b:IsA("Animation") then
            b:Stop()
        end
        if b:IsA("Model") and b:FindFirstChild("Humanoid") then
            b.Humanoid.FreeFalling:Connect(function()
                b.Humanoid:StopAllAnimations()
            end)
        end
    end
end
spawn(function()
    while wait() do
        pcall(function()
            for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                if v:IsA("Shirt") then
                    v:Destroy()
                end
                if v:IsA("Pants") then
                    v:Destroy()
                end
                if v:IsA("Accessory") then
                    v:Destroy()
                end
            end
        end)
    end
end)
FPSBooster()
repeat task.wait() until game:IsLoaded() game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
function DropFruit()
	pcall(function()
		game.Players.LocalPlayer.PlayerGui.Main.FruitInventory.Position = UDim2.new(10.100, 0, 0.100, 0) -- HideUi
		game.Players.LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
		local invenfruit = game.Players.LocalPlayer.PlayerGui.Main.FruitInventory.Container.Stored.ScrollingFrame.Frame
		wait(.3)
		for i,v in pairs(invenfruit:GetChildren()) do
			if string.find(v.Name,"-") then
				for _,Backpack in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
					FruitStoreF = string.split(Backpack.Name, " ")[1]
					FruitStoreR = FruitStoreF.."-"..FruitStoreF
					if v.Name == FruitStoreR then
						game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Backpack.Name):Destroy()
					end												
				end
			end
		end
		for i,v in pairs(invenfruit:GetChildren()) do
			if string.find(v.Name,"-") then
				for _,Character in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
					FruitStoreF = string.split(Character.Name, " ")[1]
					FruitStoreR = FruitStoreF.."-"..FruitStoreF
					if v.Name == FruitStoreR then
						game:GetService("Players").LocalPlayer.Character:FindFirstChild(Character.Name):Destroy()
					end												
				end
			end
		end
	end)
end
spawn(function()
	while wait() do
		pcall(function()
			DropFruit()
			wait()
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bomb-Bomb",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spike-Spike",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Chop-Chop",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spring-Spring",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rocket Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rocket Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rocket-Rocket",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rocket Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rocket Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Smoke-Smoke",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spin-Spin",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Flame-Flame",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Falcon Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Falcon-Falcon",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Falcon Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Ice-Ice",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Sand-Sand",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dark-Dark",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ghost Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ghost Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Ghost-Ghost",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ghost Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ghost Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Diamond-Diamond",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Light-Light",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Love-Love",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rubber-Rubber",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Barrier-Barrier",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Magma-Magma",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Portal-Portal",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Quake-Quake",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Buddha Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Buddha-Buddha",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Buddha Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spider Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spider-Spider",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spider Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Phoenix Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Phoenix-Phoenix",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Phoenix Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rumble-Rumble",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pain Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Pain-Pain",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pain Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Gravity-Gravity",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dough-Dough",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Shadow-Shadow",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Venom-Venom",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Control-Control",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dragon-Dragon",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Leopard-Leopard",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spirit-Spirit",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("T-Rex Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("T-Rex Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","T-Rex-T-Rex",game:GetService("Players").LocalPlayer.Character:FindFirstChild("T-Rex Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("T-Rex Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kitsune Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kitsune Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Kitsune-Kitsune",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kitsune Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kitsune Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sound Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sound Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Sound-Sound",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sound Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sound Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Blizzard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Blizzard Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Blizzard-Blizzard",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Blizzard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Blizzard Fruit"))
			end
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Mammoth Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Mammoth Fruit") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Mammoth-Mammoth",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Mammoth Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Mammoth Fruit"))
			end
			if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false and game.Players.LocalPlayer.Character.Humanoid.Health > 0 and not FindIsland5() then
                Buy_Chip()
            end
		end)
	end
end)

local Notify_DM = Instance.new("ScreenGui")
local NotifyList = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
Notify_DM.Name = "Notify_DM"
Notify_DM.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Notify_DM.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

NotifyList.Name = "NotifyList"
NotifyList.Parent = Notify_DM
NotifyList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotifyList.BackgroundTransparency = 1.000
NotifyList.BorderColor3 = Color3.fromRGB(0, 0, 0)
NotifyList.BorderSizePixel = 0
NotifyList.Position = UDim2.new(0.780645132, 0, 0, 0)
NotifyList.Size = UDim2.new(0, 190, 0, 504)

UIListLayout.Parent = NotifyList
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
UIListLayout.Padding = UDim.new(0, 5)

local Tw = game:GetService("TweenService")
local Tf = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

Notify = {}
function Notify.new(Title,SupTitle,Sec)

    local NotifyTemple = Instance.new("Frame")
    local CornerTemple = Instance.new("UICorner")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Close = Instance.new("TextButton")
    local Main = Instance.new("TextLabel")
    local Sup = Instance.new("TextLabel")

    NotifyTemple.Name = "NotifyTemple"
    NotifyTemple.Parent = NotifyList
    NotifyTemple.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    NotifyTemple.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyTemple.BorderSizePixel = 0
    NotifyTemple.Position = UDim2.new(0.264976948, 0, 0.390873015, 0)
    NotifyTemple.Size = UDim2.new(0, 0, 0, 40)

    CornerTemple.Name = "CornerTemple"
    CornerTemple.Parent = NotifyTemple

    Frame.Parent = NotifyTemple
    Frame.BackgroundColor3 = Color3.fromRGB(255, 204, 0)
    Frame.BorderColor3 = Color3.fromRGB(255, 255, 0)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(0, 6, 0, 40)
    Frame.ZIndex = 2

    UICorner.Parent = Frame

    Close.Name = "Close"
    Close.Parent = NotifyTemple
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0.837499976, 0, 0.25, 0)
    Close.Size = UDim2.new(0, 20, 0, 20)
    Close.Font = Enum.Font.FredokaOne
    Close.Text = "X"
    Close.TextColor3 = Color3.fromRGB(255, 204, 0)
    Close.TextScaled = true
    Close.TextSize = 14.000
    Close.TextWrapped = true

    Main.Name = "Main"
    Main.Parent = NotifyTemple
    Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Main.BackgroundTransparency = 1.000
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.0375000015, 0, 0, 0)
    Main.Size = UDim2.new(0, 148, 0, 19)
    Main.Font = Enum.Font.FredokaOne
    Main.Text = Title
    Main.TextColor3 = Color3.fromRGB(255, 204, 0)
    Main.TextSize = 12.000
    Main.TextXAlignment = Enum.TextXAlignment.Left

    Sup.Name = "Sup"
    Sup.Parent = NotifyTemple
    Sup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Sup.BackgroundTransparency = 1.000
    Sup.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Sup.BorderSizePixel = 0
    Sup.Position = UDim2.new(0.0375000648, 0, 0.474999994, 0)
    Sup.Size = UDim2.new(0, 148, 0, 19)
    Sup.Font = Enum.Font.FredokaOne
    Sup.Text = SupTitle
    Sup.TextColor3 = Color3.fromRGB(255, 250, 99)
    Sup.TextSize = 12.000
    Sup.TextXAlignment = Enum.TextXAlignment.Left

    Close.MouseButton1Click:Connect(function()
        Tw:Create(NotifyTemple,Tf,{Size = UDim2.new(0, 0, 0, 40)}):Play()
        Tw:Create(Main,Tf,{TextTransparency = 1}):Play()
        Tw:Create(Sup,Tf,{TextTransparency = 1}):Play()
        Tw:Create(Close,Tf,{TextTransparency = 1}):Play()
        Tw:Create(Frame,Tf,{BackgroundTransparency = 1}):Play()
        task.wait(.27)
        NotifyTemple:Destroy()
    end)

    Tw:Create(NotifyTemple,Tf,{Size = UDim2.new(0, 187, 0, 40)}):Play()

    task.spawn(function()
        task.wait(Sec)
        Tw:Create(NotifyTemple,Tf,{Size = UDim2.new(0, 0, 0, 40)}):Play()
        Tw:Create(Main,Tf,{TextTransparency = 1}):Play()
        Tw:Create(Sup,Tf,{TextTransparency = 1}):Play()
        Tw:Create(Close,Tf,{TextTransparency = 1}):Play()
        Tw:Create(Frame,Tf,{BackgroundTransparency = 1}):Play()
        task.wait(.27)
        NotifyTemple:Destroy()
    end)

    return Notify
end

SmallNotify = {}
function SmallNotify.new(Title,Sec)

    local NotifyTemple = Instance.new("Frame")
    local CornerTemple = Instance.new("UICorner")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Close = Instance.new("TextButton")
    local Main = Instance.new("TextLabel")

    NotifyTemple.Name = "NotifyTemple"
    NotifyTemple.Parent = NotifyList
    NotifyTemple.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    NotifyTemple.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyTemple.BorderSizePixel = 0
    NotifyTemple.Position = UDim2.new(0.264976948, 0, 0.390873015, 0)
    NotifyTemple.Size = UDim2.new(0, 0, 0, 20)

    CornerTemple.Name = "CornerTemple"
    CornerTemple.Parent = NotifyTemple

    Frame.Parent = NotifyTemple
    Frame.BackgroundColor3 = Color3.fromRGB(255, 204, 0)
    Frame.BorderColor3 = Color3.fromRGB(255, 255, 0)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(0, 6, 0, 20)
    Frame.ZIndex = 2

    UICorner.Parent = Frame

    Close.Name = "Close"
    Close.Parent = NotifyTemple
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0.86, 0, 0.25, 0)
    Close.Size = UDim2.new(0, 10, 0, 10)
    Close.Font = Enum.Font.FredokaOne
    Close.Text = "X"
    Close.TextColor3 = Color3.fromRGB(255, 204, 0)
    Close.TextScaled = true
    Close.TextSize = 10.000
    Close.TextWrapped = true

    Main.Name = "Main"
    Main.Parent = NotifyTemple
    Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Main.BackgroundTransparency = 1.000
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.0375000015, 0, 0, 0)
    Main.Size = UDim2.new(0, 148, 0, 20)
    Main.Font = Enum.Font.FredokaOne
    Main.Text = Title
    Main.TextColor3 = Color3.fromRGB(255, 204, 0)
    Main.TextSize = 12.000
    Main.TextXAlignment = Enum.TextXAlignment.Left

    Close.MouseButton1Click:Connect(function()
        Tw:Create(NotifyTemple,Tf,{Size = UDim2.new(0, 0, 0, 20)}):Play()
        Tw:Create(Main,Tf,{TextTransparency = 1}):Play()
        Tw:Create(Close,Tf,{TextTransparency = 1}):Play()
        Tw:Create(Frame,Tf,{BackgroundTransparency = 1}):Play()
        task.wait(.27)
        NotifyTemple:Destroy()
    end)

    Tw:Create(NotifyTemple,Tf,{Size = UDim2.new(0, 187, 0, 20)}):Play()

    task.spawn(function()
        task.wait(Sec)
        Tw:Create(NotifyTemple,Tf,{Size = UDim2.new(0, 0, 0, 20)}):Play()
        Tw:Create(Main,Tf,{TextTransparency = 1}):Play()
        Tw:Create(Close,Tf,{TextTransparency = 1}):Play()
        Tw:Create(Frame,Tf,{BackgroundTransparency = 1}):Play()
        task.wait(.27)
        NotifyTemple:Destroy()
    end)

    return SmallNotify
end

Notify.new("Dummy Hub | Loading","Auto Farm Fragment",5)
if FG == nil then
    FG = game:GetService("Players").LocalPlayer.Data.Fragments.Value 
end
function formatNumber(num)
    if num >= 1000000 then
        return string.format("%.2fM", num / 1000000)
    elseif num >= 1000 then
        return string.format("%.2fK", num / 1000)
    else
        return tostring(num)
    end
end
spawn(function()
    while wait(1.5) do
        pcall(function()
            local scripttime = game.Workspace.DistributedGameTime
            local seconds = scripttime % 60
            local minutes = math.floor(scripttime / 60 % 60)
            local hours = math.floor(scripttime / 3600)
            local tempo = string.format("%02d:%02d:%02d", hours, minutes, seconds)
            Notify.new("Dummy Hub | Doing","Stats: ".._G.Doing,1)
            Notify.new("Dummy Hub | Total","Total: "..tostring(formatNumber(game:GetService("Players").LocalPlayer.Data.Fragments.Value)),1)
            Notify.new("Dummy Hub | Enble","Enble: "..tostring(formatNumber(game:GetService("Players").LocalPlayer.Data.Fragments.Value-FG)),1)
            SmallNotify.new("Dummy Hub | "..tostring(tempo),1)
        end)
    end
end)

local AFK_TIMEOUT = 60
local afkTimer = 0
local isAFK = false

local function resetAFKTimer()
    afkTimer = 0
    isAFK = false
end

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        resetAFKTimer()
    end
end)

spawn(function()
    while true do
        task.wait(1)
        afkTimer = afkTimer + 1
        
        if afkTimer >= AFK_TIMEOUT then
            isAFK = true
            game.Workspace.Characters[game.Players.LocalPlayer.Name].Head:Destroy()
        else
            isAFK = false
        end
    end
end)
