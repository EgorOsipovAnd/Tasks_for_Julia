# Ост - "Е6" - восток, Норд - "N8" - север, Запад - "W4" - запад, Юг - "S2" - юг.
function main(r::Robot)
    path = go_to_left_bottom_corner_and_get_path(r)
    for i ∈ (Ost, Nord, West, Sud)
        mark_direction(r, i)
    end
    go_back(r, path)
end


function go_to_left_bottom_corner_and_get_path(r::Robot) ::Array
    path=[]
    while !isborder(r,Sud) || isborder(r,West)
        if !isborder(r,Sud)
            move!(r,Sud)
            push!(path,Nord)
        end
        if !isborder(r,West)
            move!(r,West)
            push!(path,Ost)
        end
    end
    return path
end

function mark_direction(r,side::HorizonSide)
    while !isborder(r,side)
        putmarker!(r)    
        move!(r,side)
    end
    putmarker!(r)
end

function go_back(r,path::Array)
    n=length(path)
    while n>0
        move!(r,path[n])
        n=n-1
    end
end