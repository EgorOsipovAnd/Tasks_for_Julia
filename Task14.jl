# Ост - "Е6" - восток, Норд - "N8" - север, Запад - "W4" - запад, Юг - "S2" - юг.
function main_function!14(r::Robot)
    for side in (Nord, West, Sud, Ost)
        num_steps = put_marker_in_direction_and_get_num_steps(r,side)
        try_move(r,inverse(side), num_steps)
    end
    putmarker!(r)
end


function put_marker_in_direction_and_get_num_steps(r::Robot,side::HorizonSide)
    num_steps=0 
    while try_move(r, side)
        putmarker!(r)
        num_steps += 1
    end 
    return num_steps
end


try_move(r::Robot, side::HorizonSide, num_steps::Int) =
for _ in 1:num_steps
    try_move(r,side)
end

function try_move(r::Robot, direct_side::HorizonSide)::Bool
    orthogonal_side = clockwise(direct_side)
    reverse_side = inverse(orthogonal_side)
    num_steps=0
    if !isborder(r,direct_side)
        move!(r,direct_side)
        result=true
    else
        while isborder(r,direct_side)
            if !isborder(r, orthogonal_side) 
                move!(r, orthogonal_side)
                num_steps += 1
            else
                break
            end
        end
        if !isborder(r,direct_side)
            move!(r,direct_side)
            while isborder(r,reverse_side)
                move!(r,direct_side)
            end
            result = true
        else
            result = false
        end
        while num_steps>0
            num_steps=num_steps-1
            move!(r,reverse_side)
        end
    end
    return result
end


clockwise(side::HorizonSide) = HorizonSide(mod(Int(side)-1,4))
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))