#Dados Theta1, Theta2 y un conjunto de ejemplos de 
#entrenamiento contenidos en X,
#calcula la hipotesis generada por la red neuronal. 
function result= hipothesisRN(X,Theta1,Theta2)
  a_1= X ;    #Add a_0(1). Ya tiene añadidos los unos.
  a_2=sigmoide(a_1*Theta1');  
  a_2=[ ones(rows(a_2),1) a_2 ];  #add a_0(2). 
  a_3=sigmoide(a_2*Theta2'); 
  result=a_3;
endfunction