function doTestCasesRN()
  posibles_lambda=[0.01,0.03,0.1,0.3,0.8,1,3,10];
  
  for i= 1:length(posibles_lambda) 
    accuracy(i)=aprendizajeRN(posibles_lambda(i),100,100)
  endfor
 
  plot(posibles_lambda, accuracy, "linewidth", 3)

 
endfunction


