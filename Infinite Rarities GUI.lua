-- https://www.roblox.com/games/12802235086/QUALITIES-UPDATE-Infinite-Rarities
-- This is my first ever GUI, im still working on it; however, i think it came out decent for the first time
-- NOTES: Teleport farm may be unsafe, so use with caution - Turn off buildings
-- NOTES: All farms once toggled off will continue untill their cycle ends (end of their path)
-- Made by myself (SirArcher)


-- NOTE TO SELF WORK ON SAFE MODE CURRENTLY DOESNT WORK

getgenv().qualityfarm = false
getgenv().rarityfarm = false
getgenv().rarityfarmgp = false
getgenv().TPrarityfarm = false
getgenv().TMfarm = false
getgenv().SafeMode = false

local char = game.Players.LocalPlayer.Character

function quality() 
     spawn(function()
        while qualityfarm == true do
            local cPos = char.HumanoidRootPart.Position
            local fPos = cPos.Z + 2

            char.Humanoid:MoveTo(Vector3.new(-74.375, 13.125, 59.8758))
            wait(3.5)
            char.Humanoid:MoveTo(Vector3.new(-144.07, 13.125, 69.5068))
            wait(3)
        end
    end)
end

function rarity()
    spawn(function()
       while rarityfarmgp == true do
        local cPos = char.HumanoidRootPart.Position
        local fPos = cPos.Z + 2

        char.Humanoid:MoveTo(Vector3.new(2.38419e-07, -0.125, 40)) --Rarity button
        wait(3.5)
        char.Humanoid:MoveTo(Vector3.new(39.5, -0.125, 39.5)) -- Sacrifice button
        wait(1.5)
        char.Humanoid:MoveTo(Vector3.new(39.5, -0.125, 2.5)) -- SP Upgrade
        wait(1.5)   
       end
   end)
end

function rarityslow()
    spawn(function()
       while rarityfarm == true do
        local cPos = char.HumanoidRootPart.Position
        local fPos = cPos.Z + 2

        char.Humanoid:MoveTo(Vector3.new(2.38419e-07, -0.125, 40)) --Rarity button
        wait(6)
        char.Humanoid:MoveTo(Vector3.new(39.5, -0.125, 39.5)) -- Sacrifice button
        wait(3)
        char.Humanoid:MoveTo(Vector3.new(39.5, -0.125, 2.5)) -- SP Upgrade
        wait(3)   
       end
   end)
end

function tpto(placeCFrame)
    local plyer = game.Players.LocalPlayer;
    if plyer.Character then
        plyer.Character.HumanoidRootPart.CFrame = placeCFrame
    end
end

function tpRarity()
    spawn(function()
        while TPrarityfarm == true do 
            tpto(game:GetService("Workspace").RarityGet.Hitbox.CFrame) -- rarity button
            wait(3)
            tpto(game:GetService("Workspace").Sacrifice.Hitbox.CFrame) -- sacrafice 
            wait(0.25)
            tpto(game:GetService("Workspace").UpgradeLuck.Hitbox.CFrame) -- luck upgrade
            wait(0.25)
            tpto(game:GetService("Workspace").UpgradeSPM.Hitbox.CFrame) -- SPM upgrade
            wait(0.25)
            tpto(game:GetService("Workspace").UpgradeRcd.Hitbox.CFrame) -- Roll cooldown
            wait(0.25)
            tpto(game:GetService("Workspace").UpgradeBr.Hitbox.CFrame) -- bulk roll
            wait(0.25)
            tpto(game:GetService("Workspace").RarityGet.Hitbox.CFrame) -- rarity button
        end
    end)
end

function TMfarm()
    spawn(function()
        while TMfarm == true do
            char.Humanoid:MoveTo(Vector3.new(2.38419e-07, -0.125, 40)) --Rarity button
            wait(3.5)
            char.Humanoid:MoveTo(Vector3.new(39.5, -0.125, 39.5)) -- Sacrifice button
            wait(1.5)
            char.Humanoid:MoveTo(Vector3.new(39.5, -0.125, 11.5)) -- BR Upgrade
            wait(1.5)
            char.Humanoid:MoveTo(Vector3.new(39.5, -0.125, 27.5)) -- Luck upgrade
            wait(1.25)

            char.Humanoid:MoveTo(Vector3.new(2.38419e-07, -0.125, 40)) --Rarity button
            wait(1.5)
            char.Humanoid:MoveTo(Vector3.new(0, 0.353201, 0)) -- spawn
            wait(2)
            char.Humanoid:MoveTo(Vector3.new(-57.7819, 5.94898, -18)) -- AP expansion bridge
            wait(1.75)
            char.Humanoid:MoveTo(Vector3.new(-81.75, 12.5, -13)) -- AP expansion platform
            wait(1)
            char.Humanoid:MoveTo(Vector3.new(-88.75, 13.125, 38)) -- TP expansion platform
            wait(1.5)
            char.Humanoid:MoveTo(Vector3.new(-144.75, 13.125, 18)) -- Transcend
            wait(2.5)

            char.Humanoid:MoveTo(Vector3.new(-88.75, 13.125, 38)) -- TP expansion platform
            wait(1.5)
            char.Humanoid:MoveTo(Vector3.new(-81.75, 12.5, -13)) -- AP expansion platform
            wait(1.25)
            char.Humanoid:MoveTo(Vector3.new(-57.7819, 5.94898, -18)) -- AP expansion bridge
            wait(2)
            char.Humanoid:MoveTo(Vector3.new(0, 0.353201, 0)) -- spawn
            wait(2)
        end
    end)
end

function Safe()
    spawn(function()
        if SafeMode == ture then 
            SafeMode = false
        elseif SafeMode == false then
            SafeMode = true
        end
    end)
end

-- everything below is for the UI

local library = loadstring(game:HttpGet(('https://garfieldscripts.xyz/ui-libs/wallys-ui.lua')))()

local w = library:CreateWindow("Infinite Rarities") -- Creates the window

local b = w:CreateFolder("Rarity Farms")

local c = w:CreateFolder("Transcend Farm") -- Creates the folder(U will put here your buttons,etc)

local d = w:CreateFolder("Quality Farm")

local e = w:CreateFolder("Other")

b:Toggle("Walk Farm Fast",function(bool)
    getgenv().rarityfarmgp = bool
    if bool then
        rarity()
    end
end)

b:Toggle("Walk Farm Slow",function(bool)
    getgenv().rarityfarm = bool
    if bool then
        rarityslow()
    end
end)

if SafeMode == false then
    b:Toggle("Teleport Farm",function(bool)
        getgenv().TPrarityfarm = bool
        if bool then
            tpRarity()
        end
    end)
elseif SafeMode == true then 
    b:Label("Safe Mode is on",{
        TextSize = 25; -- Self Explaining
        TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
        BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    })
end


c:Toggle("Transcend Walk",function(bool)
    getgenv().TMfarm = bool
    if bool then
        TMfarm()
    end
end)

d:Toggle("Quality Walk",function(bool)
    getgenv().qualityfarm = bool
    if bool then
        quality()
    end
end)

e:DestroyGui()

e:Toggle("Safe Mode (Not Working)",function(bool)
    getgenv().SafeMode = bool
    if bool then
        Safe()
    end
end)

-- Thank you for the supporting my journy 
-- SirArcher

e:Label("Credits to SirArcher",{
    TextSize = 25; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
})


-- b:Label("Pretty Useless NGL",{
--     TextSize = 25; -- Self Explaining
--     TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
--     BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
-- }) 

-- b:Button("Button",function()
--     print("Elym Winning")
-- end)

-- b:Toggle("Toggle",function(bool)
--     shared.toggle = bool
--     print(shared.toggle)
-- end)

-- b:Slider("Slider",{
--     min = 10; -- min value of the slider
--     max = 50; -- max value of the slider
--     precise = true; -- max 2 decimals
-- },function(value)
--     print(value)
-- end)

-- b:Dropdown("Dropdown",{"A","B","C"},true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
--     print(mob)
-- end)

-- b:Bind("Bind",Enum.KeyCode.C,function() --Default bind
--     print("Yes")
-- end)

-- b:ColorPicker("ColorPicker",Color3.fromRGB(255,0,0),function(color) --Default color
--     print(color)
-- end)

-- b:Box("Box","number",function(value) -- "number" or "string"
--     print(value)
-- end)