loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "REDz-Style | Perch-Nilin Hub",
    LoadingTitle = "Perch-Nilin Shop",
    LoadingSubtitle = "สร้างโดยหนูให้พี่เพชรน๊า~",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "PerchNilin",
        FileName = "PerchUI"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- TAB: Farm
local FarmTab = Window:CreateTab("Farm", 4483362458)
FarmTab:CreateDropdown({
    Name = "Farm Tool",
    Options = {"Melee", "Sword", "Gun", "Fruit"},
    CurrentOption = "Melee",
    Callback = function(value)
        print("Farm Tool set to", value)
    end
})
FarmTab:CreateToggle({
    Name = "Auto Farm Level",
    CurrentValue = false,
    Callback = function(bool)
        print("Auto Farm Level", bool)
    end
})
FarmTab:CreateToggle({
    Name = "Auto Farm Mastery",
    CurrentValue = false,
    Callback = function(bool)
        print("Auto Mastery", bool)
    end
})
FarmTab:CreateToggle({
    Name = "Auto Event Sea",
    CurrentValue = false,
    Callback = function(bool)
        print("Auto Event Sea", bool)
    end
})
FarmTab:CreateToggle({
    Name = "Auto Farm Bones",
    CurrentValue = false,
    Callback = function(bool)
        print("Auto Bones", bool)
    end
})
FarmTab:CreateToggle({
    Name = "Auto Cake Prince",
    CurrentValue = false,
    Callback = function(bool)
        print("Auto Cake Prince", bool)
    end
})
FarmTab:CreateToggle({
    Name = "Auto Farm Items",
    CurrentValue = false,
    Callback = function(bool)
        print("Auto Item", bool)
    end
})

-- TAB: Fruit/Raid
local RaidTab = Window:CreateTab("Fruit/Raid", 4483362458)
RaidTab:CreateToggle({
    Name = "Auto Raid Dungeon",
    CurrentValue = false,
    Callback = function(bool)
        print("Auto Raid", bool)
    end
})
RaidTab:CreateToggle({
    Name = "Auto Awaken",
    CurrentValue = false,
    Callback = function(bool)
        print("Auto Awaken", bool)
    end
})

-- TAB: Misc
local MiscTab = Window:CreateTab("Misc", 4483362458)
MiscTab:CreateToggle({
    Name = "Auto Haki",
    CurrentValue = false,
    Callback = function(bool)
        print("Auto Haki", bool)
    end
})
MiscTab:CreateToggle({
    Name = "Bring Mob",
    CurrentValue = false,
    Callback = function(bool)
        print("Bring Mob", bool)
    end
})
MiscTab:CreateToggle({
    Name = "Super Fast Gun (Auto Shoot)",
    CurrentValue = false,
    Callback = function(bool)
        print("Fast Gun", bool)
    end
})

-- เพิ่มเติมเมนูอื่น ๆ บอกหนูได้เลยนะค๊าาา~!
