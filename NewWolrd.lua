-- Verifica se está no jogo Blox Fruits
if game.PlaceId ~= 2753915549 and game.PlaceId ~= 4442272183 and game.PlaceId ~= 7449423635 then
    return -- Sai do script se não estiver no Blox Fruits
end

-- Baixa e executa a Orion Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "NewWorld [Free]", HidePremium = false, SaveConfig = true, ConfigFolder = "NewWorld"})

-- Criando as abas
local StatusTab = Window:MakeTab({Name = "Status And Server", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local FarmingTab = Window:MakeTab({Name = "Tab Farming", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local SeaEventTab = Window:MakeTab({Name = "Tab Sea Event", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local FarmingOtherTab = Window:MakeTab({Name = "Tab Farming Other", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local UpgradeRaceTab = Window:MakeTab({Name = "Upgrade Race", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-------------------
-- STATUS E SERVIDOR
-------------------
StatusTab:AddLabel("Server & Status")

local function GetServerTime()
    local seconds = math.floor(workspace.DistributedGameTime)
    local minutes = math.floor(seconds / 60)
    local hours = math.floor(minutes / 60)
    return string.format("| Hour: %d | Minute: %d | Second: %d |", hours, minutes % 60, seconds % 60)
end

StatusTab:AddParagraph("Time", GetServerTime())

game:GetService("RunService").RenderStepped:Connect(function()
    StatusTab:UpdateParagraph("Time", GetServerTime())
end)

StatusTab:AddButton({Name = "Hop Server", Callback = function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end})

-------------------
-- TAB FARMING
-------------------
FarmingTab:AddLabel("Farming Settings")

FarmingTab:AddToggle({
    Name = "Use skill fast (don't hold)",
    Default = false,
    Callback = function(state)
        print("Use skill fast: " .. tostring(state))
    end
})

FarmingTab:AddDropdown({
    Name = "Select Method Farm",
    Options = {"Level Farm", "Mastery Farm", "Material Farm"},
    Callback = function(selected)
        print("Selected Farming Method: " .. selected)
    end
})

FarmingTab:AddButton({
    Name = "Start Farm",
    Callback = function()
        print("Farm Started!")
    end
})

-------------------
-- TAB SEA EVENT
-------------------
SeaEventTab:AddLabel("Sea Event Settings")

SeaEventTab:AddDropdown({
    Name = "Select Zone",
    Options = {"Zone 1", "Zone 2", "Zone 3", "Zone 4", "Zone 5", "Zone 6"},
    Callback = function(selectedZone)
        print("Selected Zone: " .. selectedZone)
    end
})

SeaEventTab:AddDropdown({
    Name = "Select Boat",
    Options = {"GrandBrigade", "SmallBoat", "FastBoat"},
    Callback = function(selectedBoat)
        print("Selected Boat: " .. selectedBoat)
    end
})

SeaEventTab:AddToggle({
    Name = "Auto Sea Event",
    Default = false,
    Callback = function(state)
        getgenv().AutoSeaEvent = state
        while getgenv().AutoSeaEvent do
            wait(1)
            local player = game.Players.LocalPlayer
            local boat = workspace:FindFirstChild(player.Name .. "'s Boat")
            
            if boat then
                print("Boat encontrado. Seguindo para o evento do mar.")
                boat.PrimaryPart.CFrame = CFrame.new(5000, 50, 5000)
            else
                print("Nenhum barco encontrado. Tentando spawnar um barco.")
                game.ReplicatedStorage.Remotes.SpawnBoat:FireServer("GrandBrigade")
            end
        end
    end
})

SeaEventTab:AddButton({
    Name = "Reset Character Buy Boat",
    Callback = function()
        game.Players.LocalPlayer.Character:BreakJoints()
    end
})

-------------------
-- TAB FARMING OTHER
-------------------
FarmingOtherTab:AddLabel("Advanced Farming Options")

FarmingOtherTab:AddToggle({
    Name = "Auto Quest Dojo Trainee",
    Default = false,
    Callback = function(state)
        print("Auto Quest Dojo Trainee: " .. tostring(state))
    end
})

FarmingOtherTab:AddToggle({
    Name = "Auto Chest",
    Default = false,
    Callback = function(state)
        print("Auto Chest: " .. tostring(state))
    end
})

FarmingOtherTab:AddDropdown({
    Name = "Select Mobs",
    Options = {"Mob 1", "Mob 2", "Mob 3"},
    Callback = function(selectedMob)
        print("Selected Mob: " .. selectedMob)
    end
})

FarmingOtherTab:AddButton({
    Name = "Kill Mob",
    Callback = function()
        print("Killing selected mob...")
    end
})

-------------------
-- TAB UPGRADE RACE
-------------------
UpgradeRaceTab:AddLabel("Race Upgrade Options")

UpgradeRaceTab:AddButton({
    Name = "Teleport to Ancient Clock",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28385, 14896, 108)
    end
})

UpgradeRaceTab:AddToggle({
    Name = "Auto Buy Race Gears",
    Default = false,
    Callback = function(state)
        getgenv().AutoBuyGears = state
        while getgenv().AutoBuyGears do
            wait(1)
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyRaceGear")
        end
    end
})

UpgradeRaceTab:AddToggle({
    Name = "Auto Upgrade Race V2",
    Default = false,
    Callback = function(state)
        getgenv().AutoUpgradeRaceV2 = state
        while getgenv().AutoUpgradeRaceV2 do
            wait(1)
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EvolveRace", "RaceV2")
        end
    end
})

UpgradeRaceTab:AddToggle({
    Name = "Auto Upgrade Race V3",
    Default = false,
    Callback = function(state)
        getgenv().AutoUpgradeRaceV3 = state
        while getgenv().AutoUpgradeRaceV3 do
            wait(1)
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EvolveRace", "RaceV3")
        end
    end
})

UpgradeRaceTab:AddToggle({
    Name = "Auto Upgrade Race V4",
    Default = false,
    Callback = function(state)
        getgenv().AutoUpgradeRaceV4 = state
        while getgenv().AutoUpgradeRaceV4 do
            wait(1)
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EvolveRace", "RaceV4")
        end
    end
})

UpgradeRaceTab:AddButton({
    Name = "Teleport to Race Trial",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29875, 14896, 120)
    end
})

-- FINALIZA E EXIBE O GUI
OrionLib:Init()
