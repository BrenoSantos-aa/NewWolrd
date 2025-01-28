-- Verifica se está no jogo Blox Fruits
if game.PlaceId ~= 2753915549 and game.PlaceId ~= 4442272183 and game.PlaceId ~= 7449423635 then
    return -- Sai do script se não estiver no Blox Fruits
end

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/LTn9smKx"))() -- Biblioteca para UI
local Window = Library.CreateLib("Banana Cat Hub - Blox Fruit [Premium]", "DarkTheme")

-- Criando as abas
local StatusTab = Window:NewTab("Status And Server")
local FarmingTab = Window:NewTab("Tab Farming")
local SeaEventTab = Window:NewTab("Tab Sea Event")
local FarmingOtherTab = Window:NewTab("Tab Farming Other")
local UpgradeRaceTab = Window:NewTab("Upgrade Race") -- Nova aba adicionada

-------------------
-- STATUS E SERVIDOR
-------------------
local StatusSection = StatusTab:NewSection("Server & Status")

local function GetServerTime()
    local seconds = math.floor(workspace.DistributedGameTime)
    local minutes = math.floor(seconds / 60)
    local hours = math.floor(minutes / 60)
    return string.format("| Hour: %d | Minute: %d | Second: %d |", hours, minutes % 60, seconds % 60)
end

StatusSection:NewLabel("Time")
StatusSection:NewLabel(GetServerTime())

game:GetService("RunService").RenderStepped:Connect(function()
    StatusSection:UpdateLabel(2, GetServerTime())
end)

StatusSection:NewButton("Hop Server", "Hops to another server", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

-------------------
-- TAB FARMING
-------------------
local FarmingSection = FarmingTab:NewSection("Farming Settings")

FarmingSection:NewToggle("Use skill fast dont hold", "Ativa uso rápido de habilidades", function(state)
    print("Use skill fast: " .. tostring(state))
end)

FarmingSection:NewDropdown("Select Method Farm", {"Level Farm", "Mastery Farm", "Material Farm"}, function(selected)
    print("Selected Farming Method: " .. selected)
end)

FarmingSection:NewButton("Start Farm", "Inicia o farm", function()
    print("Farm Started!")
end)

-------------------
-- TAB SEA EVENT
-------------------
local SeaEventSection = SeaEventTab:NewSection("Sea Event Settings")

SeaEventSection:NewDropdown("Select Zone", {"Zone 1", "Zone 2", "Zone 3", "Zone 4", "Zone 5", "Zone 6"}, function(selectedZone)
    print("Selected Zone: " .. selectedZone)
end)

SeaEventSection:NewDropdown("Select Boat", {"GrandBrigade", "SmallBoat", "FastBoat"}, function(selectedBoat)
    print("Selected Boat: " .. selectedBoat)
end)

SeaEventSection:NewToggle("Auto Sea Event", function(state)
    getgenv().AutoSeaEvent = state
    while getgenv().AutoSeaEvent do
        wait(1)
        local player = game.Players.LocalPlayer
        local boat = workspace:FindFirstChild(player.Name .. "'s Boat")
        
        if boat then
            print("Boat encontrado. Seguindo para o evento do mar.")
            boat.PrimaryPart.CFrame = CFrame.new(5000, 50, 5000) -- Move para um evento do mar
        else
            print("Nenhum barco encontrado. Tentando spawnar um barco.")
            game.ReplicatedStorage.Remotes.SpawnBoat:FireServer("GrandBrigade") -- Spawna barco
        end
    end
end)

SeaEventSection:NewButton("Reset Character Buy Boat", function()
    game.Players.LocalPlayer.Character:BreakJoints()
end)

-------------------
-- TAB FARMING OTHER
-------------------
local FarmingOtherSection = FarmingOtherTab:NewSection("Advanced Farming Options")

FarmingOtherSection:NewToggle("Auto Quest Dojo Trainee", function(state)
    print("Auto Quest Dojo Trainee: " .. tostring(state))
end)

FarmingOtherSection:NewToggle("Auto Chest", function(state)
    print("Auto Chest: " .. tostring(state))
end)

FarmingOtherSection:NewDropdown("Select Mobs", {"Mob 1", "Mob 2", "Mob 3"}, function(selectedMob)
    print("Selected Mob: " .. selectedMob)
end)

FarmingOtherSection:NewButton("Kill Mob", function()
    print("Killing selected mob...")
end)

-------------------
-- TAB UPGRADE RACE
-------------------
local UpgradeRaceSection = UpgradeRaceTab:NewSection("Race Upgrade Options")

UpgradeRaceSection:NewButton("Teleport to Ancient Clock", "Leva até o relógio antigo", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28385, 14896, 108)
end)

UpgradeRaceSection:NewToggle("Auto Buy Race Gears", "Compra engrenagens automaticamente", function(state)
    getgenv().AutoBuyGears = state
    while getgenv().AutoBuyGears do
        wait(1)
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyRaceGear")
    end
end)

UpgradeRaceSection:NewToggle("Auto Upgrade Race V2", "Evolui a raça para V2 automaticamente", function(state)
    getgenv().AutoUpgradeRaceV2 = state
    while getgenv().AutoUpgradeRaceV2 do
        wait(1)
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EvolveRace", "RaceV2")
    end
end)

UpgradeRaceSection:NewToggle("Auto Upgrade Race V3", "Evolui a raça para V3 automaticamente", function(state)
    getgenv().AutoUpgradeRaceV3 = state
    while getgenv().AutoUpgradeRaceV3 do
        wait(1)
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EvolveRace", "RaceV3")
    end
end)

UpgradeRaceSection:NewToggle("Auto Upgrade Race V4", "Evolui a raça para V4 automaticamente", function(state)
    getgenv().AutoUpgradeRaceV4 = state
    while getgenv().AutoUpgradeRaceV4 do
        wait(1)
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EvolveRace", "RaceV4")
    end
end)

UpgradeRaceSection:NewToggle("Auto Start Race Trials", "Inicia as provas da raça automaticamente", function(state)
    getgenv().AutoRaceTrials = state
    while getgenv().AutoRaceTrials do
        wait(1)
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("StartRaceTrial")
    end
end)

UpgradeRaceSection:NewButton("Teleport to Race Trial", "Teleporta para a prova da raça", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29875, 14896, 120)
end)
