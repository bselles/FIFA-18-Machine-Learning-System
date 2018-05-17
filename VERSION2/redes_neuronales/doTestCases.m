function doTestCases(path)
  posibles_lambda=[0,0.01,0.03,0.1,0.3,0.8,1,3,5,8,10,100];

  for i= 1:length(posibles_lambda) 
    accuracy(i)=aprendizajeRN(path,posibles_lambda(i));
  endfor
 
  plot(1:length(posibles_lambda), accuracy, "linewidth", 3)

 
endfunction
