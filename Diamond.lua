-- โหลด Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Window หลัก
local Window = Rayfield:CreateWindow({
   Name = "Diamond Hub",
   LoadingTitle = "Diamond Hub",
   LoadingSubtitle = "By: นายเพชรสะเก็ดขี้💩",
   KeySystem = false
})

----------------------------------------------------
-- 🟢 Tab 1 : Main
----------------------------------------------------
local MainTab = Window:CreateTab("Main", 4483362458)
local MainSec = MainTab:CreateSection("Main Features")

-- Hitbox Player (เฉพาะหัว สีใส ดาเมจเข้า)
MainTab:CreateToggle({
   Name = "Hitbox Head",
   CurrentValue = false,
   Flag = "HitboxHead",
   Callback = function(Value)
      for _, v in pairs(game:GetService("Players"):GetPlayers()) do
         if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
            local head = v.Character.Head
            if Value then
               head.Size = Vector3.new(30,30,30)
               head.Transparency = 0.5
               head.Material = Enum.Material.SmoothPlastic
               head.BrickColor = BrickColor.new("Really black")
               head.CanCollide = false
            else
               head.Size = Vector3.new(2,1,1) -- ขนาดเดิมของหัว
               head.Transparency = 0
               head.Material = Enum.Material.Plastic
               head.BrickColor = BrickColor.new("Medium stone grey")
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
   Range = {16, 350},
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
   Range = {50, 3000},
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
      local HRP = plr.Character:WaitForChild("HumanoidRootPart")

      if Value then
         getgenv().Flying = true

         -- BodyGyro = คุมการหมุน, BodyVelocity = คุมการเคลื่อนที่
         local bg = Instance.new("BodyGyro", HRP)
         bg.P = 9e4
         bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
         bg.CFrame = HRP.CFrame

         local bv = Instance.new("BodyVelocity", HRP)
         bv.Velocity = Vector3.zero
         bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)

         flyConn = game:GetService("RunService").Heartbeat:Connect(function()
            if getgenv().Flying then
               local camCF = workspace.CurrentCamera.CFrame
               local moveDir = Vector3.zero

               if game.UserInputService:IsKeyDown(Enum.KeyCode.W) then
                  moveDir = moveDir + camCF.LookVector
               end
               if game.UserInputService:IsKeyDown(Enum.KeyCode.S) then
                  moveDir = moveDir - camCF.LookVector
               end
               if game.UserInputService:IsKeyDown(Enum.KeyCode.A) then
                  moveDir = moveDir - camCF.RightVector
               end
               if game.UserInputService:IsKeyDown(Enum.KeyCode.D) then
                  moveDir = moveDir + camCF.RightVector
               end
               if game.UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                  moveDir = moveDir + Vector3.new(0,1,0)
               end
               if game.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                  moveDir = moveDir - Vector3.new(0,1,0)
               end

               bv.Velocity = moveDir * 70 -- ความเร็วปรับได้ (70 = เร็ว)
               bg.CFrame = camCF
            end
         end)

      else
         getgenv().Flying = false
         if flyConn then flyConn:Disconnect() end
         if HRP:FindFirstChildOfClass("BodyGyro") then HRP:FindFirstChildOfClass("BodyGyro"):Destroy() end
         if HRP:FindFirstChildOfClass("BodyVelocity") then HRP:FindFirstChildOfClass("BodyVelocity"):Destroy() end
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
