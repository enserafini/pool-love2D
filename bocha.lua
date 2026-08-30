bochas = {}
miBocha = nil
velocidad = 400

local tag = "Bocha"

function CrearBocha(x, y, r, sprite)
    local bocha = {}

    bocha.cuerpo = love.physics.newBody(world, x, y, "dynamic")
    bocha.forma = love.physics.newCircleShape(r)
    bocha.acople = love.physics.newFixture(bocha.cuerpo, bocha.forma)
    bocha.acople:setUserData(tag)
    bocha.sprite = love.graphics.newImage(sprite)

    bocha.acople:setRestitution(0.4) -- Para que rebote al chocar con la mesa
    bocha.cuerpo:setLinearDamping(0.5) -- Para que se desacelere con el tiempo
    bocha.acople:setFriction(0.5) -- Para que se desacelere con el tiempo post colision con la bochas

    --Diferencia entre setLinearDamping y setFriction:
    --La primera desacelera el cuerpo en el aire,
    --mientras que la segunda desacelera el cuerpo 
    --cuando esta en contacto con otro cuerpo
    return bocha
end

function CargarBochas()

    local x = 650/2
    local y = 100
    local cantidad = 6


    for i = 1, cantidad do
        table.insert(bochas, CrearBocha(x, y +(75*i), 20, i..".png"))
        --uso i.. ya que corresponde al nombre de la imagen de la bocha, que va del 1 al 6
    end
        miBocha = bochas[cantidad]
end


function MoverBocha(x, y)
    local bx = miBocha.cuerpo:getX()
    local by = miBocha.cuerpo:getY()

    
     --con esto hago el calculo de la distancia entre la bocha y el mouse, 
     --para que la bocha se mueva hacia el mouse
    local dx = x - bx
    local dy = y - by 

    local distancia = math.sqrt(dx * dx + dy * dy)

    if distancia > 0 then
        local impulseX = (dx / distancia) * velocidad
        local impulseY = (dy / distancia) * velocidad

        miBocha.cuerpo:applyLinearImpulse(impulseX, impulseY)
    end
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