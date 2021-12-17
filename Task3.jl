#Ost - "E6" - восток, Nord - "N8" - север, West - "W4" - запад, Sud - "S2" - юг
function main_function3!(r)
    counter_sud=moves!(r, Sud)
    counter_west=moves!(r, West)
    side=Ost
    putmarkers!(r, side)
    while !isborder(r, Nord)
        move!(r, Nord)
        side=inverse(side)
        putmarkers!(r, side)
    end
    moves!(r, West)
    moves!(r, Sud)
    moves!(r, Ost, counter_west)
    moves!(r, Nord, counter_sud)
end
function moves!(r::Robot, side::HorizonSide)
    counter =0
    while !isborder(r, side)
        move!(r, side)
        counter +=1
    end
    return counter
end

function putmarkers!(r, side)
    while !isborder(r, side)
        putmarker!(r)
        move!(r, side)
        putmarker!(r)
    end
end
function moves!(r::Robot, side::HorizonSide, num_steps::Int)
    for steps in 1:num_steps
        move!(r, side)
    end
end
function inverse(side)
    HorizonSide(mod(Int(side)+2, 4))
end