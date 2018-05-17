#Cálculo del coste, sin añadir el término de regularización.

function res= J_NR(X,y,Theta1,Theta2)
  res=  sum(sum((-y).*log(hipothesisRN(X,Theta1,Theta2)) - (1-y).*(log(1-hipothesisRN(X,Theta1,Theta2)))))/rows(y);
endfunction