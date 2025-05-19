
-- DF Hub - Redz Style UI Móvel -- Desenvolvido por David e Francisco

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Criar ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DF_Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- Botão móvel de mostrar/ocultar menu
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 100, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0.5, -20)
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Text = "Mostrar Menu"
ToggleButton.Parent = ScreenGui
ToggleButton.Active = true
ToggleButton.Draggable = true

-- Menu principal (móvel)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 400)
MainFrame.Position = UDim2.new(0, 120, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true

-- Título
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Text = "DF Hub - Menu"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.Parent = MainFrame

-- Scroll de conteúdo
local ContentScroll = Instance.new("ScrollingFrame")
ContentScroll.Size = UDim2.new(1, 0, 1, -40)
ContentScroll.Position = UDim2.new(0, 0, 0, 40)
ContentScroll.CanvasSize = UDim2.new(0, 0, 10, 0)
ContentScroll.ScrollBarThickness = 6
ContentScroll.BackgroundTransparency = 1
ContentScroll.Parent = MainFrame

-- UIListLayout para organizar botões
local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 6)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = ContentScroll

-- Funções por aba
local Tabs = {
    {
        Name = "Auto Farm",
        Functions = {
            "Auto Farm Nível", "Auto Farm Bosses", "Auto Farm Missões",
            "Auto Farm Maestria", "Auto Farm Baús", "Auto Farm Raids",
            "Auto Farm Itens", "Auto Farm Recursos", "Auto Third Sea"
        }
    },
    {
        Name = "Raids",
        Functions = {
            "Auto Raid", "Auto Awaken Fruta", "Auto Kill Boss Raid",
            "Auto Join Raid", "Bypass Cooldown"
        }
    },
    {
        Name = "Combate",
        Functions = {
            "Aimbot PvE", "Aimbot PvP", "Kill Aura", "Auto Click",
            "Auto Skills", "Auto Equip Melhor", "Infinite Energy"
        }
    },
    {
        Name = "Movimento",
        Functions = {
            "Fly", "Noclip", "Speed Hack", "Teleporte", "Dash Infinito", "Infinite Jump"
        }
    },
    {
        Name = "Visão",
        Functions = {
            "ESP Geral", "ESP 3D", "Localização de Frutas", "Detector de Frutas", "Sniper de Frutas"
        }
    },
    {
        Name = "Utilidades",
        Functions = {
            "Anti-AFK", "Anti-Ban", "Auto Reconnect", "Auto Haki",
            "Auto Store Fruit", "Auto Drop Fruit", "Server Hop"
        }
    },
    {
        Name = "Economia",
        Functions = {
            "Auto Comprar Frutas", "Auto Vender Itens", "Auto Comprar Espadas", "Auto Atualizar Atributos"
        }
    },
    {
        Name = "Estética",
        Functions = {
            "Tema Escuro/Claro", "Modo Transparente", "UI Touch", "Atalhos"
        }
    }
}

-- Função para criar botões
local function CreateButton(text)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -10, 0, 40)
    Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Button.TextColor3 = Color3.new(1, 1, 1)
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 16
    Button.Text = text
    Button.Parent = ContentScroll
end

-- Criar botões por função
for _, tab in ipairs(Tabs) do
    CreateButton("[" .. tab.Name .. "]")
    for _, funcName in ipairs(tab.Functions) do
        CreateButton(" - " .. funcName)
    end
end

-- Lógica para botão mostrar/ocultar
local menuVisivel = false
ToggleButton.MouseButton1Click:Connect(function()
    menuVisivel = not menuVisivel
    MainFrame.Visible = menuVisivel
    ToggleButton.Text = menuVisivel and "Ocultar Menu" or "Mostrar Menu"
end)
