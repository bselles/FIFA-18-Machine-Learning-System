#Utilizando los datasets de la carpeta ../datasets,
#entrena varios modelos con distintos valores de lambda y 
#genera una gráfica mostrando las precisiones obtenidas 
#para cada valor de lambda.
function doTestCasesRL()
  lambda_values=[0.01,0.03,0.1,0.3,0.8,1,3,10];

  for i=1:length(lambda_values)
    #Para modificar el número de iteraciones, cambiar el segundo parámetro
    #del método regresionLogistica.
    accuracy(i)=regresionLogistica(lambda_values(i),200);
  endfor
  
  plot(lambda_values, accuracy, "linewidth", 3)
  
endfunction




