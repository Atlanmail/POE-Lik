local ContextActionService = game:GetService("ContextActionService")
local Player = game.Players.LocalPlayer
local createProj = game:GetService("ReplicatedStorage").RemoteEvents.projectileScripts.createProj

Player.CharacterAdded:Wait()

local Mouse = Player:GetMouse()
local humanoid = Player.Character:WaitForChild("Humanoid")
--local userAssetService = game:GetService("userAssetService")

local onClick = function(actionName, inputState, inputObj)
    if inputState == Enum.UserInputState.Begin then
        createProj:FireServer(Player.Character.HumanoidRootPart.Position, (Mouse.Hit.Position - Player.Character.HumanoidRootPart.Position).Unit , 100) 
    end


end

ContextActionService:BindAction("OnClick", onClick, false, Enum.UserInputType.MouseButton1)

