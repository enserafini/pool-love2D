mesa = {}
local tag = "Baranda"

function CrearMesa()

    mesa.b1 = {}
    mesa.b2 = {}
    mesa.b3 = {}
    mesa.b4 = {}

    mesa.b1.cuerpo = love.physics.newBody(world, 650/2, 650-25)
    mesa.b1.forma = love.physics.newRectangleShape(650, 50)
    mesa.b1.acople = love.physics.newFixture(mesa.b1.cuerpo, mesa.b1.forma)
    mesa.b1.acople:setUserData(tag)

    mesa.b2.cuerpo = love.physics.newBody(world, 650/2, 0)
    mesa.b2.forma = love.physics.newRectangleShape(650, 50)
    mesa.b2.acople = love.physics.newFixture(mesa.b2.cuerpo, mesa.b2.forma)
    mesa.b2.acople:setUserData(tag)

    mesa.b3.cuerpo = love.physics.newBody(world, 0, 650/2)
    mesa.b3.forma = love.physics.newRectangleShape(50, 650)
    mesa.b3.acople = love.physics.newFixture(mesa.b3.cuerpo, mesa.b3.forma)
    mesa.b3.acople:setUserData(tag)

    mesa.b4.cuerpo = love.physics.newBody(world, 650, 650/2)
    mesa.b4.forma = love.physics.newRectangleShape(50, 650)
    mesa.b4.acople = love.physics.newFixture(mesa.b4.cuerpo, mesa.b4.forma)
    mesa.b4.acople:setUserData(tag)

end

function DibujarMesa()
    love.graphics.setColor(0.6, 0.4, 0.2)
    love.graphics.polygon("fill", mesa.b1.cuerpo:getWorldPoints(mesa.b1.forma:getPoints()))
    love.graphics.polygon("fill", mesa.b2.cuerpo:getWorldPoints(mesa.b2.forma:getPoints()))
    love.graphics.polygon("fill", mesa.b3.cuerpo:getWorldPoints(mesa.b3.forma:getPoints()))
    love.graphics.polygon("fill", mesa.b4.cuerpo:getWorldPoints(mesa.b4.forma:getPoints()))
end