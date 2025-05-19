
--[[
    D_F BY DAVID E FRANCISCO - MENU COMPLETO ESTILO REDZ (SUPORTE MOBILE)
]]--

-- Serviços
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- GUI Principal
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "D_F_Hub"
ScreenGui.ResetOnSpawn = false

-- Frame Principal
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true

-- UI Corner
local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 10)

-- Botão Mostrar/Ocultar
local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Size = UDim2.new(0, 120, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0.5, -20)
ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ToggleButton.Text = "Mostrar/Ocultar Menu"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextScaled = true
ToggleButton.ZIndex = 999

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Containers
local TabsContainer = Instance.new("Frame", MainFrame)
TabsContainer.Size = UDim2.new(0, 150, 1, 0)
TabsContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabsContainer.BorderSizePixel = 0

local PagesContainer = Instance.new("Frame", MainFrame)
PagesContainer.Position = UDim2.new(0, 150, 0, 0)
PagesContainer.Size = UDim2.new(1, -150, 1, 0)
PagesContainer.BackgroundTransparency = 1

-- Layouts
local TabsLayout = Instance.new("UIListLayout", TabsContainer)
TabsLayout.FillDirection = Enum.FillDirection.Vertical
TabsLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabsLayout.Padding = UDim.new(0, 5)

-- Exemplo de Abas e Funções
local Tabs = {
    {
        Name = "Auto Farm",
        Functions = {
            {Name = "Auto Farm Level", Callback = function() print("Auto Farm Level") end},
            {Name = "Auto Farm Bosses", Callback = function() print("Auto Farm Bosses") end},
        }
    },
    {
        Name = "Combate",
        Functions = {
            {Name = "Aimbot", Callback = function() print("Aimbot") end},
            {Name = "Kill Aura", Callback = function() print("Kill Aura") end},
        }
    }
}

-- Sistema de Abas
local selectedTab = nil

for _, tab in ipairs(Tabs) do
    local TabButton = Instance.new("TextButton")
    TabButton.Parent = TabsContainer
    TabButton.Size = UDim2.new(1, 0, 0, 40)
    TabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.Text = tab.Name
    TabButton.Font = Enum.Font.SourceSansBold
    TabButton.TextScaled = true
    TabButton.BorderSizePixel = 0

    local TabPage = Instance.new("ScrollingFrame")
    TabPage.Name = tab.Name
    TabPage.Parent = PagesContainer
    TabPage.Size = UDim2.new(1, 0, 1, 0)
    TabPage.BackgroundTransparency = 1
    TabPage.Visible = false
    TabPage.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabPage.ScrollBarThickness = 4

    local FunctionList = Instance.new("UIListLayout", TabPage)
    FunctionList.FillDirection = Enum.FillDirection.Vertical
    FunctionList.SortOrder = Enum.SortOrder.LayoutOrder
    FunctionList.Padding = UDim.new(0, 5)

    for _, func in ipairs(tab.Functions) do
        local FuncButton = Instance.new("TextButton")
        FuncButton.Parent = TabPage
        FuncButton.Size = UDim2.new(1, -10, 0, 30)
        FuncButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        FuncButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        FuncButton.Text = func.Name
        FuncButton.Font = Enum.Font.SourceSans
        FuncButton.TextScaled = true
        FuncButton.BorderSizePixel = 0
        FuncButton.Position = UDim2.new(0, 5, 0, 0)

        FuncButton.MouseButton1Click:Connect(func.Callback)
    end

    TabButton.MouseButton1Click:Connect(function()
        if selectedTab then
            selectedTab.Visible = false
        end
        TabPage.Visible = true
        selectedTab = TabPage
    end)

    if not selectedTab then
        TabPage.Visible = true
        selectedTab = TabPage
    end
end
