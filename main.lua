local P,RS,T=game:GetService("Players").LocalPlayer,game:GetService("RunService"),{Stamina=false,Reach=false,AntiKb=false,Speed=false,MaxPower=false}
local MT,O=getrawmetatable(game),nil setreadonly(MT,false)O=MT.__namecall
MT.__namecall=newcclosure(function(s,...) local m,a=getnamecallmethod(),{...}
if m=="FireServer"and s.Name=="Damage5Event"and T.MaxPower then 
a[7]=2 -- Extreme Power (Subukan ang 2 para sa mas mabilis na KO)
return O(s,unpack(a))end return O(s,...)end)setreadonly(MT,true)
local function Launch() local G=Instance.new("ScreenGui",P.PlayerGui)G.ResetOnSpawn=false
local M=Instance.new("Frame",G)M.Size,M.Position,M.BackgroundColor3=UDim2.new(0,240,0,380),UDim2.new(0.5,-120,0.5,-190),Color3.fromRGB(15,15,15)
Instance.new("UICorner",M)local S=Instance.new("UIStroke",M)S.Color,S.Thickness=Color3.fromRGB(255,0,0),2
local L=Instance.new("TextLabel",M)L.Size,L.Text,L.BackgroundTransparency=UDim2.new(1,0,0,80),"🐍\nBLACKMAMBA",1
L.TextColor3,L.TextSize,L.Font=Color3.new(1,0,0),26,Enum.Font.GothamBold L.LineHeight=0.8
local C=Instance.new("ScrollingFrame",M)C.Size,C.Position,C.BackgroundTransparency,C.CanvasSize=UDim2.new(1,0,1,-100),UDim2.new(0,0,0,95),1,UDim2.new(0,0,1.3,0)
Instance.new("UIListLayout",C).HorizontalAlignment=Enum.HorizontalAlignment.Center
local function BTN(n,p) local b=Instance.new("TextButton",C)b.Size,b.Text,b.BackgroundColor3=UDim2.new(0.9,0,0,40),n,Color3.fromRGB(25,25,25)
b.TextColor3,b.Font,b.TextSize=Color3.fromRGB(200,200,200),Enum.Font.GothamSemibold,13 Instance.new("UICorner",b)
b.MouseButton1Click:Connect(function()T[p]=not T[p]b.BackgroundColor3=T[p] and Color3.new(1,0,0) or Color3.fromRGB(25,25,25)b.TextColor3=T[p] and Color3.new(1,1,1) or Color3.fromRGB(200,200,200)end)end
BTN("Infinite Stamina","Stamina")BTN("Long Reach (Pro)","Reach")BTN("Anti-Knockback","AntiKb")BTN("Extreme Power","MaxPower")BTN("Walk Speed","Speed")
local B=Instance.new("TextButton",G)B.Size,B.Position,B.Text,B.Draggable=UDim2.new(0,50,0,50),UDim2.new(0,10,0.5,0),"🐍",true
B.BackgroundColor3,B.TextColor3,B.TextSize=Color3.fromRGB(20,20,20),Color3.new(1,1,1),25 Instance.new("UICorner",B).CornerRadius=UDim.new(1,0)
Instance.new("UIStroke",B).Color=Color3.new(1,0,0)B.MouseButton1Click:Connect(function()M.Visible=not M.Visible end)
RS.Heartbeat:Connect(function() local c=P.Character if not c or not c:FindFirstChild("Humanoid")then return end
if T.Stamina then P:SetAttribute("Stamina",100)c:SetAttribute("Stamina",100)end
if T.Reach then for _,v in pairs(c:GetChildren())do if v:IsA("BasePart")and v.Name:find("Hand")then v.Size=Vector3.new(4,4,4)v.Transparency=0.8 v.CanCollide=false end end end
if T.AntiKb then local h=c:FindFirstChild("HumanoidRootPart")if h and not h:FindFirstChildOfClass("BodyVelocity")then
local bv=Instance.new("BodyVelocity",h)bv.Velocity,bv.MaxForce=Vector3.new(0,0,0),Vector3.new(1,0,1)*9e9 task.delay(0.1,function()bv:Destroy()end)end end
c.Humanoid.WalkSpeed=T.Speed and 22 or 16 end)end Launch()
