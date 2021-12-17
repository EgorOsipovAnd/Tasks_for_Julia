#Ost - "E6" - восток, Nord - "N8" - север, West - "W4" - запад, Sud - "S2" - юг
function main_function8!(r)
    side = Ost
    while isborder(r,Nord)==true
        putmarker!(r)
        go_mark(r,side)
        side=inverse(side)
    end
end

function go_mark(r, side)
    while ismarker(r)==true
        move!(r,side)
    end
end
function inverse(side)
    return HorizonSide(mod(Int(side)+2, 4))
end