
-- D_F Hub - Redz Style com Menu e Botão Móveis --

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Criação da GUI principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DF_Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- Função para tornar elementos móveis
local function makeDraggable(frame)
    local dragging, dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

-- Botão de mostrar/ocultar móvel
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 120, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0.5, -20)
toggleButton.Text = "Mostrar Menu"
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Parent = ScreenGui
makeDraggable(toggleButton)

-- Menu principal
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
makeDraggable(MainFrame)

-- Alternar visibilidade
toggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    toggleButton.Text = MainFrame.Visible and "Ocultar Menu" or "Mostrar Menu"
end)

-- Espaço reservado para construir as abas e funções
-- Aqui você pode adicionar a construção das abas e botões do menu como já configurado no restante do script.
-- Ex: criar ScrollFrame, adicionar abas e seus botões de função.
