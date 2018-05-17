#Dada una matriz y que representa las soluciones de un conjunto de 
#ejemplos de entrenamiento, devuelve una matriz cuyo contenido será:
#1-Si y, en esa posición, tenía un número menor o igual que 65 (Calidad: Normal)
#2-Si y, en esa posición, tenía un número mayor que 65  y menor que 80(Calidad: Bueno)
#1-Si y, en esa posición, tenía un número mayor o igual que 80 (Calidad: Estrella)
function result= translateClasses(y)
  for i = 1: rows(y)
    if (y(i)<=65)
      result(i,1)=1;
    elseif(y(i)>=85)
      result(i,1)=3;
    else
      result(i,1)=2;
    endif
  endfor
endfunction
