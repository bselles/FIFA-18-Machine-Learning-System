#Entrenamos el sistema entrenando tantas SVM como etiquetas requiera 
#el problema (en nuestro caso, 3).
function accuracy= entrenarSVM(C, TOL,max_passes, gaussian, sigma)
  #Cargamos los datos correspondientes.
  X=load('../datasets/x.csv');
  y=X(:,end);
  y=translateClasses(y);
  X=X(:,1:end-1);
  
  #Cargamos los datos de validación.
  Xval=load('../datasets/xval.csv');
  yval=Xval(:,end);
  yval=translateClasses(yval);
  Xval=Xval(:,1:end-1);
  
  #Entrenamos 3 svm utilizando el esquema OneVsAll.
  for i=1:3
    #Entrenamos el SVM.
    
    #Si gaussian es 1, usaremos gaussianKernel. Si es 0, usaremos linearKernel.
    if gaussian==1
      model(i)= svmTrain(X,(y==i),C,@(x1,x2) gaussianKernel(x1,x2,sigma));
    else 
      model(i)= svmTrain(X,(y==i),C,@linearKernel,TOL,max_passes);
    endif
   
    predictions(:,i)= svmPredict(model(i),Xval)
  endfor
  
  [max, result] =max(predictions, [] ,2);
  result=(result==yval);

  accuracy = (sum(result)*100)/rows(Xval);
endfunction

