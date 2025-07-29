-- Auto Chest + ESP GUI (Trollge Multiverse) by jotaro
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Trollge Multiverse GUI",
   LoadingTitle = "Đang khởi động...",
   LoadingSubtitle = "by jotaro",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "TrollgeAuto",
      FileName = "AutoChestESP"
   }
})

local autoFarm = false
local espEnabled = false

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Tabs
local AutoTab = Window:CreateTab("Auto", 4483362458)
local ESPTab = Window:CreateTab("ESP", 4483362458)

-- Tạo ESP
function createESP(part)
    if part:FindFirstChild("ESP") then return end

    local box = Instance.new("BoxHandleAdornment")
    box.Name = "ESP"
    box.Adornee = part
    box.Size = part.Size + Vector3.new(0.2, 0.2, 0.2)
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Color3 = Color3.fromRGB(255, 255, 0) -- vàng
    box.Transparency = 0.3
    box.Parent = part
end

-- Xoá ESP
function removeESP()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BoxHandleAdornment") and obj.Name == "ESP" then
            obj:Destroy()
        end
    end
end

-- Tìm ProximityPrompt gần nhất và thêm ESP nếu bật
local function getClosestPrompt()
    local closestPrompt = nil
    local shortestDist = math.huge
    local character = player.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")

    if not hrp then return end

    for _, prompt in pairs(workspace:GetDescendants()) do
        if prompt:IsA("ProximityPrompt") then
            local part = prompt.Parent
            if part and part:IsA("BasePart") then
                if espEnabled then createESP(part) end

                local dist = (hrp.Position - part.Position).Magnitude
                if dist < shortestDist then
                    shortestDist = dist
                    closestPrompt = prompt
                end
            end
        end
    end

    return closestPrompt
end

-- Toggle Auto Farm
AutoTab:CreateToggle({
   Name = "Tự động nhặt rương",
   CurrentValue = false,
   Callback = function(Value)
      autoFarm = Value
   end
})

-- Toggle ESP
ESPTab:CreateToggle({
   Name = "Bật ESP rương",
   CurrentValue = false,
   Callback = function(Value)
      espEnabled = Value
      if not Value then removeESP() end
   end
})

-- Luồng tự động nhặt rương
task.spawn(function()
    while true do
        pcall(function()
            if autoFarm then
                local prompt = getClosestPrompt()
                local character = player.Character
                local hrp = character and character:FindFirstChild("HumanoidRootPart")

                if prompt and hrp then
                    local part = prompt.Parent
                    local dist = (hrp.Position - part.Position).Magnitude
                    local travelTime = dist / 250

                    local tween = TweenService:Create(
                        hrp,
                        TweenInfo.new(travelTime, Enum.EasingStyle.Linear),
                        {CFrame = part.CFrame + Vector3.new(0, 2, 0)}
                    )
                    tween:Play()
                    tween.Completed:Wait()

                    task.wait(0.1)
                    fireproximityprompt(prompt)
                    task.wait(0.45)
                end
            end
        end)
        task.wait(0.1)
    end
end)
