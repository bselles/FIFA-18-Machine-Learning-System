#Cálculo del coste, añadiendo el término de regularización.
function result= J_REG(X,y,Theta1,Theta2,lambda)
  result=  sum(sum((-y).*log(hipothesisRN(X,Theta1,Theta2)) 
  - (1-y).*(log(1-hipothesisRN(X,Theta1,Theta2)))))/rows(X);
  
  result=result +  (sum(sum((Theta1(:,2:end)).^2)) 
  +sum(sum((Theta2(:,2:end)).^2)))*(lambda/(rows(y)*2));
endfunction

