if not game:IsLoaded() then repeat task.wait() until game:IsLoaded() end

-- Anti FPS Drop
pcall(function()
    setfpscap(90)
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    game:GetService("Lighting").GlobalShadows = false
end)

-- UI Setup
local gui = Instance.new("ScreenGui")
gui.Name = "PeachNilinUI"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 400, 0, 300)
main.Position = UDim2.new(0.5, -200, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(30,30,30)
main.Active = true
main.Draggable = true

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Peach-Nilin Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundColor3 = Color3.fromRGB(50,50,50)

local buttonsFrame = Instance.new("Frame", main)
buttonsFrame.Size = UDim2.new(1, 0, 1, -40)
buttonsFrame.Position = UDim2.new(0, 0, 0, 40)
buttonsFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)

local layout = Instance.new("UIListLayout", buttonsFrame)
layout.Padding = UDim.new(0, 6)

-- Function: Create Button
local function CreateButton(name, callback)
    local btn = Instance.new("TextButton", buttonsFrame)
    btn.Size = UDim2.new(1, -12, 0, 35)
    btn.Position = UDim2.new(0, 6, 0, 0)
    btn.Text = name
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
    btn.MouseButton1Click:Connect(callback)
end

-- Super Fast Attack V3
getgenv().FastAttack = false
function ToggleFastAttack()
    getgenv().FastAttack = not getgenv().FastAttack
    if getgenv().FastAttack then
        task.spawn(function()
            while getgenv().FastAttack do
                pcall(function()
                    local plr = game.Players.LocalPlayer
                    local cf = require(plr.PlayerScripts.CombatFramework)
                    local rig = cf.activeController
                    if rig and rig.equipped then
                        rig.timeToNextAttack = 0.1
                        rig.attacking = false
                        rig.blocking = false
                        rig.hitboxMagnitude = 100
                        rig:attack()
                    end
                end)
                task.wait(0.07)
            end
        end)
    end
end

-- Auto Farm (ตัวอย่าง)
getgenv().AutoFarm = false
function ToggleAutoFarm()
    getgenv().AutoFarm = not getgenv().AutoFarm
    if getgenv().AutoFarm then
        task.spawn(function()
            while getgenv().AutoFarm do
                pcall(function()
                    -- ใส่ฟังก์ชันฟาร์มตรงนี้
                    warn("กำลังฟาร์มเลเวล...")
                end)
                task.wait(0.5)
            end
        end)
    end
end

-- Auto Mastery (ตัวอย่าง)
getgenv().AutoMastery = false
function ToggleAutoMastery()
    getgenv().AutoMastery = not getgenv().AutoMastery
    if getgenv().AutoMastery then
        task.spawn(function()
            while getgenv().AutoMastery do
                pcall(function()
                    -- ใส่การโจมตีมอนเพื่อเก็บ Mastery
                    warn("เก็บ Mastery...")
                end)
                task.wait(0.4)
            end
        end)
    end
end

-- Add Buttons
CreateButton("Auto Farm Level", ToggleAutoFarm)
CreateButton("Auto Mastery", ToggleAutoMastery)
CreateButton("Super Fast Attack (V3)", ToggleFastAttack)

-- Notify
game.StarterGui:SetCore("SendNotification", {
    Title = "Peach-Nilin Hub",
    Text = "โหลดสำเร็จแล้วค่า~~",
    Duration = 5
})
