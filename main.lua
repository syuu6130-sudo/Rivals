local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local player = LocalPlayer
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0
TweenService:Create(blur, TweenInfo.new(0.5), {Size = 24}):Play()

local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "SaturnLoader"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundTransparency = 1

local bg = Instance.new("Frame", frame)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
bg.BackgroundTransparency = 1
bg.ZIndex = 0
TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 0.3}):Play()

local word = "SaturnHub"
local letters = {}

for i = 1, #word do
	local char = word:sub(i, i)

	local label = Instance.new("TextLabel")
	label.Text = char
	label.Font = Enum.Font.GothamBlack
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextStrokeTransparency = 1 
	label.TextTransparency = 1
	label.TextScaled = false
	label.TextSize = 10
	label.Size = UDim2.new(0, 60, 0, 60)
	label.AnchorPoint = Vector2.new(0.5, 0.5)
	label.Position = UDim2.new(0.5, (i - (#word / 2 + 0.5)) * 65, 0.5, 0)
	label.BackgroundTransparency = 1
	label.Parent = frame

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(141, 48, 255)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(93, 60, 160))
	})
	gradient.Rotation = 90
	gradient.Parent = label

	local tweenIn = TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 0, TextSize = 60})
	tweenIn:Play()

	table.insert(letters, label)
	wait(0.25)
end

for _, label in ipairs(letters) do
	TweenService:Create(label, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Position = label.Position + UDim2.new(0,0,-0.2) 
	}):Play()
end
local creditLabel = Instance.new("TextLabel", frame)
creditLabel.Text = "discord.gg/dcus\nSaturnHub - Rivals"
creditLabel.Font = Enum.Font.Gotham
creditLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
creditLabel.TextSize = 30
creditLabel.TextTransparency = 1 
creditLabel.BackgroundTransparency = 1
creditLabel.AnchorPoint = Vector2.new(0.5, 1) 
creditLabel.Position = UDim2.new(0.5, 0, 1, -20)  
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(141, 48, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(93, 60, 160))
})
gradient.Rotation = 90
gradient.Parent = creditLabel

TweenService:Create(creditLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
local imageLabel = Instance.new("ImageLabel", frame)
imageLabel.Size = UDim2.new(0, 150, 0, 150)
imageLabel.Position = UDim2.new(0.5, 0, 0.5, 80) 
imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://114053606899516"
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(141, 48, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(93, 60, 160))
})
gradient.Rotation = 90
gradient.Parent = imageLabel

local tweenImage = TweenService:Create(imageLabel, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	Position = UDim2.new(0.5, 0, 0.5, 30),
	Rotation = 360
})
tweenImage:Play()

delay(2, function()
	for _, label in ipairs(letters) do
		TweenService:Create(label, TweenInfo.new(0.5), {TextTransparency = 1, TextSize = 20}):Play()
	end
	TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
	TweenService:Create(imageLabel, TweenInfo.new(0.5), {Position = imageLabel.Position + UDim2.new(0,0,0.2,0), Rotation = 720, ImageTransparency = 1}):Play()
	TweenService:Create(blur, TweenInfo.new(0.5), {Size = 0}):Play()
	TweenService:Create(creditLabel, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
	wait(0.6)
	screenGui:Destroy()
	blur:Destroy()
end)
