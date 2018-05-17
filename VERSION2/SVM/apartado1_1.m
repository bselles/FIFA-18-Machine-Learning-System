function apartado1_1()
  #Cargamos los datos de ex6data1.mat
  load('ex6data1.mat');
  
  #Utilizando parámetro de regularización C =1.
  #model= svmTrain(X,y,1,@linearKernel, 0.001,20);
  #visualizeBoundaryLinear(X,y,model);
  
  #Utilizando parámetro de regularización C=100.
  model= svmTrain(X,y,100,@linearKernel, 0.001,20);
  visualizeBoundaryLinear(X,y,model);  
endfunction