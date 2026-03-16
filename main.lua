-- [[ MAMBA HUB | THE ULTIMATE CINEMATIC LOADER ]] --

-- ANTI-RELOAD CHECK: Check kung loaded na para hindi mag-spam
if _G.MambaLoaded then 
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Mamba Hub",
        Text = "Script is already running!",
        Duration = 3
    })
    return -- Ititigil ang script dito
end

-- I-set ang variable na loaded na ang script
_G.MambaLoaded = true

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local IntroGui = Instance.new("ScreenGui", CoreGui)
IntroGui.Name = "MambaIntro_Ultimate"
IntroGui.IgnoreGuiInset = true

-- 1. Dark Background Overlay
local BG = Instance.new("Frame", IntroGui)
BG.Size = UDim2.new(1, 0, 1, 0)
BG.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
BG.BackgroundTransparency = 1
BG.ZIndex = 0

-- 2. Flashbang Frame
local FlashFrame = Instance.new("Frame", IntroGui)
FlashFrame.Size = UDim2.new(1, 0, 1, 0)
FlashFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlashFrame.BackgroundTransparency = 1
FlashFrame.ZIndex = 100

-- 3. Center Container
local Container = Instance.new("Frame", IntroGui)
Container.Size = UDim2.new(0, 500, 0, 500)
Container.Position = UDim2.new(0.5, 0, 0.5, 0)
Container.AnchorPoint = Vector2.new(0.5, 0.5)
Container.BackgroundTransparency = 1
Container.ZIndex = 5

-- 4. FX: Background Particles (Venom Mist)
for i = 1, 15 do
    local p = Instance.new("Frame", IntroGui)
    p.Size = UDim2.new(0, 4, 0, 4)
    p.Position = UDim2.new(math.random(), 0, math.random(), 0)
    p.BackgroundColor3 = (i % 2 == 0) and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(255, 0, 255)
    p.BackgroundTransparency = 1
    Instance.new("UICorner", p).CornerRadius = UDim.new(1, 0)
    
    task.spawn(function()
        TweenService:Create(p, TweenInfo.new(2), {BackgroundTransparency = 0.5}):Play()
        while IntroGui.Parent do
            TweenService:Create(p, TweenInfo.new(3), {Position = UDim2.new(p.Position.X.Scale, p.Position.X.Offset + math.random(-50,50), p.Position.Y.Scale, p.Position.Y.Offset + math.random(-50,50))}):Play()
            task.wait(3)
        end
    end)
end

-- 5. Main Assets (Glow, Ring, Logo)
local Glow = Instance.new("ImageLabel", Container)
Glow.Size = UDim2.new(0, 0, 0, 0); Glow.Position = UDim2.new(0.5,0,0.5,0); Glow.AnchorPoint = Vector2.new(0.5,0.5)
Glow.Image = "rbxassetid://13212745404"; Glow.ImageColor3 = Color3.fromRGB(255, 0, 255); Glow.BackgroundTransparency = 1; Glow.ImageTransparency = 0.5; Glow.ZIndex = 1

local Ring = Instance.new("ImageLabel", Container)
Ring.Size = UDim2.new(0, 0, 0, 0); Ring.Position = UDim2.new(0.5,0,0.5,0); Ring.AnchorPoint = Vector2.new(0.5,0.5)
Ring.Image = "rbxassetid://12558451121"; Ring.ImageColor3 = Color3.fromRGB(0, 255, 255); Ring.BackgroundTransparency = 1; Ring.ImageTransparency = 1; Ring.ZIndex = 2

local IntroLogo = Instance.new("ImageLabel", Container)
IntroLogo.Size = UDim2.new(0, 0, 0, 0); IntroLogo.Position = UDim2.new(0.5,0,0.5,0); IntroLogo.AnchorPoint = Vector2.new(0.5,0.5)
IntroLogo.Image = "rbxassetid://135195218768176"; IntroLogo.BackgroundTransparency = 1; IntroLogo.ImageTransparency = 1; IntroLogo.ZIndex = 3

-- [[ ANIMATION SEQUENCE ]] --
TweenService:Create(BG, TweenInfo.new(1), {BackgroundTransparency = 0.2}):Play()
TweenService:Create(IntroLogo, TweenInfo.new(1.2, Enum.EasingStyle.Back), {Size = UDim2.new(0, 280, 0, 280), ImageTransparency = 0}):Play()
TweenService:Create(Glow, TweenInfo.new(1.5), {Size = UDim2.new(1.8, 0, 1.8, 0)}):Play()
TweenService:Create(Ring, TweenInfo.new(1.5), {Size = UDim2.new(0, 420, 0, 420), ImageTransparency = 0.5}):Play()

-- Rotation Loop
task.spawn(function()
    while IntroGui.Parent do Ring.Rotation = Ring.Rotation + 2.5; task.wait() end
end)

task.wait(3)

-- 6. Glitch & Shake Build-up
for i = 1, 15 do
    Container.Position = UDim2.new(0.5, math.random(-10, 10), 0.5, math.random(-10, 10))
    Glow.ImageColor3 = (i % 2 == 0) and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(255, 0, 255)
    task.wait(0.05)
end
Container.Position = UDim2.new(0.5, 0, 0.5, 0)

-- 7. THE FLASHBANG EXIT
TweenService:Create(Ring, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(0, 1000, 0, 1000), ImageTransparency = 0}):Play()
TweenService:Create(FlashFrame, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
task.wait(0.2)

Container:Destroy()
BG:Destroy()

-- 8. Recovery
TweenService:Create(FlashFrame, TweenInfo.new(1.2), {BackgroundTransparency = 1}):Play()
task.wait(1.2)
IntroGui:Destroy()

-- 9. Load Script
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/danielramo027143883-stack/BlackMambaHub/refs/heads/main/main.lua"))()
end)

if not success then 
    _G.MambaLoaded = false -- I-reset kung nag-fail ang load
    warn("Load Error: "..err) 
end

-- NOTE: Para ma-reload mo ulit ang script kapag binura mo yung UI, 
-- siguraduhin na sa main.lua mo, kapag dine-destroy ang UI, i-set ang _G.MambaLoaded = false.
