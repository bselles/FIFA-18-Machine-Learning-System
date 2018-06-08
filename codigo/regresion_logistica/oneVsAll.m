#Función que entrena, por regresión logística, tres modelos.
#Cada uno será entrenado para reconocer una de las clases del problema
function all_theta = oneVsAll (X,y, num_etiquetas, lambda, numIter)
  
  #Añadimos una columna de unos (1) por la izquierda. 
  #Como siempre, lo hacemos para poder calcular X*theta con
  #mayor facilidad.
  
  initial_theta=zeros(columns(X)+1,1);
  X=[ones(rows(X),1) X];
  
  #Llamamos a fmincg con los opciones descritas en el enunciado.
  options = optimset ( 'GradObj' , 'on', 'MaxIter', numIter);
  
  for i=1:num_etiquetas
    #Trasponemos el resultado y lo insertamos en la fila i. 
    #(y==i) devolverá un vector en el que las posiciones que 
    #contenían i ahora contendrán 1. En las otras contendrán 0.
    all_theta(i,:)= fmincg (@(t) (cost_function (t,X, (y==i), lambda)),
    initial_theta, options)';
  endfor
  
endfunction


