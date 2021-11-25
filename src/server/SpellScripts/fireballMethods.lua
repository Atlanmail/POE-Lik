local fireballMethods = {}

function fireballMethods.onEnd(projectileModel, rayResult)

    print("collided")
    if not rayResult then
        print("no result")
        projectileModel:Destroy()
        return
    end

    local humanoid = rayResult.Instance:FindFirstAncestor("HitParts").Parent:FindFirstChild("Humanoid");

    humanoid:takeDamage(30)
    print("dealt damage")
    projectileModel:Destroy()


    

end


return fireballMethods