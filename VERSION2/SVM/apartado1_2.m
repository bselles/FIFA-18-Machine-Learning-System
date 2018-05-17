function apartado1_2()
  #Cargamos los datos de ex6data1.mat
  load('ex6data2.mat');
 
  #Ponemos los valores de sigma y C del ejemplo del enunciado.
  sigma= 0.1;
  C=1;
  
  model=svmTrain(X,y, C, @(x1,x2) gaussianKernel(x1,x2,sigma));
  visualizeBoundary(X,y,model);
endfunction