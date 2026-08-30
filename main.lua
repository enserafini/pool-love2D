baranda = {}
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

    bocha.cuerpo = love.physics.newBody(world, 650/2, 650/2, "dynamic")
    bocha.forma = love.physics.newCircleShape(20)   
    bocha.acople = love.physics.newFixture(bocha.cuerpo, bocha.forma)
    bocha.sprite = love.graphics.newImage("bola.png")

    love.window.setMode(650, 650)
end

function love.update(dt)
    world:update(dt)
end

function love.draw()
    love.graphics.polygon("fill", baranda.cuerpo:getWorldPoints(baranda.forma:getPoints()))
    love.graphics.draw( bocha.sprite,
                        bocha.cuerpo:getX(),
                        bocha.cuerpo:getY(),
                        0,
                        0.075,
                        0.075,
                        256,
                        256)
end