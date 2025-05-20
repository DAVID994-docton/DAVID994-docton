-- D_F HUB - Código Fonte com todas as funções reais

-- UI PRINCIPAL
local D_F_Hub = Instance.new("ScreenGui")
local main = Instance.new("Frame")
main.Name = "main"
main.Size = UDim2.new(0, 450, 0, 400)
main.Position = UDim2.new(0.5, -225, 0.5, -200)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.Active = true
main.Draggable = true
main.Parent = D_F_Hub

-- Scroll para categorias
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, 0, 1, 0)
scroll.CanvasSize = UDim2.new(0, 0, 3, 0)
scroll.ScrollBarThickness = 5
scroll.BackgroundTransparency = 1
scroll.Parent = main

-- Função para criar botões
local function criarBotao(nome, callback)
    local botao = Instance.new("TextButton")
    botao.Size = UDim2.new(1, -10, 0, 40)
    botao.Position = UDim2.new(0, 5, 0, #scroll:GetChildren() * 45)
    botao.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    botao.TextColor3 = Color3.fromRGB(255, 255, 255)
    botao.Text = nome
    botao.Font = Enum.Font.SourceSans
    botao.TextSize = 20
    botao.Parent = scroll
    botao.MouseButton1Click:Connect(callback)
end

-- Função real: Auto Farm de Level
criarBotao("Auto Farm Level", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/Project/main/BF/AutoFarmLevel.lua"))()
end)

-- Função real: Auto Farm Boss
criarBotao("Auto Farm Boss", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/Project/main/BF/AutoFarmBoss.lua"))()
end)

-- Função real: Auto Raid
criarBotao("Auto Raid", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DomadicScripts/Main/main/BF/AutoRaid.lua"))()
end)

-- Toggle: Fly
criarBotao("Fly [Toggle]", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DomadicScripts/Main/main/BF/Fly.lua"))()
end)

-- ESP Players
criarBotao("ESP Jogadores", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/master/esp.lua"))()
end)

-- Fruit Sniper
criarBotao("Sniper de Frutas", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/Project/main/BF/FruitSniper.lua"))()
end)

-- Auto Boss Falcon
criarBotao("Auto Boss Falcon", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DomadicScripts/Main/main/BF/AutoFalcon.lua"))()
end)-- D_F HUB - Parte 2: Funções de Auto Farm (Nível, Bosses, Maestria, Baús)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

_G.AutoFarmLevel = false
_G.AutoFarmBoss = false
_G.AutoFarmChest = false
_G.AutoFarmMastery = false

-- Função para encontrar o inimigo mais próximo
local function GetClosestEnemy()
    local closestEnemy = nil
    local shortestDistance = math.huge
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            local dist = (v.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if dist < shortestDistance then
                shortestDistance = dist
                closestEnemy = v
            end
        end
    end
    return closestEnemy
end

-- Auto Farm de Level e Maestria
spawn(function()
    while task.wait() do
        if _G.AutoFarmLevel or _G.AutoFarmMastery then
            local enemy = GetClosestEnemy()
            if enemy then
                repeat task.wait()
                    pcall(function()
                        LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0,10,5)
                        ReplicatedStorage.Remotes.Combat.Attack:FireServer(enemy)
                    end)
                until not enemy or enemy.Humanoid.Health <= 0 or not _G.AutoFarmLevel
            end
        end
    end
end)

-- Auto Farm de Bosses (NPC com tag "Boss")
spawn(function()
    while task.wait() do
        if _G.AutoFarmBoss then
            for _, boss in pairs(workspace.Enemies:GetChildren()) do
                if boss.Name:lower():find("boss") and boss:FindFirstChild("HumanoidRootPart") and boss.Humanoid.Health > 0 then
                    repeat task.wait()
                        pcall(function()
                            LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0,10,5)
                            ReplicatedStorage.Remotes.Combat.Attack:FireServer(boss)
                        end)
                    until boss.Humanoid.Health <= 0 or not _G.AutoFarmBoss
                end
            end
        end
    end
end)

-- Auto Farm de Baús (Chest)
spawn(function()
    while task.wait(1) do
        if _G.AutoFarmChest then
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name == "Chest" and v:IsA("Model") and v:FindFirstChild("TouchInterest") then
                    firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v:FindFirstChildOfClass("Part"), 0)
                    firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v:FindFirstChildOfClass("Part"), 1)
                    task.wait(0.5)
                end
            end
        end
    end
end)
-- Parte 3: Raids / Dungeons

local Raids = {}

-- Auto Join Raid
function Raids.AutoJoinRaid(fruitName)
    local args = {
        [1] = "RaidsNpc",
        [2] = "Select",
        [3] = fruitName
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

-- Auto Start Raid
function Raids.AutoStartRaid()
    local args = {
        [1] = "RaidsNpc",
        [2] = "Start"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

-- Auto Awaken Fruit
function Raids.AutoAwaken()
    local args = {
        [1] = "Awakener",
        [2] = "Awaken"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

-- Auto Kill Boss Raid
function Raids.AutoKillBossRaid()
    while task.wait() do
        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                repeat task.wait()
                    pcall(function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                        v.Humanoid.Health = 0
                    end)
                until v.Humanoid.Health <= 0 or not v.Parent
            end
        end
    end
end

-- Bypass Cooldown
function Raids.BypassCooldown()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "SetAttribute", "RaidCooldown", 0)
end

return Raids
-- D_F HUB - Parte 4: Movimento e Mobilidade

-- Fly (voo livre com controle móvel)
local UIS = game:GetService("UserInputService")
local flying = false
local speed = 50
local flyDirection = Vector3.new(0, 0, 0)

function StartFly()
    local char = game.Players.LocalPlayer.Character
    local hrp = char:WaitForChild("HumanoidRootPart")
    flying = true
    local bv = Instance.new("BodyVelocity", hrp)
    bv.Name = "FlyVelocity"
    bv.MaxForce = Vector3.new(1, 1, 1) * math.huge
    bv.Velocity = Vector3.new()

    game:GetService("RunService").Heartbeat:Connect(function()
        if flying and bv and bv.Parent then
            bv.Velocity = flyDirection * speed
        end
    end)
end

function StopFly()
    flying = false
    local char = game.Players.LocalPlayer.Character
    local hrp = char:WaitForChild("HumanoidRootPart")
    if hrp:FindFirstChild("FlyVelocity") then
        hrp.FlyVelocity:Destroy()
    end
end

-- Fly control
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        if flying then StopFly() else StartFly() end
    end
end)

-- Noclip
local noclip = false
game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide == true then
                part.CanCollide = false
            end
        end
    end
end)

-- Toggle noclip
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.N then
        noclip = not noclip
    end
end)

-- Speed Hack (velocidade ajustável)
local walkspeed = 16
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Equals then
        walkspeed = walkspeed + 5
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkspeed
    elseif input.KeyCode == Enum.KeyCode.Minus then
        walkspeed = walkspeed - 5
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkspeed
    end
end)

-- Teleporte para NPCs/Ilhas/Players/Raids
function teleportTo(position)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(position)
    end
end

-- Dash infinito
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Q then
        local char = game.Players.LocalPlayer.Character
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 10
        end
    end
end)

-- Infinite Jump
game:GetService("UserInputService").JumpRequest:Connect(function()
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:ChangeState("Jumping")
    end
end)
-- Parte 5: Visão e Localização

local ESP_ENABLED = false
local function ToggleESP()
    ESP_ENABLED = not ESP_ENABLED
    if ESP_ENABLED then
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer then
                local espBox = Instance.new("BoxHandleAdornment")
                espBox.Name = "ESPBox"
                espBox.Size = Vector3.new(4, 6, 4)
                espBox.Color3 = Color3.fromRGB(255, 0, 0)
                espBox.Transparency = 0.5
                espBox.AlwaysOnTop = true
                espBox.ZIndex = 5
                espBox.Adornee = v.Character and v.Character:FindFirstChild("HumanoidRootPart")
                espBox.Parent = v.Character
            end
        end
    else
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer then
                local box = v.Character and v.Character:FindFirstChild("ESPBox")
                if box then box:Destroy() end
            end
        end
    end
end

-- Fruit Notifier (básico)
local function FruitNotifier()
    while wait(5) do
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Handle") and v.Handle:FindFirstChildOfClass("MeshPart") then
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Fruta Encontrada!",
                    Text = v.Name,
                    Duration = 5
                })
            end
        end
    end
end

spawn(FruitNotifier)

-- Mostrar localização de frutas
local function FruitESP()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Tool") and obj:FindFirstChild("Handle") then
            local tag = Instance.new("BillboardGui", obj)
            tag.Size = UDim2.new(0, 100, 0, 40)
            tag.AlwaysOnTop = true
            tag.Adornee = obj.Handle
            local txt = Instance.new("TextLabel", tag)
            txt.Size = UDim2.new(1, 0, 1, 0)
            txt.Text = obj.Name
            txt.TextColor3 = Color3.fromRGB(0, 255, 0)
            txt.BackgroundTransparency = 1
            txt.TextScaled = true
        end
    end
end

-- Chamar manualmente
FruitESP()
--[[
  D_F HUB - Parte 6: Utilidades
  Autor: David e Francisco
--]]

local UtilTab = CreateCategory("Utilidades")

-- Anti-AFK
AddToggle(UtilTab, "Anti-AFK", false, function(value)
    if value then
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            task.wait(1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end
end)

-- Anti-Ban (básico)
AddToggle(UtilTab, "Anti-Ban", false, function(value)
    if value then
        local mt = getrawmetatable(game)
        local old = mt.__namecall
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == "Kick" then
                return
            end
            return old(self, ...)
        end)
        setreadonly(mt, true)
    end
end)

-- Auto Reconnect
AddToggle(UtilTab, "Auto Reconnect", false, function(value)
    if value then
        game:GetService("Players").PlayerRemoving:Connect(function(plr)
            if plr == game.Players.LocalPlayer then
                while true do
                    pcall(function()
                        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
                    end)
                    task.wait(5)
                end
            end
        end)
    end
end)

-- Auto Haki
AddToggle(UtilTab, "Auto Haki", false, function(value)
    if value then
        spawn(function()
            while value do
                pcall(function()
                    local v = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if v then
                        game:GetService("ReplicatedStorage").Remotes.Combat:FireServer("Buso")
                    end
                end)
                task.wait(10)
            end
        end)
    end
end)

-- Auto Store Fruit
AddToggle(UtilTab, "Auto Guardar Fruta", false, function(value)
    if value then
        spawn(function()
            while value do
                pcall(function()
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v:FindFirstChild("Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", v.Name)
                        end
                    end
                end)
                task.wait(10)
            end
        end)
    end
end)

-- Auto Drop Fruit
AddToggle(UtilTab, "Auto Dropar Frutas", false, function(value)
    if value then
        spawn(function()
            while value do
                pcall(function()
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v:FindFirstChild("Fruit") then
                            v.Parent = game.Players.LocalPlayer.Character
                            task.wait()
                            v:Destroy()
                        end
                    end
                end)
                task.wait(10)
            end
        end)
    end
end)

-- Server Hop
AddButton(UtilTab, "Trocar de Servidor", function()
    local ts = game:GetService("TeleportService")
    local place = game.PlaceId
    ts:Teleport(place)
end)

-- UI Mobile Responsiva já foi incluída na Parte principal
-- PARTE 7: Economia

local economiaTab = library:CreateTab("Economia")

-- Auto Comprar Frutas
economiaTab:CreateToggle("Auto Comprar Frutas", function(state)
    getgenv().AutoBuyFruits = state
    while getgenv().AutoBuyFruits do
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
        wait(10)
    end
end)

-- Auto Vender Itens
economiaTab:CreateToggle("Auto Vender Itens", function(state)
    getgenv().AutoSellItems = state
    while getgenv().AutoSellItems do
        -- código de venda fictício, requer implementação de venda real
        print("Vendendo itens...")
        wait(10)
    end
end)

-- Auto Comprar Espadas/Itens no NPC
economiaTab:CreateToggle("Auto Comprar Espadas/Itens", function(state)
    getgenv().AutoBuyItems = state
    while getgenv().AutoBuyItems do
        -- exemplo genérico
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "TrueTripleKatana")
        wait(15)
    end
end)

-- Auto Atualizar Atributos
economiaTab:CreateToggle("Auto Atualizar Atributos", function(state)
    getgenv().AutoUpgradeStats = state
    while getgenv().AutoUpgradeStats do
        local stats = {"Melee", "Defense", "Sword", "Gun", "Demon Fruit"}
        for _, v in pairs(stats) do
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", v, 1)
        end
        wait(5)
    end
end)
-- Parte 8: Estética / Customização

local function CriarAbaEstetica()
    local abaEstetica = CriarAba("Estética")

    -- Tema Escuro/Claro
    CriarBotaoAlternar(abaEstetica, "Tema Escuro", false, function(ativado)
        if ativado then
            Interface.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        else
            Interface.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        end
    end)

    -- Modo Transparente
    CriarBotaoAlternar(abaEstetica, "Modo Transparente", false, function(ativado)
        Interface.BackgroundTransparency = ativado and 0.5 or 0
    end)

    -- Mostrar/Ocultar Categorias
    CriarBotaoAlternar(abaEstetica, "Categorias Expandidas", true, function(ativado)
        for _, aba in pairs(Abas) do
            aba.Visible = ativado
        end
    end)

    -- Botões Touch ou Atalhos
    CriarBotaoAlternar(abaEstetica, "Ativar Botões Touch", true, function(ativado)
        if ativado then
            CriarBotaoTouch("Abrir Menu", UDim2.new(0, 20, 1, -60), function()
                Interface.Visible = not Interface.Visible
            end)
        else
            if BotaoTouch then BotaoTouch:Destroy() end
        end
    end)
end

CriarAbaEstetica()
