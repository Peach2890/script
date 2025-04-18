--// Load UI Library local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({ Name = "Perch-Nilin Hub | Blox Fruits", LoadingTitle = "โหลดสำหรับน้องนิลิน~", LoadingSubtitle = "by เพชร", ConfigurationSaving = { Enabled = true, FolderName = nil, FileName = "PerchNilinHub" }, Discord = { Enabled = false }, KeySystem = false })

--// Variables _G.AutoFarmLevel = false _G.AutoHaki = false _G.BringMob = false _G.FastAttack = false local RunService = game:GetService("RunService")

--// FARM TAB local FarmTab = Window:CreateTab("Farm", 4483362458) FarmTab:CreateToggle({ Name = "Auto Farm Level", CurrentValue = false, Flag = "AutoFarmLevel", Callback = function(v) _G.AutoFarmLevel = v end }) FarmTab:CreateToggle({ Name = "Auto Haki", CurrentValue = false, Flag = "AutoHaki", Callback = function(v) _G.AutoHaki = v end }) FarmTab:CreateToggle({ Name = "Bring Mob", CurrentValue = false, Flag = "BringMob", Callback = function(v) _G.BringMob = v end }) FarmTab:CreateToggle({ Name = "Fast Attack", CurrentValue = false, Flag = "FastAttack", Callback = function(v) _G.FastAttack = v end })

--// Teleport TAB local TeleportTab = Window:CreateTab("Teleport", 4483362458) TeleportTab:CreateButton({ Name = "Teleport to Cafe", Callback = function() game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-385.11, 73.05, 297.78)) end })

--// Player TAB local PlayerTab = Window:CreateTab("Player", 4483362458) PlayerTab:CreateSlider({ Name = "WalkSpeed", Range = {16, 200}, Increment = 1, CurrentValue = 16, Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end })

--// Misc TAB local MiscTab = Window:CreateTab("Misc", 4483362458) MiscTab:CreateButton({ Name = "Server Hop", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ArponAG/SERVER-HOPPER/main/ServerHop.lua"))() end })

--// Optimized Auto Execution Loop RunService.Heartbeat:Connect(function() pcall(function() if G.AutoHaki then local h = game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") if not h then game:GetService("ReplicatedStorage").Remotes.CommF:InvokeServer("Buso") end end

if _G.BringMob then
     for _,v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head") then
           if v:FindFirstChildOfClass("Folder") then
              v:PivotTo(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5))
           end
        end
     end
  end

end) end)

Rayfield:Notify({ Title = "Perch-Nilin Hub", Content = "โหลดสำเร็จแล้วค๊า~", Duration = 5, Image = 4483362458, Actions = { Ignore = { Name = "เย้!", Callback = function() end } } })
