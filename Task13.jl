function main_function13!(r::Robot)
    x = 0
    y = 0 
    while !isborder(r, Sud)
      move!(r, Sud)
      y += 1 
    end 
    while !isborder(r, West)
      move!(r, West)
      x += 1 
    end 
  
    putmarkerss(r)
  
    for i in 1:x
      move!(r, Ost)
    end
  
    for i in 1:y
      move!(r, Nord)
    end
  
  end
  function putmarkerss(r::Robot)
    putmarker!(r)
    while !isborder(r, Nord) && !isborder(r, Ost)
      move!(r, Nord)
      move!(r, Ost)
      putmarker!(r)
    end
    while !isborder(r, West)
      move!(r, West)
    end
    putmarker!(r)
    while !isborder(r, Sud) && !isborder(r, Ost)
      move!(r, Sud)
      move!(r, Ost)
      putmarker!(r)
    end
    while !isborder(r, West)
      move!(r, West)
    end
  end