-- Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Window Main
local Window = Rayfield:CreateWindow({
   Name = "Maru Hub",
   LoadingTitle = "Maru Hub",
   LoadingSubtitle = "3 Tabs Example",
   KeySystem = false
})

----------------------------------------------------
-- 🟢 Tab 1 : Main
----------------------------------------------------
local MainTab = Window:CreateTab("Main", 4483362458)
local MainSec = MainTab:CreateSection("Main Features")

-- Hitbox Player (Toggle)
MainTab:CreateToggle({
   Name = "Hitbox Player",
   CurrentValue = false,
   Flag = "HitboxToggle",
   Callback = function(Value)
      for _, v in pairs(game:GetService("Players"):GetPlayers()) do
         if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
            if Value then
               v.Character.Head.Size = Vector3.new(7, 7, 7)
               v.Character.Head.Transparency = 0.7
               v.Character.Head.Material = Enum.Material.Neon
               v.Character.Head.BrickColor = BrickColor.new("Bright red")
               v.Character.Head.CanCollide = false
            else
               v.Character.Head.Size = Vector3.new(2, 1, 1) -- รีเซ็ตกลับ
               v.Character.Head.Transparency = 0
               v.Character.Head.Material = Enum.Material.Plastic
               v.Character.Head.BrickColor = BrickColor.new("Medium stone grey")
            end
         end
      end
   end,
})

-- ESP Highlight (Toggle)
MainTab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "ESPToggle",
   Callback = function(Value)
      for _, v in pairs(game:GetService("Players"):GetPlayers()) do
         if v ~= game.Players.LocalPlayer and v.Character then
            if Value then
               if not v.Character:FindFirstChild("Highlight") then
                  local esp = Instance.new("Highlight")
                  esp.FillTransparency = 0.5
                  esp.OutlineTransparency = 0
                  esp.Adornee = v.Character
                  esp.Parent = v.Character
               end
            else
               if v.Character:FindFirstChild("Highlight") then
                  v.Character.Highlight:Destroy()
               end
            end
         end
      end
   end,
})

----------------------------------------------------
-- 🟡 Tab 2 : Local Players
----------------------------------------------------
local PlayerTab = Window:CreateTab("Local Players", 4483362458)
local PlayerSec = PlayerTab:CreateSection("Player Mods")

-- WalkSpeed
PlayerTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 200},
   Increment = 1,
   Suffix = " Speed",
   CurrentValue = 16,
   Flag = "WalkSpeed",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

-- JumpBoost
PlayerTab:CreateSlider({
   Name = "JumpBoost",
   Range = {50, 300},
   Increment = 10,
   Suffix = " Power",
   CurrentValue = 50,
   Flag = "JumpBoost",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

-- No-clip
PlayerTab:CreateToggle({
   Name = "No-Clip",
   CurrentValue = false,
   Flag = "NoClip",
   Callback = function(Value)
      if Value then
         noclipConn = game:GetService("RunService").Stepped:Connect(function()
            if game.Players.LocalPlayer.Character then
               for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                  if part:IsA("BasePart") then
                     part.CanCollide = false
                  end
               end
            end
         end)
      else
         if noclipConn then noclipConn:Disconnect() end
      end
   end,
})

-- Fly
PlayerTab:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Flag = "Fly",
   Callback = function(Value)
      local plr = game.Players.LocalPlayer
      if Value then
         getgenv().Flying = true
         local HRP = plr.Character:WaitForChild("HumanoidRootPart")
         local bv = Instance.new("BodyVelocity")
         bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
         bv.Velocity = Vector3.zero
         bv.Parent = HRP
         flyConn = game:GetService("RunService").Heartbeat:Connect(function()
            if getgenv().Flying then
               bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50
            end
         end)
      else
         getgenv().Flying = false
         if flyConn then flyConn:Disconnect() end
         if plr.Character:FindFirstChild("HumanoidRootPart"):FindFirstChildOfClass("BodyVelocity") then
            plr.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
         end
      end
   end,
})

-- Boost FPS
PlayerTab:CreateButton({
   Name = "Boost FPS",
   Callback = function()
      for _,v in pairs(workspace:GetDescendants()) do
         if v:IsA("BasePart") and not v:IsDescendantOf(game.Players.LocalPlayer.Character) then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
         elseif v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 1
         elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
         elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
         end
      end
      sethiddenproperty(game:GetService("Lighting"), "Technology", 2)
   end,
})

----------------------------------------------------
-- 🔵 Tab 3 : Create By
----------------------------------------------------
local CreditTab = Window:CreateTab("Create By", 4483362458)

CreditTab:CreateButton({
   Name = "Create By คนพิการประจำกลุ่ม",
   Callback = function()
      Rayfield:Notify({
         Title = "Credit",
         Content = "Create By คนพิการประจำกลุ่ม",
         Duration = 5
      })
   end,
})

CreditTab:CreateButton({
   Name = "UI By ??",
   Callback = function()
      Rayfield:Notify({
         Title = "Credit",
         Content = "UI By ???",
         Duration = 5
      })
   end,
})
