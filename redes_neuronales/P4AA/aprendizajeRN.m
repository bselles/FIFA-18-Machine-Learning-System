function porcentajeAcierto=aprendizajeRN(lambda)
  warning('off','all');
  num_entradas=400;
  num_ocultas=25;
  num_etiquetas=10;
  
  load('ex4data1.mat'); #Los resultados se almacenan en X e y.
  
  Theta1=pesosAleatorios(num_entradas, num_ocultas);
  Theta2=pesosAleatorios(num_ocultas,num_etiquetas);
  
  #Igual que en el propio enunciado.
  options= optimset('MaxIter',50);
  cost = @(p) costeRN(p, num_entradas,num_ocultas,num_etiquetas,X,y,lambda);
  [params_rn, cost]= fmincg(cost, [Theta1(:);Theta2(:)],options);
  
  
  Theta1= reshape(params_rn(1:num_ocultas*(num_entradas+1)),num_ocultas,(num_entradas+1));
  Theta2= reshape(params_rn((1+(num_ocultas* (num_entradas+1))):end), num_etiquetas, (num_ocultas+1));
  
  #Añadimos los unos a X.
  X = [ones(rows(X),1),X];
  #Con los siguientes cálculos, calculamos las probabilidades.
  probabilities= hipothesisRN(X,Theta1,Theta2);
  [aux, predictions] = max(probabilities,[],2);
  porcentajeAcierto=mean(predictions==y)*100;
endfunction