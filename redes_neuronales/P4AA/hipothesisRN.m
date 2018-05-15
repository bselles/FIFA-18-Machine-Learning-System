#Reutilizada de la práctica 3.
function result= hipothesisRN(X,Theta1,Theta2)
  
  a_1= X ;    #Add a_0(1). Ya tiene añadidos los unos.

  a_2=sigmoide(a_1*Theta1');  #Matriz resultante de dimensiones 5000x25
  a_2=[ ones(rows(a_2),1) a_2 ];  #add a_0(2). Matriz resultante de dimensiones 5000x26
  
  a_3=sigmoide(a_2*Theta2'); # Matriz resultante de dimensiones 5000x10 
  
  result=a_3;
  
  
endfunction