local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Carlin Ä°nc Hub - CHEATER.FUN", "Ocean")

-- Main
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")


MainSection:NewButton("CMD-X", "ADMÄ°N", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()
end)

MainSection:NewButton("Esp", "WallHack", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/espice", true))()
end)

MainSection:NewButton("Aimbot", "Aim", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/ygp8Enye"))()
end)

MainSection:NewButton("Infinite Yield", "FE Admin Commands", function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    end)


--local Player
local Player = Window:NewTab("Player")
local PlayerSection = Player:NewSection("Player")

PlayerSection:NewSlider("WalkSpeed", "Speed", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("Jumppower", "Jump High", 350, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

PlayerSection:NewButton("Drawing Lib Player Radar", "Radar", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/topitbopit/stuff/main/PlayerRadar/source.lua'))()
end)


--Games
local Games = Window:NewTab("Games")
local GamesSection = Games:NewSection("Games")

GamesSection:NewButton("Driving Simulator", "OP Hack", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/iERa4ke4", true))()
end)

GamesSection:NewButton("Arsenal Op", "Arsenal Op", function()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/PWNERHUB.lua"), true))()
end)

GamesSection:NewButton("Shindo Life", "Shindo Life", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
end)

GamesSection:NewButton("DOORS", "DOORS", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/BlackKing/main/BlackKing"))()
end)

GamesSection:NewButton("Build A Boat For Treasure", "Build A Boat For Treasure", function()
    loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua')()
end)

GamesSection:NewButton("Jailbreak KeySystem", "Jailbreak KeySystem", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xxSirLotte/Salazar/main/SalazarHub"))()
end)

GamesSection:NewButton("Murder Mystery 2", "Murder Mystery 2", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KidichiHB/Kidachi/main/Scripts/MM2", true))()
end)

GamesSection:NewButton("Tower of Hell", "Tower of Hell", function()
    loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua')()
end)

GamesSection:NewButton("Pet Simulator X", "Pet Simulator X", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua'),true))()
end)

GamesSection:NewButton("Blox Fruits", "Blox Fruits", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/minded102/dokinbog/main/README.md", true))()
end)

GamesSection:NewButton("LUCKY BLOCKS Battlegrounds", "LUCKY BLOCKS Battlegrounds", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua"))()loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua"))()
end)

GamesSection:NewButton("Car Crushers 2", "Car Crushers 2", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/littlegui/main/BloxingBurging/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/Sex'))()
end)

GamesSection:NewButton("Tsunami Game KeySystem", "Tsunami Game KeySystem", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nadir3709/ScriptHub/main/KeySystem"))()
end)

GamesSection:NewButton("Prison Life KeySystem", "Prison Life KeySystem", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/XTheMasterX/Scripts/Main/PrisonLife'),true))()
end)

GamesSection:NewButton("Brookhaven", "Brookhaven", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kaidacoder/Scriptdetection/main/Scriptsearcher.lua"))()
end)

GamesSection:NewButton("Ninja Legends", "Ninja Legends", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua"))()
end)

GamesSection:NewButton("Legends Of Speed", "Legends Of Speed", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PlanetHubX/Legends-Of-Speed/main/source", true))()
end)

GamesSection:NewButton("Flee The Facility", "Flee The Facility", function()
    loadstring(game:HttpGet("https://lkhub.net/s/loader.lua"))()
end)

GamesSection:NewButton("PLS DONATE", "PLS DONATE", function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/f0a3yune')))()
end)

GamesSection:NewButton("Bee Swarm Simulator", "Bee Swarm Simulator", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxking776/kocmoc/main/kocmoc-remastered.lua"))()
end)

GamesSection:NewButton("KAT KeySystem", "KAT KeySystem", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/zReal-King/King-Hub-v2/main/Loader.lua'))()
end)

GamesSection:NewButton("Natural Disaster Survival", "Natural Disaster Survival", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ObviouslyOrchi/Moonlight_Client.lua/main/Moonlight_Client.",true))()
end)

GamesSection:NewButton("Da Hood", "Da Hood", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jemangeleZ/KLD/main/KLD", true))()
end)

GamesSection:NewButton("Stop it, Slender", "Stop it, Slender", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/rBApH3Nm"))()
end)

GamesSection:NewButton("Counter Blox", "Counter Blox", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/NooVster/404/main/Source'))()
end)

GamesSection:NewButton("3008", "3008", function()
    loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/scripts/main/3008.lua')()
end)

GamesSection:NewButton("Goal Kick Simulator", "Goal Kick Simulator", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Volatile-10304"))()
end)

GamesSection:NewButton("BIG Paintball", "BIG Paintball", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Harley-HUB/BIG-Paintball/main/BIG%20Paintballs", true))()
end)

GamesSection:NewButton("Wacky Wizards", "Wacky Wizards", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe2/ToraIsMe2/main/0wacky", true))()
end)

GamesSection:NewButton("carry people simulator 3", "carry people simulator 3", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/JumbleBumble/Scripts/main/CarryPeopleSimulator.lua",true))()
end)

GamesSection:NewButton("Shrek in the Backrooms KeySystem", "Shrek in the Backrooms KeySystem", function()
    loadstring(game:HttpGet("https://lkhub.net/s/loader.lua"))()
end)

GamesSection:NewButton("Mad City", "Mad City", function()
    loadstring(Game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconGUI/main/Script", true))() 
end)

GamesSection:NewButton("The Wild West", "The Wild West", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Spooksmn/Tww-Stuff/main/EternalXcracked.lua"))(); 
end)

GamesSection:NewButton("Speed Run 4 KeySystem", "Speed Run 4 KeySystem", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/romkich09/MainForRealium/main/ForRealium'),true))() 
end)

GamesSection:NewButton("Evade", "Evade", function()
    _G.Key = "FreeKey2023"
--- https://discord.gg/8gNrnWmgcb
pcall(function()
  loadstring(game:HttpGet("https://roflux.net/scripts/games/" .. tostring(game.PlaceId) .. ".lua"))()
end) 
end)

GamesSection:NewButton("Phantom Forces", "Phantom Forces", function()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/Yousuck780/phantom-forces-new/main/noob"), true))() 
end)

GamesSection:NewButton("Muscle Legends", "Muscle Legends", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AliCode14/scripts/main/ScriptHub.lua"))() 
end)

GamesSection:NewButton("Notoriety", "Notoriety", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Ev01Discord/Blunted-X/main/Notoriety'))() 
end)

GamesSection:NewButton("Survive and Kill the Killers in Area 51", "Survive and Kill the Killers in Area 51", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/a49VdC7u"))() 
end)

GamesSection:NewButton("The Rake REMASTERED", "The Rake REMASTERED", function()
    loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua')() 
end)



--Other
local Other = Window:NewTab("Other")
local OtherSection = Other:NewSection("Other")

OtherSection:NewButton("Chat Spoofer", "Chat Spoofer", function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/djBfk8Li'),true))()
end)

OtherSection:NewButton("GhostHub", "GhostHub", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
end)

OtherSection:NewButton("MoonHub", "MoonHub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/voiddscripts/moon/main/script.lua"))()
end)

OtherSection:NewButton("Bido Skins V1.2", "Bido Skins V1.2", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20SkinsV1.2"))()
end)

OtherSection:NewButton("Universal hub v2.1", "Universal hub v2.1", function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/iLhzq2tR'),true))()
end)

OtherSection:NewButton("Remote Spy", "Remote Spy", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/bCghX33W", true))()
end)

OtherSection:NewButton("Universal Bypasser Dark Dex", "Universal Bypasser Dark Dex", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
end)

OtherSection:NewButton("VHub: Key Bypassed", "VHub: Key Bypassed", function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/HZ5Y0i2f'),true))() 
end)

OtherSection:NewButton("Roblox: Holf Hub", "Roblox: Holf Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Podroka626/Scripts/main/Universal"))() 
end)

OtherSection:NewButton("Roblox [Universal hub]", "Roblox [Universal hub]", function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/snapshot.lua"))() 
end)
