-- Tải Rayfield Library
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Tạo cửa sổ chính
local Window = Rayfield:CreateWindow({
   Name = "Trollge Multiverse GUI",
   LoadingTitle = "Đang khởi động GUI...",
   LoadingSubtitle = "by jotaro",
   ConfigurationSaving = {
      Enabled = false
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

-- Tạo tab chính
local MainTab = Window:CreateTab("Main", 4483362458)

-- Tạo nút để chạy script từ Pastebin
MainTab:CreateButton({
   Name = "Chạy Auto Chest",
   Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/Yh5eG2WM"))()
   end,
})
