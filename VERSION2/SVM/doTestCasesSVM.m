
#Si el par�metro de entrada gaussian es 1, las SVM utilizar�n 
#gaussianKernel.
#Si es 0, usar�n linearKernel.
function doTestCasesSVM(gaussian)
  #Probamos con menos valores que en los otros ejemplos de entrenamiento 
  #debido a la duraci�n del entrenamiento de una SVM.
  posibles_C= [100,10,1,0.1,0.01];
  
  for i= 1:length(posibles_C) 
    accuracy(i)=entrenarSVM(posibles_C(i),0.001,2,gaussian,0.01)
  endfor
 
  plot(posibles_C, accuracy, "linewidth", 3)
  
endfunction
