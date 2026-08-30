bochas = {}

local tag = "Bocha"

function CrearBocha(x, y, r, sprite)
    local bocha = {}

    bocha.cuerpo = love.physics.newBody(world, x, y, "dynamic")
    bocha.forma = love.physics.newCircleShape(r)
    bocha.acople = love.physics.newFixture(bocha.cuerpo, bocha.forma)
    bocha.acople:setUserData(tag)
    bocha.sprite = love.graphics.newImage(sprite)

    return bocha
end

function CargarBochas()
   table.insert(bochas, CrearBocha(650/2, 650/2, 20, "1.png"))
   table.insert(bochas, CrearBocha(650/2, 650/2, 20, "2.png"))
   table.insert(bochas, CrearBocha(650/2, 650/2, 20, "3.png"))
   table.insert(bochas, CrearBocha(650/2, 650/2, 20, "4.png"))
   table.insert(bochas, CrearBocha(650/2, 650/2, 20, "5.png"))
end

function DibujarBochas()
    love.graphics.setColor(1,1,1) --Para que los sprites se vean con sus colores originales
    
    for i, bocha in ipairs(bochas) do
        love.graphics.draw(bocha.sprite,
                            bocha.cuerpo:getX(),
                            bocha.cuerpo:getY(),
                            0,
                            0.075,
                            0.075,
                            256,
                            256)
    end
end