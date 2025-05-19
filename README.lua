
--[[
    D_F BY DAVID E FRANCISCO - SCRIPT DE HACK PARA BLOX FRUITS
    FUNCIONALIDADES:
    - Auto Farm
    - Raids / Dungeons
    - Combate
    - Movimento e Mobilidade
    - Visão e Localização
    - Utilidades
    - Economia
    - Estética / Customização
]]

-- Proteção contra kick automático
pcall(function()
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

-- Interface principal com Tabs
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = library.CreateLib("D_F HUB - Blox Fruits", "DarkTheme")

-- TABS
local tabFarm = Window:NewTab("Auto Farm")
local tabRaids = Window:NewTab("Raids / Dungeons")
local tabCombat = Window:NewTab("Combate")
local tabMove = Window:NewTab("Movimento")
local tabESP = Window:NewTab("Visão")
local tabUtil = Window:NewTab("Utilidades")
local tabEco = Window:NewTab("Economia")
local tabUI = Window:NewTab("Estética")

-- SEÇÕES
local farmSection = tabFarm:NewSection("Farm")
local raidSection = tabRaids:NewSection("Raids")
local combatSection = tabCombat:NewSection("Combate")
local moveSection = tabMove:NewSection("Movimento")
local espSection = tabESP:NewSection("ESP e Localização")
local utilSection = tabUtil:NewSection("Utilidades")
local ecoSection = tabEco:NewSection("Economia")
local uiSection = tabUI:NewSection("Customização")

-- AUTO FARM DE BOSS
_G.AutoFarmBoss = false
farmSection:NewToggle("Auto Farm Bosses", "Farme automático de chefes", function(v)
    _G.AutoFarmBoss = v
    while _G.AutoFarmBoss do
        pcall(function()
            for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    if string.find(v.Name, "Boss") or string.find(v.Name, "Boss") then
                        repeat wait()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                        until not _G.AutoFarmBoss or v.Humanoid.Health <= 0
                    end
                end
            end
        end)
        wait(1)
    end
end)

-- ANTI AFK
utilSection:NewButton("Ativar Anti-AFK", "Evita ser desconectado", function()
    pcall(function()
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end)
end)

-- FLIGHT
_G.FlyToggle = false
moveSection:NewToggle("Fly", "Permite voar", function(state)
    _G.FlyToggle = state
    if state then
        loadstring(game:HttpGet("https://pastebin.com/raw/yN3TzWnX"))()
    end
end)

-- NOCLIP
_G.Noclip = false
moveSection:NewToggle("Noclip", "Atravessar paredes", function(state)
    _G.Noclip = state
    while _G.Noclip do
        pcall(function()
            game:GetService("Players").LocalPlayer.Character.Head.CanCollide = false
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CanCollide = false
        end)
        wait(0.1)
    end
end)

-- ESP
espSection:NewButton("Ativar ESP", "Mostrar jogadores/NPCs/baús", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Exunys-ESP/main/src/ESP.lua"))()
end)

-- AUTO CLICK
_G.AutoClick = false
combatSection:NewToggle("Auto Click", "Clicar automaticamente", function(v)
    _G.AutoClick = v
    while _G.AutoClick do
        pcall(function()
            local vim = game:GetService("VirtualInputManager")
            vim:SendMouseButtonEvent(0, 0, 0, true, game, 1)
            vim:SendMouseButtonEvent(0, 0, 0, false, game, 1)
        end)
        wait(0.1)
    end
end)

-- AUTO HAKI
utilSection:NewButton("Auto Haki", "Ativa Busoshoku", function()
    game:GetService("ReplicatedStorage").Remotes.CommE:InvokeServer("Buso")
end)




-- ABA: AUTO FARM
local sectionFarm = tabFarm:NewSection("Farm Principal")

sectionFarm:NewToggle("Auto Farm de Nível (Level)", "Farm automático de inimigos para upar.", function(state)
    getgenv().AutoFarmLevel = state
    while getgenv().AutoFarmLevel do
        pcall(function()
            local args = {[1] = "StartLevelFarm"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end)
        wait(1)
    end
end)

sectionFarm:NewToggle("Auto Farm de Bosses", "Elimina chefes automaticamente.", function(state)
    getgenv().AutoBoss = state
    while getgenv().AutoBoss do
        pcall(function()
            local args = {[1] = "AutoBoss"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end)
        wait(3)
    end
end)

sectionFarm:NewToggle("Auto Farm de Missões", "Completa missões automaticamente.", function(state)
    getgenv().AutoQuest = state
    while getgenv().AutoQuest do
        pcall(function()
            local args = {[1] = "StartQuestAuto"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end)
        wait(2)
    end
end)

sectionFarm:NewToggle("Auto Farm de Maestria", "Upa armas e frutas.", function(state)
    getgenv().AutoMastery = state
    while getgenv().AutoMastery do
        pcall(function()
            local args = {[1] = "AutoMastery"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end)
        wait(1)
    end
end)

sectionFarm:NewToggle("Auto Farm de Baús", "Coleta baús automaticamente.", function(state)
    getgenv().AutoChests = state
    while getgenv().AutoChests do
        pcall(function()
            for _,v in pairs(workspace:GetDescendants()) do
                if v:IsA("TouchTransmitter") and v.Parent.Name:match("Chest") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                    wait()
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
                end
            end
        end)
        wait(5)
    end
end)

sectionFarm:NewToggle("Auto Farm de Raids", "Faz raids automaticamente.", function(state)
    getgenv().AutoRaid = state
    while getgenv().AutoRaid do
        pcall(function()
            local args = {[1] = "StartAutoRaid"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end)
        wait(10)
    end
end)

sectionFarm:NewToggle("Auto Farm de Itens", "Farm de espadas e itens especiais.", function(state)
    getgenv().AutoItem = state
    while getgenv().AutoItem do
        pcall(function()
            local args = {[1] = "AutoItemFarm"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end)
        wait(3)
    end
end)

sectionFarm:NewToggle("Farm de Ossos, Fragmentos, Candies, etc.", "Itens secundários de evento.", function(state)
    getgenv().AutoMaterials = state
    while getgenv().AutoMaterials do
        pcall(function()
            local args = {[1] = "AutoMaterialFarm"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end)
        wait(2)
    end
end)

sectionFarm:NewToggle("Auto Third Sea Progression", "Avança até o Terceiro Mar automaticamente.", function(state)
    getgenv().AutoThirdSea = state
    while getgenv().AutoThirdSea do
        pcall(function()
            local args = {[1] = "UnlockThirdSea"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end)
        wait(10)
    end
end)



-- ABA: RAIDS / DUNGEONS
local sectionRaids = tabFarm:NewSection("Raids e Dungeons")

sectionRaids:NewToggle("Auto Raid", "Inicia e completa raids automaticamente.", function(state)
    getgenv().AutoRaidStart = state
    while getgenv().AutoRaidStart do
        pcall(function()
            local args = {[1] = "StartAutoRaid"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end)
        wait(5)
    end
end)

sectionRaids:NewToggle("Auto Awaken Fruta", "Desperta habilidades da fruta automaticamente.", function(state)
    getgenv().AutoAwaken = state
    while getgenv().AutoAwaken do
        pcall(function()
            local args = {[1] = "AwakenFruit"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end)
        wait(5)
    end
end)

sectionRaids:NewToggle("Auto Kill Boss da Raid", "Elimina o boss final automaticamente.", function(state)
    getgenv().AutoKillRaidBoss = state
    while getgenv().AutoKillRaidBoss do
        pcall(function()
            local boss = workspace.Enemies:FindFirstChild("Raid Boss")
            if boss and boss:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0,10,0)
                boss.Humanoid.Health = 0
            end
        end)
        wait(1)
    end
end)

sectionRaids:NewToggle("Auto Join Raid com Fruta Selecionada", "Entra na raid da fruta equipada.", function(state)
    getgenv().AutoJoinSelectedRaid = state
    while getgenv().AutoJoinSelectedRaid do
        pcall(function()
            local fruit = game.Players.LocalPlayer.Data.DevilFruit.Value
            local args = {[1] = "Raids", [2] = "Start", [3] = fruit}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end)
        wait(10)
    end
end)

sectionRaids:NewButton("Bypass Cooldown da Raid", "Remove tempo de espera da raid.", function()
    pcall(function()
        local plr = game.Players.LocalPlayer
        plr.PlayerGui.Main.Timer.Visible = false
    end)
end)



-- ABA: COMBATE
local sectionCombat = tabCombat:NewSection("Combate Automático")

sectionCombat:NewToggle("Aimbot (Players)", "Trava a mira em jogadores próximos.", function(state)
    getgenv().AimbotPlayers = state
    while getgenv().AimbotPlayers do
        pcall(function()
            local plrs = game:GetService("Players")
            local cam = workspace.CurrentCamera
            local localPlr = plrs.LocalPlayer
            local closest = nil
            local dist = math.huge

            for _,v in pairs(plrs:GetPlayers()) do
                if v ~= localPlr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    local mag = (v.Character.HumanoidRootPart.Position - localPlr.Character.HumanoidRootPart.Position).magnitude
                    if mag < dist then
                        dist = mag
                        closest = v
                    end
                end
            end

            if closest and closest.Character and closest.Character:FindFirstChild("Head") then
                cam.CFrame = CFrame.new(cam.CFrame.Position, closest.Character.Head.Position)
            end
        end)
        wait(0.1)
    end
end)

sectionCombat:NewToggle("Auto Haki", "Ativa Haki automaticamente ao atacar.", function(state)
    getgenv().AutoHaki = state
    while getgenv().AutoHaki do
        pcall(function()
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
        end)
        wait(2)
    end
end)

sectionCombat:NewToggle("Auto Saber Boss", "Farmeia o boss do Sabre automaticamente.", function(state)
    getgenv().AutoSaberBoss = state
    while getgenv().AutoSaberBoss do
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartSaber")
        end)
        wait(5)
    end
end)

sectionCombat:NewToggle("Auto Dark Blade", "Ativa habilidades da Dark Blade automaticamente.", function(state)
    getgenv().AutoDarkBlade = state
    while getgenv().AutoDarkBlade do
        pcall(function()
            local tool = game.Players.LocalPlayer.Character:FindFirstChild("Dark Blade") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dark Blade")
            if tool then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                wait(0.5)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
            end
        end)
        wait(3)
    end
end)

sectionCombat:NewToggle("Auto Kill NPCs", "Elimina automaticamente NPCs de missão.", function(state)
    getgenv().AutoKillNPCs = state
    while getgenv().AutoKillNPCs do
        pcall(function()
            for _,v in pairs(workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                    v.Humanoid.Health = 0
                end
            end
        end)
        wait(1)
    end
end)

sectionCombat:NewToggle("Kill Aura", "Ataca automaticamente inimigos próximos.", function(state)
    getgenv().KillAura = state
    while getgenv().KillAura do
        pcall(function()
            for _,enemy in pairs(workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("HumanoidRootPart") and (enemy.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Attack", enemy)
                end
            end
        end)
        wait(0.5)
    end
end)

sectionCombat:NewToggle("God Mode", "Ativa imortalidade (limita dano recebido).", function(state)
    getgenv().GodMode = state
    if state then
        game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
        game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
    else
        game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 100
    end
end)

sectionCombat:NewButton("Auto Equipar Fruta/Arma", "Equipa a fruta ou arma atual automaticamente.", function()
    pcall(function()
        local backpack = game.Players.LocalPlayer.Backpack
        for _,v in pairs(backpack:GetChildren()) do
            if v:IsA("Tool") then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            end
        end
    end)
end)



-- ABA: MOVIMENTAÇÃO / UTILITÁRIOS
local sectionMove = tabUtil:NewSection("Movimentação")

sectionMove:NewToggle("Fly", "Permite voar (tecla F).", function(state)
    getgenv().flyToggled = state
    local UIS = game:GetService("UserInputService")
    local Plr = game.Players.LocalPlayer
    local Char = Plr.Character or Plr.CharacterAdded:Wait()
    local Hum = Char:WaitForChild("Humanoid")
    local HRP = Char:WaitForChild("HumanoidRootPart")

    local flying = false
    local vel = Instance.new("BodyVelocity")
    vel.Velocity = Vector3.zero
    vel.MaxForce = Vector3.new(100000, 100000, 100000)
    vel.P = 1250
    vel.Name = "FlyVelocity"

    local function fly()
        vel.Parent = HRP
        flying = true
        while flying and getgenv().flyToggled do
            vel.Velocity = HRP.CFrame.lookVector * 100
            wait()
        end
        vel:Destroy()
    end

    if state then
        fly()
    end
end)

sectionMove:NewToggle("Noclip", "Ativa o noclip (atravessa objetos).", function(state)
    getgenv().noclip = state
    local RunService = game:GetService("RunService")
    RunService.Stepped:Connect(function()
        if getgenv().noclip then
            for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide == true then
                    v.CanCollide = false
                end
            end
        end
    end)
end)

sectionMove:NewToggle("Dash Infinito", "Remove cooldown do dash.", function(state)
    getgenv().InfiniteDash = state
    while getgenv().InfiniteDash do
        pcall(function()
            local plr = game.Players.LocalPlayer
            plr.Character.EvadeCooldown.Value = 0
        end)
        wait(0.1)
    end
end)

sectionMove:NewToggle("Super Pulo", "Aumenta força do pulo.", function(state)
    getgenv().SuperJump = state
    if state then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
    else
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)

sectionMove:NewSlider("Velocidade", "Controla a velocidade do player.", 500, 16, function(val)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
end)

sectionMove:NewButton("Invisibilidade", "Deixa o personagem invisível.", function()
    pcall(function()
        local savedPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(9999, 9999, 9999))
        wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Transparency = 1
        game.Players.LocalPlayer.Character:MoveTo(savedPos.Position)
    end)
end)

local sectionUtil = tabUtil:NewSection("Utilitários")

sectionUtil:NewToggle("Anti-AFK", "Evita ser desconectado por inatividade.", function(state)
    getgenv().AntiAFK = state
    if state then
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end
end)

sectionUtil:NewToggle("Auto Rejoin", "Reconecta automaticamente ao ser desconectado.", function(state)
    getgenv().AutoRejoin = state
    while getgenv().AutoRejoin do
        pcall(function()
            if not game:IsLoaded() then
                game:GetService("TeleportService"):Teleport(game.PlaceId)
            end
        end)
        wait(5)
    end
end)



-- ABA: VISUAL / MUNDO
local sectionVisual = tabWorld:NewSection("Visual")

sectionVisual:NewToggle("ESP Players", "Mostra caixas nos jogadores.", function(state)
    getgenv().espPlayers = state
    while getgenv().espPlayers do
        pcall(function()
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and v.Character and not v.Character:FindFirstChild("ESPBox") then
                    local box = Instance.new("BoxHandleAdornment", v.Character)
                    box.Name = "ESPBox"
                    box.Adornee = v.Character:FindFirstChild("HumanoidRootPart")
                    box.Size = Vector3.new(3, 5, 1)
                    box.Color3 = Color3.new(1, 0, 0)
                    box.Transparency = 0.5
                    box.ZIndex = 5
                    box.AlwaysOnTop = true
                end
            end
        end)
        wait(1)
    end
    -- Remover quando desativar
    for _, v in pairs(game.Players:GetPlayers()) do
        if v.Character and v.Character:FindFirstChild("ESPBox") then
            v.Character.ESPBox:Destroy()
        end
    end
end)

sectionVisual:NewToggle("ESP NPCs", "Mostra caixas nos NPCs.", function(state)
    getgenv().espNPC = state
    while getgenv().espNPC do
        pcall(function()
            for _, npc in pairs(workspace:GetDescendants()) do
                if npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart") and not npc:FindFirstChild("ESPBox") then
                    local box = Instance.new("BoxHandleAdornment", npc)
                    box.Name = "ESPBox"
                    box.Adornee = npc:FindFirstChild("HumanoidRootPart")
                    box.Size = Vector3.new(3, 5, 1)
                    box.Color3 = Color3.new(0, 1, 0)
                    box.Transparency = 0.5
                    box.ZIndex = 5
                    box.AlwaysOnTop = true
                end
            end
        end)
        wait(1)
    end
    for _, npc in pairs(workspace:GetDescendants()) do
        if npc:FindFirstChild("ESPBox") then
            npc.ESPBox:Destroy()
        end
    end
end)

sectionVisual:NewToggle("ESP Itens", "Destaca itens no chão.", function(state)
    getgenv().espItems = state
    while getgenv().espItems do
        pcall(function()
            for _, item in pairs(workspace:GetDescendants()) do
                if item:IsA("Tool") and not item:FindFirstChild("ESPBox") then
                    local box = Instance.new("BoxHandleAdornment", item)
                    box.Name = "ESPBox"
                    box.Adornee = item:FindFirstChildWhichIsA("Part") or item
                    box.Size = Vector3.new(2, 2, 2)
                    box.Color3 = Color3.new(1, 1, 0)
                    box.Transparency = 0.5
                    box.ZIndex = 5
                    box.AlwaysOnTop = true
                end
            end
        end)
        wait(1)
    end
    for _, item in pairs(workspace:GetDescendants()) do
        if item:FindFirstChild("ESPBox") then
            item.ESPBox:Destroy()
        end
    end
end)

sectionVisual:NewSlider("FOV", "Altera o campo de visão da câmera.", 120, 70, function(val)
    workspace.CurrentCamera.FieldOfView = val
end)

local sectionWorld = tabWorld:NewSection("Mundo")

sectionWorld:NewButton("Remover Nevoeiro", "Remove neblina do mapa.", function()
    game.Lighting.FogEnd = 100000
    game.Lighting.FogStart = 100000
end)

sectionWorld:NewButton("Brilho Máximo", "Melhora iluminação do jogo.", function()
    game.Lighting.Brightness = 5
    game.Lighting.GlobalShadows = false
    game.Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
end)

sectionWorld:NewButton("Desativar Shake", "Remove tremores da câmera.", function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BlurEffect") or v:IsA("CameraShaker") then
            v:Destroy()
        end
    end
end)

sectionWorld:NewButton("Remover Lava/Partes", "Destrói objetos perigosos do mapa.", function()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name:lower():match("lava") then
            obj:Destroy()
        end
    end
end)

-- [ UTILIDADES ]
local abaUtilidades = criarAba("Utilidades")

criarBotao(abaUtilidades, "Anti-AFK", function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

criarBotao(abaUtilidades, "Anti-Ban (Proteção Básica)", function()
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(self, ...)
        local args = {...}
        if getnamecallmethod() == "FireServer" and tostring(self) == "Kick" then
            return
        end
        return old(self, unpack(args))
    end)
end)

criarBotao(abaUtilidades, "Auto Reconnect", function()
    game:GetService("CoreGui"):WaitForChild("RobloxPromptGui"):WaitForChild("PromptOverlay").ChildAdded:Connect(function(child)
        if child.Name == "ErrorPrompt" then
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
        end
    end)
end)

criarBotao(abaUtilidades, "Auto Haki (Buso e Ken)", function()
    while task.wait(1) do
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ken", true)
        end)
    end
end)

criarBotao(abaUtilidades, "Auto Store Fruit", function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and string.find(v.Name:lower(), "fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", v.Name)
        end
    end
end)

criarBotao(abaUtilidades, "Auto Drop Fruit (Dropa Frutas Específicas)", function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and string.find(v.Name:lower(), "bomb") or string.find(v.Name:lower(), "spin") then
            v.Parent = game.Workspace
        end
    end
end)

criarBotao(abaUtilidades, "Server Hop", function()
    local ts = game:GetService("TeleportService")
    local http = game:GetService("HttpService")
    local servers = game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")
    local serversDecoded = http:JSONDecode(servers)
    for i,v in pairs(serversDecoded.data) do
        if v.playing < v.maxPlayers then
            ts:TeleportToPlaceInstance(game.PlaceId, v.id)
            break
        end
    end
end)


-- Estética / Customização
local esteticaPage = window:CreateTab("Estética", 4483362458)
local temaToggle = esteticaPage:CreateToggle("Tema Escuro", nil, function(state)
    if state then
        OrionLib:SetTheme("Dark")
    else
        OrionLib:SetTheme("Light")
    end
end)
temaToggle:Set(true)

local modoTransparente = esteticaPage:CreateToggle("Modo Transparente", nil, function(state)
    if state then
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.BackgroundTransparency = 1
    else
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.BackgroundTransparency = 0
    end
end)

esteticaPage:CreateButton("Ativar UI Touch", function()
    game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
end)

esteticaPage:CreateLabel("Use os atalhos de teclado conforme seu dispositivo.")

