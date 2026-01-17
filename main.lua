--[[
    🐍 BLACKMAMBAHUB: BOXING BETA [V3.3 - ACCESS CONTROL]
    OWNER: anonymous14383
]]

local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- CONFIG
local CorrectKey = "MAMBA-777" -- Ito ang password na ipo-post mo sa Discord
local DiscordLink = "https://discord.gg/xfdkm787E"

-- 1. ACCESS CHECK (PARA SA IYO)
if LP.Name == "anonymous14383" then
    -- Kung ikaw ang gumagamit, rekta agad sa script
    loadstring(game:HttpGet("https://raw.githubusercontent.com/danielramo027143883-stack/BlackMambaHub/main/main.lua"))()
    return
end

-- 2. KEY UI (PARA SA IBA)
local KeyGui = Instance.new("ScreenGui", LP.PlayerGui)
local Frame = Instance.new("Frame", KeyGui)
Frame.Size = UDim2.new(0, 250, 0, 180)
Frame.Position = UDim2.new(0.5, -125, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Instance.new("UICorner", Frame)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "🐍 ENTER KEY"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(40, 0, 0)

local Input = Instance.new("TextBox", Frame)
Input.Size = UDim2.new(0.8, 0, 0, 35)
Input.Position = UDim2.new(0.1, 0, 0.35, 0)
Input.PlaceholderText = "Paste key from Discord..."
Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Input.TextColor3 = Color3.fromRGB(255, 255, 255)

local Submit = Instance.new("TextButton", Frame)
Submit.Size = UDim2.new(0.8, 0, 0, 35)
Submit.Position = UDim2.new(0.1, 0, 0.65, 0)
Submit.Text = "SUBMIT"
Submit.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
Submit.TextColor3 = Color3.fromRGB(255, 255, 255)

local GetKey = Instance.new("TextButton", Frame)
GetKey.Size = UDim2.new(1, 0, 0, 20)
GetKey.Position = UDim2.new(0, 0, 0.88, 0)
GetKey.Text = "Get Key (Join Discord)"
GetKey.BackgroundTransparency = 1
GetKey.TextColor3 = Color3.fromRGB(150, 150, 150)

-- LOGIC
Submit.MouseButton1Click:Connect(function()
    if Input.Text == CorrectKey then
        KeyGui:Destroy()
        -- Pag tama ang key, doon pa lang lalabas ang main menu
        loadstring(game:HttpGet("https://raw.githubusercontent.com/danielramo027143883-stack/BlackMambaHub/main/main.lua"))()
    else
        Input.Text = ""
        Input.PlaceholderText = "WRONG KEY!"
    end
end)

GetKey.MouseButton1Click:Connect(function()
    setclipboard(DiscordLink)
    game.StarterGui:SetCore("SendNotification", {Title = "Mamba Hub", Text = "Discord link copied!"})
end)
