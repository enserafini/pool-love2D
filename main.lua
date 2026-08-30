baranda = {}
baranda2 = {}
bocha = {}


function love.load()
    love.physics.setMeter(64)
    world = love.physics.newWorld(0, 9.81 * 64, true)


    --los parametros de cuerpo significan:
    --tipo de cuerpo, posicion x, posicion y
    --si no definimos el tipo de cuerpo, por defecto es "static"
    baranda.cuerpo = love.physics.newBody(world, 650/2, 650-25)
    
    --los parametros de forma significan:
    --ancho, alto
    baranda.forma = love.physics.newRectangleShape(650, 50)
    
    --los parametros de acople significan:
    --cuerpo, forma
    baranda.acople = love.physics.newFixture(baranda.cuerpo, baranda.forma)
    
    baranda2.cuerpo = love.physics.newBody(world, 650/2, 25)
    baranda2.forma = love.physics.newRectangleShape(650, 50)
    baranda2.acople = love.physics.newFixture(baranda2.cuerpo, baranda2.forma)


    bocha.cuerpo = love.physics.newBody(world, 650/2, 650/2, "dynamic")
    bocha.forma = love.physics.newCircleShape(20)   
    bocha.acople = love.physics.newFixture(bocha.cuerpo, bocha.forma)
    bocha.sprite = love.graphics.newImage("bola.png")

    love.window.setMode(650, 650)
end

--"key" sirve para detectar cuando se presiona una tecla,
-- y ejecutar un codigo en consecuencia

--"scancode" sirve para detectar la tecla presionada,
-- pero en vez de devolver el nombre de la tecla, 
--devuelve un codigo unico para cada tecla


--"isrepeat" sirve para detectar si la tecla esta 
--siendo presionada de manera continua, o si se presiono una sola vez
function love.keypressed(key,scancode,isrepeat)
    if key == "space" then
        bocha.cuerpo:applyLinearImpulse(0, -1000)
    end
end



function love.update(dt)
    world:update(dt)
end

function love.draw()
    love.graphics.setColor(0.6,0.4,0.2)
    love.graphics.polygon("fill", baranda.cuerpo:getWorldPoints(baranda.forma:getPoints()))
    love.graphics.polygon("fill", baranda2.cuerpo:getWorldPoints(baranda2.forma:getPoints()))

    love.graphics.setColor(1,1,1) --Para que los sprites se vean con sus colores originales
    love.graphics.draw( bocha.sprite,
                        bocha.cuerpo:getX(),
                        bocha.cuerpo:getY(),
                        0,
                        0.075,
                        0.075,
                        256,
                        256)
end