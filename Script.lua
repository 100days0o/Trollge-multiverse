-- Tải Rayfield Library
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Tạo cửa sổ chính có hệ thống Key
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
   KeySystem = true, -- Bật key system
   KeySettings = {
      Title = "Trollge GUI Key",
      Subtitle = "Vui lòng nhập key để mở GUI",
      Note = "Key: 1241997",
      FileName = "TrollGUIKey", -- File lưu key trên thiết bị
      SaveKey = true,           -- Tự động lưu key đã nhập đúng
      GrabKeyFromSite = false,  -- Không lấy key từ web
      Key = {"1241997"}         -- Danh sách key hợp lệ
   }
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
