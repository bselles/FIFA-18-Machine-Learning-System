#Entrenamos el sistema entrenando tantas SVM como etiquetas requiera 
#el problema (en nuestro caso, 3).
function accuracy= entrenarSVM(C, TOL,max_passes)
  #Cargamos los datos correspondientes.
  
  X=load('../datasets/x.csv');
  y=X(:,end);
  y=translateClasses(y);
  X=X(:,1:end-1);
  
  Xval=load('../datasets/xval.csv');
  yval=Xval(:,end);
  yval=translateClasses(yval);
  Xval=Xval(:,1:end-1);
  
  #Entrenamos 3 svm utilizando el esquema OneVsAll.
  for i=1:3
    #Entrenamos el SVM.
    model(i)= svmTrain(X,(y==i),C,@linearKernel,TOL,max_passes);
    predictions(:,i)= svmPredict(model(i),Xval);

  endfor
  [max, result] =max(predictions, [] ,2);
  result=(result==yval);

  accuracy = (sum(result)*100)/rows(Xval);
endfunction
