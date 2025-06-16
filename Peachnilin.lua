local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlantSeedEvent = ReplicatedStorage.GrowGardenEvents.PlantSeed
local HarvestEvent = ReplicatedStorage.GrowGardenEvents.Harvest

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local playerGui = player:WaitForChild("PlayerGui")
local screenGui = playerGui:WaitForChild("ScreenGui") -- ชื่อ ScreenGui ที่สร้างไว้
local moneyLabel = screenGui:WaitForChild("MoneyLabel")
local actionButton = screenGui:WaitForChild("ActionButton")

local targetPlot = nil

-- อัพเดตเงินบน UI
local function updateMoney()
    local money = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Money")
    if money then
        moneyLabel.Text = "เงิน: " .. money.Value
    end
end

player.leaderstats.Money.Changed:Connect(updateMoney)
updateMoney()

local function getTreeNearPlot(plot)
    for _, obj in pairs(workspace:GetChildren()) do
        if obj.Name == "Tree" and (obj.Position - plot.Position).magnitude < 5 then
            return obj
        end
    end
    return nil
end

local function updateButton()
    if not targetPlot then
        actionButton.Text = "เลือกแปลงปลูก"
        actionButton.Enabled = false
        return
    end

    local tree = getTreeNearPlot(targetPlot)
    if tree then
        if tree.Size.Y >= 6 then
            actionButton.Text = "เก็บผลผลิต"
            actionButton.Enabled = true
        else
            actionButton.Text = "รอให้โต"
            actionButton.Enabled = false
        end
    else
        actionButton.Text = "ปลูกต้นไม้"
        actionButton.Enabled = true
    end
end

mouse.Button1Down:Connect(function()
    local target = mouse.Target
    if target and target.Parent and target.Parent.Name == "Plots" then
        targetPlot = target.Parent:FindFirstChild(target.Name) or target
        updateButton()
    end
end)

actionButton.MouseButton1Click:Connect(function()
    if not targetPlot then return end
    local tree = getTreeNearPlot(targetPlot)
    if tree and tree.Size.Y >= 6 then
        HarvestEvent:FireServer(targetPlot.Name)
    else
        PlantSeedEvent:FireServer(targetPlot.Name)
    end
end)

HarvestEvent.OnClientEvent:Connect(function(plotId, success)
    if success then
        print("เก็บผลผลิตสำเร็จที่ " .. plotId)
        updateMoney()
        updateButton()
    else
        print("เก็บผลผลิตไม่สำเร็จ")
    end
end)
