-- โหลด RedzLib
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

-- Window หลัก
local Window = redzlib:MakeWindow({
  Title = "Diamond Hub",
  SubTitle = "By : นายเพชรสะเก็ดขี้💩",
  SaveFolder = "DiamondHub | RedzLib V5"
})

----------------------------------------------------
-- 🟢 Tab 1 : Main
----------------------------------------------------
local MainTab = Window:MakeTab({"Main", "sword"})

MainTab:AddToggle({
  Name = "Hitbox Head",
  Default = false,
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
          head.Size = Vector3.new(2,1,1)
          head.Transparency = 0
          head.Material = Enum.Material.Plastic
          head.BrickColor = BrickColor.new("Medium stone grey")
        end
      end
    end
  end
})

MainTab:AddToggle({
  Name = "ESP",
  Default = false,
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
  end
})

MainTab:AddToggle({
  Name = "Fast Attack",
  Default = false,
  Callback = function(Value)
    if Value then
      getgenv().FastAttack = true
      task.spawn(function()
        while getgenv().FastAttack do
          pcall(function()
            local args = {
              [1] = workspace:WaitForChild("Big Hammer"):WaitForChild("SwordScript"):WaitForChild("Swing")
            }
            for i = 1,30 do
              args[1]:InvokeServer()
            end
          end)
          task.wait(0.05) -- กันแลค
        end
      end)
    else
      getgenv().FastAttack = false
    end
  end
})

----------------------------------------------------
-- 🟡 Tab 2 : Local Players
----------------------------------------------------
local PlayerTab = Window:MakeTab({"Local Players", "user"})

PlayerTab:AddSlider({
  Name = "WalkSpeed",
  Min = 16,
  Max = 350,
  Default = 16,
  Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
  end
})

PlayerTab:AddSlider({
  Name = "JumpBoost",
  Min = 50,
  Max = 3000,
  Default = 50,
  Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
  end
})

PlayerTab:AddToggle({
  Name = "No-Clip",
  Default = false,
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
  end
})

PlayerTab:AddToggle({
  Name = "Fly",
  Default = false,
  Callback = function(Value)
    local plr = game.Players.LocalPlayer
    local HRP = plr.Character:WaitForChild("HumanoidRootPart")

    if Value then
      getgenv().Flying = true
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

          bv.Velocity = moveDir * 70
          bg.CFrame = camCF
        end
      end)

    else
      getgenv().Flying = false
      if flyConn then flyConn:Disconnect() end
      if HRP:FindFirstChildOfClass("BodyGyro") then HRP:FindFirstChildOfClass("BodyGyro"):Destroy() end
      if HRP:FindFirstChildOfClass("BodyVelocity") then HRP:FindFirstChildOfClass("BodyVelocity"):Destroy() end
    end
  end
})

PlayerTab:AddButton({
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
  end
})

PlayerTab:AddButton({
  Name = "Unlock FPS (240)",
  Callback = function()
    setfpscap(240)
  end
})

----------------------------------------------------
-- 🔵 Tab 3 : Create By
----------------------------------------------------
local CreditTab = Window:MakeTab({"Create By", "info"})

CreditTab:AddButton({
  Name = "Create By คนพิการประจำกลุ่ม",
  Callback = function()
    print("Credit : คนพิการประจำกลุ่ม")
  end
})

CreditTab:AddButton({
  Name = "UI By : RedzLib V5",
  Callback = function()
    print("UI By RedzLib")
  end
})

----------------------------------------------------
-- 🟣 Tab 4 : Scripts & Settings
----------------------------------------------------
local ScriptTab = Window:MakeTab({"Scripts & Settings", "code"})

-- Infinity Yield
ScriptTab:AddButton({
  Name = "Infinity Yield",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
  end
})

-- Dex
ScriptTab:AddButton({
  Name = "Dex Explorer",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
  end
})

-- Remote Spy
ScriptTab:AddButton({
  Name = "Remote Spy",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
  end
})

-- Console Viewer
ScriptTab:AddButton({
  Name = "Console Viewer",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source/console"))()
  end
})

-- Theme Switcher
ScriptTab:AddButton({"Dark Theme", function()
  redzlib:SetTheme("Dark")
end})
ScriptTab:AddButton({"Darker Theme", function()
  redzlib:SetTheme("Darker")
end})
ScriptTab:AddButton({"Purple Theme", function()
  redzlib:SetTheme("Purple")
end})
ScriptTab:AddButton({"Default Theme", function()
  redzlib:SetTheme("Default")
end})
