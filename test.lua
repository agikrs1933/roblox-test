-- // Pet Simulator X Complete Script (All Features) //
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Pet Simulator X Hub",
    LoadingTitle = "Loading PetSimX Hub",
    LoadingSubtitle = "by swanlake",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "PetSimX"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- Main Tab
local MainTab = Window:CreateTab("Main", "apple")

-- // Auto Farming //
getgenv().autoFarm = false
function doAutoFarm()
    while getgenv().autoFarm do
        local plr = game.Players.LocalPlayer
        for i, v in pairs(game:GetService("Workspace")["__THINGS"].Coins:GetChildren()) do
            local args = {
                [1] = { [1] = v.Name, [2] = {} }
            }
            game:GetService("ReplicatedStorage").Network.Invoke:InvokeServer("Collect Coin", unpack(args))
        end
        task.wait(0.5)
    end
end

MainTab:CreateToggle({
    Name = "Auto Farm Coins",
    CurrentValue = false,
    Callback = function(v)
        getgenv().autoFarm = v
        if v then doAutoFarm() end
    end
})

-- // Auto Collect Orbs //
getgenv().autoCollect = false
function doAutoCollect()
    while getgenv().autoCollect do
        for _, v in pairs(game:GetService("Workspace")["__THINGS"].Orbs:GetChildren()) do
            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
        task.wait(0.3)
    end
end

MainTab:CreateToggle({
    Name = "Auto Collect Orbs",
    CurrentValue = false,
    Callback = function(v)
        getgenv().autoCollect = v
        if v then doAutoCollect() end
    end
})

-- // Auto Hatch Eggs //
MainTab:CreateButton({
    Name = "Auto Hatch Egg (Cracked)",
    Callback = function()
        while true do
            game:GetService("ReplicatedStorage").Network.Invoke:InvokeServer("Buy Egg", "Cracked Egg", false)
            task.wait(1)
        end
    end
})

-- // Equip Best Pets //
MainTab:CreateButton({
    Name = "Equip Best Pets",
    Callback = function()
        game:GetService("ReplicatedStorage").Network.Fire:FireServer("Equip Best")
    end
})

-- // Auto Damage Farming (Targeting Enemies) //
getgenv().damageFarm = false
function doDamageFarm()
    while getgenv().damageFarm do
        for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") then
                game:GetService("ReplicatedStorage").Network.Invoke:InvokeServer("Damage", enemy)
            end
        end
        task.wait(1)
    end
end

MainTab:CreateToggle({
    Name = "Auto Damage Farm",
    CurrentValue = false,
    Callback = function(v)
        getgenv().damageFarm = v
        if v then doDamageFarm() end
    end
})

-- // Auto Teleport //
local WorldsTab = Window:CreateTab("Worlds", "earth")

local function teleportToPosition(position)
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
    else
        print("Character not loaded.")
    end
end

WorldsTab:CreateButton({
    Name = "Teleport to Starter World",
    Callback = function()
        teleportToPosition(Vector3.new(760, 975, -662))
    end
})

WorldsTab:CreateButton({
    Name = "Teleport to Underworld",
    Callback = function()
        teleportToPosition(Vector3.new(-195, 416, -16013))
    end
})

WorldsTab:CreateButton({
    Name = "Teleport to Sky World",
    Callback = function()
        teleportToPosition(Vector3.new(8386, 6320, 142))
    end
})

WorldsTab:CreateButton({
    Name = "Teleport to Space World",
    Callback = function()
        teleportToPosition(Vector3.new(-7834, 5623, -795))
    end
})

WorldsTab:CreateButton({
    Name = "Teleport to Atlantis World",
    Callback = function()
        teleportToPosition(Vector3.new(-3462, 723, -264))
    end
})

-- End of Script