#Utilizando los datasets de la carpeta ../datasets,
#entrena varios modelos con distintos valores de C y 
#genera una gráfica mostrando las precisiones obtenidas 
#para cada valor de C.

#Si el parámetro de entrada gaussian es 1, las SVM utilizarán 
#gaussianKernel.
#Si es 0, usarán linearKernel.
function doTestCasesSVM(gaussian)
  #Probamos con menos valores que en los otros ejemplos de entrenamiento 
  #debido a la duración del entrenamiento de una SVM.
  posibles_C= [100,10,1,0.1,0.01];
  
  for i= 1:length(posibles_C) 
    accuracy(i)=entrenarSVM(posibles_C(i),0.001,20,gaussian,0.01)
  endfor
 
  plot(posibles_C, accuracy, "linewidth", 3)
  
endfunction
