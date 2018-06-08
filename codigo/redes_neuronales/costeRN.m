#Implementa la función de coste de una red neuronal (con regularización).
function [J,grad] = costeRN (params_rn, num_entradas, num_ocultas,
   num_etiquetas, X,y,lambda)  
   
  #Añadimos la columna de unos a X
  X = [ones(rows(X),1),X];
  
  #Obtenemos Theta1 y Theta2.
  Theta1= reshape(params_rn(1:num_ocultas*(num_entradas+1)),
  num_ocultas,(num_entradas+1));
  Theta2= reshape(params_rn((1+(num_ocultas* (num_entradas+1))):end)
  , num_etiquetas, (num_ocultas+1));
    
  #Modificamos y para que cumpla los requisitos que se explican 
  #en el enunciado.
  Y=zeros(rows(y),num_etiquetas);
  for i=1: rows(y)
    Y(i,y(i))= 1;
  endfor
  
  #Primero calculamos el coste de la red neuronal.
  J=J_REG(X,Y,Theta1,Theta2,1);
  
  #Después, el gradiente.
  #Debe tener la misma forma que params_rn
  grad=retro_propagacion(X,Y,Theta1,Theta2,lambda);
  
endfunction

