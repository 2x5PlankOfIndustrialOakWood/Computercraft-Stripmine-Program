--- turtle mines first above, then to the left, then to the right, and finally straight
function TurtleMine()
    turtle.digUp()
    turtle.turnLeft()
    turtle.dig()
    turtle.turnRight()
    turtle.turnRight()
    turtle.dig()
    turtle.turnLeft()
    turtle.dig()
end

-- checks if the turtle has enough fuel to return to the starting point or if its inventory is full (last slot used)
function CheckToReturn(distance)
    if turtle.getFuelLevel() == distance then
        return "leave"
        -- if there is not enough fuel to return to the starting location then the turtle will stop as it is better to manually retrieve the material than loose it
    elseif turtle.getFuelLevel() < distance then
        os.shutdown()
    else
        return "continue"
    end
end

-- drops off all items in inventory below turtle
function DropOff()
    for i = 1, 16 do
        turtle.select(i)
        turtle.dropDown(64)
    end
    turtle.select(1)
end

local distanceToStart = 0

while turtle.getFuelLevel() > 0 do
    TurtleMine()
    if turtle.getItemCount(16) > 0 then
        for i = 1, distanceToStart do
            turtle.back()
        end
        DropOff()
    elseif CheckToReturn(distanceToStart) == "continue" then
        turtle.forward()
        distanceToStart = distanceToStart + 1
    elseif CheckToReturn(distanceToStart) == "leave" then
        for i = 1, distanceToStart do
            turtle.back()
        end
        DropOff()
    end
end
