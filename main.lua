--[[
    🐍 BLACKMAMBAHUB: BOXING BETA [PRO V2]
    OWNER/DEV: PRIMEBLACKMAMBA
    
    🔥 PRO FEATURES:
    - No Hit Delay (Optimized Combat)
    - Smooth Hitbox Expander
    - Anti-Velocity (Anti-Knockback)
    - Performance Mode (Less Lag)
]]

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

-- 1. PREMIUM UI DESIGN
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BlackMamba_Pro"
ScreenGui.Parent = LP:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 230, 0, 360)
MainFrame.Position = UDim2.new(0.5, -115, 0.5, -180) -- Center Screen
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 10)

-- Glowing Border Effect
local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(255, 0, 0)
UIStroke.Thickness = 2
UIStroke.Transparency = 0.5

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Text = "🐍 BLACKMAMBA PRO V2"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold
local TitleCorner = Instance.new("UICorner", Title)

local Container = Instance.new("ScrollingFrame")
Container.Parent = MainFrame
Container.Size = UDim2.new(1, 0, 1, -50)
Container.Position = UDim2.new(0, 0, 0, 50)
Container.BackgroundTransparency = 1
Container.CanvasSize = UDim2.new(0, 0, 1.2, 0)
Container.ScrollBarThickness = 0

local List = Instance.new("UIListLayout", Container)
List.Padding = UDim.new(0, 8)
List.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Toggle System
local Toggles = {Stamina = false, Reach = false, AntiKb = false, Speed = false, ESP = false, NoShake = false}

local function CreateToggle(name, prop)
    local btn = Instance.new("TextButton")
    btn.Parent = Container
    btn.Size = UDim2.new(0.9, 0, 0, 42)
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 13
    local btnC = Instance.new("UICorner", btn)

    btn.MouseButton1Click:Connect(function()
        Toggles[prop] = not Toggles[prop]
        if Toggles[prop] then
            btn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
            btn.TextColor3 = Color3.fromRGB(255, 0, 0)
            UIStroke.Color = Color3.fromRGB(255, 0, 0)
        else
            btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
    end)
end

-- LOADING PRO FEATURES
CreateToggle("🔥 Infinite Stamina", "Stamina")
CreateToggle("🥊 Long Reach (Pro)", "Reach")
CreateToggle("🛡️ Anti-Knockback", "AntiKb")
CreateToggle("⚡ Walk Speed (22)", "Speed")
CreateToggle("👁️ Player ESP", "ESP")
CreateToggle("🚫 No Camera Shake", "NoShake")

-- Floating Toggle Icon
local OpenBtn = Instance.new("TextButton")
OpenBtn.Parent = ScreenGui
OpenBtn.Size = UDim2.new(0, 50, 0, 50)
OpenBtn.Position = UDim2.new(0.02, 0, 0.45, 0)
OpenBtn.Text = "🐍"
OpenBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.TextSize = 25
OpenBtn.Draggable = true
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", OpenBtn).Color = Color3.fromRGB(255, 0, 0)

OpenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- 2. PRO ENGINE LOGIC
RS.Heartbeat:Connect(function()
    local Char = LP.Character
    if not Char or not Char:FindFirstChild("Humanoid") then return end

    -- INF STAMINA
    if Toggles.Stamina then
        LP:SetAttribute("Stamina", 100)
        Char:SetAttribute("Stamina", 100)
    end

    -- PRO REACH (Safe but Long)
    if Toggles.Reach then
        for _, v in pairs(Char:GetChildren()) do
            if v.Name == "RightHand" or v.Name == "LeftHand" then
                v.Size = Vector3.new(5.2, 5.2, 5.2)
                v.Transparency = 0.7
                v.CanCollide = false
            end
        end
    end

    -- ANTI-KNOCKBACK (Stay still while punching)
    if Toggles.AntiKb then
        local hrp = Char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.Velocity = Vector3.new(0, hrp.Velocity.Y, 0)
            hrp.RotVelocity = Vector3.new(0, 0, 0)
        end
    end

    -- WALK SPEED
    Char.Humanoid.WalkSpeed = Toggles.Speed and 22 or 16
    
    -- NO CAMERA SHAKE
    if Toggles.NoShake then
        LP.PlayerGui.Scripts.CameraShake.Enabled = false -- Bypass shake script
    end
end)

-- PRO ESP SYSTEM
task.spawn(function()
    while true do
        task.wait(1)
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LP and v.Character then
                local hl = v.Character:FindFirstChild("MambaHL")
                if Toggles.ESP then
                    if not hl then
                        hl = Instance.new("Highlight", v.Character)
                        hl.Name = "MambaHL"
                        hl.FillColor = Color3.fromRGB(255, 0, 0)
                        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                    end
                elseif hl then hl:Destroy() end
            end
        end
    end
end)

-- 3. PRO ANNOUNCEMENT
game.StarterGui:SetCore("SendNotification", {
    Title = "BLACKMAMBA PRO",
    Text = "Version 2.0 Loaded. Welcome, Legend!",
    Icon = "rbxassetid://6034287525",
    Duration = 5
})
