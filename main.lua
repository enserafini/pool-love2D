require("mesa")
require("bocha")

--baranda = {}
--baranda2 = {}
-- -- bocha = {}

entidad1 = nil
entidad2 = nil
contacto = false

--Callbacks de colision - Funciones callback o de respuesta
function iniciarContacto(a,b,col)
    contacto = true
    entidad1 = a:getUserData()
    entidad2 = b:getUserData()
end

function terminarContacto(a,b,col)
    contacto = false
    entidad1 = nil
    entidad2 = nil
end
                  
function love.load()
    love.physics.setMeter(64)
    world = love.physics.newWorld(0, 0, true)

    -- Se definen las funciones de callback para detectar colisiones
    world:setCallbacks(iniciarContacto, terminarContacto)
                           

    --los parametros de cuerpo significan:
    --tipo de cuerpo, posicion x, posicion y
    --si no definimos el tipo de cuerpo, por defecto es "static"
    
    --los parametros de forma significan:
    --ancho, alto
    
    --los parametros de acople significan:
    --cuerpo, forma

    CrearMesa()
    CargarBochas()

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
        miBocha.cuerpo:applyLinearImpulse(0, -1000)
    end
end


function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        MoverBocha(x, y)
    end
end



function love.update(dt)
    world:update(dt)
end

function love.draw()
    DibujarMesa()
    DibujarBochas()

                        
    love.graphics.setColor(1,0,0)
    if contacto then
        love.graphics.print("CHOQUE", 650/2, 200 + 20)
        love.graphics.print(entidad1, 650/2, 200 + 30)
        love.graphics.print(entidad2, 650/2, 200 + 40)
    end
                        
end