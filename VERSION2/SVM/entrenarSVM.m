function accuracy= entrenarSVM(C, TOL,max_passes)
  #Cargamos los datos correspondientes.
  
  X=load('../datasets/distribucion2/x.csv');
  y=X(:,end);
  y=translateClasses(y);
  X=X(:,1:end-1);
  
  Xval=load('../datasets/distribucion2/xval.csv');
  yval=Xval(:,end);
  yval=translateClasses(yval);
  Xval=Xval(:,1:end-1);
  
  #Entrenamos 3 svm utilizando el esquema OneVsAll.
  for i=1:3
    #Entrenamos el SVM.
    #model(i)= svmTrain(X,(y==i),C,@(x1,x2) gaussianKernel(x1,x2,sigma));
    model(i)= svmTrain(X,(y==i),C,@linearKernel,TOL,max_passes);
    predictions(:,i)= svmPredict(model(i),Xval);

  endfor
  [max, result] =max(predictions, [] ,2);
  result=(result==yval);

  accuracy = (sum(result)*100)/rows(Xval);
endfunction
