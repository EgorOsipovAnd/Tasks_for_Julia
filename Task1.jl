#Ost - "E6" - восток, Nord - "N8" - север, West - "W4" - запад, Sud - "S2" - юг
"""
main_function1!(r::Robot) это главная функция которая рисует крест на поле использует три функции описанные внизу, 
но алгоритм выполнения следующий цикл for перебирает 4 стороны: Nord, Sud, West, Ost дальше каждый элемент side передается в 
функции putmarkers!, move_by_markers, inverse после выполнения цикла появляет крест из маркеров и в изначальной позиции ставится маркер
"""
function main_function1!(r)
    for side in [Nord, Sud, West, Ost]
        putmarkers!(r, side)
        move_by_markers(r, inverse(side))
    end
    putmarker!(r)
end
"""
putmarkers!(r::Robot, side::HorizonSide) - пока нет перегоротки в переданам направлении side::HorizonSide делает шаг в заданном направлении и ставит маркер
"""
function putmarkers!(r, side)
    while !isborder(r, side)
        move!(r, side)
        putmarker!(r)
    end
end
"""
move_by_markers(r::Robot, side::HorizonSide) - пока есть маркер в клетке с роботом он делает в шаг в заданном направлении
"""
function move_by_markers(r, side)
    while ismarker(r)==true
        move!(r, side)
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