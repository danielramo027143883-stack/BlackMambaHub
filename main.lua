--[[
    🐍 BLACKMAMBAHUB: BOXING BETA [PRO V2 + KEY SYSTEM]
    OWNER/DEV: anonymous14383 (PRIMEBLACKMAMBA)
]]

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")

-- CONFIG
local CorrectKey = "MAMBA-777"
local DiscordLink = "https://discord.gg/xfdkm787E"

-- ==========================================
-- 1. THE PRO V2 ENGINE (ANG FEATURES)
-- ==========================================
local function LaunchPro()
    local ScreenGui = Instance.new("ScreenGui", LP.PlayerGui)
    ScreenGui.Name = "BlackMamba_Pro"
    ScreenGui.ResetOnSpawn = false

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 230, 0, 360)
    MainFrame.Position = UDim2.new(0.5, -115, 0.5, -180)
    MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    MainFrame.BorderSizePixel = 0
    MainFrame.Visible = true -- Automatic visible pagka-login
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

    local UIStroke = Instance.new("UIStroke", MainFrame)
    UIStroke.Color = Color3.fromRGB(255, 0, 0)
    UIStroke.Thickness = 2
    UIStroke.Transparency = 0.5

    local Title = Instance.new("TextLabel", MainFrame)
    Title.Size = UDim2.new(1, 0, 0, 45)
    Title.Text = "🐍 BLACKMAMBA PRO V2"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    Title.TextSize = 16
    Title.Font = Enum.Font.GothamBold
    Instance.new("UICorner", Title)

    local Container = Instance.new("ScrollingFrame", MainFrame)
    Container.Size = UDim2.new(1, 0, 1, -50)
    Container.Position = UDim2.new(0, 0, 0, 50)
    Container.BackgroundTransparency = 1
    Container.CanvasSize = UDim2.new(0, 0, 1.2, 0)
    Container.ScrollBarThickness = 0
    local List = Instance.new("UIListLayout", Container)
    List.Padding = UDim.new(0, 8)
    List.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local Toggles = {Stamina = false, Reach = false, AntiKb = false, Speed = false, ESP = false, NoShake = false}

    local function CreateToggle(name, prop)
        local btn = Instance.new("TextButton", Container)
        btn.Size = UDim2.new(0.9, 0, 0, 42)
        btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        btn.Text = name
        btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        btn.Font = Enum.Font.GothamSemibold
        btn.TextSize = 13
        Instance.new("UICorner", btn)

        btn.MouseButton1Click:Connect(function()
            Toggles[prop] = not Toggles[prop]
            btn.BackgroundColor3 = Toggles[prop] and Color3.fromRGB(60, 0, 0) or Color3.fromRGB(25, 25, 25)
            btn.TextColor3 = Toggles[prop] and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(200, 200, 200)
        end)
    end

    CreateToggle("🔥 Infinite Stamina", "Stamina")
    CreateToggle("🥊 Long Reach (Pro)", "Reach")
    CreateToggle("🛡️ Anti-Knockback", "AntiKb")
    CreateToggle("⚡ Walk Speed (22)", "Speed")
    CreateToggle("👁️ Player ESP", "ESP")
    CreateToggle("🚫 No Camera Shake", "NoShake")

    local OpenBtn = Instance.new("TextButton", ScreenGui)
    OpenBtn.Size = UDim2.new(0, 50, 0, 50)
    OpenBtn.Position = UDim2.new(0.02, 0, 0.45, 0)
    OpenBtn.Text = "🐍"
    OpenBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    OpenBtn.TextColor3 = Color3.new(1,1,1)
    OpenBtn.TextSize = 25
    OpenBtn.Draggable = true
    Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)
    Instance.new("UIStroke", OpenBtn).Color = Color3.fromRGB(255, 0, 0)

    OpenBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

    RS.Heartbeat:Connect(function()
        local Char = LP.Character
        if not Char or not Char:FindFirstChild("Humanoid") then return end
        if Toggles.Stamina then LP:SetAttribute("Stamina", 100) Char:SetAttribute("Stamina", 100) end
        if Toggles.Reach then
            for _, v in pairs(Char:GetChildren()) do
                if v.Name == "RightHand" or v.Name == "LeftHand" then
                    v.Size = Vector3.new(5.2, 5.2, 5.2)
                    v.Transparency = 0.7
                    v.CanCollide = false
                end
            end
        end
        if Toggles.AntiKb then
            local hrp = Char:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.Velocity = Vector3.new(0, hrp.Velocity.Y, 0) end
        end
        Char.Humanoid.WalkSpeed = Toggles.Speed and 22 or 16
        if Toggles.NoShake and LP.PlayerGui:FindFirstChild("Scripts") and LP.PlayerGui.Scripts:FindFirstChild("CameraShake") then
            LP.PlayerGui.Scripts.CameraShake.Enabled = false
        end
    end)

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
                        end
                    elseif hl then hl:Destroy() end
                end
            end
        end
    end)

    game.StarterGui:SetCore("SendNotification", {Title = "BLACKMAMBA PRO", Text = "Welcome, Legend!", Duration = 5})
end

-- ==========================================
-- 2. THE KEY SYSTEM (PARA SA BYPASS AT ACCESS)
-- ==========================================

-- CHECK KUNG IKAW ANG OWNER
if LP.Name == "anonymous14383" then 
    LaunchPro() 
    return 
end

-- KUNG HINDI IKAW, LALABAS ANG KEY UI
local KeyGui = Instance.new("ScreenGui", LP.PlayerGui)
local Frame = Instance.new("Frame", KeyGui)
Frame.Size = UDim2.new(0, 250, 0, 180)
Frame.Position = UDim2.new(0.5, -125, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Instance.new("UICorner", Frame)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "🐍 ENTER KEY"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
Instance.new("UICorner", Title)

local Input = Instance.new("TextBox", Frame)
Input.Size = UDim2.new(0.8, 0, 0, 35)
Input.Position = UDim2.new(0.1, 0, 0.35, 0)
Input.PlaceholderText = "Paste key here..."
Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Input.TextColor3 = Color3.new(1, 1, 1)

local Submit = Instance.new("TextButton", Frame)
Submit.Size = UDim2.new(0.8, 0, 0, 35)
Submit.Position = UDim2.new(0.1, 0, 0.65, 0)
Submit.Text = "SUBMIT"
Submit.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
Submit.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Submit)

local GetK = Instance.new("TextButton", Frame)
GetK.Size = UDim2.new(1, 0, 0, 20)
GetK.Position = UDim2.new(0, 0, 0.88, 0)
GetK.Text = "Get Key (Join Discord)"
GetK.BackgroundTransparency = 1
GetK.TextColor3 = Color3.fromRGB(150, 150, 150)

Submit.MouseButton1Click:Connect(function()
    if Input.Text == CorrectKey then
        KeyGui:Destroy()
        LaunchPro()
    else
        Input.Text = ""
        Input.PlaceholderText = "WRONG KEY!"
    end
end)

GetK.MouseButton1Click:Connect(function()
    setclipboard(DiscordLink)
    game.StarterGui:SetCore("SendNotification", {Title = "Mamba Hub", Text = "Discord Link Copied!"})
end)
