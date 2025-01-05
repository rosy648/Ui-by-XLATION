











local gui = game:GetService("CoreGui"):FindFirstChild("LuxuriosHubsUiLibrary")
if gui then
    gui:Destroy()
end

local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/robloxfui/LuxuriosHub2/main/ThemeManager'))()

if game:GetService("UserInputService").TouchEnabled then
	print("Mobile device")
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/robloxfui/LuxuriosLib/main/MobileUiLibrary'))()
else 
	print("PC device")
    local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/robloxfui/LuxuriosLib/main/Librarys'))()
end

local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/robloxfui/LuxuriosHub3/main/SaveManager'))()
    

repeat wait() until game:IsLoaded() 
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
	vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

Library:Notify("discord : discord.gg/GZcKyTRb9W", 3)

Library:Notify("Enjoy.", 3)

-------------------------------------------------------------------

local Window = Library:CreateWindow({
    Title = 'Dece Hub Free Script - God Tycoon',
    Center = true, 
    AutoShow = true,
})

local function UpdateTime()
    local GameTime = math.floor(workspace.DistributedGameTime+0.5)
    local Hour = math.floor(GameTime/(60^2))%24
    local Minute = math.floor(GameTime/(60^1))%60
    local Second = math.floor(GameTime/(60^0))%60
    Library:SetWatermark('Dece Hub Free Script - Hr(s) : '..Hour..' Min(s) : '..Minute..' Sec(s) : '..Second)
    end
    spawn(function()
          while true do
          UpdateTime()
          game:GetService("RunService").RenderStepped:Wait()
          end
   end)

local Tabs = {
    General = Window:AddTab('General'),
    ['UI Settings'] = Window:AddTab('Settings')
}


local Killers = Tabs.General:AddLeftTabbox()
local Main = Killers:AddTab(' [ Main ] ')
local Visual = Killers:AddTab(' [ Visual ] ')

Main:AddToggle('', {
    Text = 'Auto Collect Money',
    Default = false, 
    Tooltip = nil,
    Callback = function(t)

        getgenv().AutoCollect = t
        if getgenv().AutoCollect then
            enabled = true
     
            local tycoons = workspace.Tycoons.Tycoons
    local plrName = game.Players.LocalPlayer.Name
     
    for i,tycoon in pairs(tycoons:GetChildren()) do
        if tostring(tycoon.Owner.Value) == plrName then
            local playerTycoon = tycoons[tycoon.Name]
     
            local giver = playerTycoon.Essentials.Giver
            local currencyToCollect = playerTycoon.CurrencyToCollect
     
            currencyToCollect.Changed:Connect(function()
                if enabled == true then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, giver, 0)
                wait(.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, giver, 1)
                end
                end)
        end
        end
            else
                enabled = false
    end
    end
})

Main:AddToggle('', {
    Text = 'Auto Click Droper',
    Default = false, 
    Tooltip = nil,
    Callback = function(t)

        getgenv().AutoClick = t

        if getgenv().AutoClick then
        
            _G.autoClick = true
            
            local tycoons = workspace.Tycoons.Tycoons
            local plrName = game.Players.LocalPlayer.Name
            
            for i,tycoon in pairs(tycoons:GetChildren()) do
            if tostring(tycoon.Owner.Value) == plrName then
                local playerTycoon = tycoons[tycoon.Name]
                
                while _G.autoClick == true do task.wait()
                    fireclickdetector(playerTycoon.PurchasedObjects.Mine.Model.Clicker.ClickDetector)
                    end
            end
            end
            else
                _G.autoClick = false
            end
    end
})

Main:AddToggle('', {
    Text = 'Auto Buy',
    Default = false, 
    Tooltip = nil,
    Callback = function(t)

        getgenv().AutoBuy = t

        if getgenv().AutoBuy then
            enabled1 = true
            local cash = game.Players.LocalPlayer.leaderstats.Cash
     
    cash.Changed:Connect(function()
        local tycoons = workspace.Tycoons.Tycoons
        local plrName = game.Players.LocalPlayer.Name
     
        for i,tycoon in pairs(tycoons:GetChildren()) do
            if tostring(tycoon.Owner.Value) == plrName then
                local playerTycoon = tycoons[tycoon.Name]
     
                print(playerTycoon)
     
                local buttons = playerTycoon:FindFirstChild("Buttons")
     
                for i,button in pairs(buttons:GetChildren()) do
                    if enabled1 == true then
                        if button:FindFirstChild("Gamepass") then
                            else
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, button.Head, 0)
                                wait(.1)
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, button.Head, 1)
                                end
                        end
                        end
                end
            end
    end)
            else
                enabled1 = false
                end
    end
})

Visual:AddButton({
    Text = 'Fake Chat',
    Func = function()
        game.StarterGui:SetCore("ChatMakeSystemMessage", {Text = "This Game has got hacked by c00lkidd.", Color = Color3.fromRGB(255,0,0), Font = Enum.Font.FredokaOne, FontSize = Enum.FontSize.Size32})
    end,
    DoubleClick = false,
    Tooltip = nil
})


Visual:AddButton({
    Text = 'Delete All Laser',
    Func = function()
        local tycoonTypes = {"Nature", "Light", "Ice", "Lightning", "Fire", "Wind", "Poison", "Death"}

        for _, tycoonType in pairs(tycoonTypes) do
            local tycoonFolder = game:GetService("Workspace").Tycoons.Tycoons[tycoonType]
        
            if tycoonFolder and tycoonFolder.PurchasedObjects:FindFirstChild("OwnerOnlyDoor") then
                local ownerOnlyDoor = tycoonFolder.PurchasedObjects.OwnerOnlyDoor
                if ownerOnlyDoor.Button then
                    ownerOnlyDoor.Lasers.Parent = game.StarterGui
                end
            end
            wait()
        end
         
    end,
    DoubleClick = false,
    Tooltip = nil
})

Visual:AddButton({
    Text = 'Steal All Item Tycoon',
    Func = function()
        local tycoons = workspace.Tycoons.Tycoons
        local plrName = game.Players.LocalPlayer.Name
     
        for i,tycoon in pairs(tycoons:GetChildren()) do
            if tycoon.Name == "Poison" then
                local poisonPurchases = tycoon.PurchasedObjects
     
                if poisonPurchases:FindFirstChild("Giver1") and poisonPurchases:FindFirstChild("Giver2") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                elseif poisonPurchases:FindFirstChild("Giver1") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                elseif poisonPurchases:FindFirstChild("Giver2") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                    else
                        --
                end
            end
        end

        local tycoons = workspace.Tycoons.Tycoons
        local plrName = game.Players.LocalPlayer.Name
     
        for i,tycoon in pairs(tycoons:GetChildren()) do
            if tycoon.Name == "Nature" then
                local poisonPurchases = tycoon.PurchasedObjects
     
                if poisonPurchases:FindFirstChild("Giver1") and poisonPurchases:FindFirstChild("Giver2") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                elseif poisonPurchases:FindFirstChild("Giver1") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                elseif poisonPurchases:FindFirstChild("Giver2") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                    else
                        --
                end
            end
        end

        local tycoons = workspace.Tycoons.Tycoons
        local plrName = game.Players.LocalPlayer.Name
     
        for i,tycoon in pairs(tycoons:GetChildren()) do
            if tycoon.Name == "Death" then
                local poisonPurchases = tycoon.PurchasedObjects
     
                if poisonPurchases:FindFirstChild("Giver1") and poisonPurchases:FindFirstChild("Giver2") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                elseif poisonPurchases:FindFirstChild("Giver1") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                elseif poisonPurchases:FindFirstChild("Giver2") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                    else
                        --
                end
            end
        end

        local tycoons = workspace.Tycoons.Tycoons
        local plrName = game.Players.LocalPlayer.Name
     
        for i,tycoon in pairs(tycoons:GetChildren()) do
            if tycoon.Name == "Lightning" then
                local poisonPurchases = tycoon.PurchasedObjects
     
                if poisonPurchases:FindFirstChild("Giver1") and poisonPurchases:FindFirstChild("Giver2") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                elseif poisonPurchases:FindFirstChild("Giver1") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                elseif poisonPurchases:FindFirstChild("Giver2") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                    else
                        --
                end
            end
        end

        local tycoons = workspace.Tycoons.Tycoons
        local plrName = game.Players.LocalPlayer.Name
     
        for i,tycoon in pairs(tycoons:GetChildren()) do
            if tycoon.Name == "Ice" then
                local poisonPurchases = tycoon.PurchasedObjects
     
                if poisonPurchases:FindFirstChild("Giver1") and poisonPurchases:FindFirstChild("Giver2") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                elseif poisonPurchases:FindFirstChild("Giver1") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                elseif poisonPurchases:FindFirstChild("Giver2") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                    else
                        --
                end
            end
        end

        local tycoons = workspace.Tycoons.Tycoons
        local plrName = game.Players.LocalPlayer.Name
     
        for i,tycoon in pairs(tycoons:GetChildren()) do
            if tycoon.Name == "Wind" then
                local poisonPurchases = tycoon.PurchasedObjects
     
                if poisonPurchases:FindFirstChild("Giver1") and poisonPurchases:FindFirstChild("Giver2") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                elseif poisonPurchases:FindFirstChild("Giver1") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                elseif poisonPurchases:FindFirstChild("Giver2") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                    else
                        --
                end
            end
        end

        local tycoons = workspace.Tycoons.Tycoons
        local plrName = game.Players.LocalPlayer.Name
     
        for i,tycoon in pairs(tycoons:GetChildren()) do
            if tycoon.Name == "Fire" then
                local poisonPurchases = tycoon.PurchasedObjects
     
                if poisonPurchases:FindFirstChild("Giver1") and poisonPurchases:FindFirstChild("Giver2") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                elseif poisonPurchases:FindFirstChild("Giver1") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                elseif poisonPurchases:FindFirstChild("Giver2") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                    wait(0.1)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                    else
                        --
                end
            end
        end
    end,
    DoubleClick = false,
    Tooltip = nil
})

local Tp = Tabs.General:AddLeftTabbox()
local Zone = Tp:AddTab(' [ Teleport Zone ] ')
Zone:AddButton({
    Text = 'Ice',
    Func = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(277.608276, 140.479126, -171.713165)
    end,
    DoubleClick = false,
    Tooltip = nil
})

Zone:AddButton({
    Text = 'Nature',
    Func = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(75.3429565, 138.334717, 35.1716614)
    end,
    DoubleClick = false,
    Tooltip = nil
})


Zone:AddButton({
    Text = 'Death',
    Func = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(76.4955673, 140.269302, -378.061646)
    end,
    DoubleClick = false,
    Tooltip = nil
})

Zone:AddButton({
    Text = 'Lighting',
    Func = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(215.946243, 140.478531, -312.939697)
    end,
    DoubleClick = false,
    Tooltip = nil
})

Zone:AddButton({
    Text = 'Light',
    Func = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(215.563568, 140.454056, -29.9981823)
    end,
    DoubleClick = false,
    Tooltip = nil
})

Zone:AddButton({
    Text = 'Poison',
    Func = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-64.9857178, 140.372375, -315.127991)
    end,
    DoubleClick = false,
    Tooltip = nil
})

Zone:AddButton({
    Text = 'Wind',
    Func = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-68.536377, 140.464355, -30.7801437)
    end,
    DoubleClick = false,
    Tooltip = nil
})

Zone:AddButton({
    Text = 'Fire',
    Func = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-126.079498, 140.422226, -174.646118)
    end,
    DoubleClick = false,
    Tooltip = nil
})

local lk = Tabs.General:AddRightTabbox()
local LocalPlayer = lk:AddTab(' [ LocalPlayer ] ')

LocalPlayer:AddSlider('', {
    Text = 'Walk Speed',
    Default = 1000,
    Min = 0,
    Max = 500,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

LocalPlayer:AddSlider('', {
    Text = 'Jumppower',
    Default = 100,
    Min = 0,
    Max = 500,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.Jumppower = Value
    end
})

LocalPlayer:AddToggle('', {
    Text = 'Noclip',
    Default = false, 
    Tooltip = nil,
    Callback = function(t)
        getgenv().Noclip = t
    end
})

spawn(function()
    while game:GetService("RunService").Stepped:wait() do
		pcall(function()
        	if getgenv().Noclip then
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

LocalPlayer:AddToggle('', {
    Text = 'Inf Jump',
    Default = false, 
    Tooltip = nil,
    Callback = function(t)
        getgenv().Infjump = t
    end
})

game:GetService("UserInputService").jumpRequest:Connect(function()
    if getgenv().Infjump  then
        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass"Humanoid":ChangeState("Jumping")
    end
end)

local gh = Tabs.General:AddRightTabbox()
local bb = gh:AddTab(' [ Graphic ] ')


bb:AddButton({
    Text = 'Fps Booster',
    Func = function()
			for i,v in pairs(game.Workspace.Map:GetDescendants()) do
				if v.Name == "Tavern" or v.Name == "SmileFactory" or v.Name == "Tree" or v.Name == "Rocks" or v.Name == "PartHouse" or v.Name == "Hotel" or v.Name == "WallPiece" or v.Name == "MiddlePillars" or v.Name == "Cloud" or v.Name == "PluginGrass" or v.Name == "BigHouse" or v.Name == "SmallHouse" or v.Name == "Detail" then
					v:Destroy()
				end
			end 
			for i,v in pairs(game.ReplicatedStorage.Unloaded:GetDescendants()) do
				if v.Name == "Tavern" or v.Name == "SmileFactory" or v.Name == "Tree" or v.Name == "Rocks" or v.Name == "PartHouse" or v.Name == "Hotel" or v.Name == "WallPiece" or v.Name == "MiddlePillars" or v.Name == "Cloud" or v.Name == "PluginGrass" or v.Name == "BigHouse" or v.Name == "SmallHouse" or v.Name == "Detail" then
					v:Destroy()
				end
			end
			for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("Accessory") or v.Name == "Pants" or v.Name == "Shirt" then
					v:Destroy()
				end
			end
			local decalsyeeted = true
			local g = game
			local w = g.Workspace
			local l = g.Lighting
			local t = w.Terrain
			t.WaterWaveSize = 0
			t.WaterWaveSpeed = 0
			t.WaterReflectance = 0
			t.WaterTransparency = 0
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
				if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
					e.Enabled = false
				end
			end
    end,
    DoubleClick = false,
    Tooltip = nil
})

bb:AddButton({
    Text = 'Save Gpu',
    Func = function()
        setfpscap(120000)
    end,
    DoubleClick = false,
    Tooltip = nil
})

    local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

    MenuGroup:AddButton('Destroy Ui', function() Library:Unload() end)
    
    ThemeManager:SetLibrary(Library)
    SaveManager:SetLibrary(Library)
    
    SaveManager:IgnoreThemeSettings() 
    
    SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
    
    ThemeManager:SetFolder('MyScriptHub')
    SaveManager:SetFolder('MyScriptHub/specific-game')
    
    SaveManager:BuildConfigSection(Tabs['UI Settings']) 
    
    ThemeManager:ApplyToTab(Tabs['UI Settings'])
    
