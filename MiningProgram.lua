turtle.refuel()
 
local distanceToStart = 0
 
function Dig()
    turtle.dig()
    distanceToStart = distanceToStart + 1
    turtle.forward()
    turtle.turnLeft()
    turtle.dig()
    turtle.turnRight()
    turtle.turnRight()
    turtle.dig()
    turtle.turnLeft()
    turtle.digUp()
end
 
function CheckForFuel()
    -- checks if inv is full or fuel is close is empty
    if turtle.getFuelLevel() <= distanceToStart or turtle.getItemCount(16) > 0 then
        for i=0,distanceToStart do
            turtle.back()
        end
        for i=1,16 do
            turtle.select(i)
            turtle.dropDown(64)
        end
        turtle.select(1)
        return "done"
    else 
        return "not done"
    end
end
while true do    
    if turtle.getFuelLevel() > 0 then
        while CheckForFuel() ~= "done" do
            Dig()
        end
        distanceToStart = 0
    else
        break
    end
end
shell.run("reboot")
