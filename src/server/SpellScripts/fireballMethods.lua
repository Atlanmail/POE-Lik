local ReplicatedStorage = game:GetService("ReplicatedStorage")
local fireballMethods = {}

local projEvents = ReplicatedStorage.RemoteEvents:WaitForChild("projectileScripts")
local projHit = projEvents.projHit

function fireballMethods.onEnd(projectileModel, rayResult)

    print("collided")
    if not rayResult then
        print("no result")
        projectileModel:Destroy()
        return
    end

    local humanoid = rayResult.Instance:FindFirstAncestor("HitParts").Parent:FindFirstChild("Humanoid");
    if humanoid then 
        print(humanoid)
        ---projHit:FireServer(projectileModel, humanoid, rayResult.Position)
        humanoid:TakeDamage(25)
        projectileModel:Destroy()
    end


    

end


return fireballMethods