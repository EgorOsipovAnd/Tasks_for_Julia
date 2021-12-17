#Ost - "E6" - восток, Nord - "N8" - север, West - "W4" - запад, Sud - "S2" - юг
function main_function6!(r)
    nord_counter=moves!(r, Nord)
    west_counter=moves!(r, West)
    sud_counter=moves!(r, Sud)
    ost_counter=moves!(r, Ost)
    for steps in 1:ost_counter/2
        move!(r, West)
    end
    moves!(r, Nord)
    while (isborder(r, Nord)==true) && (!ismarker(r))
        putmarker!(r)
        move!(r, West)
    end
    putmarker!(r)
    move!(r, Nord)
    while (isborder(r, Ost)==true) && (!ismarker(r))
        putmarker!(r)
        move!(r, Nord)
    end
    putmarker!(r)
    move!(r, Ost)
    while (isborder(r, Sud)==true) && (!ismarker(r))
        putmarker!(r)
        move!(r, Ost)
    end
    putmarker!(r)
    move!(r, Sud)
    while (isborder(r, West)==true) && (!ismarker(r))
        putmarker!(r)
        move!(r, Sud)
    end
    putmarker!(r)
    move!(r, West)
    while (isborder(r, Nord)==true) && (!ismarker(r))
        putmarker!(r)
        move!(r, West)
    end
    moves!(r, Sud)
    moves!(r, Ost)
    moves!(r, West, ost_counter)
    moves!(r, Nord, sud_counter)
    moves!(r, Ost, west_counter)
    moves!(r, Sud, nord_counter)
end
function moves!(r, side)
    counter=0
    while !isborder(r, side)
        move!(r, side)
        counter +=1
    end
    return counter
end
function moves!(r::Robot, side::HorizonSide, num_steps::Int)
    for steps in 1:num_steps
        move!(r, side)
    end
end