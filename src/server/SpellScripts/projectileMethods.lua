--[[
	Projectiles have 3 methods

	onCreate which runs on the creation
	flightBehavior which describes the motion of the projectile as a linear projectile
	onEnd which runs when flightBehavior hits a target or when it reaches the end of its range.

]]

local RunService = game:GetService("RunService")



local projectileMethods = {}

local sizeMulti = 6 --- how much leeway to give a projectile collision
local sizeConst = 0

--[[local function Wait(seconds) 
	local Heartbeat = RunService.Heartbeat
	local StartTime = tick()
	repeat Heartbeat:Wait() until tick() - StartTime >= seconds
end]]-- use task.wait() instead


function projectileMethods.onCreate(projectileModel) 
	print(projectileModel.Name .. " created")
end


function projectileMethods.flightBehavior(projectileModel, repeatCount, velocityMod, sizeMultiInput, sizeConstInput) -- velocity mod is how many times to check per second sensitivity multiples the raycast's mag

	local projectile = projectileModel.Main
	local sizeMulti = sizeMultiInput or sizeMulti
	local inverseVelMod = 1/velocityMod -- this converts studs/seconds to studs/intervalcalled
	local raycastParams = RaycastParams.new()
	local sizeConst = sizeConstInput or sizeConst
	local largestSize = math.max(projectile.Size.X, projectile.Size.Y, projectile.Size.Z)

	raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
	raycastParams.FilterDescendantsInstances = {projectileModel}
	raycastParams.IgnoreWater = true
	
	local rayResult
	Wait(0.1)
	---print(velocityModded)  
	for i = 0, repeatCount - 1, 1 do
		
		
		local origin = projectile.Position
		local result = projectile.Velocity.Unit * (inverseVelMod + sizeConst + largestSize ) * sizeMulti

		rayResult = workspace:Raycast(origin, result, raycastParams)
		
			
			

		if rayResult then 
			print(rayResult)
			inverseVelMod = 1/60
			i = i - 1
			if (rayResult.Position - projectile.Position).Magnitude <= (largestSize + sizeConst)  then
				
				
				break;
				
			else
				print("detected")
			end
		else
			print("Nothing was hit! " .. tostring(i))
		end
		Wait(inverseVelMod)
	end
	projectileMethods.onEnd(projectileModel, rayResult)
end

function projectileMethods.onEnd(projectileModel, rayResult)
	print(rayResult.Instance)
	
	--[[for index, value in pairs(rayResult) do
		print (index .. " " .. value)
	end]]--
	projectileModel:Destroy()
end


return projectileMethods


