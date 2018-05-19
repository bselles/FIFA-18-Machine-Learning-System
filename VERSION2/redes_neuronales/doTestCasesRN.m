function doTestCasesRN(path)
  posibles_lambda=[0.01,0.03,0.1,0.3,0.8,1,3,10];
  
  for i= 1:length(posibles_lambda) 
    accuracy(i)=aprendizajeRN(path,posibles_lambda(i),200)
  endfor
 
  plot(posibles_lambda, accuracy, "linewidth", 3)

 
endfunction


