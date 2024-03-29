#Funci�n que implementa, realizando llamadas a otras funciones implementadas, 
#el aprendizaje de una red neuronal.

#Utilizar� el n�mero de capas ocultas, el n�mero de iteraciones y la 
#lambda proporcionada por el usuario para realizar el entrenamiento de la red neuronal.
function porcentajeAcierto=aprendizajeRN(lambda,numOcultas, numIter)
  #Para eliminar los warnings en el uso de fmincg.
  warning('off','all');       
  #N�mero de atributos de los ejemplos de entrenamiento.   
  num_entradas=30;        
  #N�mero de capas ocultas de la red neuronal.  
  num_ocultas=numOcultas;
  #N�mero de posibles clases entre las que  
  #clasificar� los ejemplos de entrenamiento. 
  num_etiquetas=3;               
                                                        
  #Cargamos el dataset y separamos los ejemplos 
  #de entrenamiento de los resultados.
  X=load('../datasets/x.csv'); 
  y=X(:,end);
  #A cada soluci�n le asociamos una clase: normal, bueno o estrella.
  y=translateClasses(y);  
  X=X(:,1:end-1);

  Theta1=pesosAleatorios(num_entradas, num_ocultas);
  Theta2=pesosAleatorios(num_ocultas,num_etiquetas);
    
  #Igual que en el propio enunciado.
  options= optimset('MaxIter',numIter);
  cost = @(p) costeRN(p, num_entradas,num_ocultas,
  num_etiquetas,X,y,lambda);
  [params_rn, cost]= fmincg(cost, [Theta1(:);Theta2(:)],options);
  
  #Obtenemos las thetas asociadas a params_rn.
  Theta1= reshape(params_rn(1:num_ocultas*(num_entradas+1)),
  num_ocultas,(num_entradas+1));
  Theta2= reshape(params_rn((1+(num_ocultas* (num_entradas+1))):end),
  num_etiquetas, (num_ocultas+1));
  
  #Cargamos los datos de validaci�n, con los que probaremos la 
  #precisi�n del sistema.
  X=load('../datasets/xval.csv'); 
  y=X(:,end);
  y=translateClasses(y);  
  X=X(:,1:end-1);
  
  #A�adimos los unos a X.
  X = [ones(rows(X),1),X];
  #Con los siguientes c�lculos, calculamos las probabilidades.
  probabilities= hipothesisRN(X,Theta1,Theta2);
  [aux, predictions] = max(probabilities,[],2);
  
  #Devolvemos el porcentaje de acierto obtenido.
  porcentajeAcierto=mean(predictions==y)*100 
  
  #Dibujamos una gr�fica mostrando como va disminuyendo 
  #el coste en cada iteraci�n.
  #plot(1:length(cost), cost, "linewidth", 3)

endfunction