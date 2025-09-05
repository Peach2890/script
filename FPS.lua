----------------------------------------------------
-- 🟣 Tab : Stats
----------------------------------------------------
local StatsTab = Window:CreateTab("Stats", 4483362458)

local PingLabel = StatsTab:CreateLabel("Ping: ... ms")
local FpsLabel = StatsTab:CreateLabel("FPS: ...")
local UserLabel = StatsTab:CreateLabel("Username: " .. game.Players.LocalPlayer.Name)

-- อัปเดต FPS + Ping ทุก 1 วินาที
task.spawn(function()
    local RunService = game:GetService("RunService")
    local Stats = game:GetService("Stats")

    while task.wait(1) do
        -- FPS
        local fps = math.floor(1 / RunService.RenderStepped:Wait())
        FpsLabel:Set("FPS: " .. fps)

        -- Ping
        local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValueString()
        PingLabel:Set("Ping: " .. ping)
    end
end)
