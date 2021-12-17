#Ost - "E6" - восток, Nord - "N8" - север, West - "W4" - запад, Sud - "S2" - юг
function main_function1!(r)
    for side in [Nord, Sud, West, Ost]
        putmarkers!(r, side)
        move_by_markers(r, inverse(side))
    end
    putmarker!(r)
end
function putmarkers!(r, side)
    while !isborder(r, side)
        move!(r, side)
        putmarker!(r)
    end
end
function move_by_markers(r, side)
    while ismarker(r)==true
        move!(r, side)
    end
end
function inverse(side)
    HorizonSide(mod(Int(side)+2, 4))
end