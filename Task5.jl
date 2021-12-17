#Ost - "E6" - восток, Nord - "N8" - север, West - "W4" - запад, Sud - "S2" - юг
function main_function5!(r::Robot)
    arr=[]
    exit_to_the_lower_left_cell!(r, arr)
    cell_end_markers!(r)
    return_to_starting_point!(r, arr)
end
function exit_to_the_lower_left_cell!(r, arr::Vector{Any})
    while !(isborder(r, West)&&isborder(r, Sud))
        if !isborder(r, West)
            move!(r, West)
            push!(arr, West)
        end
        if !isborder(r, Sud)
            move!(r, Sud)
            push!(arr, Sud)
        end
    end
end
function cell_end_markers!(r)
    for side in [Nord, Ost, Sud, West]
        while !isborder(r, side)
            move!(r, side)
        end
        putmarker!(r)
    end
end
function return_to_starting_point!(r, arr::Vector{Any})
    while length(arr)>0
        side=pop!(arr)
        move!(r, inverse(side))
    end
end
function inverse(side)
    HorizonSide(mod(Int(side)+2, 4))
end
