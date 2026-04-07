-- hope youre gay --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local RunService = game:GetService("RunService")

local Window = Rayfield:CreateWindow({
   Name = "ULTIMA HUB | V20 (ADMIN-PROOF)",
   LoadingTitle = "cool",
   ConfigurationSaving = { Enabled = true, FolderName = "UltimaConfig" }
})

-- [[ SHARED VALUES ]] --
_G.WalkSpeed = 16
_G.JumpPower = 50
_G.GodMode = false
_G.InfJump = false

-- [[ THE "ADMIN-SHIELD" LOGIC ]] --
RunService.Heartbeat:Connect(function()
    local p = game.Players.LocalPlayer
    if p.Character and p.Character:FindFirstChildOfClass("Humanoid") then
        local hum = p.Character:FindFirstChildOfClass("Humanoid")
        
        -- Movement Bypasses
        if _G.WalkSpeed > 16 then hum.WalkSpeed = _G.WalkSpeed end
        if _G.JumpPower > 50 then 
            hum.UseJumpPower = true 
            hum.JumpPower = _G.JumpPower 
        end

        -- THE NEW GOD MODE: Blocks state changes
        if _G.GodMode then
            hum.Health = 100
            -- This blocks the ":kill" command from forcing the Dead state
            hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        end
    end
end)

-- [[ 1. MOVEMENT TAB ]] --
local MoveTab = Window:CreateTab("🏃 Movement", nil)
MoveTab:CreateToggle({Name = "Infinite Jump", CurrentValue = false, Callback = function(V) _G.InfJump = V end})
MoveTab:CreateSlider({Name = "Forced Speed", Range = {16, 500}, CurrentValue = 16, Callback = function(V) _G.WalkSpeed = V end})
MoveTab:CreateSlider({Name = "Forced Jump", Range = {50, 800}, CurrentValue = 50, Callback = function(V) _G.JumpPower = V end})

-- [[ 2. DEFENSE TAB (THE ADMIN FIX) ]] --
local DefTab = Window:CreateTab("🛡️ Defense", nil)
DefTab:CreateToggle({
   Name = "Admin-Proof God Mode",
   CurrentValue = false,
   Callback = function(V) _G.GodMode = V end,
})

-- [[ 3. VISUALS & TOOLS ]] --
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
ToolTab:CreateButton({
   Name = "Anti-Lag / Clear Map",
   Callback = function()
      for _, v in pairs(game.Workspace:GetChildren()) do
          if v:IsA("BasePart") and v.Name ~= "Baseplate" then v:Destroy() end
      end
   end,
})

Rayfield:Notify({Title = "V20 LOADED", Content = "Admin-Proof Defense is ACTIVE.", Duration = 5})
