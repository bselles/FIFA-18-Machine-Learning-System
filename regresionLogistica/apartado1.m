#FUNCIÓN QUE REPRESENTA EL APARTADO 1.

function percentage = apartado1(lambda)
  #Cargamos los datos. Se almacenarán en X e y.
  #load('ex3data1.mat');
 
  X=load('../datasets/X.csv');
  X=deleteWrongSamples(X);
  y=X(:,end);
  X=X(:,1:end-1);
  
  all_theta=oneVsAll(X,y,10,lambda);
  
  #Añadimos una columna de unos (la primera por la izquierda).
  X=[ones(rows(X),1) X];
  hipotesis = sigmoide(X*all_theta');
  
  #Obtenemos las etiquetas por las que se obtiene el valor máximo.
  #https://octave.sourceforge.io/octave/function/max.html
  [max, result] =max(hipotesis, [] ,2);
  
  #Calculamos el porcentage de aciertos y los devolvemos.
  result=(result==y);
  percentage = (sum(result)*100)/rows(X);
  
  
endfunction