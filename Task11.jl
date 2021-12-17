#Ost - "E6" - восток, Nord - "N8" - север, West - "W4" - запад, Sud - "S2" - юг
function main_function11!(::Robot)
    A=[]
    B=[]
    help_main_2(r,Ost)
    help_main_1(r, Nord)
    help_main_1(r, West)
    help_main_2(r, Sud)
end

function obhod(::Robot,side1::HorizonSide,side2::HorizonSide,A,B)
    while isborder(r,side1)
        move!(r,side2),push!(A,side2)
    end
    while length(B)>0
        side=pop!(B)
        move!(r,inverse(side)),push!(A,inverse(side))
    end
        putmarker!(r)
end
function go_back_position(::Robot,A)
    while length(A)>0
        side=pop!(A)
        move!(r,inverse(side))
    end
end


function help_main_1(r, side)
    A = []
    B = []
    if !isborder(r,side)
        move!(r,side)
        putmarker!(r)
        move!(r,inverse(side))
    else
        if isborder(r,hourly(side))
            side3=inverse(hourly(side))
        else 
            side3=hourly(side)
        end
        while isborder(r,side) && !isborder(r,side3)
            move!(r,side3),push!(A,side3),push!(B,side3)
        end
        if !isborder(r,side3) && !isborder(r,side)
            move!(r,side),push!(A,side)
            obhod(r,inverse(side3),side,A,B)
            putmarker!(r)
            go_back_position(r,A)
        else
            go_back_position(r,A)
            B=[]
        end
    end
end

function help_main_2(r, side)
    A = []
    B = []
    if !isborder(r,side)
        move!(r,side)
        putmarker!(r)
        move!(r,inverse(side))
    else
        if isborder(r,counterclockwise(side))
            side4=inverse(counterclockwise(side))
        else 
            side4=counterclockwise(side)
        end
        while isborder(r,side) && !isborder(r,side4)
            move!(r,side4),push!(A,side4),push!(B,side4)
        end
        if !isborder(r,side4) && !isborder(r,side)
            move!(r,side),push!(A,side)
            obhod(r,inverse(side4),side,A,B)
            putmarker!(r)
            go_back_position(r,A)
        else
            go_back_position(r,A)
            B=[]
        end
    end
end

counterclockwise(side) = HorizonSide(mod(Int(side)+1, 4))
hourly(side) = HorizonSide(mod(Int(side)- 1 , 4))
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))