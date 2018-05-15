#APARTADO 2: PROPAGACIONES EN LA RED NEURONAL.

function percentage= apartado2()  
  load('ex3data1.mat');
  load('ex3weights.mat');
  
  #Las propagaciones son las descritas en el propio enunciado.

  a_1=[ ones(rows(X),1) X ];    #Add a_0(1)

  a_2=sigmoide(a_1*Theta1');  #Matriz resultante de dimensiones 5000x25
  a_2=[ ones(rows(a_2),1) a_2 ];  #add a_0(2). Matriz resultante de dimensiones 5000x26
  
  a_3=sigmoide(a_2*Theta2'); # Matriz resultante de dimensiones 5000x10 
  
  #Obtenemos las etiquetas por las que se obtiene el valor máximo.
  [max, result] = max (a_3, [],2 ); 
  
  #Vemos qué porcentaje de aciertos ha tenido.
  #Para ello, comparamos los resultados obtenidos con las etiquetas de los
  #ejemplos de entrenamiento y calculamos el porcentaje de aciertos.
  result=(result==y);
  percentage = (sum(result)*100)/rows(X);
  
endfunction