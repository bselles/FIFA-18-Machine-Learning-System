function porcentajeAcierto=aprendizajeRN(lambda)
  warning('off','all');
  num_entradas=30;          #Número de atributos de entrada.
  num_ocultas=100;
  num_etiquetas=3;         #Número de clases entre las que clasificará los ejemplos de entrenamiento.
  
  X=load('../datasets/distribucion2/x.csv');
  columns(X)

  y=X(:,end)+1; #Le sumamos a todas las clases 1. Así, las clases serán de 1 a 14 (14 clases en total).
  X=X(:,1:end-1); #Eliminamos las respuestas (las clases) de X.

    
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