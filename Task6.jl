#Ost - "E6" - восток, Nord - "N8" - север, West - "W4" - запад, Sud - "S2" - юг
"""
main_function6!(r) - главная функция
"""
function main_function6!(r)
    side = Ost
    arr = []
    exit_to_the_lower_left_cell!(r, arr)
    up_search(r, side)
end
"""
exit_to_the_lower_left_cell!(r, arr) - это функция заполняет в переданый массив  двумя сторонами West || Sud: принцип алгоритма такой
цикл while работет так: пока слева(West) && снизу(Sud) нет перегоротки каждая проверка будет выполнятся проверка двух if: первый проверяет 
есть ли перегоротка в заданном направлении, если нет, то робот делает шаг в сторону West и заносит это сторону в переданный массив 
принцип работы второго if такой же.Цикл while прекратит свою работу, когда окажется в левом нижнем углу
"""
function exit_to_the_lower_left_cell!(r, arr)
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
"""
changing_side_to_clock_side(side) - получает переданую в функцию side преобразовывает её в Int значение то есть Nord = 0,
West = 1, Sud = 2, Ost = 3 потом преобразовывает её на часовую сторону : допустим, что в функцию передано напрвление West после преобразование в значения Int
Sud = 2 после к этого к этому числу прибавляется 1 и берется остаток от деления на число 4 то есть 3 и это сторона Ost, а эта часовая сторона Sud
"""
function changing_side_to_clock_side1(side)
    HorizonSide(mod(Int(side)+1, 4))
end
"""
changing_side_to_clock_side(side) - получает переданую в функцию side преобразовывает её в Int значение то есть Nord = 0,
West = 1, Sud = 2, Ost = 3 потом преобразовывает её на часовую сторону : допустим, что в функцию передано напрвление West после преобразование в значения Int
Sud = 2 после к этого к этому числу прибавляется 3 и берется остаток от деления на число 4 то есть 1 и это сторона Sud, а эта часовая сторона West
"""
function changing_side_to_clock_side(side)
    HorizonSide(mod(Int(side)+3, 4))
end
"""
inner_perimeter(r, side) - функция ставит маркеры по наружному периметру пока в клетке с роботом не будет маркера алгоритм функции такой:
пока есть перегоротка в заданном направлении исполняется список команд поставить маркер в клетке с роботом и сделать шаг в заданном переменной направление 
после цикла while происходит доп проверка есть ли маркер в клетке с роботом если нет то выполняется список команд поставить маркер, шаг от измененной переменной
и присвоение переменной нового значения стороны
"""
function inner_perimeter(r, side)
    side1 = side
    while !ismarker(r)
        while isborder(r, side1) == true
            putmarker!(r)
            if !ismarker(r)
                move!(r, changing_side_to_clock_side1(side1))
            end
        end
        if !ismarker(r)
            putmarker!(r)
            move!(r, side1)
            side1 = changing_side_to_clock_side(side)
        end
    end
end
"""
up_search(r, side) - это функция поднимается вверх и ищет сверху перегоротку
"""
function up_search(r, side)
    try_ch = true
    while try_ch == true
        while !isborder(r, side)
            move!(r, side)
            if isborder(r, Nord)
                inner_perimeter(r, Nord)
                try_ch = false
            end
        end
        side = inverse(side)
        if isborder(r, Nord)
            try_ch = false
        end
        move!(r, Nord)
    end
end