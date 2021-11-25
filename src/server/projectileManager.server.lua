local castSpell = game:GetService("ReplicatedStorage").RemoteEvents.castSpell
local fireballModel = game:GetService("ServerStorage").Fireball
--- local fireball = fireballModel.Part
local projectiles = {}


local createProjectile = function(player, startingPosition, normalVector, speed) -- vector3, vector3, scalar
    local newFireball = fireballModel:Clone()
    ---print(tostring(startingPosition) .. " " .. tostring(normalVector))
    newFireball.Main.Position = startingPosition + (normalVector * 20)
    newFireball.Main.BodyVelocity.Velocity = normalVector * speed
    
    newFireball.Parent = workspace

    newFireball.Main:SetNetworkOwner(player)
end

castSpell.onServerEvent:connect(createProjectile)