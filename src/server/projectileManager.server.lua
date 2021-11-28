local createProj = game:GetService("ReplicatedStorage").RemoteEvents.projectileScripts.createProj
local fireballModel = game:GetService("ServerStorage").Fireball
--- local fireball = fireballModel.Part
local projectiles = {}


local createProjectile = function(player, startingPosition, velocity) -- vector3, vector3, scalar
    local newFireball = fireballModel:Clone()
    ---print(tostring(startingPosition) .. " " .. tostring(normalVector))
    newFireball.Main.Position = startingPosition + (velocity.Unit * 20)
    newFireball.Main.BodyVelocity.Velocity = velocity
    
    projectiles[newFireball] = {player, startingPosition, velocity}

    newFireball.Parent = workspace

    newFireball.Main:SetNetworkOwner(player)
end

local projectileHit = function(projectileModel, humanoid, rayHit)
    local player, startingPosition, velocity = unpack(projectiles[projectileModel])
    print(player.Name .. " " .. tostring(startingPosition) .. " " .. tostring(velocity))
end

createProj.onServerEvent:connect(createProjectile)