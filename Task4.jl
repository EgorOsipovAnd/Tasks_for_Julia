#Ost - "E6" - восток, Nord - "N8" - север, West - "W4" - запад, Sud - "S2" - юг
function main_function4!(r)
    Nord_counter=moves!(r, Nord)
    West_counter=moves!(r, West)
    Sud_counter=moves!(r, Sud)
    Ost_counter=moves!(r, Ost)
    diagonal=0
    ost_counter=Ost_counter
    moves!(r, West)
    while diagonal<=ost_counter
        horizon_line(r, Ost, ost_counter)
        ost_counter -=1
        diagonal +=1
    end
    moves!(r, Ost, West_counter)
    moves!(r, Sud, Nord_counter)
end
function moves!(r::Robot, side::HorizonSide, num_steps::Int)
    for steps in 1:num_steps
        move!(r, side)
    end
end
function putmarkers!(r, side)
    move!(r, side)
    putmarker!(r)
end
function moves!(r, side)
    counter=0
    while !isborder(r, side)
        move!(r, side)
        counter +=1
    end
    return counter
end
function inverse(side)
    HorizonSide(mod(Int(side)+2, 4))
end
function horizon_line(r, side, num_horizon)
    steps=0
    while steps<num_horizon
        putmarker!(r)
        move!(r, side)
        steps +=1
    end
    putmarker!(r)
    steps = 0
    while steps<num_horizon
        move!(r, inverse(side))
        steps +=1
    end
    move_up!(r, Nord)
end
function move_up!(r, side)
    if !isborder(r, Nord)
        move!(r, side)
    else
        move!(r, inverse(side))
        move!(r, side)
    end
end