function apartado2()
  #Ya hemos procesado los datos, almacenando los resultados en 
  #easy_ham.mat, hard_ham.mat y spam.mat.
  #Lo que hemos procesado serían los valores de X.
  
  #Cargamos los valores obtenidos del procesamiento anterior.
  
  Oeasy=load('easy_ham.mat');
  Ohard=load('hard_ham.mat');
  Ospam=load('spam.mat');
  
  #Parte de los datos serán de validación. 
  #Pongamos que el 30% de los datos serán de validación, mientras
  #que el resto no.
  
  #DATOS DE VALIDACIÓN
  #https://octave.sourceforge.io/octave/function/floor.html
  #Redondeamos el resultado de la multiplicación a la baja.
  numValEasy= floor(rows(Oeasy.X)*0.3);
  numValHard= floor(rows(Ohard.X)*0.3);
  numValSpam= floor(rows(Ospam.X)*0.3);
  
  XvalEasy=Oeasy.X(numValEasy+1:end,:);
  XvalHard=Ohard.X(numValHard+1:end,:);
  XvalSpam=Ospam.X(numValSpam+1:end,:);
  
  Xval= [XvalEasy;XvalHard;XvalSpam];
  yval= [zeros(rows(XvalEasy),1);zeros(rows(XvalHard),1);ones(rows(XvalSpam),1)];
  
  #DATOS DE ENTRENAMIENTO
  
  numEasy= floor(rows(Oeasy.X)*0.7);
  numHard= floor(rows(Ohard.X)*0.7);
  numSpam= floor(rows(Ospam.X)*0.7);
  
  Xeasy=Oeasy.X(1:numEasy,:);
  Xhard=Ohard.X(1:numHard,:);
  Xspam=Ospam.X(1:numSpam,:);
  
  X= [Xeasy;Xhard;Xspam];
  y= [zeros(rows(Xeasy),1);zeros(rows(Xhard),1);ones(rows(Xspam),1)];
  
  #Ahora que ya tenemos los datos de entrenamiento y validación, 
  #aplicamos la misma técnica que en el apartado anterior.
  
  possible_values=[0.01,0.03,0.1,0.3,1,3,10,30];
  best_accuracy=0;
  
  for i=1:length(possible_values)
    #Le asignamos el valor a C que le corresponda, dentro de los factibles.
    C=possible_values(i);
    for j= 1:length(possible_values)
      #Le asignamos el valor a sigma que le corresponda, dentro de los factibles.
      sigma=possible_values(j);
      
      #Entrenamos el SVM.
      model= svmTrain(X,y,C,@(x1,x2) gaussianKernel(x1,x2,sigma));
      
      #Calculamos el porcentaje de ejemplos que el sistema clasifica correctamente.
      accuracy= sum(svmPredict(model,Xval)==yval);
      
      #Su la precisión obtenida es mejor que la mejor obtenida hasta el momento, la
      #almacenamos, junto al modelo y valores de sigma y C.
      if accuracy > best_accuracy
        best_accuracy= accuracy;
        best_sigma= sigma;
        best_C= C;
        best_model= model;
      endif
     endfor
   endfor
  
  #Mostramos los resultados.  
  visualizeBoundary(X,y,best_model);
  best_accuracy
  best_sigma
  best_C
endfunction