#Funcion que implementa la regresi�n log�stica.

#Utilizar� los datos de path para el entrenamiento y la 
#lambda proporcionada por el usuario.
function percentage = regresionLogistica(path,lambda)
  warning('off','all');          #Para eliminar los warnings en el uso de fmincg.

  #Cargamos el dataset y separamos los ejemplos de entrenamiento de los resultados.
  X=load(path); 
  y=X(:,end);
  y=translateClasses(y);  #A cada soluci�n le asociamos una clase: normal, bueno o estrella.
  X=X(:,1:end-1);
  
  all_theta=oneVsAll(X,y,3,lambda);
  
  #A�adimos una columna de unos (la primera por la izquierda).
  X=[ones(rows(X),1) X];
  hipotesis = sigmoide(X*all_theta');
  
  #Obtenemos las etiquetas por las que se obtiene el valor m�ximo.
  #https://octave.sourceforge.io/octave/function/max.html
  [max, result] =max(hipotesis, [] ,2);
  
  #Calculamos el porcentage de aciertos y los devolvemos.
  result=(result==y);
  percentage = (sum(result)*100)/rows(X);
endfunction