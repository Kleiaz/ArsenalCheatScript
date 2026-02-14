-- Services
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Camera = Workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Configuration du cheat
local Cheat = {
    Enabled = true,
    Aimbot = false,
    ESP = false,
    Triggerbot = false,
    MenuVisible = true,
    FOV = 150,
    MinFOV = 50,
    MaxFOV = 300,
    CurrentTab = "Main"
}

-- Couleurs modernes
local Colors = {
    Background = Color3.fromRGB(8, 8, 16),
    Surface = Color3.fromRGB(18, 18, 28),
    Surface2 = Color3.fromRGB(22, 22, 32),
    Primary = Color3.fromRGB(0, 200, 255),
    Secondary = Color3.fromRGB(255, 70, 70),
    Success = Color3.fromRGB(0, 255, 120),
    Text = Color3.fromRGB(245, 245, 255),
    TextMuted = Color3.fromRGB(130, 130, 150),
    Hover = Color3.fromRGB(35, 35, 45),
    TabInactive = Color3.fromRGB(25, 25, 35)
}

-- Création de l'interface
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AetherCheat"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 100

-- Frame principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 420, 0, 580)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -290)
MainFrame.BackgroundColor3 = Colors.Background
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

-- Coins arrondis
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 20)
Corner.Parent = MainFrame

-- Ombre
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageColor3 = Color3.new(0, 0, 0)
Shadow.ImageTransparency = 0.8
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.Parent = MainFrame

-- Barre de titre
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 70)
TitleBar.BackgroundColor3 = Colors.Surface
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 20)
TitleCorner.Parent = TitleBar

local TitleIcon = Instance.new("TextLabel")
TitleIcon.Name = "TitleIcon"
TitleIcon.Size = UDim2.new(0, 45, 0, 45)
TitleIcon.Position = UDim2.new(0, 20, 0.5, -22.5)
TitleIcon.BackgroundColor3 = Colors.Surface2
TitleIcon.Text = "⚡"
TitleIcon.TextColor3 = Colors.Primary
TitleIcon.TextSize = 30
TitleIcon.Font = Enum.Font.GothamBold
TitleIcon.Parent = TitleBar

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(0, 12)
IconCorner.Parent = TitleIcon

local TitleText = Instance.new("TextLabel")
TitleText.Name = "TitleText"
TitleText.Size = UDim2.new(0.5, 0, 0.4, 0)
TitleText.Position = UDim2.new(0, 75, 0.2, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "AETHER"
TitleText.TextColor3 = Colors.Text
TitleText.TextSize = 28
TitleText.Font = Enum.Font.GothamBold
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TitleBar

local TitleSub = Instance.new("TextLabel")
TitleSub.Name = "TitleSub"
TitleSub.Size = UDim2.new(0.5, 0, 0.3, 0)
TitleSub.Position = UDim2.new(0, 75, 0.5, 0)
TitleSub.BackgroundTransparency = 1
TitleSub.Text = "cheat system"
TitleSub.TextColor3 = Colors.TextMuted
TitleSub.TextSize = 14
TitleSub.Font = Enum.Font.Gotham
TitleSub.TextXAlignment = Enum.TextXAlignment.Left
TitleSub.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -50, 0.5, -20)
CloseButton.BackgroundColor3 = Colors.Surface2
CloseButton.Text = "✕"
CloseButton.TextColor3 = Colors.Secondary
CloseButton.TextSize = 20
CloseButton.Font = Enum.Font.GothamBold
CloseButton.BorderSizePixel = 0
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 12)
CloseCorner.Parent = CloseButton

-- Animation close button
CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Colors.Secondary, TextColor3 = Colors.Text}):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Colors.Surface2, TextColor3 = Colors.Secondary}):Play()
end)

-- Barre d'onglets
local TabBar = Instance.new("Frame")
TabBar.Name = "TabBar"
TabBar.Size = UDim2.new(1, -40, 0, 50)
TabBar.Position = UDim2.new(0, 20, 0, 80)
TabBar.BackgroundColor3 = Colors.Surface2
TabBar.BorderSizePixel = 0
TabBar.Parent = MainFrame

local TabBarCorner = Instance.new("UICorner")
TabBarCorner.CornerRadius = UDim.new(0, 15)
TabBarCorner.Parent = TabBar

-- Onglet Main
local MainTab = Instance.new("TextButton")
MainTab.Name = "MainTab"
MainTab.Size = UDim2.new(0.5, -5, 0, 40)
MainTab.Position = UDim2.new(0, 5, 0.5, -20)
MainTab.BackgroundColor3 = Colors.Primary
MainTab.Text = "MAIN"
MainTab.TextColor3 = Colors.Text
MainTab.TextSize = 18
MainTab.Font = Enum.Font.GothamBold
MainTab.BorderSizePixel = 0
MainTab.Parent = TabBar

local MainTabCorner = Instance.new("UICorner")
MainTabCorner.CornerRadius = UDim.new(0, 12)
MainTabCorner.Parent = MainTab

-- Onglet Personnage
local CharTab = Instance.new("TextButton")
CharTab.Name = "CharTab"
CharTab.Size = UDim2.new(0.5, -5, 0, 40)
CharTab.Position = UDim2.new(0.5, 5, 0.5, -20)
CharTab.BackgroundColor3 = Colors.TabInactive
CharTab.Text = "PERSONNAGE"
CharTab.TextColor3 = Colors.TextMuted
CharTab.TextSize = 18
CharTab.Font = Enum.Font.GothamBold
CharTab.BorderSizePixel = 0
CharTab.Parent = TabBar

local CharTabCorner = Instance.new("UICorner")
CharTabCorner.CornerRadius = UDim.new(0, 12)
CharTabCorner.Parent = CharTab

-- Conteneur des onglets
local TabContainer = Instance.new("Frame")
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(1, -40, 1, -160)
TabContainer.Position = UDim2.new(0, 20, 0, 140)
TabContainer.BackgroundColor3 = Colors.Surface
TabContainer.BorderSizePixel = 0
TabContainer.Parent = MainFrame

local TabContainerCorner = Instance.new("UICorner")
TabContainerCorner.CornerRadius = UDim.new(0, 15)
TabContainerCorner.Parent = TabContainer

-- Contenu de l'onglet MAIN
local MainContent = Instance.new("ScrollingFrame")
MainContent.Name = "MainContent"
MainContent.Size = UDim2.new(1, -20, 1, -20)
MainContent.Position = UDim2.new(0, 10, 0, 10)
MainContent.BackgroundTransparency = 1
MainContent.BorderSizePixel = 0
MainContent.ScrollBarThickness = 4
MainContent.ScrollBarImageColor3 = Colors.Primary
MainContent.CanvasSize = UDim2.new(0, 0, 0, 400)
MainContent.Visible = true
MainContent.Parent = TabContainer

local MainList = Instance.new("UIListLayout")
MainList.Padding = UDim.new(0, 8)
MainList.HorizontalAlignment = Enum.HorizontalAlignment.Center
MainList.SortOrder = Enum.SortOrder.LayoutOrder
MainList.Parent = MainContent

-- Contenu de l'onglet PERSONNAGE (SOON)
local CharContent = Instance.new("Frame")
CharContent.Name = "CharContent"
CharContent.Size = UDim2.new(1, -20, 1, -20)
CharContent.Position = UDim2.new(0, 10, 0, 10)
CharContent.BackgroundTransparency = 1
CharContent.Visible = false
CharContent.Parent = TabContainer

local SoonText = Instance.new("TextLabel")
SoonText.Name = "SoonText"
SoonText.Size = UDim2.new(1, 0, 1, 0)
SoonText.BackgroundTransparency = 1
SoonText.Text = "🚧 SOON... 🚧"
SoonText.TextColor3 = Colors.TextMuted
SoonText.TextSize = 32
SoonText.Font = Enum.Font.GothamBold
SoonText.Parent = CharContent

-- Fonction pour créer un checkbox moderne
local function CreateModernCheckbox(parent, title, description, default, icon, layoutOrder)
    local CheckboxContainer = Instance.new("Frame")
    CheckboxContainer.Name = title .. "Container"
    CheckboxContainer.Size = UDim2.new(1, -10, 0, 75)
    CheckboxContainer.BackgroundColor3 = Colors.Surface2
    CheckboxContainer.BorderSizePixel = 0
    CheckboxContainer.LayoutOrder = layoutOrder
    CheckboxContainer.Parent = parent
    
    local ContainerCorner = Instance.new("UICorner")
    ContainerCorner.CornerRadius = UDim.new(0, 12)
    ContainerCorner.Parent = CheckboxContainer
    
    local IconBg = Instance.new("Frame")
    IconBg.Name = "IconBg"
    IconBg.Size = UDim2.new(0, 45, 0, 45)
    IconBg.Position = UDim2.new(0, 15, 0.5, -22.5)
    IconBg.BackgroundColor3 = Colors.Surface
    IconBg.BorderSizePixel = 0
    IconBg.Parent = CheckboxContainer
    
    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 10)
    IconCorner.Parent = IconBg
    
    local IconLabel = Instance.new("TextLabel")
    IconLabel.Name = "IconLabel"
    IconLabel.Size = UDim2.new(1, 0, 1, 0)
    IconLabel.BackgroundTransparency = 1
    IconLabel.Text = icon
    IconLabel.TextColor3 = Colors.Primary
    IconLabel.TextSize = 22
    IconLabel.Font = Enum.Font.GothamBold
    IconLabel.Parent = IconBg
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Size = UDim2.new(0.5, 0, 0.35, 0)
    TitleLabel.Position = UDim2.new(0, 70, 0, 15)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Colors.Text
    TitleLabel.TextSize = 18
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = CheckboxContainer
    
    local DescLabel = Instance.new("TextLabel")
    DescLabel.Name = "DescLabel"
    DescLabel.Size = UDim2.new(0.5, 0, 0.35, 0)
    DescLabel.Position = UDim2.new(0, 70, 0, 40)
    DescLabel.BackgroundTransparency = 1
    DescLabel.Text = description
    DescLabel.TextColor3 = Colors.TextMuted
    DescLabel.TextSize = 12
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.Parent = CheckboxContainer
    
    -- Checkbox
    local CheckboxFrame = Instance.new("Frame")
    CheckboxFrame.Name = "CheckboxFrame"
    CheckboxFrame.Size = UDim2.new(0, 25, 0, 25)
    CheckboxFrame.Position = UDim2.new(1, -45, 0.5, -12.5)
    CheckboxFrame.BackgroundColor3 = default and Colors.Primary or Colors.Surface
    CheckboxFrame.BorderSizePixel = 0
    CheckboxFrame.Parent = CheckboxContainer
    
    local CheckboxCorner = Instance.new("UICorner")
    CheckboxCorner.CornerRadius = UDim.new(0, 6)
    CheckboxCorner.Parent = CheckboxFrame
    
    local Checkmark = Instance.new("TextLabel")
    Checkmark.Name = "Checkmark"
    Checkmark.Size = UDim2.new(1, 0, 1, 0)
    Checkmark.BackgroundTransparency = 1
    Checkmark.Text = default and "✓" or ""
    Checkmark.TextColor3 = Colors.Text
    Checkmark.TextSize = 18
    Checkmark.Font = Enum.Font.GothamBold
    Checkmark.Visible = default
    Checkmark.Parent = CheckboxFrame
    
    local CheckboxButton = Instance.new("TextButton")
    CheckboxButton.Name = "CheckboxButton"
    CheckboxButton.Size = UDim2.new(1, 0, 1, 0)
    CheckboxButton.BackgroundTransparency = 1
    CheckboxButton.Text = ""
    CheckboxButton.Parent = CheckboxFrame
    
    return {
        Button = CheckboxButton,
        Frame = CheckboxFrame,
        Checkmark = Checkmark,
        Value = default
    }
end

-- Création des checkboxes dans l'onglet MAIN
local checkboxes = {
    Aimbot = CreateModernCheckbox(MainContent, "Aimbot", "Lock onto enemies with right click", false, "🎯", 1),
    ESP = CreateModernCheckbox(MainContent, "ESP Box", "Show enemy boxes through walls", false, "👁️", 2),
    Triggerbot = CreateModernCheckbox(MainContent, "Triggerbot", "Auto lock + shoot when enemy visible", false, "⚡", 3)
}

-- Variables pour l'ESP
local ESPBoxes = {}

-- Variables pour le triggerbot
local lastShotTime = 0
local SHOT_COOLDOWN = 0.15 -- 150ms entre chaque tir

-- Fonction pour vérifier si un joueur est un ennemi
local function IsEnemy(player)
    if player == LocalPlayer then return false end
    
    -- Vérifier les équipes si le jeu en a
    if LocalPlayer.Team and player.Team then
        return LocalPlayer.Team ~= player.Team
    end
    
    -- Par défaut, tous les autres joueurs sont des ennemis
    return true
end

-- Fonction pour créer une boîte ESP (rectangle avec seulement les contours)
local function CreateESPBox(player)
    if not IsEnemy(player) then return nil end
    if not player.Character or not player.Character:FindFirstChild("Humanoid") then return nil end
    
    local character = player.Character
    local humanoid = character:FindFirstChild("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    
    if not humanoid or humanoid.Health <= 0 or not rootPart then return nil end
    
    -- Créer une boîte avec seulement les contours
    local box = Instance.new("BoxHandleAdornment")
    box.Name = player.Name .. "_ESP"
    box.Size = Vector3.new(4, 6, 2)
    box.Adornee = character
    box.Color3 = Color3.fromRGB(255, 0, 0)
    box.Transparency = 0.3
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Parent = character
    
    return box
end

-- Fonction pour mettre à jour toutes les boîtes ESP
local function UpdateAllESPBoxes()
    for player, box in pairs(ESPBoxes) do
        if box and box.Parent then
            box:Destroy()
        end
    end
    ESPBoxes = {}
    
    for _, player in ipairs(Players:GetPlayers()) do
        if IsEnemy(player) and player.Character then
            local box = CreateESPBox(player)
            if box then
                ESPBoxes[player] = box
            end
        end
    end
end

-- Fonction pour vérifier si un joueur est visible
local function IsPlayerVisible(player)
    if not player.Character or not player.Character:FindFirstChild("Head") then return false end
    
    local head = player.Character.Head
    local origin = Camera.CFrame.Position
    local direction = (head.Position - origin).Unit * 1000
    
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {LocalPlayer.Character, player.Character}
    
    local result = Workspace:Raycast(origin, direction, params)
    
    if result then
        local distanceToHead = (head.Position - origin).Magnitude
        local distanceToHit = (result.Position - origin).Magnitude
        return distanceToHit >= distanceToHead - 2
    end
    
    return true
end

-- Fonction pour trouver la cible ennemie la plus proche (avec FOV)
local function GetClosestEnemyInFOV()
    local closestTarget = nil
    local closestDistance = Cheat.FOV
    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
    for _, player in ipairs(Players:GetPlayers()) do
        if IsEnemy(player) and player.Character and player.Character:FindFirstChild("Head") then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local head = player.Character.Head
                local headPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                
                if onScreen then
                    local distance = (Vector2.new(headPos.X, headPos.Y) - screenCenter).Magnitude
                    
                    if distance < closestDistance then
                        closestDistance = distance
                        closestTarget = player
                    end
                end
            end
        end
    end
    
    return closestTarget
end

-- Gestion du drag
local dragging = false
local dragInput
local dragStart
local startPos

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Gestion des onglets
MainTab.MouseButton1Click:Connect(function()
    Cheat.CurrentTab = "Main"
    MainTab.BackgroundColor3 = Colors.Primary
    MainTab.TextColor3 = Colors.Text
    CharTab.BackgroundColor3 = Colors.TabInactive
    CharTab.TextColor3 = Colors.TextMuted
    MainContent.Visible = true
    CharContent.Visible = false
end)

CharTab.MouseButton1Click:Connect(function()
    Cheat.CurrentTab = "Personnage"
    CharTab.BackgroundColor3 = Colors.Primary
    CharTab.TextColor3 = Colors.Text
    MainTab.BackgroundColor3 = Colors.TabInactive
    MainTab.TextColor3 = Colors.TextMuted
    MainContent.Visible = false
    CharContent.Visible = true
end)

-- Gestion des checkboxes
checkboxes.Aimbot.Button.MouseButton1Click:Connect(function()
    Cheat.Aimbot = not Cheat.Aimbot
    checkboxes.Aimbot.Frame.BackgroundColor3 = Cheat.Aimbot and Colors.Primary or Colors.Surface
    checkboxes.Aimbot.Checkmark.Text = Cheat.Aimbot and "✓" or ""
    checkboxes.Aimbot.Checkmark.Visible = Cheat.Aimbot
    checkboxes.Aimbot.Value = Cheat.Aimbot
end)

checkboxes.ESP.Button.MouseButton1Click:Connect(function()
    Cheat.ESP = not Cheat.ESP
    checkboxes.ESP.Frame.BackgroundColor3 = Cheat.ESP and Colors.Primary or Colors.Surface
    checkboxes.ESP.Checkmark.Text = Cheat.ESP and "✓" or ""
    checkboxes.ESP.Checkmark.Visible = Cheat.ESP
    checkboxes.ESP.Value = Cheat.ESP
    
    if Cheat.ESP then
        UpdateAllESPBoxes()
    else
        for _, box in pairs(ESPBoxes) do
            if box and box.Parent then
                box:Destroy()
            end
        end
        ESPBoxes = {}
    end
end)

checkboxes.Triggerbot.Button.MouseButton1Click:Connect(function()
    Cheat.Triggerbot = not Cheat.Triggerbot
    checkboxes.Triggerbot.Frame.BackgroundColor3 = Cheat.Triggerbot and Colors.Primary or Colors.Surface
    checkboxes.Triggerbot.Checkmark.Text = Cheat.Triggerbot and "✓" or ""
    checkboxes.Triggerbot.Checkmark.Visible = Cheat.Triggerbot
    checkboxes.Triggerbot.Value = Cheat.Triggerbot
end)

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    Cheat.MenuVisible = false
end)

-- Gestion de la touche Insert
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Insert then
        MainFrame.Visible = not MainFrame.Visible
        Cheat.MenuVisible = MainFrame.Visible
    end
end)

-- Animation d'entrée
MainFrame.Size = UDim2.new(0, 0, 0, 0)
TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 420, 0, 580)}):Play()

-- Mise à jour automatique de l'ESP toutes les secondes
task.spawn(function()
    while true do
        task.wait(1)
        if Cheat.ESP then
            UpdateAllESPBoxes()
        end
    end
end)

-- ===== TRIGGERBOT CORRIGÉ =====
-- Fonctionne comme l'aimbot : seulement dans le FOV et quand la boîte est verte
RunService.RenderStepped:Connect(function()
    if not Cheat.Enabled then return end
    
    local currentTime = tick()
    
    -- Mise à jour des couleurs ESP
    if Cheat.ESP then
        for player, box in pairs(ESPBoxes) do
            if player.Character and box and box.Parent and IsEnemy(player) then
                local visible = IsPlayerVisible(player)
                box.Color3 = visible and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
            end
        end
    end
    
    -- Aimbot normal (avec FOV)
    if Cheat.Aimbot and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = GetClosestEnemyInFOV()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            local head = target.Character.Head
            Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, head.Position)
        end
    end
    
    -- TRIGGERBOT AMÉLIORÉ (comme l'aimbot mais avec tir auto)
    if Cheat.Triggerbot then
        -- Trouver l'ennemi le plus proche dans le FOV
        local target = GetClosestEnemyInFOV()
        
        if target and target.Character and target.Character:FindFirstChild("Head") then
            local head = target.Character.Head
            
            -- Vérifier si l'ennemi est visible (boîte verte)
            if IsPlayerVisible(target) then
                -- 1. VERROUILLER LA CIBLE (viser)
                Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, head.Position)
                
                -- 2. TIRER AUTOMATIQUEMENT avec cooldown
                if currentTime - lastShotTime > SHOT_COOLDOWN then
                    mouse1press()
                    task.wait(0.03)
                    mouse1release()
                    lastShotTime = currentTime
                end
            end
        end
    end
end)

-- Gestion des nouveaux joueurs
Players.PlayerAdded:Connect(function(player)
    if Cheat.ESP and IsEnemy(player) then
        player.CharacterAdded:Connect(function()
            task.wait(0.5)
        end)
    end
end)

-- Nettoyage quand un joueur quitte
Players.PlayerRemoving:Connect(function(player)
    if ESPBoxes[player] then
        ESPBoxes[player]:Destroy()
        ESPBoxes[player] = nil
    end
end)

-- Mise à jour quand un personnage apparaît
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        player.CharacterAdded:Connect(function()
            task.wait(0.5)
            if Cheat.ESP and IsEnemy(player) then
                UpdateAllESPBoxes()
            end
        end)
    end
end
