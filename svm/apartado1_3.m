function apartado1_3()
  #Cargamos los datos de ex6data1.mat
  
  X=load('../datasets/X.csv');
  X=deleteWrongSamples(X);
  
  y=X(:,end);
  X=X(:,1:end-1);
  
  
  Xval=load('../datasets/xval.csv');
  Xval=deleteWrongSamples(Xval);
  
  yval=Xval(:,end);
  Xval=Xval(:,1:end-1);
  
  rows(Xval)
  columns(Xval)
  
  
  
  possible_values=[0.01];
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