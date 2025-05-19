
-- DF Hub - Redz Style UI
-- Desenvolvido por David e Francisco

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

-- Tela principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DF_Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- Container Principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- UICorner para bordas arredondadas
local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 10)

-- Título
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Text = "D_F Hub - Redz Style"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Parent = MainFrame

-- Aba de botões
local TabButtons = Instance.new("Frame")
TabButtons.Name = "TabButtons"
TabButtons.Size = UDim2.new(0, 130, 1, -30)
TabButtons.Position = UDim2.new(0, 0, 0, 30)
TabButtons.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TabButtons.BorderSizePixel = 0
TabButtons.Parent = MainFrame

local TabCorner = Instance.new("UICorner", TabButtons)
TabCorner.CornerRadius = UDim.new(0, 8)

-- Área de conteúdo
local TabContent = Instance.new("Frame")
TabContent.Name = "TabContent"
TabContent.Size = UDim2.new(1, -140, 1, -40)
TabContent.Position = UDim2.new(0, 140, 0, 35)
TabContent.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabContent.BorderSizePixel = 0
TabContent.Parent = MainFrame

local TabContentCorner = Instance.new("UICorner", TabContent)
TabContentCorner.CornerRadius = UDim.new(0, 8)

-- Lista de abas
local Tabs = {
    "Auto Farm", "Raids / Dungeons", "Combate", "Movimento", "Visão", "Utilidades", "Economia", "Estética"
}

-- Função para criar botão de aba
local function createTabButton(name)
    local Button = Instance.new("TextButton")
    Button.Name = name
    Button.Size = UDim2.new(1, -10, 0, 30)
    Button.Position = UDim2.new(0, 5, 0, #TabButtons:GetChildren() * 35)
    Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 14
    Button.Parent = TabButtons

    local Corner = Instance.new("UICorner", Button)
    Corner.CornerRadius = UDim.new(0, 6)

    Button.MouseButton1Click:Connect(function()
        for _, v in pairs(TabContent:GetChildren()) do
            if v:IsA("Frame") then
                v.Visible = false
            end
        end
        if TabContent:FindFirstChild(name) then
            TabContent[name].Visible = true
        end
    end)
end

-- Criar conteúdo para cada aba
for _, tabName in ipairs(Tabs) do
    createTabButton(tabName)
    local TabFrame = Instance.new("Frame")
    TabFrame.Name = tabName
    TabFrame.Size = UDim2.new(1, 0, 1, 0)
    TabFrame.BackgroundTransparency = 1
    TabFrame.Visible = false
    TabFrame.Parent = TabContent
end

-- Ativar primeiro tab por padrão
TabContent["Auto Farm"].Visible = true

print("Interface do DF Hub (Redz Style) carregada com abas.")
