function doTestCasesRL(path)
  lambda_values=[0.01,0.03,0.1,0.3,0.8,1,3,10,100];
  
  for i=1:length(lambda_values)
    accuracy(i)=regresionLogistica(path,lambda_values(i));
  endfor
  
  plot(1:length(lambda_values), accuracy, "linewidth", 3)
  
endfunction
