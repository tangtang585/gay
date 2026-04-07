local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local Window = Rayfield:CreateWindow({
   Name = "ULTIMA V22 | FLING EDITION",
   LoadingTitle = "Loading Fling Modules...",
   ConfigurationSaving = { Enabled = true, FolderName = "UltimaFling" }
})

-- [[ SHARED VALUES ]] --
_G.WalkSpeed = 16
_G.JumpPower = 50
_G.GodMode = false
_G.InfJump = false
_G.FlingActive = false

-- [[ FLING LOGIC ]] --
-- This makes your character "invisible" and spinning to fling others
local function ToggleFling(v)
    _G.FlingActive = v
    local lp = game.Players.LocalPlayer
    local char = lp.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    local hrp = char.HumanoidRootPart
    task.spawn(function()
        while _G.FlingActive do
            RunService.Heartbeat:Wait()
            local velocity = hrp.Velocity
            hrp.Velocity = velocity * Vector3.new(1, 0, 1) + Vector3.new(0, 5000, 0)
            RunService.RenderStepped:Wait()
            hrp.Velocity = velocity
        end
    end)
end

-- [[ UNIVERSAL LOOP ]] --
RunService.Heartbeat:Connect(function()
    local p = game.Players.LocalPlayer
    if p.Character and p.Character:FindFirstChildOfClass("Humanoid") then
        local hum = p.Character:FindFirstChildOfClass("Humanoid")
        if _G.WalkSpeed > 16 then hum.WalkSpeed = _G.WalkSpeed end
        if _G.JumpPower > 50 then hum.UseJumpPower = true hum.JumpPower = _G.JumpPower end
        if _G.GodMode then
            hum.Health = 100
            hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        end
    end
end)

-- [[ 1. MOVEMENT ]] --
local MoveTab = Window:CreateTab("🏃 Movement", nil)
MoveTab:CreateToggle({Name = "Infinite Jump", CurrentValue = false, Callback = function(V) _G.InfJump = V end})
MoveTab:CreateSlider({Name = "Speed", Range = {16, 500}, CurrentValue = 16, Callback = function(V) _G.WalkSpeed = V end})

-- [[ 2. FLING & COMBAT (NEW!) ]] --
local FlingTab = Window:CreateTab("🌪️ Fling", nil)

FlingTab:CreateToggle({
   Name = "Invisible Fling (Touch to Launch)",
   CurrentValue = false,
   Callback = function(V) ToggleFling(V) end,
})

FlingTab:CreateButton({
   Name = "Kill All (Requires Tools)",
   Callback = function()
       -- Loads a universal kill-all script if the game has tools
       loadstring(game:HttpGet("https://raw.githubusercontent.com/GwnVvw/KillAll/main/Source.lua"))()
   end,
})

-- [[ 3. DEFENSE ]] --
local DefTab = Window:CreateTab("🛡️ Defense", nil)
DefTab:CreateToggle({Name = "Admin-Proof God", CurrentValue = false, Callback = function(V) _G.GodMode = V end})

-- [[ 4. VISUALS & TOOLS ]] --
local VisTab = Window:CreateTab("👁️ Visuals", nil)
VisTab:CreateToggle({
   Name = "Player ESP",
   CurrentValue = false,
   Callback = function(V)
      for _, p in pairs(game.Players:GetPlayers()) do
          if p ~= game.Players.LocalPlayer and p.Character then
              if V then
                  local h = Instance.new("Highlight", p.Character)
                  h.Name = "UltimaESP"
              elseif p.Character:FindFirstChild("UltimaESP") then
                  p.Character.UltimaESP:Destroy()
              end
          end
      end
   end,
})

local ToolTab = Window:CreateTab("🛠️ Tools", nil)
ToolTab:CreateButton({Name = "Infinite Yield", Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end})
