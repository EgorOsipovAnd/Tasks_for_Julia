#Ost - "E6" - восток, Nord - "N8" - север, West - "W4" - запад, Sud - "S2" - юг
function main_function7!(r)
    arr=[]
    exit_to_the_lower_left_cell!(r, arr)
    moves!(r, Nord)
    counter_Nord=moves!(r, Sud)
    side=Ost
    mark_line!(r, side)
    for _ in 1:counter_Nord
        if !ismarker(r)
            move!(r, Nord)
            side=inverse(side)
            mark_line!(r, side)
        elseif ismarked(r)  
            ismarked(r)
            move!(r, Nord)
            side=inverse(side)
            move!(r, side)
            mark_line!(r, side)
        end
    end
    moves!(r, West)
    moves!(r, Sud)
    return_to_starting_point!(r, arr)
    putmarker!(r)
end
function mark_line!(r, side)
    while !isborder(r, side)
        putmarker!(r)
        move!(r, side)
        if !isborder(r, side)
            move!(r, side)
        end
    end
end
function exit_to_the_lower_left_cell!(r, arr)
    while !(isborder(r, West)&&isborder(r, Sud))
        if !isborder(r, West)
            move!(r, West)
            push!(arr, West)
        end
        if !isborder(r, West)
            move!(r, West)
            push!(arr, West)
        end
    end
end
function return_to_starting_point!(r, arr)
    while length(arr)>0
        side=pop!(arr)
        move!(r, inverse(side))
    end
end
function inverse(side)
    HorizonSide(mod(Int(side)+2, 4))
end
function moves!(r, side)
    counter=0
    while !isborder(r, side)
        move!(r, side)
        counter +=1
    end
    return counter
end