#FUNCI�N QUE ENTRENA POR REGRESI�N LOG�STICA A LAS 10 CLASES DEL 
#CONJUNTO DE DATOS.

function all_theta = oneVsAll (X,y, num_etiquetas, lambda)
  
  #A�adimos una columna de unos (1) por la izquierda. 
  #Como siempre, lo hacemos para poder calcular X*theta con
  #mayor facilidad.
  
  initial_theta=zeros(columns(X)+1,1);
  X=[ones(rows(X),1) X];
  
  #Llamamos a fmincg con los opciones descritas en el enunciado.
  options = optimset ( 'GradObj' , 'on', 'MaxIter', 50);
  
  for i=1:num_etiquetas
    #Trasponemos el resultado y lo insertamos en la fila i. 
    #(y==i) devolver� un vector en el que las posiciones que conten�an i ahora contendr�n 1. En las otras
    #contendr�n 0.
    all_theta(i,:)= fmincg (@(t) (cost_function (t,X, (y==i), lambda)), initial_theta, options)';
  endfor
  
endfunction