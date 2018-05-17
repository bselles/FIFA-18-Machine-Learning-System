#Función que implementa, realizando llamadas a otras funciones implementadas, 
#el aprendizaje de una red neuronal.

#Utilizará los datos de path para el entrenamiento de la red neuronal y la 
#lambda proporcionada por el usuario.
function porcentajeAcierto=aprendizajeRN(path,lambda)
  
  warning('off','all');          #Para eliminar los warnings en el uso de fmincg.
  num_entradas=30;               #Número de atributos de los ejemplos de entrenamiento.         
  num_ocultas=3;                 #Número de capas ocultas de la red neuronal.
  num_etiquetas=3;               #Número de posibles clases entre las que 
                                 #clasificará los ejemplos de entrenamiento.
                                 
  #Cargamos el dataset y separamos los ejemplos de entrenamiento de los resultados.
  X=load(path); 
  y=X(:,end);
  y=translateClasses(y);  #A cada solución le asociamos una clase: normal, bueno o estrella.
  X=X(:,1:end-1);

  Theta1=pesosAleatorios(num_entradas, num_ocultas);
  Theta2=pesosAleatorios(num_ocultas,num_etiquetas);
  
  numIter=100;
  
  #Igual que en el propio enunciado.
  options= optimset('MaxIter',numIter);
  cost = @(p) costeRN(p, num_entradas,num_ocultas,num_etiquetas,X,y,lambda);
  [params_rn, cost]= fmincg(cost, [Theta1(:);Theta2(:)],options);
  
  #Obtenemos las thetas asociadas a params_rn.
  Theta1= reshape(params_rn(1:num_ocultas*(num_entradas+1)),num_ocultas,(num_entradas+1));
  Theta2= reshape(params_rn((1+(num_ocultas* (num_entradas+1))):end), num_etiquetas, (num_ocultas+1));
  
  #Añadimos los unos a X.
  X = [ones(rows(X),1),X];
  #Con los siguientes cálculos, calculamos las probabilidades.
  probabilities= hipothesisRN(X,Theta1,Theta2);
  [aux, predictions] = max(probabilities,[],2);
  
  #Devolvemos el porcentaje de acierto obtenido.
  porcentajeAcierto=mean(predictions==y)*100;

  #Dibujamos una gráfica mostrando como va disminuyendo el coste en cada iteración.
  #plot(1:numIter, cost, "linewidth", 3)

  
endfunction