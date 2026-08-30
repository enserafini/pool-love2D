function love.load()
    love.physics.setMeter(64)
    world = love.physics.newWorld(0, 9.81 * 64, true)


    --los parametros de cuerpo significan:
    --tipo de cuerpo, posicion x, posicion y
    cuerpo = love.physics.newBody(world, 650/2, 650-25)

    --los parametros de forma significan:
    --ancho, alto
    forma = love.physics.newRectangleShape(650, 50)

    --los parametros de acople significan:
    --cuerpo, forma
    acople = love.physics.newFixture(cuerpo, forma)

    love.window.setMode(650, 650)
end

function love.draw()
    love.graphics.polygon("fill", cuerpo:getWorldPoints(forma:getPoints()))
end