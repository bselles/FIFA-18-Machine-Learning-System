#VERSIÓN SIN REGULARIZAR

#Suponemos que theta es un vector N x 1.
#NR= Not Regularized.
function [J, grad] = cost_functionNR(theta, X, y , lambda)
  J=  (log(sigmoide(X*theta))'*(-y) - log(1-sigmoide(X*theta))'*(1-y))/rows(y);
  grad=  (X'*(sigmoide(X*theta)-y))/columns(X);
endfunction

