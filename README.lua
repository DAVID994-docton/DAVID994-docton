
-- D_F Hub - Interface Completa com Funcionalidades Reais
-- Desenvolvido por David e Francisco

-- Serviços
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- GUI
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "DF_Hub"
ScreenGui.ResetOnSpawn = false

-- Menu móvel
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0, 50, 0, 100)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Active = true
MainFrame.Draggable = true

-- Botão Mostrar/Ocultar
local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Size = UDim2.new(0, 120, 0, 30)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Text = "Ocultar Menu"
ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleButton.Text = MainFrame.Visible and "Ocultar Menu" or "Mostrar Menu"
end)

-- Layout de botões
local UIListLayout = Instance.new("UIListLayout", MainFrame)
UIListLayout.Padding = UDim.new(0, 4)

-- Função para criar botão
local function createButton(name, callback)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.Text = name
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.MouseButton1Click:Connect(callback)
end

-- Funções reais
createButton("Fly", function()
    local flying = false
    local bodyGyro, bodyVelocity
    local speed = 50

    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.F then
            flying = not flying
            if flying then
                bodyGyro = Instance.new("BodyGyro", LocalPlayer.Character.HumanoidRootPart)
                bodyGyro.P = 9e4
                bodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                bodyGyro.cframe = LocalPlayer.Character.HumanoidRootPart.CFrame

                bodyVelocity = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
                bodyVelocity.velocity = Vector3.new(0, 0, 0)
                bodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)

                RunService:BindToRenderStep("Fly", Enum.RenderPriority.Camera.Value + 1, function()
                    local cf = workspace.CurrentCamera.CFrame
                    bodyGyro.cframe = cf
                    local direction = Vector3.new()
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then direction += cf.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then direction -= cf.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then direction -= cf.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then direction += cf.RightVector end
                    bodyVelocity.velocity = direction.unit * speed
                end)
            else
                RunService:UnbindFromRenderStep("Fly")
                if bodyGyro then bodyGyro:Destroy() end
                if bodyVelocity then bodyVelocity:Destroy() end
            end
        end
    end)
end)

createButton("ESP", function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and not player.Character:FindFirstChild("ESPBox") then
            local box = Instance.new("BoxHandleAdornment")
            box.Name = "ESPBox"
            box.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
            box.AlwaysOnTop = true
            box.ZIndex = 5
            box.Size = Vector3.new(4, 6, 2)
            box.Color3 = Color3.new(1, 0, 0)
            box.Transparency = 0.5
            box.Parent = player.Character
        end
    end
end)

createButton("Infinite Jump", function()
    UserInputService.JumpRequest:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end)

createButton("Noclip", function()
    local noclip = true
    RunService.Stepped:Connect(function()
        if noclip and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end)

createButton("Speed Hack", function()
    LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)
