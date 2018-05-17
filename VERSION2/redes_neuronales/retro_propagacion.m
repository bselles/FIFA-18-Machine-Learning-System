#Implementa la técnica de la retro-propagación.
#Dadas las thetas obtenidas y los ejemplos de entrenamiento,
#calcula el gradiente asociado.
function result= retro_propagacion(X,Y, Theta1,Theta2,lambda)
  #Igual que la función hipothesisRN.
  a_1=X ;    #Add a_0(1).Ya tiene añadidos los unos.

  a_2=sigmoide(a_1*Theta1');  
  a_2=[ ones(rows(a_2),1) a_2 ];  #add a_0(2). 
  
  a_3=sigmoide(a_2*Theta2'); 
  
  #Aplicamos las fórmulas del propio enunciado de la práctica.
  sigma3= a_3-Y; #Ya se ha realizado el arreglo a Y.
  sigma2=(sigma3*Theta2)(:,2:end);
  sigma2= sigma2.*derivadaSigmoide(a_1*Theta1');
  delta1= sigma2' * X;
  delta2= sigma3' * a_2; 
  
  #Calculo del gradiente sin regularizar.
  grad1= delta1/rows(Y);
  grad2= delta2/rows(Y);
  
  #Regularizamos el gradiente.
  Theta1(:,1)=0;
  Theta2(:,1)=0;
  grad1=grad1+(lambda/rows(Y))*Theta1;
  grad2=grad2+(lambda/rows(Y))*Theta2;
  
  #El resultado será una sola columna que contendrá ambos gradientes.
  result=[grad1(:); grad2(:)];
endfunction