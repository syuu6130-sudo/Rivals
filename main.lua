-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Player
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 視覚効果
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting

-- 入力ブロック（ローディング中は操作を無効化）
local function blockInput(block)
    if block then
        UserInputService.MouseIconEnabled = false
        LocalPlayer.DevEnableMouseLock = false
        LocalPlayer.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
    else
        UserInputService.MouseIconEnabled = true
        LocalPlayer.DevEnableMouseLock = true
        LocalPlayer.DevComputerMovementMode = Enum.DevComputerMovementMode.KeyboardMouse
    end
end

-- 初期化
blockInput(true)
TweenService:Create(blur, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 24}):Play()

-- GUI作成
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SaturnLoader"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = PlayerGui

-- メインフレーム
local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundTransparency = 1
frame.Parent = screenGui

-- 背景
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
bg.BackgroundTransparency = 1
bg.ZIndex = 0
bg.Parent = frame

TweenService:Create(bg, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0.3
}):Play()

-- SaturnHub文字アニメーション
local word = "SaturnHub"
local letters = {}

for i = 1, #word do
    local char = word:sub(i, i)
    
    local label = Instance.new("TextLabel")
    label.Name = "Letter_" .. i
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
    
    -- グラデーション効果
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(141, 48, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(120, 54, 200)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(93, 60, 160))
    })
    gradient.Rotation = 90
    gradient.Parent = label
    
    -- 文字のフェードイン
    local tweenIn = TweenService:Create(label, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        TextTransparency = 0,
        TextSize = 60
    })
    tweenIn:Play()
    
    table.insert(letters, label)
    task.wait(0.15) -- wait()の代わりにtask.wait()を使用
end

-- 文字を上に移動
task.wait(0.3)
for _, label in ipairs(letters) do
    TweenService:Create(label, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = label.Position + UDim2.new(0, 0, -0.2, 0)
    }):Play()
end

-- Discordクレジット
local creditLabel = Instance.new("TextLabel")
creditLabel.Name = "DiscordCredit"
creditLabel.Text = "discord.gg/GG9BCrnq\nSaturnHub - Rivals"
creditLabel.Font = Enum.Font.Gotham
creditLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
creditLabel.TextSize = 28
creditLabel.TextTransparency = 1
creditLabel.BackgroundTransparency = 1
creditLabel.AnchorPoint = Vector2.new(0.5, 1)
creditLabel.Position = UDim2.new(0.5, 0, 1, -25)
creditLabel.Parent = frame

-- クレジットのグラデーション
local creditGradient = Instance.new("UIGradient")
creditGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(141, 48, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(93, 60, 160))
})
creditGradient.Rotation = 90
creditGradient.Parent = creditLabel

TweenService:Create(creditLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    TextTransparency = 0
}):Play()

-- ロゴ画像
local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "SaturnLogo"
imageLabel.Size = UDim2.new(0, 150, 0, 150)
imageLabel.Position = UDim2.new(0.5, 0, 0.5, 100)
imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://114053606899516"
imageLabel.ImageTransparency = 0
imageLabel.Parent = frame

-- ロゴのグラデーション
local logoGradient = Instance.new("UIGradient")
logoGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(141, 48, 255)),
    ColorSequenceKeypoint.new(0.7, Color3.fromRGB(120, 54, 200)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(93, 60, 160))
})
logoGradient.Rotation = 90
logoGradient.Parent = imageLabel

-- ロゴアニメーション
local tweenImage = TweenService:Create(imageLabel, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, 0, 0.5, 30),
    Rotation = 360
})
tweenImage:Play()

-- 進捗バー（追加機能）
local progressBar = Instance.new("Frame")
progressBar.Name = "ProgressBar"
progressBar.Size = UDim2.new(0, 300, 0, 4)
progressBar.Position = UDim2.new(0.5, 0, 0.75, 0)
progressBar.AnchorPoint = Vector2.new(0.5, 0.5)
progressBar.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
progressBar.BorderSizePixel = 0
progressBar.Parent = frame

local progressFill = Instance.new("Frame")
progressFill.Name = "ProgressFill"
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(141, 48, 255)
progressFill.BorderSizePixel = 0
progressFill.Parent = progressBar

local progressGradient = Instance.new("UIGradient")
progressGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(141, 48, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(93, 60, 160))
})
progressGradient.Rotation = 0
progressGradient.Parent = progressFill

-- プログレスバーのアニメーション
TweenService:Create(progressFill, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Size = UDim2.new(1, 0, 1, 0)
}):Play()

-- ローディング完了後の処理
task.delay(2, function()
    -- 文字をフェードアウト
    for _, label in ipairs(letters) do
        TweenService:Create(label, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            TextTransparency = 1,
            TextSize = 20
        }):Play()
    end
    
    -- 背景をフェードアウト
    TweenService:Create(bg, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 1
    }):Play()
    
    -- プログレスバーをフェードアウト
    TweenService:Create(progressBar, TweenInfo.new(0.3), {
        BackgroundTransparency = 1
    }):Play()
    
    TweenService:Create(progressFill, TweenInfo.new(0.3), {
        BackgroundTransparency = 1
    }):Play()
    
    -- ロゴをフェードアウト
    TweenService:Create(imageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = imageLabel.Position + UDim2.new(0, 0, 0.2, 0),
        Rotation = 720,
        ImageTransparency = 1
    }):Play()
    
    -- クレジットをフェードアウト
    TweenService:Create(creditLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 1
    }):Play()
    
    -- ブラー効果を解除
    TweenService:Create(blur, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = 0
    }):Play()
    
    -- 入力ブロックを解除
    blockInput(false)
    
    -- クリーンアップ
    task.wait(0.6)
    
    -- 安全な削除処理
    pcall(function()
        if screenGui then
            screenGui:Destroy()
        end
        if blur then
            blur:Destroy()
        end
    end)
end)

-- エラー処理
local success, errorMessage = pcall(function()
    -- メインスクリプトはここに追加
    -- 例: メインのスクリプトをここで実行
end)

if not success then
    warn("SaturnHub Loader Error: " .. tostring(errorMessage))
    
    -- エラー発生時も確実にクリーンアップ
    task.wait(1)
    pcall(function()
        if screenGui then
            screenGui:Destroy()
        end
        if blur then
            blur:Destroy()
        end
        blockInput(false)
    end)
end
