function string.ToVector(vector)

    if type(vector) == "Vector" then
        local x = vector.x
        local y = vector.y
        local z = vector.z

        return "Vector("..x..","..y..","..z..")"
    end
end

function string.ToAngle(angle)

    if type(angle) == "Angle" then

        local p = angle.p
        local y = angle.y
        local r = angle.r

        return "Angle("..p..","..y..","..r..")"
    end
end
