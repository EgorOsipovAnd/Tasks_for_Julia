#Ost - "E6" - восток, Nord - "N8" - север, West - "W4" - запад, Sud - "S2" - юг
"""
main_function4!(r) - это главная функция которая закрашивает поле в ввиде пирамиды
"""
function main_function4!(r)
    arr = []
    side = Ost
    exit_to_the_lower_left_cell!(r, arr)
    diagonal!(r, West, Nord)
    checks_whether_to_put_a_marker_in_the_cell_and_go_back(r, side)
    return_to_starting_point!(r, arr)
end
"""
diagonal!(r, side1, side2) - функция ставит маркеры в диагональной линии в переданном напралениях
"""
function diagonal!(r, side1, side2)
    while !(isborder(r, side1)&&isborder(r, side2))
        putmarker!(r)
        if !isborder(r, side1)
            move!(r, side1)
        end
        if !isborder(r, side1)
            move!(r, side2)
        end
    end
end
"""
checks_whether_to_put_a_marker_in_the_cell_and_go_back(r, side) - это функция действует так пока переменная try_ch_side
не примет значение false она будет проверять поставить ли маркер в клетке, пока робот не будет находится
в клетке где стоит маркер она и возвращается назад и спускается вниз если пройдет проверку
"""
function checks_whether_to_put_a_marker_in_the_cell_and_go_back(r, side)
    try_ch_side = true
    while try_ch_side == true
        while !ismarker(r)
            putmarker!(r)
            move!(r, side)
        end
        while (ismarker(r) == true)&&(!isborder(r, inverse(side)))
            move!(r, inverse(side))
        end
        if (!isborder(r, Sud))
            move!(r, Sud)
        else
            try_ch_side = false
        end
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