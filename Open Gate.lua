--Menyiapkan variables
local workspace =game.Workspace
local button =workspace:WaitForChild("Button")
local gate =workspace:WaitForChild("Gate")
local sound =workspace:WaitForChild("Sound")
local particlePart=workspace:WaitForChild("particlePart")
local particleEmitter=particlePart:FindFirstChildOfClass("ParticleEmitter")
--Menyiapkan function
local function buttonPressed(button,gate,particlePart, sound, particleEmitter)
	return function(otherPart)
		local character = otherPart.Parent
		if character:FindFirstChild("Humanoid") then
			print(button.Name.." touched by a player!")
			--change change button color
			button.BrickColor =BrickColor.new("Bright green")
			gate.Transparency =1
			gate.CanCollide =false
			if particleEmitter then
				particleEmitter.Enabled = true
			end
			if sound then
				sound:Play()
			end


			task.wait(10)
			gate.Transparency =0
			gate.CanCollide =true
			if sound then
				sound:stop()
			end
			if particleEmitter then
				particleEmitter.Enabled = false
			end
			button.BrickColor =BrickColor.new("Bright red")
		end
	end
	
	
	
end
button.Touched:Connect(buttonPressed(button,gate,particlePart,sound,particleEmitter))