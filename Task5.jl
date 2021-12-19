#Ost - "E6" - восток, Nord - "N8" - север, West - "W4" - запад, Sud - "S2" - юг
function main_function5!(r::Robot)
    arr=[]
    exit_to_the_lower_left_cell!(r, arr)
    cell_end_markers!(r)
    return_to_starting_point!(r, arr)
end
"""
cell_end_markers!(r) - ставит маркеры в углах квадрата
"""
function cell_end_markers!(r)
    for side in [Nord, Ost, Sud, West]
        while !isborder(r, side)
            move!(r, side)
        end
        putmarker!(r)
    end
end
"""
exit_to_the_lower_left_cell!(r, arr) - это функция заполняет в переданый массив  двумя сторонами West || Sud: принцип алгоритма такой
цикл while работет так: пока слева(West) && снизу(Sud) нет перегоротки каждая проверка будет выполнятся проверка двух if: первый проверяет 
есть ли перегоротка в заданном направлении, если нет, то робот делает шаг в сторону West и заносит это сторону в переданный массив 
принцип работы второго if такой же.Цикл while прекратит свою работу, когда окажется в левом нижнем углу
"""
function exit_to_the_lower_left_cell!(r, arr)
    while !(isborder(r, Ost)&&isborder(r, Sud))
        if !isborder(r, Ost)
            move!(r, Ost)
            push!(arr, Ost)
        end
        if !isborder(r, Sud)
            move!(r, Sud)
            push!(arr, Sud)
        end
    end
end
"""
return_to_starting_point!(r, arr) - это функция использует переданный массив и передвигается по элементам массива то есть пока длина массива
не будет равна нулю выполняется следующие переменная side принимает значение последнего элемента массива и двигается в противоположном направление за это отвечает фунrция inverse
дальше удаляется последний элемент массива и так пока длина массива не станет равна 0
"""
function return_to_starting_point!(r, arr)
    while length(arr)>0
        side=pop!(arr)
        move!(r, inverse(side))
    end
end
"""
inverse(side::HorizonSide) - получает переданую в функцию side преобразовывает её в Int значение то есть Nord = 0,
West = 1, Sud = 2, Ost = 3 потом преобразовывает в сторону противоположную : допустим, что в функцию передано напрвление West после преобразование в значения Int
West = 1 после к этого к этому числу прибавляется 2 и берется остаток от деления на число 4 то есть 3 и это сторона Ost, а эта сторона противоположна стороне West
"""
function inverse(side)
    HorizonSide(mod(Int(side)+2, 4))
end