#Ost - "E6" - восток, Nord - "N8" - север, West - "W4" - запад, Sud - "S2" - юг
function main_function9!(r)
    steps = 1
    side = Nord
    while ismarker(r)==false
        for _ in 1:2
            special_move!(r,side,steps)
            side=counterclockwise(side)
        end
        steps += 1
    end
end
function special_move!(r, side, num::Int)
    for _ in 1:num
        if ismarker(r)
            return nothing
        end
        move!(r,side)
    end
end
function counterclockwise(side)
    return HorizonSide(mod(Int(side)+1,4))
end