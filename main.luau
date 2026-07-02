local tables = { ShootCooldown = {}, ShootRecoil = {}, ShootSpread = {} }

for _, e in getgc({ "ShootCooldown", "ShootRecoil", "ShootSpread" }) do
    if e.type == "number" then table.insert(tables[e.key], { tbl = e, original = e.value }) end
end

loadstring(game:HttpGet("https://scripts.wabisabi.mom/wabi-sabi-ui-lib.lua"))()
local Library = WabiSabi

local Window = Library:CreateWindow({
    Title = "Rivals gun mods",
    SubTitle = "v6.9",
    Size = Vector2.new(580, 460),
    Resize = true,
})

local Main = Window:AddTab({ Title = "Main", Icon = "house" })

for k, _ in tables do
    Main:AddSlider({
        Id = k,
        Title = k,
        Min = 0,
        Max = 100,
        Default = 100,
        Callback = function(value)
            local multiplier = value / 100
            for _, e in tables[k] do
                memory_write("double", e.tbl.addr, e.original * multiplier)
            end
        end,
    })
end

Library:Notify({ Title = "Loaded", Content = "Menu ready.", Duration = 4 })
