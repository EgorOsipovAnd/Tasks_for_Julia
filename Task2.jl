#Ost - "E6" - восток, Nord - "N8" - север, West - "W4" - запад, Sud - "S2" - юг
function main_function2!(r)
    arr=[]
    exit_to_the_lower_left_cell!(r, arr)
    for side in [Nord, Ost, Sud, West]
        putmarkers!(r, side)
    end
    return_to_starting_point!(r, arr)
end
function exit_to_the_lower_left_cell!(r, arr)
    while !(isborder(r, West)&&isborder(r, Sud))
        if !isborder(r, West)
            move!(r, West)
            push!(arr, Weat)
        end
        if !isborder(r, Sud)
            move!(r, Sud)
            push!(arr, Sud)
        end
    end
end
function return_to_starting_point!(r, arr)
    while length(arr)>0
        side=pop!(arr)
        move!(r, inverse(side))
    end
end
function putmarkers!(r, side)
    while !isborder(r, side)
        putmarker!(r)
        move!(r, side)
    end
end
