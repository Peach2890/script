-- PeachNilin Hub v1.0
-- By Peach x Nilin | รองรับมือถือ & คอม
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- UI โหลด
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Peach-Nilin HUB", "Midnight")

-- ตัวแปร
local autofarm = false
local fastAttack = false

-- Page ฟาร์ม
local Tab = Window:NewTab("Auto Farm")
local Section = Tab:NewSection("Main Farm")

Section:NewToggle("Auto Farm Level", "เก็บเลเวลอัตโนมัติ", function(state)
    autofarm = state
    while autofarm do
        task.wait()
        local enemy = FindNearestMob()
        if enemy then
            BringMob(enemy)
            AttackMob(enemy)
        end
    end
end)

Section:NewToggle("Fast Attack", "ตีไวมากๆ", function(state)
    fastAttack = state
    if fastAttack then
        RunService.Stepped:Connect(function()
            pcall(function()
                local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                end
            end)
        end)
    end
end)

-- Page มาสเตอร์รี่
local Tab2 = Window:NewTab("Mastery")
local Section2 = Tab2:NewSection("Mastery Auto")

Section2:NewToggle("Auto Mastery All", "เก็บ Mastery ดาบ/ปืน/ผล", function(state)
    if state then
        autofarm = true
    else
        autofarm = false
    end
end)

-- Page อีเวนต์
local Tab3 = Window:NewTab("Events")
local Section3 = Tab3:NewSection("Auto Events")

Section3:NewButton("Auto Bones", "เก็บ Bones จากมอน", function()
    print("เก็บ Bones ทำงาน")
    -- ใส่โค้ดฟาร์ม Bones
end)

Section3:NewButton("Auto Cake", "ฟาร์มเค้ก", function()
    print("ฟาร์มเค้กทำงาน")
    -- ใส่โค้ดฟาร์มเค้ก
end)

Section3:NewButton("Auto Sea Event", "ทะเลแตก", function()
    print("Sea Event เริ่ม!")
    -- ใส่โค้ด Sea Event
end)

Section3:NewButton("Auto Raid", "ลงดันเจี้ยน", function()
    print("ลงดัน")
    -- ใส่โค้ดลง Raid
end)

-- ฟังก์ชันดึงมอนมาใกล้ตัว
function BringMob(mob)
    pcall(function()
        if mob and mob:FindFirstChild("HumanoidRootPart") then
            local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear)
            local goal = {CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(3, 0, -3)}
            local tween = TweenService:Create(mob.HumanoidRootPart, tweenInfo, goal)
            tween:Play()
        end
    end)
end

-- ฟังก์ชันหามอนใกล้สุด
function FindNearestMob()
    local closest, dist = nil, math.huge
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            local magnitude = (LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
            if magnitude < dist then
                dist = magnitude
                closest = v
            end
        end
    end
    return closest
end

-- ฟังก์ชันตีมอน
function AttackMob(mob)
    pcall(function()
        repeat
            task.wait(0.1)
            if LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                LocalPlayer.Character:FindFirstChildOfClass("Tool"):Activate()
            end
        until mob.Humanoid.Health <= 0 or not autofarm
    end)
end
