#Función que calcula el coste y el gradiente.
function [J, grad] = cost_function(theta, X, Y,lambda)
  #Primero, calculamos el valor de la función de coste (J).
  J =( log(sigmoide(X*theta))'*(-Y) -  log(1-sigmoide(X*theta))'*(1-Y) 
  + (lambda*sum(theta.^2)/2) ) / rows(X);
  #Después, calculamos el gradiente (grad).
  #Tal y como dice el enunciado, si j==0, entonces no se debe 
  #sumar lambda*theta_sub_j/m.
  #Para ello, crearemos el vector theta_mod, que contendrá lo 
  #mismo que theta en todas las posiciones menos 
  #en la primera,que contendrá un 0. De esta forma, evitaremos 
  #que se sume cuando j==0.

  #Devuelve el vector de gradiente como un vector columna (401x1).
  theta_mod=[0;theta(2:end)];
  grad = (X'*(sigmoide(X*theta)-Y) + lambda*theta_mod )/rows(Y);
endfunction


